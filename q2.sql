USE car_dealership;

SELECT v.make, v.model, v.year
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;
