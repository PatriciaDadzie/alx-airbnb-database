# Airbnb Database Project - Advanced SQL Joins

This project is part of the **ALX Airbnb Database Module**, focusing on mastering SQL joins by writing complex queries across multiple tables in the Airbnb schema.

---

## Files
- **joins_queries.sql** → Contains SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
- **README.md** → Documentation and explanations of the queries.

---

## Queries Implemented

### 1. INNER JOIN: Bookings with Users
```sql
SELECT b.id, b.property_id, b.start_date, b.end_date, u.id, u.name, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;
