-- Indexes for optimization in the Airbnb database schema

-- 1. Users table
-- Frequently used in JOINs and WHERE clauses
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(name);

-- 2. Bookings table
-- user_id and property_id are frequently used in JOINs
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- start_date is often used in filtering (WHERE start_date BETWEEN …)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 3. Properties table
-- host_id is used in filtering and joining
CREATE INDEX idx_properties_host_id ON properties(host_id);

-- property name may be searched (LIKE or =)
CREATE INDEX idx_properties_name ON properties(name);
