-- ═══════════════════════════════════════════════════════════════════════
--  FIX: the admins policy referred to itself, which Postgres treats as
--  infinite recursion. Paste the whole thing into SQL Editor and Run.
--  Safe to run more than once.
-- ═══════════════════════════════════════════════════════════════════════

-- 1. a function that can check the list without tripping over RLS
create or replace function is_admin() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from admins where user_id = auth.uid());
$$;

grant execute on function is_admin() to authenticated;

-- 2. replace the self-referencing policy
drop policy if exists read_admins on admins;
create policy read_admins on admins for select to authenticated
  using (is_admin());

-- 3. make sure the login is actually on the list
insert into admins (user_id, email)
select id, email from auth.users
where lower(trim(email)) = lower(trim('ammu@sahasara.com'))
on conflict (user_id) do nothing;

-- 4. show the result — you should see one row with your email
select a.email as admin_email, u.email as login_email, a.added_at
from admins a
join auth.users u on u.id = a.user_id;
