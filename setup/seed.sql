-- ═══════════════════════════════════════════════════════════════════════
--  SAHASRA HOME FOODS — the menu as it stands today.
--  Run schema.sql FIRST, then paste this and Run.
--  Running it again replaces the menu with this list.
-- ═══════════════════════════════════════════════════════════════════════

delete from items;
delete from sections;

insert into sections (slug, name, note, unit, step, sort) values ('sweets', 'Sweets', 'Priced per kilogram', 'kg', 0.5, 0);
insert into items (section_id, name_en, name_te, price, sort) values
  ((select id from sections where slug = 'sweets'), 'Dry Fruit Laddu', 'డ్రై ఫ్రూట్ లడ్డు', 1850, 0),
  ((select id from sections where slug = 'sweets'), 'Bakshalu', 'బక్షాలు (బొబ్బట్లు)', 800, 1),
  ((select id from sections where slug = 'sweets'), 'Ariselu', 'అరిసెలు', 550, 2),
  ((select id from sections where slug = 'sweets'), 'Nuvvula Laddu', 'నువ్వుల లడ్డు', 400, 3),
  ((select id from sections where slug = 'sweets'), 'Murmura Laddu', 'మరమరాల లడ్డు', 400, 4),
  ((select id from sections where slug = 'sweets'), 'Palli Laddu', 'పల్లి లడ్డు', 300, 5),
  ((select id from sections where slug = 'sweets'), 'Bondi Laddu', 'బొంది లడ్డు', 300, 6);

insert into sections (slug, name, note, unit, step, sort) values ('snacks', 'Snacks', 'Priced per kilogram', 'kg', 0.5, 1);
insert into items (section_id, name_en, name_te, price, sort) values
  ((select id from sections where slug = 'snacks'), 'Poha Mixture', 'అటుకుల మిక్చర్', 680, 0),
  ((select id from sections where slug = 'snacks'), 'Karam Senagapappu', 'కారం శెనగపప్పు', 600, 1),
  ((select id from sections where slug = 'snacks'), 'Ribbon Pakoda', 'రిబ్బన్ పకోడా', 600, 2),
  ((select id from sections where slug = 'snacks'), 'Sakinalu', 'సకినాలు', 400, 3),
  ((select id from sections where slug = 'snacks'), 'Palli Chekalu', 'పల్లి చెకలు', 400, 4),
  ((select id from sections where slug = 'snacks'), 'Pappu Chekalu', 'పప్పు చెకలు', 400, 5),
  ((select id from sections where slug = 'snacks'), 'Star Murukulu', 'స్టార్ మురుకులు', 400, 6),
  ((select id from sections where slug = 'snacks'), 'Janthikalu', 'జంతికలు', 400, 7),
  ((select id from sections where slug = 'snacks'), 'Karam Bondi', 'కారం బొంది', 350, 8),
  ((select id from sections where slug = 'snacks'), 'Bondi Mixture', 'బొంది మిక్చర్', 350, 9),
  ((select id from sections where slug = 'snacks'), 'Corn Flakes Mixture', 'కార్న్ ఫ్లేక్స్ మిక్చర్', 300, 10),
  ((select id from sections where slug = 'snacks'), 'Chudva Atukulu', 'చూడ్వా అటుకులు', 280, 11);

insert into sections (slug, name, note, unit, step, sort) values ('podi', 'Podi & Powders', 'Priced per 250 g pack', 'pack', 1, 2);
insert into items (section_id, name_en, name_te, price, sort) values
  ((select id from sections where slug = 'podi'), 'Munagaku Powder', 'మునగాకు పొడి', 170, 0),
  ((select id from sections where slug = 'podi'), 'Vellulli Karam Podi', 'వెల్లుల్లి కారం పొడి', 165, 1),
  ((select id from sections where slug = 'podi'), 'Curry Leaves Powder', 'కరివేపాకు పొడి', 150, 2),
  ((select id from sections where slug = 'podi'), 'Kandi Podi', 'కంది పొడి', 150, 3),
  ((select id from sections where slug = 'podi'), 'Flax Seeds Powder', 'అవిసె గింజల పొడి', null, 4),
  ((select id from sections where slug = 'podi'), 'Idli Karam Powder', 'ఇడ్లీ కారం పొడి', null, 5);

insert into sections (slug, name, note, unit, step, sort) values ('batter', 'Fresh Batters', 'Priced per kilogram', 'kg', 1, 3);
insert into items (section_id, name_en, name_te, price, sort) values
  ((select id from sections where slug = 'batter'), 'Idli Batter', 'ఇడ్లీ పిండి', 70, 0),
  ((select id from sections where slug = 'batter'), 'Dosa Batter', 'దోస పిండి', 70, 1),
  ((select id from sections where slug = 'batter'), 'Vada Batter', 'వడ పిండి', null, 2);

insert into sections (slug, name, note, unit, step, sort) values ('bowls', 'Healthy Bowls', 'Made fresh daily · each', 'bowl', 1, 4);
insert into items (section_id, name_en, name_te, price, sort) values
  ((select id from sections where slug = 'bowls'), 'Chana Bowl', 'శెనగల బౌల్', 40, 0),
  ((select id from sections where slug = 'bowls'), 'Sweet Corn Bowl', 'స్వీట్ కార్న్ బౌల్', 40, 1),
  ((select id from sections where slug = 'bowls'), 'Protein Bowl', 'ప్రోటీన్ బౌల్', 40, 2),
  ((select id from sections where slug = 'bowls'), 'Fruit Bowl', 'ఫ్రూట్ బౌల్', 40, 3),
  ((select id from sections where slug = 'bowls'), 'Veg Sandwich', 'వెజ్ శాండ్‌విచ్', 40, 4);

insert into sections (slug, name, note, unit, step, sort) values ('dry', 'Dry Fruits', 'Priced per kilogram', 'kg', 0.5, 5);
insert into items (section_id, name_en, name_te, price, sort) values
  ((select id from sections where slug = 'dry'), 'Cashews', 'జీడిపప్పు', 1020, 0),
  ((select id from sections where slug = 'dry'), 'Almonds', 'బాదం', null, 1),
  ((select id from sections where slug = 'dry'), 'Raisins', 'కిస్మిస్', null, 2);

-- 6 sections, 36 items