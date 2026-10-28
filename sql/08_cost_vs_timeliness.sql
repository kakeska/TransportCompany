-- sprawdzenie czy dostawy drozsze są czesciej realizowane terminowo niz tansze

SELECT 
    CASE 
        WHEN delivery_date - delivery_planned_date <= 0 THEN 'terminowo'
        ELSE 'opozniona'
    END AS kategoria_terminowosci,
    COUNT(*) AS liczba_dostaw,
    ROUND(AVG(delivery_cost),2) AS sr_koszt_dostawy,
    MIN(delivery_cost) AS min_koszt_dostawy,
    MAX(delivery_cost) AS max_koszt_dostawy
FROM deliveries 
WHERE status_id = 2 
GROUP BY CASE 
        WHEN delivery_date - delivery_planned_date <= 0 THEN 'terminowo'
        ELSE 'opozniona'
    END
ORDER BY kategoria_terminowosci DESC;