-- ═══════════════════════════════════════════════════════════════════════
--  Telugu names for the section headings.
--  Paste into Supabase → SQL Editor → Run. Safe to run more than once.
--
--  ⚠️  THESE SPELLINGS ARE MINE AND UNCHECKED, like the item names.
--      Have a Telugu reader look at them. You can correct any of them
--      afterwards in /admin without touching SQL again.
-- ═══════════════════════════════════════════════════════════════════════

alter table sections add column if not exists name_te text not null default '';

update sections set name_te = 'మిఠాయిలు'      where slug = 'sweets';
update sections set name_te = 'చిరుతిళ్ళు'      where slug = 'snacks';
update sections set name_te = 'పొడులు'         where slug = 'podi';
update sections set name_te = 'తాజా పిండి'      where slug = 'batter';
update sections set name_te = 'హెల్తీ బౌల్స్'     where slug = 'bowls';
update sections set name_te = 'డ్రై ఫ్రూట్స్'      where slug = 'dry';

select name, name_te, slug from sections order by sort;
