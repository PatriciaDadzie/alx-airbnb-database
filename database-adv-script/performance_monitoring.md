# Airbnb Database Project - Performance Monitoring & Refinement

This task demonstrates how to **monitor, identify bottlenecks, and refine database performance** in the Airbnb schema.  
We used tools like `EXPLAIN ANALYZE` (PostgreSQL) or `SHOW PROFILE` (MySQL) to study query execution plans.

---

## Step 1: Queries Tested

### Query A: Bookings by User
```sql
EXPLAIN ANALYZE
SELECT b.id, b.property_id, b.start_date, b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE u.email = 'testuser@example.com';
