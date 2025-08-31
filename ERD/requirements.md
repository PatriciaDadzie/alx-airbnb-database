# AirBnB Database - ER Diagram

## Entities

- User
- Property
- Booking
- Payment
- Review
- Message

## Relationships

- A User can:
  - own many Properties
  - make many Bookings
  - write many Reviews
  - send and receive Messages
- A Property can have many:
  - Bookings
  - Reviews
- Each Booking has one Payment

## ER Diagram

> File included: `airbnb_er_diagram.drawio` and `airbnb_er_diagram.png`

Visual representation shows:
- Primary keys and foreign keys
- Attributes per entity
- Relationship cardinality
