-- sprawdzenie w poszczegolnych miesiacach procentową terminowosc dostaw     
SELECT 
    TO_CHAR(delivery_planned_date, 'YYYY-MM') AS miesiace_planowanej_dostawy,
    COUNT(*) AS liczba_dostaw,
    ROUND (
        100 *
            SUM(
                CASE
                    WHEN delivery_date <= delivery_planned_date THEN 1
                    ELSE 0
                 END
                )/COUNT(*),1
            ) AS liczba_terminowych_dostaw,
    ROUND (
        100 *
            SUM(
                CASE
                    WHEN delivery_date > delivery_planned_date THEN 1
                    ELSE 0
                END
            ) / COUNT(*),1
        ) AS liczba_nieterminowych_dostaw 
FROM deliveries
WHERE status_id = 2
GROUP BY TO_CHAR(delivery_planned_date, 'YYYY-MM')
ORDER BY miesiace_planowanej_dostawy ASC;
