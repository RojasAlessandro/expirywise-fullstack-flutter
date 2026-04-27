-- ExpiryWise Database Schema
-- This schema is planned for PostgreSQL.

DROP TABLE IF EXISTS waste_logs;
DROP TABLE IF EXISTS shopping_reflections;
DROP TABLE IF EXISTS food_items;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE food_items (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- If a user is deleted, their food items/reflections/waste logs are also deleted
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    quantity NUMERIC(10, 2) NOT NULL DEFAULT 1,
    unit VARCHAR(30) NOT NULL,
    purchase_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    estimated_cost NUMERIC(10, 2) NOT NULL DEFAULT 0,
    storage_location VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT food_items_status_check
        -- Only allow valid statuses
        -- So the database accepts: active, used, wasted, donated, expired
        CHECK (status IN ('active', 'used', 'wasted', 'donated', 'expired'))
);

CREATE TABLE waste_logs (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    food_item_id INTEGER NOT NULL REFERENCES food_items(id) ON DELETE CASCADE,
    -- If a user is deleted, their food items/reflections/logs are also deleted.
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    action VARCHAR(20) NOT NULL,
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT waste_logs_action_check
        CHECK (action IN ('used', 'wasted', 'donated', 'expired'))
);

CREATE TABLE shopping_reflections (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    -- If a user is deleted, their food items/reflections/logs are also deleted.
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    reflection TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);