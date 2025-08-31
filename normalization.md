# Database Normalization - AirBnB

## Objective

Ensure that the AirBnB-style database schema conforms to the Third Normal Form (3NF).

---

## 1. First Normal Form (1NF)

**Rule:** Eliminate repeating groups and ensure atomicity.

- All attributes in the schema hold atomic values.
- No arrays or multi-valued fields.

✅ **Passes 1NF**

---

## 2. Second Normal Form (2NF)

**Rule:** Eliminate partial dependencies.

- All tables use single-column primary keys (UUIDs).
- No attribute depends only on part of a composite key.

✅ **Passes 2NF**

---

## 3. Third Normal Form (3NF)

**Rule:** Eliminate transitive dependencies.

- All non-key attributes depend only on the primary key.
- No attribute is dependent on another non-key attribute.

✅ **Passes 3NF**

---

## Optional Consideration

- **Location** could be normalized into a separate table if locations are reused across properties. Current design keeps it as a simple field for simplicity.

---

## Final Verdict

The database schema conforms to **Third Normal Form (3NF)** and is well-structured for production use.

