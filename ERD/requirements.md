Entities and Attributes
1. User

user_id (PK)

first_name

last_name

email (Unique)

password_hash

phone_number (nullable)

role (ENUM: guest, host, admin)

created_at (timestamp)

2. Property

property_id (PK)

host_id (FK → User.user_id)

name

description

location

pricepernight (decimal)

created_at (timestamp)

updated_at (timestamp, auto-updated)

3. Booking

booking_id (PK)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

start_date

end_date

total_price (decimal)

status (ENUM: pending, confirmed, canceled)

created_at (timestamp)

4. Payment

payment_id (PK)

booking_id (FK → Booking.booking_id)

amount (decimal)

payment_date (timestamp)

payment_method (ENUM: credit_card, paypal, stripe)

5. Review

review_id (PK)

property_id (FK → Property.property_id)

user_id (FK → User.user_id)

rating (integer, 1–5)

comment (text)

created_at (timestamp)

6. Message

message_id (PK)

sender_id (FK → User.user_id)

recipient_id (FK → User.user_id)

message_body (text)

sent_at (timestamp)

Relationships

User → Property

One User (host) can create many Properties.

A Property belongs to exactly one User.

(1 User : N Properties)

User → Booking

A User (guest) can make many Bookings.

A Booking belongs to exactly one User.

(1 User : N Bookings)

Property → Booking

A Property can be booked many times.

A Booking refers to exactly one Property.

(1 Property : N Bookings)

Booking → Payment

A Booking can have one or more Payments.

A Payment belongs to exactly one Booking.

(1 Booking : N Payments)

User → Review

A User (guest) can write many Reviews.

A Review belongs to exactly one User.

(1 User : N Reviews)

Property → Review

A Property can receive many Reviews.

A Review belongs to exactly one Property.

(1 Property : N Reviews)

User → Message

A User can send many Messages and receive many Messages.

Each Message has exactly one sender and one recipient.

(User : Message : User)