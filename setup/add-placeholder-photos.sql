-- ══════════════════════════════════════════════════════════════════════
--  PLACEHOLDER PHOTOS — licensed stock, not their food.
--  Replace each one from /admin as real photographs are taken.
--
--  To remove them all again:   update items set photo_url = null;
-- ══════════════════════════════════════════════════════════════════════

update items set photo_url = '/photos/ariselu.jpg' where name_en = 'Ariselu';
update items set photo_url = '/photos/bakshalu.jpg' where name_en = 'Bakshalu';
update items set photo_url = '/photos/bondi-laddu.jpg' where name_en = 'Bondi Laddu';
update items set photo_url = '/photos/sakinalu.jpg' where name_en = 'Sakinalu';
update items set photo_url = '/photos/janthikalu.jpg' where name_en = 'Janthikalu';
update items set photo_url = '/photos/bondi-mixture.jpg' where name_en = 'Bondi Mixture';
update items set photo_url = '/photos/cashews.jpg' where name_en = 'Cashews';
update items set photo_url = '/photos/idli-batter.jpg' where name_en = 'Idli Batter';
update items set photo_url = '/photos/curry-leaves-powder.jpg' where name_en = 'Curry Leaves Powder';
update items set photo_url = '/photos/fruit-bowl.jpg' where name_en = 'Fruit Bowl';

select name_en, photo_url from items where photo_url is not null order by name_en;