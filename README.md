# SaaS Business & Subscription Analytics Dashboard

Projekt przedstawiający pełny cykl pracy z danymi w środowisku SaaS – od surowych zapytań SQL, przez modelowanie relacyjne, aż po interaktywny dashboard.



## Stack technologiczny
* **Bazy danych i skrypty:** PostgreSQL, SQL
* **Narzędzia:** TablePlus, Power BI (Power Query, DAX)



## Architektura i przebieg projektu

1. **Baza danych i skrypty SQL:**
   W katalogu projektu znajdują się skrypty .sql (odpowiadające za strukturę, zasilenie i transformację danych w PostgreSQL – wzorowane na podejściu w stylu dbt).
2. **Modelowanie (Schemat Gwiazdy):**
   Dane zostały uporządkowane w architekturę opartą o schemat gwiazdy (tabela faktów oraz tabele wymiarów), a następnie wyeksportowane do plików CSV jako warstwa pośrednia.
3. **Logika i DAX:**
   Zbudowano miary stanowiące fundament dynamiki raportu, uwzględniające m.in. obsługę stanów brzegowych, wskaźniki subskrypcji oraz poprawne mianowniki niezależne od filtrów.



## Zawartość raportu (.pbix)

### Strona 1: Przegląd Biznesu
* Suma oraz średnia wpływów (ogólna i w podziale na plany cenowe).
* Wykres osi czasu pokazujący realny trend napływu z uwzględnieniem niepełnych okresów rozliczeniowych.

### Strona 2: Analiza Klientów i Churnu
* Monitorowanie wskaźnika odejść oraz struktury powodów rezygnacji.
* Analiza zdarzeń w cyklu klienta (`New`, `Renewal`, `Cancellation`, `Upgrade`, `Downgrade`).

### Strona 3: Efektywność Płatności
* Analiza błędów przetwarzania płatności oraz popularności metod transakcyjnych (z dominacją kart kredytowych).
* Wnioski dotyczące stabilności wpływów i retencji klientów.

### Utworzone miary DAX:
**Suma wpływów za subskrypcje:**
```dax
Suma wpływów za subskrypcje = 
SUMX(fact_subscriptions, RELATED(dim_plans[monthly_price]))
```
**Liczba aktywnych subskrybentów:**
```dax
Liczba aktywnych subskrybentów = 
CALCULATE(DISTINCTCOUNT(fact_subscriptions[customer_id]), fact_subscriptions[event_type] <> "Cancellation")
```
**Liczba Płatności:**
```dax
Liczba Płatności = 
COUNTROWS(fact_subscriptions)
```
**Liczba subskrybentów:**
```dax
Liczba subskrybentów = 
DISTINCTCOUNT(fact_subscriptions[customer_id])
```
**Liczba zdarzeń dla event_type:**
```dax
Liczba zdarzeń dla event_type = 
COUNTA(fact_subscriptions[event_type])
```
**Średni przychód na subskrybenta:**
```dax
Średni przychód na subskrybenta = 
AVERAGEX(dim_customers, [Suma wpływów za subskrypcje])
```
**Wskaźnik błędnych płatności:**
```dax
Wskaźnik błędnych płatności = 
VAR WszystkiePlatnosci = CALCULATE(COUNTROWS(fact_subscriptions), REMOVEFILTERS(fact_subscriptions[payment_status]))
VAR PlatnosciBledne = CALCULATE(COUNTROWS(fact_subscriptions), fact_subscriptions[payment_status] = "Failed")
RETURN
DIVIDE(PlatnosciBledne, WszystkiePlatnosci, 0)
```
**Wskaźnik dokonanych płatności:**
```dax
Wskaźnik dokonanych płatności = 
VAR WszystkiePlatnosci = CALCULATE(COUNTROWS(fact_subscriptions), REMOVEFILTERS(fact_subscriptions[payment_status]))
VAR PlatnosciDokonane = CALCULATE(COUNTROWS(fact_subscriptions), fact_subscriptions[payment_status] = "Paid")
RETURN
DIVIDE(PlatnosciDokonane, WszystkiePlatnosci, 0)
```
**Wskaźnik odejść:**
```dax
Wskaźnik odejść = 
VAR WszyscySubskrybenci = CALCULATE([Liczba subskrybentów], REMOVEFILTERS(fact_subscriptions[event_type]))
VAR Odejscia = CALCULATE([Liczba subskrybentów], fact_subscriptions[event_type] = "Cancellation")
RETURN
IF(ISBLANK(DIVIDE(Odejscia, WszyscySubskrybenci, 0)), "Brak zdarzeń", DIVIDE(Odejscia, WszyscySubskrybenci, 0))
```

## Zawartość repozytorium

`01_schema.sql`
`02_seed_data.sql`
`03_star_schema.sql`
`dashboard.pbix`


### Zrzuty ekranu z projektu:

#### Podgląd raportu:

<img width="1314" height="742" alt="zrzut_ekranu_przeglad_biznesu" src="https://github.com/user-attachments/assets/1f4df107-1b95-4678-9577-9b66f763a2d1" />

<img width="1315" height="736" alt="zrzut_ekranu_analiza_klientow_i_odejsc" src="https://github.com/user-attachments/assets/5f4c2a89-ff5f-4151-a62d-06266cc4e837" />

<img width="1312" height="737" alt="zrzut_ekranu_efektywnosc_platnosci" src="https://github.com/user-attachments/assets/835d193b-f365-4bcc-910c-d91aabac1fa2" />

#### Model danych (relacje)

<img width="1305" height="780" alt="zrzut_ekranu_relacje" src="https://github.com/user-attachments/assets/a6e5fc48-5157-4e79-86b4-53e2e8236d39" />


