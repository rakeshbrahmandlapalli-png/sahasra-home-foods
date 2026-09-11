═══════════════════════════════════════════════════════════════════════
 SAHASRA HOME FOODS — what is in this folder
═══════════════════════════════════════════════════════════════════════

 index.html    The menu customers see. Browse, tap ADD, the green bar
               opens WhatsApp with the order already written out.

 admin.html    The edit screen. Sign in and change any name, Telugu
               name, price, section, photo or phone number.
               Changes appear on the customer site straight away.

 setup/        SETUP-GUIDE.txt  step by step, do this first
               schema.sql       builds the database
               seed.sql         puts today's menu into it


───────────────────────────────────────────────────────────────────────
 HOW IT FITS TOGETHER
───────────────────────────────────────────────────────────────────────
 The live menu lives in a Supabase database. index.html asks for it
 every time someone opens the page.

 index.html also keeps a full copy of the menu inside itself. If the
 database is ever unreachable, paused or empty, customers see that copy
 instead of a blank page. It is marked FALLBACK_MENU near the bottom of
 the file. It is worth refreshing it once or twice a year, but nothing
 breaks if you forget.


───────────────────────────────────────────────────────────────────────
 EDITING IT IN VS CODE
───────────────────────────────────────────────────────────────────────
 File → Open Folder → this folder. Click a file, edit, Ctrl+S.

 To see the site while you work, the files must be SERVED, not just
 double-clicked — the database will not load from a file:// page.
 Easiest way: install the "Live Preview" extension by Microsoft, then
 right-click index.html → "Show Preview".


───────────────────────────────────────────────────────────────────────
 NEVER PUT THESE IN ANY FILE HERE
───────────────────────────────────────────────────────────────────────
   • the Supabase SECRET key (sb_secret_...) or service_role key
   • the database password
   • anybody's login password

 Everything in this folder ends up public once the site is online.
 The PUBLISHABLE key sits inside index.html and admin.html on purpose —
 it is designed to be public and can only read the menu. The SECRET key
 bypasses every rule; if it ever goes online, anyone can rewrite the menu.


───────────────────────────────────────────────────────────────────────
 STILL TO SETTLE BEFORE THE SITE GOES PUBLIC
───────────────────────────────────────────────────────────────────────
 1. Five items have no price and show "Call for price":
    Flax Seeds Powder, Idli Karam Powder, Vada Batter, Almonds, Raisins.
 2. One snack could not be read from the notebook — looked like "Pusa",
    Rs 350/kg. Left off the site rather than guess a food name.
 3. Poha Mixture Rs 680/kg — the dearest snack. Could be 630.
 4. Dry Fruit Laddu — the flyer says 1800, the handwritten notes 1850.
 5. Which number takes orders — assumed WhatsApp 95153 62514, with
    72078 06223 as the Call button.
 6. The Telugu spellings have never been checked by a Telugu reader.

 Also outstanding: no domain, no hosting, no photos, no delivery area,
 no opening hours, no minimum order.
