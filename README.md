# Sahasra Home Foods

Menu website for a home-food business in Manikonda, Hyderabad.
Homemade Telugu sweets, snacks, podi, fresh batters and healthy bowls.

**Live:** https://sahasra-home-foods.vercel.app
**Menu editor:** https://sahasra-home-foods.vercel.app/admin

## What is here

| | |
|---|---|
| `index.html` | The menu customers see. Tap to add, order opens in WhatsApp. |
| `admin.html` | Sign in to change names, Telugu names, prices, photos, phone numbers. |
| `brand/` | Share card and app icons. |
| `setup/` | Database scripts and the setup guide. Not deployed. |

## How it works

No build step, no framework, no npm. Two HTML files served as they are.

The live menu comes from a Supabase database. `index.html` also keeps a full
copy of the menu inside itself (`FALLBACK_MENU`), so if the database is ever
paused or unreachable the site shows that instead of going blank.

Prices, names and photos are edited at `/admin` — never by editing these files.

## Deploying

Vercel builds from this repo automatically. Push to `main` and it goes live.

## Never commit

- the Supabase **secret** key (`sb_secret_...`) or `service_role` key
- the database password
- anyone's login password

The publishable key in the pages is public by design and can only read the
menu. Database rules (`setup/schema.sql`) allow writes only to accounts listed
in the `admins` table.
