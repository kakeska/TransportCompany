# TransportCompany — Analiza danych transportowych w Oracle SQL

## Opis projektu

TransportCompany to projekt portfolio skupiający się na analizie kosztów transportu, terminowości dostaw oraz efektywności przewoźników w fikcyjnej firmie transportowej.

Projekt wykorzystuje Oracle SQL do analizy danych o dostawach, porównywania przewoźników, identyfikowania opóźnień, badania kosztów transportu oraz kontroli jakości danych.

**Głównym celem projektu** jest rozwijanie praktycznych umiejętności SQL oraz nauka przekładania pytań biznesowych na konkretne analizy danych.

## Wykorzystane technologie

- Oracle AI Database Free 26ai
- Oracle SQL
- Git i GitHub

## Struktura bazy danych

Baza danych składa się z czterech głównych tabel:

| Tabela | Opis |
|---|---|
| `CARRIERS` | Informacje o przewoźnikach |
| `CITIES` | Miasta i kraje |
| `DELIVERY_STATUS` | Dostępne statusy dostaw |
| `DELIVERIES` | Informacje o dostawach, trasach, datach, kosztach, przewoźnikach i statusach |

Tabele są połączone za pomocą kluczy głównych i obcych. W bazie zastosowano również ograniczenia zapewniające spójność danych, między innymi uniemożliwiające utworzenie trasy, której punkt początkowy i końcowy są tym samym miastem.

## Dane

Projekt wykorzystuje **dane syntetyczne**, wygenerowane na potrzeby nauki i analizy.

- 300 rekordów dostaw
- 3 przewoźników
- 6 miast
- Planowane daty dostaw z 2025 roku
- Koszty dostaw wyrażone w złotych
- Planowane i rzeczywiste daty dostaw
- Różne statusy dostaw

Zbiór danych nie przedstawia rzeczywistej firmy transportowej ani faktycznych transakcji handlowych.

## Przeprowadzone analizy SQL

### 1. Analiza terminowości dostaw
- Ile dostaw zostało zrealizowanych?
- Ile dostaw zrealizowano terminowo, a ile z opóźnieniem?
- Jaki procent zrealizowanych dostaw był terminowy?

### 2. Miesięczna analiza terminowości
- Jak zmieniała się terminowość dostaw w poszczególnych miesiącach?
- Czy wyniki różniły się w zależności od miesiąca?

### 3. Analiza przewoźników
- Ile dostaw zrealizował każdy przewoźnik?
- Jaki był średni koszt dostawy dla każdego przewoźnika?
- Jaki procent dostaw każdego przewoźnika zrealizowano terminowo?

### 4. Analiza tras
- Które trasy miały największą liczbę dostaw?
- Które trasy charakteryzowały się najniższą terminowością?
- Jak różniły się średnie koszty dostaw na poszczególnych trasach?

### 5. Analiza kosztów według przewoźników
- Jaki był łączny koszt zrealizowanych dostaw dla każdego przewoźnika?
- Jaki procent całkowitych kosztów dostaw przypadał na poszczególnych przewoźników?

### 6. Analiza opóźnień
- O ile dni spóźniały się poszczególne dostawy?
- Jakie było średnie opóźnienie u każdego przewoźnika?
- Który przewoźnik miał najwyższe średnie opóźnienie wśród spóźnionych dostaw?

### 7. Klasyfikacja dostaw według opóźnienia

Zrealizowane dostawy podzielono na cztery kategorie:
- Terminowo lub przed terminem
- Opóźnienie 1–2 dni
- Opóźnienie 3–5 dni
- Opóźnienie powyżej 5 dni

Dla każdej kategorii obliczono liczbę dostaw oraz ich procentowy udział we wszystkich zrealizowanych dostawach.

### 8. Analiza kosztów a terminowość
- Jak różnił się średni koszt dostaw terminowych i opóźnionych?
- Jakie były minimalne i maksymalne koszty w obu grupach?

Analiza pozwala sprawdzić, czy w badanym zbiorze występują różnice między kosztami dostaw terminowych i opóźnionych. Nie dowodzi jednak, że koszt bezpośrednio wpływa na terminowość.

### 9. Kontrola jakości danych
Przygotowano zapytania sprawdzające wybrane reguły poprawności danych:
- Trasy, w których miasto początkowe i końcowe są takie same
- Zrealizowane dostawy bez rzeczywistej daty dostawy
- Dostawy z brakującym lub ujemnym kosztem

