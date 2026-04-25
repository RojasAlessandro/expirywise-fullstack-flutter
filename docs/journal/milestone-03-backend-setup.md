# Milestone 3: Backend Setup

## Date
2026-04-25

## What I built
I initialized the Node.js backend for ExpiryWise, installed Express, created a basic backend server, and added a health check endpoint at `/api/health`.

## What I learned
I learned that Node.js lets JavaScript run outside the browser, Express helps create API routes, and a health check endpoint is used to confirm that a backend server is running correctly.

## Problems I faced
Write any issues you faced here, such as missing Node.js, missing Express, package.json script errors, or port conflicts.

## How I solved it
Write how you fixed the issue here.

## Next step
Plan the database schema for users, food items, and waste logs.

## Additional Progress

I added a mock food item route at `/api/food-items`.

This route returns sample grocery data such as milk, chicken breast, and rice. I used mock data first so I can learn how backend API routes work before connecting the backend to PostgreSQL.

This prepares the project for the next milestone, where the Flutter app will fetch food item data from the backend.