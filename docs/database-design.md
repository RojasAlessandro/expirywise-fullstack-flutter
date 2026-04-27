# ExpiryWise Database Design

## Purpose

This document explains the planned database structure for ExpiryWise.

ExpiryWise needs to store users, grocery items, waste/usage actions, and shopping reflections.

## Main Tables

### users

Stores registered user accounts.

| Column | Type | Purpose |
|---|---|---|
| id | integer | Unique user id |
| name | text | User's display name |
| email | text | User's email address |
| password_hash | text | Hashed password, not plain password |
| created_at | timestamp | When the user was created |

### food_items

Stores grocery or pantry items owned by a user.

| Column | Type | Purpose |
|---|---|---|
| id | integer | Unique food item id |
| user_id | integer | Owner of the food item |
| name | text | Food item name |
| category | text | Food category such as Dairy, Meat, Dry Goods |
| quantity | numeric | Item quantity |
| unit | text | Unit such as carton, pieces, kg |
| purchase_date | date | Date the item was bought |
| expiry_date | date | Date the item expires |
| estimated_cost | numeric | Estimated cost of the item |
| storage_location | text | Fridge, Freezer, Pantry, etc. |
| status | text | active, used, wasted, donated, expired |
| created_at | timestamp | When the item was added |
| updated_at | timestamp | When the item was last updated |

### waste_logs

Stores actions taken on food items.

| Column | Type | Purpose |
|---|---|---|
| id | integer | Unique log id |
| food_item_id | integer | Food item being logged |
| user_id | integer | User who performed the action |
| action | text | used, wasted, donated, expired |
| notes | text | Optional note about the action |
| created_at | timestamp | When the action happened |

### shopping_reflections

Stores user-written reflections about shopping habits.

| Column | Type | Purpose |
|---|---|---|
| id | integer | Unique reflection id |
| user_id | integer | User who wrote the reflection |
| title | text | Reflection title |
| reflection | text | Reflection content |
| created_at | timestamp | When the reflection was created |

## Relationships

```mermaid
erDiagram
    users ||--o{ food_items : owns
    users ||--o{ waste_logs : creates
    users ||--o{ shopping_reflections : writes
    food_items ||--o{ waste_logs : has