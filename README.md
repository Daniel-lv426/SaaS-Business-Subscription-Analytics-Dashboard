# SaaS Business & Subscription Analytics Dashboard

Projekt przedstawiający pełny cykl pracy z danymi w środowisku SaaS – od surowych zapytań SQL, przez modelowanie relacyjne, aż po interaktywny dashboard.



## Stack technologiczny
* **Bazy danych i skrypty:** PostgreSQL, SQL
* **Narzędzia:** TablePlus, Power BI (Power Query, DAX)



## Architektura i przebieg projektu

1. **Baza danych i skrypty SQL**
   W katalogu projektu znajdują się skrypty .sql (odpowiadające za strukturę, zasilenie i transformację danych w PostgreSQL – wzorowane na podejściu w stylu dbt).
2. **Modelowanie (Schemat Gwiazdy)**
   Dane zostały uporządkowane w architekturę opartą o schemat gwiazdy (tabela faktów oraz tabele wymiarów), a następnie wyeksportowane do plików CSV jako warstwa pośrednia.
3. **Logika i DAX**
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



## Zawartość repozytorium

`01_schema.sql`
`02_seed_data.sql`
`03_star_schema.sql`
`dashboard.pbix`
`zrzut_ekranu.png`
