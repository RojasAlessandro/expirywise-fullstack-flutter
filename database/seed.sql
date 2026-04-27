-- ExpiryWise Sample Seed Data
-- This data is for local development only.

INSERT INTO users (name, email, password_hash)
VALUES
-- This is okay for local development, 'not_a_real_password_hash'
-- Do not put real passwords in seed files
-- Later when building authentication, the backend will hash passwords properly
('Demo User', 'demo@expirywise.local', 'not_a_real_password_hash');

INSERT INTO food_items (
    user_id,
    name,
    category,
    quantity,
    unit,
    purchase_date,
    expiry_date,
    estimated_cost,
    storage_location,
    status
)
VALUES
(1, 'Milk', 'Dairy', 1, 'carton', '2026-04-24', '2026-04-28', 3.50, 'Fridge', 'active'),
(1, 'Chicken Breast', 'Meat', 2, 'pieces', '2026-04-24', '2026-04-27', 6.80, 'Fridge', 'active'),
(1, 'Rice', 'Dry Goods', 5, 'kg', '2026-04-20', '2027-04-20', 12.00, 'Pantry', 'active'),
(1, 'Spinach', 'Vegetables', 1, 'bag', '2026-04-24', '2026-04-26', 2.20, 'Fridge', 'active'),
(1, 'Bread', 'Bakery', 1, 'loaf', '2026-04-23', '2026-04-27', 2.80, 'Pantry', 'active');

INSERT INTO waste_logs (
    food_item_id,
    user_id,
    action,
    notes
)
VALUES
(4, 1, 'used', 'Used spinach for dinner before it expired.'),
(5, 1, 'wasted', 'Bread became stale before it was finished.');

INSERT INTO shopping_reflections (
    user_id,
    title,
    reflection
)
VALUES
(
    1,
    'First shopping reflection',
    'I should check the fridge before buying more vegetables because they expire quickly.'
);