// Bring Express into this file so that I can create a backend server.
const express = require('express');

// Create my Express application
const app = express();

// Stores the port number in a variable
const PORT = 5000;

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
// Creates the first API endpoint for /api/food-items.
// Can try and check in http://localhost:5000/api/food-items
app.get('/api/food-items', (req, res) => {
  res.json({
    // message = human-readable explanation
    // items = actual food item array
    message: 'Food items retrieved successfully',
    items: mockFoodUItems,
  });
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