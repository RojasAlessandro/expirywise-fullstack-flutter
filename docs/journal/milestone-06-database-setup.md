# Milestone 6: Database Setup

## Date
2026-04-27

## What I built
I connected the ExpiryWise Express backend to a local PostgreSQL database. I created a database connection file, added a database test endpoint, and updated the food items route so that it queries seeded food item data from PostgreSQL instead of using hardcoded mock data.

## What I learned
I learned how PostgreSQL stores app data in tables, how Express connects to PostgreSQL using the `pg` package, and why environment variables are used to keep database credentials out of source code.

## Problems I faced
The Flutter app initially failed to load food items because PostgreSQL numeric values were returned as strings, causing a Dart type error.

## How I solved it
I updated the Flutter `FoodItem.fromJson` parsing logic to convert values like `quantity` and `estimatedCost` safely using `.toString()` and numeric parsing.

## Next step
Build more Flutter UI screens with mock/data-backed content, including login, register, dashboard, pantry, add food item, and expiring soon screens.