-- Ktore trasy sa najdrozsze i na ktorych realizuje sie najwiecej dostaw
SELECT 
    c_from.city_name as od,
    c_to.city_name as do,
    COUNT(*) as liczba_dostaw,
    ROUND(AVG(d.delivery_cost),2) as sredni_koszt_transportu,
    ROUND( 
        100 * SUM(
            CASE
                WHEN d.delivery_date <= d.delivery_planned_date THEN 1
                ELSE 0
            END
            ) / COUNT(*),1
        ) AS procent_terminowych_dostaw
FROM deliveries d
JOIN cities c_from
ON d.route_from = c_from.city_id
JOIN cities c_to 
ON d.route_to = c_to.city_id
where d.status_id = 2
GROUP BY c_from.city_name,c_to.city_name
ORDER BY COUNT(*) DESC, ROUND(AVG(d.delivery_cost),2) DESC;