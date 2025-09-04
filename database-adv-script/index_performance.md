# Airbnb Database Project - Index Performance

This part of the **ALX Airbnb Database Module** focuses on **creating indexes** to improve query performance in frequently used columns.

---

## Indexed Columns
We identified columns based on their frequent use in **WHERE, JOIN, and ORDER BY** clauses:

- **Users Table**
  - `email`, `name` → commonly searched
- **Bookings Table**
  - `user_id`, `property_id` → used in JOINs
  - `start_date` → used in range queries
- **Properties Table**
  - `host_id` → used in filtering
  - `name` → used in search

---

## SQL Index Commands
Indexes were created using the following commands (see `database_index.sql`):

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_properties_host_id ON properties(host_id);
