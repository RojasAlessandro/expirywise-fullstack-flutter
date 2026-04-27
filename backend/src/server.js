// Bring Express into this file so that I can create a backend server.
const express = require('express');

const { pool, testDatabaseConnection } = require('./config/db');

// Create my Express application
const app = express();

// Stores the port number in a variable
const PORT = process.env.PORT ||5000;

// Allows the backend to understand JSON request later
app.use(express.json());

const mockFoodUItems = [
    {
        id: 1,
        name: 'Milk',
        category: 'Dairy',
        quantity: 1,
        unit: 'carton',
        purchaseDate: '2026-04-24',
        expiryDate: '2026-04-28',
        estimatedCost: 3.50,
        storageLocation: 'Fridge',
        status: 'active',
    },
    {
        id: 2,
        name: 'Chicken Breast',
        category: 'Meat',
        quantity: 2,
        unit: 'pieces',
        purchaseDate: '2026-04-24',
        expiryDate: '2026-04-27',
        estimatedCost: 6.80,
        storageLocation: 'Fridge',
        status: 'active',
    },
    {
        id: 3,
        name: 'Rice',
        category: 'Dry Goods',
        quantity: 5,
        unit: 'kg',
        purchaseDate: '2026-04-20',
        expiryDate: '2027-04-20',
        estimatedCost: 12.00,
        storageLocation: 'Pantry',
        status: 'active',
    },
];

// When someone sends a GET request to /api/health, reply with JSON.
// Creates the first API endpoint for /api/health.
// Can try and check in http://localhost:5000/api/health
app.get('/api/health', (req, res) => {
    // Sends JSON back to the client.
    res.json({
        status: 'ok',
        message: 'ExpiryWise backend is running',
    });
});

// When someone sends a GET request to /api/food-items, reply with JSON.
// Creates the second API endpoint for /api/food-items.
// Can try and check in http://localhost:5000/api/food-items
//app.get('/api/food-items', (req, res) => {
//  res.json({
//    // message = human-readable explanation
//    // items = actual food item array
//    message: 'Food items retrieved successfully',
//    items: mockFoodUItems,
//  });
//});

// GET /api/food-items
// Retrieves all food items from PostgreSQL database,
// converts database column names from snake_case to camelCase for Flutter,
// and returns the items ordered by nearest expiry data.
app.get('/api/food-items', async (req, res) => {
    try {
      const result = await pool.query(`
        SELECT
          id,
          user_id AS "userId",
          name,
          category,
          quantity,
          unit,
          TO_CHAR(purchase_date, 'YYYY-MM-DD') AS "purchaseDate",
          TO_CHAR(expiry_date, 'YYYY-MM-DD') AS "expiryDate",
          estimated_cost AS "estimatedCost",
          storage_location AS "storageLocation",
          status
        FROM food_items
        ORDER BY expiry_date ASC;
      `);

      res.json({
        message: 'Food items retrieved successfully',
        items: result.rows,
        });
    } catch (error) {
      res.status(500).json({
        message: 'Failed to retrieve food items',
      });
    }
});

// When visiting http://localhost:5000/api/db-test,
// the backend will ask PostgreSQL: SELECT NOW();
app.get('/api/db-test', async (req, res) => {
    try {
        const result = await testDatabaseConnection();

        res.json({
            status: 'ok',
            message: 'Database connection is working',
            databaseTime: result.now,
        });
    } catch (error) {
      res.status(500).json({
          status: 'error',
          message: 'Database connection failed',
          error: error.message,
      });
    }
});


// Alternative testing for backend:
// 1. Make sure the backend is running using npm run dev
// 2. run Invoke-RestMethod http://localhost:5000/api/health
// 3. Should something like:
// status message
// ------ -------
// ok     ExpiryWise backend is running
app.listen(PORT, () => {
    console.log(`ExpiryWise backend is running on port ${PORT}`); // Use console swrily quote under escape
});