-- Partitioning the bookings table by start_date (Range Partitioning Example)

-- 1. Drop old partitioned table if exists (for reruns)
DROP TABLE IF EXISTS bookings_partitioned;

-- 2. Create a partitioned version of the bookings table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create partitions (example: yearly partitions)
CREATE TABLE bookings_2022 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Default partition for future or missing ranges
CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    DEFAULT;
