-- Initial query: Retrieve bookings with user, property, and payment details
-- Includes WHERE and AND clauses
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.id AS payment_id,
    pay.amount,
    pay.status AS payment_status,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
WHERE b.start_date IS NOT NULL 
  AND pay.status = 'Completed';


-- Analyze performance of the initial query
EXPLAIN 
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.id AS payment_id,
    pay.amount,
    pay.status AS payment_status,
    pay.payment_date
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
WHERE b.start_date IS NOT NULL 
  AND pay.status = 'Completed';


-- Optimized query: Using selective columns, filters, and indexes
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.status AS payment_status
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
LEFT JOIN Payment pay ON b.id = pay.booking_id
WHERE b.start_date IS NOT NULL 
  AND pay.status = 'Completed';
