# Dziennik z realizacji projektu (Vitalii)

 - Zbiór danych ze strony [Mendeley Data](https://data.mendeley.com/datasets/gdx3pkwp47/2) został pobrany i ucięty w taki sposób że pozostało w nim 10 000 wierszy. Wyjściowy plik można znaleźć za następującą ścieżką: `data/Webpages_Classification_10k.csv`.

 - Zostały opracowane kilka artykułów, które omawiają wybrany przez nas problem niebezpieczeństwa domen. Najbardziej przydatnym dla nas okazał się chiński artykuł konferencyjny *Malicious URL Filtering – A Big Data Application*. Główną ideą eksperymentu, który prowadzili autory, było podzielenie domeny na składniki (*np. host, ścieżka do zasobu, ścieżka wyszukiwania*), a zatem obliczenie różnych opisowych parametrów każdej z tych części (*np. długość, liczba znaków interpunkcyjnych, entropia alfabetyczna*). Więc przede wszystkim potrzebujemy algorytm który dzieli URL na części pierwsze. 
 
 - 