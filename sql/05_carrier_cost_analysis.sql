-- Analiza kosztow dostaw wedlug przewoznikow
SELECT 
    car.carrier_name as nazwa_przewoznika,
    COUNT(d.delivery_id) as liczba_zrealizowanych_dostaw,
    SUM(d.delivery_cost) as calkowity_koszt_dostaw,
    ROUND(
        100 * 
        SUM(d.delivery_cost)
        / (SELECT SUM(delivery_cost) FROM deliveries WHERE status_id = 2),2
        )as procentowy_udzial_przewoznika_w_calkowitym_koszcie
FROM deliveries d
JOIN carriers car
ON d.carriers_id = car.carrier_id
WHERE d.status_id = 2
GROUP BY car.carrier_name
ORDER BY SUM(d.delivery_cost) DESC;