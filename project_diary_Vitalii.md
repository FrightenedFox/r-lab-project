# Dziennik z realizacji projektu (Vitalii)

 - Zbiór danych ze strony [Mendeley Data](https://data.mendeley.com/datasets/gdx3pkwp47/2) został pobrany i ucięty w taki sposób że pozostało w nim 10 000 wierszy. Wyjściowy plik można znaleźć za następującą ścieżką: `data/Webpages_Classification_10k.csv`.

 - Zostały opracowane kilka artykułów, które omawiają wybrany przez nas problem niebezpieczeństwa domen. Najbardziej przydatnym dla nas okazał się chiński artykuł konferencyjny [*Malicious URL Filtering – A Big Data Application*](https://www.semanticscholar.org/paper/Malicious-URL-filtering-%E2%80%94-A-big-data-application-Lin-Chiu/c46092506e36d8d5e4bea3c7bf507b2bb3c079d1#paper-header). Główną ideą eksperymentu, który prowadzili autory, było podzielenie domeny na składniki (*np. host, ścieżka do zasobu, ścieżka wyszukiwania*), a zatem obliczenie różnych opisowych parametrów każdej z tych części (*np. długość, liczba znaków interpunkcyjnych, entropia alfabetyczna*). Więc przede wszystkim potrzebujemy algorytm który dzieli URL na części pierwsze. 
 
 - Dla podziału domen skorzystaliśmy z prawie gotowego rozwiązania ze strony [StackOverflow](https://stackoverflow.com/questions/27745/getting-parts-of-a-url-regex), które zostało adaptowane dla języka R (funkcja `split_url()` w pliku `modules/split-url.r`). Utworzyliśmy także ulepszoną wersję tej funkcji `clean_split_url()`, w której zostały usunięte zbędne kolumny z macierzy oraz dodane nazwy kolumn. 

 - W trakcie analizowania wybranego zestawu danych okazało się, że większość URLów zawierają wyłącznie adres hosta, co nie dałoby zbyt wyraźnych wyników po dokonaniu analizy leksykalnej. Co więcej, prawie 80% złych domen zawierają pornografię, co nie bardzo wiąże się z tematem wyłudzania informacji w internecie (Phishing). Więc dodaliśmy jeszcze jeden [zestaw danych o 95 000 wierszy](https://research.aalto.fi/en/datasets/phishstorm-phishing-legitimate-url-dataset), w którym już prawie niema wcześniej wspominanych problemów. Natomiast pojawił się inny problem przy dekodowaniu tego pliku środowiskiem programistycznym: niektóre znaczki w domenach były oznaczone jako *"koniec linii"* (End Of Line, EOL), co powodowało odczytywanie tylko pierwszych 18 000 wierszy. Wiec opracowaliśmy ten plik w edytorze tekstowym i usunęliśmy około 600 wierszy. Wyjściowy plik można znaleźć za następującą ścieżką: `data/PhishStorm_urlset_96k.csv`.

 - W pliku `modules/url-lengths.r` stworzyliśmy funkcję `url_lengths()` która służy do obliczenia cech opisowych związanych z długością domen i ich poszczególnych części.

 - Dodaliśmy trzy funkcji do obliczania ilości wystąpień ciągów postaci: litera między dwiema cyframi (np. 9l1) lub cyfra między dwiema literami (np. examp1e). *(`modules/url-ambiguity.r`)*  
 Takie cechy mogą pomóc wykryć, czy adres URL próbuje oszukać użytkownika, czy nie.

 ---

 - Została zaimplementowana funkcja dla liczenia oddzielnie ilości liter, cyfr i znaków interpunkcyjnych (funkcja `lett_dig_symb_count()` w pliku *`modules/url-special-symbol-count.r`*)
