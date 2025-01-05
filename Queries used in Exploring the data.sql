-- Query 1 - Identify frequently delivery route

-- SELECT origin, destination, COUNT(*) as frequency
-- FROM deliveries
-- GROUP BY origin, destination
-- ORDER BY frequency DESC

-- Query 2: Calculate Average Delivery Time per Route

-- SELECT origin, destination, ROUND(AVG(deliverytime),0) as AverageDeliveryTime
-- FROM deliveries
-- GROUP BY origin, destination
-- ORDER BY AverageDeliveryTime 


-- 3.	Query 3: Identify Costliest Routes

-- Select r.origin, r.destination, SUM(c.totalcost) as totalsum
-- FROM routes as r
-- LEFT JOIN costs as c
-- USING(routeid)
-- GROUP BY r.origin, r.destination
-- ORDER BY totalsum DESC


-- Query 4 - Detect Routes with Delays
SELECT origin, destination, deliverytime, expectedtime, deliverytime - expectedtime as delayedby
FROM deliveries
WHERE deliverytime > expectedtime

-- Query 5 - Using conditional statement, express delayed, early or on time deliveries

-- SELECT deliveryid, origin, destination,
-- CASE
--  WHEN deliverytime > expectedtime THEN 'Delayed'
-- 	WHEN deliverytime = expectedtime THEN 'On time'
-- 	WHEN deliverytime < expectedtime THEN 'Early'
-- END as deliverystatus

-- FROM deliveries
-- ORDER BY deliverystatus


-- Query 6 -- Time series on deliveries

SELECT date, origin, destination, deliverytime, expectedtime, deliverytime - expectedtime as delayedby
FROM deliveries

