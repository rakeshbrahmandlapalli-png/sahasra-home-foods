-- ═══════════════════════════════════════════════════════════════════════
--  Delivery area, opening hours, minimum order and lead time.
--  Paste into Supabase → SQL Editor → Run. Safe to run more than once.
--
--  All four are plain text, so write them however the family says them.
--  Leave any of them empty and the site simply does not show that line.
--  After this, edit them in /admin → Shop details.
-- ═══════════════════════════════════════════════════════════════════════

alter table settings add column if not exists hours        text not null default '';
alter table settings add column if not exists delivery     text not null default '';
alter table settings add column if not exists min_order    text not null default '';
alter table settings add column if not exists lead_time    text not null default '';

-- Starting values — CHANGE THESE, they are guesses.
update settings set
  hours     = '8 am to 8 pm, every day',
  delivery  = 'Manikonda and nearby areas',
  min_order = 'No minimum',
  lead_time = 'Same day for small orders. Two days for 2 kg or more, and for festival orders.'
where id = 1;

select hours, delivery, min_order, lead_time from settings where id = 1;
