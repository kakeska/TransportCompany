-- Ktory przewoznik realizuje dostawy najtaniej i ktory ma najlepszą terminowość.
SELECT 
    c.carrier_name as przewoznik,
    COUNT(d.delivery_id) as liczba_zrealizowanych_dostaw,
    ROUND(AVG(d.delivery_cost),2) as sredni_koszt_dostawy,
    SUM (CASE 
            WHEN d.delivery_date <= d.delivery_planned_date THEN 1
            ELSE 0
        END) as dostawy_terminowe,
    ROUND (
        100 *
            SUM(
                CASE
                    WHEN d.delivery_date <= d.delivery_planned_date THEN 1
                    ELSE 0
                 END
                )/COUNT(*),1
            ) AS procent_terminowych_dostaw
FROM deliveries d 
JOIN carriers c
ON d.carriers_id = c.carrier_id
WHERE d.status_id = 2
GROUP BY c.carrier_name
ORDER BY AVG(d.delivery_cost);
