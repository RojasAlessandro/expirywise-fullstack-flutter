// This line imports the PostgreSQL client
const { Pool } = require('pg');
// This line loads the .env values
require('dotenv').config();

// This part creates the connection settings
const pool = new Pool({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
});

// This part checks if the database connection works
async function testDatabaseConnection() {
    const result = await pool.query('SELECT NOW()');
    return result.rows[0];
}

module.exports = {
    pool,
    testDatabaseConnection,
};