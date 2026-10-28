-- przedstawione w procentach terminowe i nieterminowe dostawy
SELECT 
    ROUND( 
        100 * SUM(
                CASE
                    WHEN delivery_date <= delivery_planned_date THEN 1
                    ELSE 0
                END
                ) / COUNT(*),2
        ) AS procent_terminowych,
        ROUND(
            100 * SUM(
                    CASE
                        WHEN delivery_date > delivery_planned_date THEN 1
                        ELSE 0
                    END
            ) / COUNT(*), 2
        ) AS procent_spoznionych
FROM deliveries
WHERE status_id = 2;