## Najważniejsze wyniki

Analiza danych pozwoliła zidentyfikować różnice w terminowości dostaw, efektywności przewoźników oraz wynikach poszczególnych tras.

### 1. Terminowość dostaw

Spośród 221 zrealizowanych dostaw 83 dostarczono terminowo, a 138 z opóźnieniem.

Terminowość wyniosła 37,56%, natomiast udział dostaw opóźnionych wyniósł 62,44%.

Najwyższy odsetek terminowych dostaw w analizowanym okresie odnotowano w czerwcu i grudniu 2025 roku — po 52,9%.

Najniższą terminowość odnotowano we wrześniu 2025 roku — 19%.

### 2. Porównanie przewoźników

SpeedLogistics osiągnął najwyższy wskaźnik terminowości spośród trzech przewoźników — 44,2% — oraz najniższy średni koszt dostawy: 2360,41 zł.

FastTrans osiągnął terminowość na poziomie 28,6%, przy średnim koszcie dostawy wynoszącym 2538,00 zł.

EuroCargo osiągnął terminowość na poziomie 39,2%, a jego średni koszt dostawy wyniósł 2552,14 zł.

W badanym zbiorze SpeedLogistics wyróżniał się zarówno pod względem terminowości, jak i średniego kosztu dostawy.

### 3. Analiza tras

Najczęściej występującą trasą była Warszawa–Frankfurt, na której zrealizowano 15 dostaw. Terminowość tej trasy wyniosła 46,7%.

Trasa Wrocław–Warszawa miała niski wskaźnik terminowości — 7,7% — przy 13 dostawach.

Na trzech trasach: Bochnia–Wrocław, Bochnia–Kraków oraz Frankfurt–Warszawa nie odnotowano żadnej terminowej dostawy w analizowanym zbiorze.

Wyniki tras różniły się pod względem kosztów i terminowości, co wskazuje na obszary wymagające dalszej analizy.

### 4. Kontrola jakości danych

Kontrola wykazała 2 rekordy z brakującym lub ujemnym kosztem dostawy.

Wynik ten wymaga sprawdzenia poszczególnych rekordów, aby ustalić, czy problemem jest brak wartości, czy nieprawidłowy koszt.

### 5. Podsumowanie

W analizowanym zbiorze występował wysoki udział dostaw opóźnionych. SpeedLogistics osiągnął najlepszy wynik terminowości spośród badanych przewoźników, a analiza tras pozwoliła wskazać połączenia o szczególnie niskiej terminowości. Kontrola jakości wykazała również rekordy wymagające dodatkowej weryfikacji.

Wyniki dotyczą wyłącznie syntetycznych danych wykorzystanych w projekcie i nie stanowią wniosków o rzeczywistych firmach transportowych.

## Struktura repozytorium

```text
TransportCompany/
├── README.md
├── database/
│   ├── create_tables.sql
│   ├── insert_data.sql
│   └── check_data.sql
└── sql/
    ├── 01_delivery_timeliness.sql
    ├── 02_monthly_timeliness.sql
    ├── 03_carrier_analysis.sql
    ├── 04_route_analysis.sql
    ├── 05_carrier_cost_analysis.sql
    ├── 06_delivery_delay_analysis.sql
    ├── 06b_avg_delivery_delay_analysis.sql
    ├── 07_delivery_delay_categories.sql
    └── 08_cost_vs_timeliness.sql
```

## Umiejętności rozwijane w projekcie

- Pisanie zapytań SQL w Oracle Database
- Łączenie tabel za pomocą `JOIN`
- Agregowanie i grupowanie danych przy użyciu `GROUP BY`
- Wykorzystywanie funkcji agregujących: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Tworzenie logiki warunkowej za pomocą `CASE WHEN`
- Obliczanie wskaźników procentowych
- Analiza dat i opóźnień
- Tworzenie zapytań do kontroli jakości danych
- Formułowanie wniosków na podstawie wyników analizy

## Możliwe kierunki rozwoju projektu

- Rozszerzenie analizy o procedury i funkcje PL/SQL
- Przygotowanie dashboardu w Power BI
- Wizualizacja terminowości, kosztów i efektywności przewoźników
- Rozbudowanie zbioru danych o dodatkowe informacje biznesowe

