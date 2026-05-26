#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= System `M/M/x,y` - $E[T(n)]$

Rozważmy system `M/M/x,y` (x serwerów plus (y-x) miejsca w kolejce, razem y miejsc w systemie),
gdzie każdy serwer obsługuje klienta przez czas wykładniczy z intensywnością $mu$,
a intensywność napływu zgłoszeń zależy od stanu w sposób następujący:

$lambda_n$ dla $n = 0, 1, ..., y =$ ...

+ Narysować diagram przejść tego systemu.
+ Podać wzory (zgodnie ze slajdem nr 10, druga część wykładów) na średni czas
   przebywania systemu w stanach, czyli $E[T(n)]$
+ Obliczyć wartości $E[T(n)]$ dla powyższych stanów dla parametrów: $lambda=a, mu=b$.

=== Diagram przejść między stanami

Intensywności przejść:
- Góra (napływ zgłoszeń): $lambda_n$ - podana w treści zadania
- Dół (obsługa / powroty): $mu_n = min(n, x) mu$

Diagram rysujemy zgodnie z heurystyką z zadania 1.

=== Wzory na średni czas przebywania systemu w stanach $E[T(n)]$

$ E[T(n)] = 1 / (lambda_n + mu_n) $

Dla $T(0)$ pomijamy $mu_0$ (nie ma obsługi, bo nie ma klientów), a dla $T(y)$ pomijamy $lambda_y$ (nie ma napływu, bo system jest pełny).

$ E[T(0)] = 1 / lambda_0 $
$ E[T(n)] = 1 / (lambda_n + mu_n), n = 1, 2, ..., y-1 $
$ E[T(y)] = 1 / mu_y $

=== Obliczenie wartości $E[T(n)]$ dla parametrów: $lambda=a, mu=b$

Podstawiamy $lambda=a$ i $mu=b$ do wzorów z poprzedniej sekcji.

== Przykładowe obliczenia

5 serwerów plus 2 miejsca w kolejce, razem 7 miejsc w systemie, $x = 5, y = 7, a = 1, b = 3$.

$ lambda_n = (3 n + 1) lambda, n = 0, 1, ..., 6 $

=== Diagram przejść między stanami

$ lambda_0 = lambda, lambda_1 = 4 lambda, lambda_2 = 7 lambda, lambda_3 = 10 lambda, lambda_4 = 13 lambda, lambda_5 = 16 lambda, lambda_6 = 19 lambda $
$ mu_1 = mu, mu_2 = 2 mu, mu_3 = 3 mu, mu_4 = 4 mu, mu_5 = 5 mu, mu_6 = 5 mu, mu_7 = 5 mu $

#align(center)[
  #diagram(
    node-stroke: 1pt,
    node-fill: white,
    spacing: 4em,
    
    // Definicja węzłów (stanów)
    node((0,0), [0], shape: "circle", radius: 1.5em),
    node((1,0), [1], shape: "circle", radius: 1.5em),
    node((2,0), [2], shape: "circle", radius: 1.5em),
    node((3,0), [3], shape: "circle", radius: 1.5em),
    node((4,0), [4], shape: "circle", radius: 1.5em),
    node((5,0), [5], shape: "circle", radius: 1.5em),
    node((6,0), [6], shape: "circle", radius: 1.5em),
    node((7,0), [7], shape: "circle", radius: 1.5em),

    // Przejścia (dolne, w prawo - napływ zgłoszeń)
    edge((0,0), (1,0), $lambda$, "->", bend: 35deg),
    edge((1,0), (2,0), $4 lambda$, "->", bend: 35deg),
    edge((2,0), (3,0), $7 lambda$, "->", bend: 35deg),
    edge((3,0), (4,0), $10 lambda$, "->", bend: 35deg),
    edge((4,0), (5,0), $13 lambda$, "->", bend: 35deg),
    edge((5,0), (6,0), $16 lambda$, "->", bend: 35deg),
    edge((6,0), (7,0), $19 lambda$, "->", bend: 35deg),

    // Przejścia (górne, w lewo - obsługa)
    edge((1,0), (0,0), $mu$, "->", bend: 35deg),
    edge((2,0), (1,0), $2 mu$, "->", bend: 35deg),
    edge((3,0), (2,0), $3 mu$, "->", bend: 35deg),
    edge((4,0), (3,0), $4 mu$, "->", bend: 35deg),
    edge((5,0), (4,0), $5 mu$, "->", bend: 35deg),
    edge((6,0), (5,0), $5 mu$, "->", bend: 35deg),
    edge((7,0), (6,0), $5 mu$, "->", bend: 35deg)
  )
]

=== Obliczenie wartości $E[T(n)]$ dla parametrów: $lambda = 1, mu = 3$

$ E[T(0)] = 1 / lambda_0 = 1 / lambda = 1 $
$ E[T(1)] = 1 / (lambda_1 + mu_1) = 1 / (4 lambda + mu) = 1 / (4 + 3) = 1 / 7 $
$ E[T(2)] = 1 / (lambda_2 + mu_2) = 1 / (7 lambda + 2 mu) = 1 / (7 + 6) = 1 / 13 $
$ E[T(3)] = 1 / (lambda_3 + mu_3) = 1 / (10 lambda + 3 mu) = 1 / (10 + 9) = 1 / 19 $
$ E[T(4)] = 1 / (lambda_4 + mu_4) = 1 / (13 lambda + 4 mu) = 1 / (13 + 12) = 1 / 25 $
$ E[T(5)] = 1 / (lambda_5 + mu_5) = 1 / (16 lambda + 5 mu) = 1 / (16 + 15) = 1 / 31 $
$ E[T(6)] = 1 / (lambda_6 + mu_6) = 1 / (19 lambda + 5 mu) = 1 / (19 + 15) = 1 / 34 $
$ E[T(7)] = 1 / mu_7 = 1 / (5 mu) = 1 / 15 $
