SELECT COUNT(*) AS bledne_trasy
FROM deliveries
WHERE route_from = route_to;

SELECT COUNT(*) AS brak_dat_dostawy
FROM deliveries
WHERE status_id = 2
  AND delivery_date IS NULL;

-- wykrywa zrealizowane dostawy w ktorych brakuje daty rzeczywistej lub kosztu
SELECT count(*) 
FROM deliveries 
WHERE status_id = 2 
  AND ( delivery_date IS NULL OR delivery_cost IS NULL);

-- sprawdzenie ile dostaw ma puste pole albo ujemna wartosc
SELECT 
    COUNT(*) as liczba_dostaw_null_lub_ujemna
FROM deliveries 
WHERE delivery_cost <0 or delivery_cost IS NULL;