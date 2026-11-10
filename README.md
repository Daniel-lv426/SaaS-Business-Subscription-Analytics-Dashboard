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


### Zrzuty ekranu z projektu:

<img width="1314" height="742" alt="zrzut_ekranu_przeglad_biznesu" src="https://github.com/user-attachments/assets/1f4df107-1b95-4678-9577-9b66f763a2d1" />

<img width="1315" height="736" alt="zrzut_ekranu_analiza_klientow_i_odejsc" src="https://github.com/user-attachments/assets/5f4c2a89-ff5f-4151-a62d-06266cc4e837" />

<img width="1312" height="737" alt="zrzut_ekranu_efektywnosc_platnosci" src="https://github.com/user-attachments/assets/835d193b-f365-4bcc-910c-d91aabac1fa2" />

<img width="1305" height="780" alt="zrzut_ekranu_relacje" src="https://github.com/user-attachments/assets/a6e5fc48-5157-4e79-86b4-53e2e8236d39" />


