Step 1: First Normal Form (1NF)

Rule:

Eliminate repeating groups.

Ensure each field contains only atomic values.

Application to AirBnB schema:

All attributes contain atomic values (e.g., first_name, last_name, email).

No multi-valued attributes (e.g., phone numbers, payment methods).

Each table has a primary key.

✅ The schema satisfies 1NF.

Step 2: Second Normal Form (2NF)

Rule:

Must be in 1NF.

Remove partial dependencies (no non-key attribute should depend on part of a composite key).

Application:

All tables use single-column primary keys (UUIDs), not composite keys.

Therefore, no partial dependency issues.

✅ The schema satisfies 2NF.

Step 3: Third Normal Form (3NF)

Rule:

Must be in 2NF.

Remove transitive dependencies (non-key attributes should depend only on the key, not on other non-key attributes).

Checks:

User Table

role is independent of other non-key attributes.

✅ No transitive dependencies.

Property Table

All attributes depend on property_id.

host_id is a foreign key → valid dependency.

✅ No transitive dependencies.

Booking Table

total_price could be considered derived from (pricepernight × nights).

Keeping it stored introduces potential redundancy.

Option 1: Keep it for performance (denormalization).

Option 2: Remove it to strictly enforce 3NF.

⚠️ Suggested: Remove total_price from schema OR mark it as a computed field instead of stored.

Payment Table

All attributes depend only on payment_id.

✅ No issues.

Review Table

rating, comment depend only on review_id.

✅ No issues.

Message Table

message_body, sent_at depend only on message_id.

✅ No issues.

Final Adjustments

Remove total_price from Booking (to strictly comply with 3NF).

Instead, calculate when needed:

total_price = Property.pricepernight × DATEDIFF(end_date, start_date)


All other tables are already in 3NF.

Conclusion

The AirBnB database schema is normalized to Third Normal Form (3NF), with only one adjustment recommended:

Remove or compute total_price dynamically in the Booking table to avoid redundancy.

This ensures:

Minimal data redundancy.

Improved consistency.

Clear relationships between entities.