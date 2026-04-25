// Bring Express into this file so that I can create a backend server.
const express = require('express');

// Create my Express application
const app = express();

// Stores the port number in a variable
const PORT = 5000;

// Allows the backend to understand JSON request later
app.use(express.json());

// When someone sends a GET request to /api/health, reply with JSON.
// Creates the first API endpoint
// Can try and check in http://localhost:5000/api/health
app.get('/api/health', (req, res) => {
    // Sends JSON back to the client.
    res.json({
        status: 'ok',
        message: 'ExpiryWise backend is running',
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