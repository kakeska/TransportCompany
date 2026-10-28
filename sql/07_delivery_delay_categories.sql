-- przydzial zakonczonych dostaw do poszczegolnych kategorii
SELECT 
   CASE
        WHEN delivery_date - delivery_planned_date <= 0 THEN 'terminowo'
        WHEN delivery_date - delivery_planned_date >0 AND delivery_date - delivery_planned_date <=2 THEN '1-2 dni opoznienia'
        WHEN delivery_date - delivery_planned_date >2 AND delivery_date - delivery_planned_date <=5 THEN '3-5 dni opoznienia'
        ELSE 'powyzej 5 dni' 
    END as kategoria_opoznien,
    COUNT(*) as liczba_dostaw,
    ROUND(
        100 * COUNT(*) / (SELECT COUNT(*) FROM deliveries where status_id =2)
    ,2) as procent_wszystkich_zrealizowanych_dostaw
FROM deliveries 
where status_id = 2
GROUP BY CASE
        WHEN delivery_date - delivery_planned_date <= 0 THEN 'terminowo'
        WHEN delivery_date - delivery_planned_date >0 AND delivery_date - delivery_planned_date <=2 THEN '1-2 dni opoznienia'
        WHEN delivery_date - delivery_planned_date >2 AND delivery_date - delivery_planned_date <=5 THEN '3-5 dni opoznienia'
        ELSE 'powyzej 5 dni' 
    END
ORDER BY kategoria_opoznien;