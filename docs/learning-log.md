# Learning Log

This file summarizes the main concepts I learned while building ExpiryWise.

| Date       | Milestone | What I learned | Evidence |
|------------|---|---|---|
| 2026-04-24 | Milestone 1: Project Setup | Set up a full-stack monorepo with folders for mobile, backend, database, and documentation. | Created project structure and README. |
| 2026-04-24 | Milestone 2: Flutter App Setup | Learned the basic Flutter screen structure: `main()` → `MaterialApp` → `Scaffold` → widgets. | Created the ExpiryWise welcome screen. |
| 2026-04-25 | Milestone 3: Backend Basics | Learned how to initialize a Node.js backend, install Express, create a health check route, and return mock JSON data. | Created `/api/health` and `/api/food-items`. |
| 2026-04-27 | Milestone 4: Flutter Connects to Backend | Learned how Flutter can call an Express API using the `http` package, convert JSON into Dart model objects, and display loading/error/empty states. | Created `FoodItem`, `ApiService`, and Pantry Preview screen. |