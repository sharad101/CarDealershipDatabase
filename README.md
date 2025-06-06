# 🚗 Car Dealership SQL Database

This project provides a complete SQL setup for managing a fictional car dealership system. It includes table creation, sample data insertion, and test queries to explore and validate the database.

---

## 📦 What's Included

- `car_dealership_setup.sql` – Main script to create and populate the database
- Test queries:
  - `get_all_dealerships.sql`
  - `vehicles_by_dealership.sql`
  - `vehicle_by_vin.sql`
  - `dealership_by_vin.sql`
  - `dealerships_with_specific_vehicle.sql`
  - `sales_by_dealer_and_date.sql`

---

## 🛠️ How to Use

1. Open MySQL Workbench, DBeaver, or any SQL client.
2. Run `car_dealership_setup.sql` to create and populate the database.
3. Execute the individual `.sql` test files to verify functionality or run reports.

---

## 🧠 Interesting Discovery

> **Which dealerships currently stock a red Ford Mustang?**

This query shows how SQL joins can answer real-world questions like specific inventory searches:

```sql
SELECT DISTINCT d.name, d.address
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON v.VIN = i.VIN
WHERE v.make = 'Ford'
  AND v.model = 'Mustang'
  AND v.color = 'Red';
