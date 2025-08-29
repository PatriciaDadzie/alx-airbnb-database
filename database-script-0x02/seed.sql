-- Seed Script for AirBnB Database


-- User Table

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (UUID(), 'Kuukua', 'Dadzie', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest'),
    (UUID(), 'Maxwell', 'Opare', 'bob@example.com', 'hashed_pw2', '0987654321', 'host'),
    (UUID(), 'Kofi', 'Baah', 'charlie@example.com', 'hashed_pw3', NULL, 'guest'),
    (UUID(), 'Admin', 'User', 'admin@example.com', 'hashed_admin', NULL, 'admin');


-- Property Table

-- Properties owned by Maxwell (host)
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'),
     'Cozy Apartment', 'A small but cozy apartment in the city center.', 'New York', 120.00),
    (UUID(), (SELECT user_id FROM User WHERE email = 'bob@example.com'),
     'Beach House', 'Beautiful house by the beach with sea view.', 'Miami', 250.00);


-- Booking Table
-- Kuukua books the Cozy Apartment
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (UUID(),
     (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'),
     (SELECT user_id FROM User WHERE email = 'alice@example.com'),
     '2025-09-10', '2025-09-15', 600.00, 'confirmed');

-- Kofi books the Beach House
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (UUID(),
     (SELECT property_id FROM Property WHERE name = 'Beach House'),
     (SELECT user_id FROM User WHERE email = 'charlie@example.com'),
     '2025-10-01', '2025-10-05', 1000.00, 'pending');


-- Payment Table

-- Payment for Kuukua's booking
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    (UUID(),
     (SELECT booking_id FROM Booking WHERE status = 'confirmed' AND user_id = (SELECT user_id FROM User WHERE email = 'alice@example.com')),
     600.00, 'credit_card');


-- Review Table

-- Kuukua leaves a review for the Cozy Apartment
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    (UUID(),
     (SELECT property_id FROM Property WHERE name = 'Cozy Apartment'),
     (SELECT user_id FROM User WHERE email = 'alice@example.com'),
     5, 'Amazing stay! The apartment was clean and comfortable.');


-- Message Table

-- Kuukua sends a message to Maxwell (host)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    (UUID(),
     (SELECT user_id FROM User WHERE email = 'alice@example.com'),
     (SELECT user_id FROM User WHERE email = 'bob@example.com'),
     'Hi Maxwell, is early check-in possible?');

-- Maxwell replies
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    (UUID(),
     (SELECT user_id FROM User WHERE email = 'bob@example.com'),
     (SELECT user_id FROM User WHERE email = 'alice@example.com'),
     'Yes, early check-in is fine. See you soon!');
