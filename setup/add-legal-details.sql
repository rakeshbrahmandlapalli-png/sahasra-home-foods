-- ═══════════════════════════════════════════════════════════════════════
--  Legal and food-safety details.
--  Paste into Supabase → SQL Editor → Run. Safe to run more than once.
--
--  ⚠️  NOT LEGAL ADVICE. This is the usual set of disclosures an Indian
--      food business website carries. Have someone qualified confirm
--      what applies to this business.
--
--  The FSSAI number is left EMPTY on purpose. If the family does not
--  have a registration yet, that is the thing to sort out before the
--  site is promoted anywhere. Basic Registration is applied for at
--  foscos.fssai.gov.in and costs around Rs 100 a year for small turnover.
--  Until it is filled in, the site simply does not show that line.
-- ═══════════════════════════════════════════════════════════════════════

alter table settings add column if not exists legal_name text not null default '';
alter table settings add column if not exists address    text not null default '';
alter table settings add column if not exists fssai      text not null default '';
alter table settings add column if not exists allergens  text not null default '';
alter table settings add column if not exists terms      text not null default '';

update settings set
  legal_name = 'Sahasra Home Foods',
  address    = '',
  fssai      = '',
  allergens  = 'Our food is cooked in a home kitchen that also handles peanuts, cashews, almonds and other tree nuts, sesame, wheat, milk and ghee. We cannot guarantee any item is free of these. Please tell us about any allergy when you order.',
  terms      = 'Everything is cooked to order in small batches, so please allow time for larger quantities. Bulk and festival orders need more notice.

Prices are in Indian Rupees and include all applicable taxes. Prices may change; the price confirmed on WhatsApp when you order is the one that applies.

Orders are confirmed over WhatsApp, not on this website. Please cancel as early as you can. Once we have started cooking or bought ingredients for a large or festival order we may not be able to cancel it.

Some items show a stock photograph rather than our own cooking. Photographs are indicative; the food you receive is made fresh by hand and will not look identical.

When you send an order you share your name, delivery address and phone number with us over WhatsApp. We use those details only to prepare and deliver your order, and we do not sell or share them. This website itself does not ask you for any personal details.'
where id = 1;

select legal_name, fssai, address from settings where id = 1;
