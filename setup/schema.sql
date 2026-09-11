-- ═══════════════════════════════════════════════════════════════════════
--  SAHASRA HOME FOODS — database setup
--  Paste this whole file into Supabase → SQL Editor → Run.
--  Safe to run more than once.
-- ═══════════════════════════════════════════════════════════════════════

-- ── shop details (one row) ─────────────────────────────────────────────
create table if not exists settings (
  id          int primary key default 1,
  shop_name   text not null default 'Sahasra Home Foods',
  tagline     text not null default 'Manikonda, Hyderabad · Made fresh to order',
  area        text not null default 'Manikonda, Hyderabad',
  whatsapp    text not null default '919515362514',   -- country code, no + or spaces
  phone       text not null default '+917207806223',
  footer_note text not null default 'Everything is cooked to order in small batches, so please allow time for larger quantities. Bulk and festival orders welcome.',
  updated_at  timestamptz not null default now(),
  constraint settings_single_row check (id = 1)
);

insert into settings (id) values (1) on conflict (id) do nothing;

-- ── menu sections ──────────────────────────────────────────────────────
create table if not exists sections (
  id         uuid primary key default gen_random_uuid(),
  slug       text unique not null,          -- used in the page links
  name       text not null,                 -- "Sweets"
  note       text not null default '',      -- "Priced per kilogram"
  unit       text not null default 'kg',    -- what one "1" means
  step       numeric not null default 0.5,  -- how much each + adds
  sort       int  not null default 0,
  visible    boolean not null default true,
  updated_at timestamptz not null default now()
);

-- ── menu items ─────────────────────────────────────────────────────────
create table if not exists items (
  id         uuid primary key default gen_random_uuid(),
  section_id uuid not null references sections(id) on delete cascade,
  name_en    text not null,
  name_te    text not null default '',
  price      numeric,                       -- NULL = "Call for price"
  photo_url  text,                          -- NULL = no photo
  veg        boolean not null default true,
  available  boolean not null default true,
  sort       int not null default 0,
  updated_at timestamptz not null default now()
);

create index if not exists items_section_idx on items (section_id, sort);
create index if not exists sections_sort_idx  on sections (sort);

-- ── keep updated_at honest ─────────────────────────────────────────────
create or replace function touch_updated_at() returns trigger
language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end $$;

drop trigger if exists t_settings on settings;
drop trigger if exists t_sections on sections;
drop trigger if exists t_items    on items;
create trigger t_settings before update on settings for each row execute function touch_updated_at();
create trigger t_sections before update on sections for each row execute function touch_updated_at();
create trigger t_items    before update on items    for each row execute function touch_updated_at();

-- ═══════════════════════════════════════════════════════════════════════
--  WHO CAN DO WHAT
--  Anyone may READ the menu (it is a public menu).
--  Only someone named in the admins table may CHANGE it.
--
--  "Signed in" is NOT good enough on its own: Supabase lets people sign
--  themselves up by default, and that would let a stranger rewrite the
--  menu. So every write is checked against this explicit list.
-- ═══════════════════════════════════════════════════════════════════════
create table if not exists admins (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  email      text,
  added_at   timestamptz not null default now()
);

alter table admins enable row level security;

-- is_admin() is SECURITY DEFINER, so it runs as the table owner and is not
-- itself subject to RLS. That matters: a policy ON admins that queries admins
-- directly is infinite recursion, and Postgres refuses it at query time.
create or replace function is_admin() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from admins where user_id = auth.uid());
$$;

grant execute on function is_admin() to authenticated;

-- an admin may see who else is an admin; nobody else sees this table at all
drop policy if exists read_admins on admins;
create policy read_admins on admins for select to authenticated
  using (is_admin());

alter table settings enable row level security;
alter table sections enable row level security;
alter table items    enable row level security;

drop policy if exists read_settings  on settings;
drop policy if exists read_sections  on sections;
drop policy if exists read_items     on items;
create policy read_settings on settings for select to anon, authenticated using (true);
create policy read_sections on sections for select to anon, authenticated using (true);
create policy read_items    on items    for select to anon, authenticated using (true);

drop policy if exists write_settings on settings;
drop policy if exists write_sections on sections;
drop policy if exists write_items    on items;
create policy write_settings on settings for all to authenticated using (is_admin()) with check (is_admin());
create policy write_sections on sections for all to authenticated using (is_admin()) with check (is_admin());
create policy write_items    on items    for all to authenticated using (is_admin()) with check (is_admin());

-- ═══════════════════════════════════════════════════════════════════════
--  PHOTO STORAGE — a public bucket called "photos"
-- ═══════════════════════════════════════════════════════════════════════
insert into storage.buckets (id, name, public)
values ('photos', 'photos', true)
on conflict (id) do update set public = true;

drop policy if exists photos_read   on storage.objects;
drop policy if exists photos_write  on storage.objects;
drop policy if exists photos_update on storage.objects;
drop policy if exists photos_delete on storage.objects;
create policy photos_read   on storage.objects for select to anon, authenticated using (bucket_id = 'photos');
create policy photos_write  on storage.objects for insert to authenticated with check (bucket_id = 'photos' and is_admin());
create policy photos_update on storage.objects for update to authenticated using (bucket_id = 'photos' and is_admin());
create policy photos_delete on storage.objects for delete to authenticated using (bucket_id = 'photos' and is_admin());
