-- srednia liczba dni opoznienia dostawy z podzialem na przewoznika
SELECT 
     car.carrier_name as nazwa_przewoznika,
     ROUND(
        AVG(
            CASE
                WHEN d.delivery_date > d.delivery_planned_date
                    THEN d.delivery_date - d.delivery_planned_date 
            END
            )
        ,1) AS srednia_liczba_dni_opoznienia
    FROM carriers car
    JOIN deliveries d
    ON car.carrier_id = d.carriers_id
    WHERE d.status_id = 2
    GROUP BY car.carrier_name
    ORDER BY srednia_liczba_dni_opoznienia DESC;