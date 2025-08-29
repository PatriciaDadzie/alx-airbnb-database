# AirBnB Database Schema

## Overview
This directory contains the **DDL (Data Definition Language)** script that defines the database schema for the AirBnB project.

The schema implements entities:
- **User**
- **Property**
- **Booking**
- **Payment**
- **Review**
- **Message**

## Features
- Primary keys are UUIDs.
- Foreign key constraints enforce relationships.
- ENUMs used for `role`, `status`, and `payment_method`.
- Indexes on frequently queried fields (`email`, foreign keys).
- Constraints such as `NOT NULL`, `UNIQUE`, and `CHECK` ensure data integrity.

## Files
- `schema.sql` → SQL script to create all tables and constraints.
- `README.md` → Documentation of the schema.

## Usage
To create the schema in MySQL/MariaDB:

```bash
mysql -u <username> -p < database_name < schema.sql
