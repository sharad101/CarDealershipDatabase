USE car_dealership;

SELECT sc.*
FROM sales_contracts sc
JOIN inventory i ON sc.VIN = i.VIN
WHERE i.dealership_id = 1
  AND sc.sale_date BETWEEN '2025-05-01' AND '2025-06-30';
