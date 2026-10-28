SELECT COUNT(*) AS bledne_trasy
FROM deliveries
WHERE route_from = route_to;

SELECT COUNT(*) AS brak_dat_dostawy
FROM deliveries
WHERE status_id = 2
  AND delivery_date IS NULL;