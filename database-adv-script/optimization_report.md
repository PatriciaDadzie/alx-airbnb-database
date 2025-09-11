# Query Optimization Report

## Initial Query
The initial query joined the Booking, User, Property, and Payment tables to retrieve booking details along with user, property, and payment information.

```sql
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
LEFT JOIN Payment pay ON b.id = pay.booking_id;
