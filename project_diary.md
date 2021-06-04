# Dziennik z realizacji projektu 
 - Został wybrany wstępny temat projektu - Bezpieczeństwo domen internetowych.

 - Zapoznano się z podstawowym działaniem platformy GitHub (https://github.com/) oraz podjęto decyzję o pracy przy jej pomocy. 

 - Przestudiowano literaturę związaną z Phishingiem, sposobem postępowania przestępców, szczegołową budową linków oraz dokumentację potrzebnych bibliotek programu R:
    - [*Malicious URL Filtering – A Big Data Application*](https://www.semanticscholar.org/paper/Malicious-URL-filtering-%E2%80%94-A-big-data-application-Lin-Chiu/c46092506e36d8d5e4bea3c7bf507b2bb3c079d1#paper-header). 
    - https://www.gov.pl/web/baza-wiedzy/czym-jest-phishing-i-jak-nie-dac-sie-nabrac-na-podejrzane-widomosci-e-mail-oraz-sms-y
    - 
    - 
Na główny artykuł wybrano pozycję [1]. Główną ideą eksperymentu, który prowadzili autorzy, było podzielenie domeny na składniki (*np. host, ścieżka do zasobu, ścieżka wyszukiwania*), a zatem obliczenie różnych "opisowych" parametrów każdej z tych części (*np. długość, liczba znaków interpunkcyjnych, entropia alfabetyczna*). 

- Postawiono założenie, że gównym celem kodu będzie podział adresu URL na "części pierwsze". 

- Wybrano zestaw danych [Mendeley Data](https://data.mendeley.com/datasets/gdx3pkwp47/2) i sformatowano go w celu pozostawienia 10 000 wierszy. Ostatecznie otrzymano: `data/Webpages_Classification_10k.csv`.

- Wybrano wstępny zarys plakatu.

- Do podziału adresu użyto roziązania ze strony [StackOverflow](https://stackoverflow.com/questions/27745/getting-parts-of-a-url-regex). Zaimplementowano algorytm dla języka R (funkcja `split_url()` w pliku `modules/split-url.r`). 

- Utworzono lepszą wersję tej funkcji `clean_split_url()`, w której zostały usunięte zbędne kolumny z macierzy oraz dodane nazwy kolumn. 

- Analizując plik bazowy otrzymano dwie przeszkody:
    - większość adresów URL zawiera wyłącznie adres hosta, a to nie dałoby przejrzystych wyników po analizie leksykalnej,
    - zdecydowana większość (prawie 80%) domen złych to strony pornograficzne, które uznano za niepotrzebne pod kątem badania Phishing'u, czyli wyłudzania danych.

- Przeprowadzając dyskusję została podjęta decyzja o dodaniu jeszcze jednego zestawu danych: [zestaw danych o 95 000 wierszy](https://research.aalto.fi/en/datasets/phishstorm-phishing-legitimate-url-dataset), w którym wyżej przedstawione problemy pojawiają się znacznie rzadziej. 

- Ustalono motyw przewodni oraz kolorystykę plakatu.

- Został wybrany ostetczny temat projektu - "Phishing - jak się nie dać "złowić"? ".

- Analizując w programie R dane napotkano kolejny problem. Mianowicie przy dekodowaniu niektóre znaki w domenach były oznaczone jako *"koniec linii"* (End Of Line, EOL), co powodowało odczytywanie tylko pierwszych 18 000 wierszy. W celu rozwiązania tego problemu plik został zedytowany w edytorze tekstowym w związku z czym zostało usunięte ok. 600 wierszy. 
Wyjściowy plik można znaleźć za następującą ścieżką: `data/PhishStorm_urlset_96k.csv`.

 - W pliku `modules/url-lengths.r` stworzono funkcję `url_lengths()`, która służy do obliczenia cech opisowych związanych z długością domen i ich poszczególnych części.

 - Dodano trzy funkcje do obliczania ilości wystąpień ciągów postaci litera między dwiema cyframi (np. 9l1) lub cyfra między dwiema literami (np. examp1e), które mogą pomóc wykryć, czy ktoś za pomocą takiego adresu URL próbuje oszukać użytkownika. *(`modules/url-ambiguity.r`)*  

 - Przeprowadzono dyskusję na temat sposobu prezentacji projektu.

 - Została zaimplementowana funkcja do liczenia, oddzielnie ilości liter, cyfr i znaków interpunkcyjnych (funkcja `lett_dig_symb_count()` w pliku *`modules/url-special-symbol-count.r`*)
 
 - Prystąpiono do budowy prezentacji.






 - Idee do ulepszenia:
   - policzenie entropii
   - policzenie długości najdłuższego słowa