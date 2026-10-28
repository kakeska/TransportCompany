INSERT INTO carriers (carrier_name, country, rating)
VALUES ('FastTrans','Polska', 4.5),('EuroCargo', 'Niemcy', 4.2),('SpeedLogistics', 'Czechy', 3.9);

INSERT INTO delivery_status (status_name) VALUES ('IN_PROGRESS'),('DELIVERED'),('CANCELLED');

INSERT INTO cities(city_name,country) VALUES ('Kraków','Polska'),('Bochnia','Polska'),('Warszawa','Polska'),('Wrocław','Polska'),('Berlin','Niemcy'),('Frankfurt','Niemcy');

INSERT INTO deliveries (
    carriers_id,
    route_from,
    route_to,
    delivery_planned_date,
    delivery_date,
    status_id,
    delivery_cost
)
SELECT
    carriers_id,
    route_from,
    CASE
        WHEN route_to_raw >= route_from THEN route_to_raw + 1
        ELSE route_to_raw
    END AS route_to,
    planned_date,
    CASE
        WHEN status_id = 2 THEN
            planned_date + (DBMS_RANDOM.VALUE(-2, 4))
        ELSE NULL
    END AS delivery_date,
    status_id,
    ROUND(DBMS_RANDOM.VALUE(50, 5000), 2) AS delivery_cost
FROM (
    SELECT
        TRUNC(DBMS_RANDOM.VALUE(1, 4)) AS carriers_id,
        TRUNC(DBMS_RANDOM.VALUE(1, 7)) AS route_from,
        TRUNC(DBMS_RANDOM.VALUE(1, 6)) AS route_to_raw,
        DATE '2025-01-01'
            + TRUNC(DBMS_RANDOM.VALUE(0, 365))
            + DBMS_RANDOM.VALUE(0, 1) AS planned_date,
        CASE
            WHEN DBMS_RANDOM.VALUE(0, 1) < 0.7 THEN 2
            WHEN DBMS_RANDOM.VALUE(0, 1) < 0.5 THEN 1
            ELSE 3
        END AS status_id
    FROM dual
    CONNECT BY LEVEL <= 300
);