USE electric_vehicle_population;

-- Query 1 most popular model and make in each legislative district
CREATE VIEW popular_model_by_district AS
SELECT legislative_district, make, model, COUNT(model) AS count
	FROM vehicle_make
    JOIN electric_vehicle_information USING (vehicle_id)
    JOIN government USING (government_id)
    GROUP BY legislative_district, make, model
    ORDER BY legislative_district, count DESC;

-- Query 2 most popular model by brand
CREATE VIEW popular_model AS
SELECT make, model, COUNT(model) AS count
FROM vehicle_make
WHERE make = (
	SELECT make
	FROM vehicle_make
	GROUP BY make
	ORDER BY COUNT(model) DESC
	LIMIT 1
)
GROUP BY make, model
ORDER BY count DESC
LIMIT 1;

-- Query 3 least expensive model to most expensive
CREATE VIEW least_expensive_model AS
SELECT make, model, MIN(base_msrp) AS min_price
	FROM electric_vehicle_information
    JOIN vehicle_make USING (vehicle_id)
    GROUP BY make, model
    ORDER BY min_price ASC;
    
-- Query 4 which vehicles have a base msrp greater than $50,000
CREATE VIEW base_msrp_over_fifty_thousand AS
SELECT government_id, base_msrp
FROM electric_vehicle_information
JOIN government USING (government_id)
WHERE base_msrp > 50000;

-- Query 5 the average electric range for legislative district
CREATE VIEW avg_electric_range_by_district AS
SELECT legislative_district, AVG(electric_range) AS avg_electric_range
FROM electric_vehicle_information
JOIN government USING (government_id)
GROUP BY legislative_district
ORDER BY avg_electric_range DESC;




