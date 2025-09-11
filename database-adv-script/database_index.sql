-- Index on Users table
CREATE INDEX idx_users_email ON users(email);

-- Indexes on Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Index on Properties table
CREATE INDEX idx_properties_location ON properties(location);

-- Measure performance BEFORE and AFTER using EXPLAIN ANALYZE

-- Query 1: Join bookings with users (check email lookups)
EXPLAIN ANALYZE
SELECT * 
FROM bookings b
JOIN users u ON b.user_id = u.id
WHERE u.email = 'test@example.com';

-- Query 2: Date range search on bookings
EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

-- Query 3: Property search by location
EXPLAIN ANALYZE
SELECT * 
FROM properties
WHERE location = 'Accra';
