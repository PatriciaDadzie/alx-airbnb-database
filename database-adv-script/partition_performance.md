# Airbnb Database Project - Partitioning Performance

This task demonstrates how **partitioning a large table** can improve query performance.  
We implemented **range partitioning** on the `bookings` table based on the `start_date` column.

---

## Partition Strategy
- The original `bookings` table was replaced by `bookings_partitioned`.
- Partitioned by **year of start_date**:
  - `bookings_2022`
  - `bookings_2023`
  - `bookings_2024`
  - `bookings_future` (default catch-all)

---

## Performance Testing

### Query Example
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2023-01-01' AND '2023-06-30';
