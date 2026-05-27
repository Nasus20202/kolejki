#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= System `M/M/x,y`

Rozważmy system kolejkowy `M/M/x,y` (x serwerów, (y-x) miejsc w kolejce, razem y miejsca w systemie), gdzie każdy serwer obsługuje klienta przez czas wykładniczy z intensywnością $mu$, a intensywność napływu zgłoszeń zależy od stanu systemu w sposób następujący:

$lambda_n$ dla $n = 0, 1, ..., y =$ ...

+ narysować diagram przejść między stanami
+ podać wzory na prawdopodobieństwa stanów $P_n$ ($n=0,1,2,...,y$) (p. slajd nr 9, druga część wykładów)
+ podać wzór na średni stan kolejki $L_q$ oraz (z równości Little'ego) średni czas oczekiwania w kolejce $W_g$ (uwaga: w równości Little'ego (p. slajd nr 14, trzecia część wykładów) trzeba użyć wartości średniej intensywności napływu zgłoszeń, tzn. $overline(lambda) = sum_(n=0)^y lambda_n P_n$)
+ następnie (korzystając ze wzoru na $W_g$) podać wzór na średni czas przebywania klienta w systemie $W$ i na tej podstawie (z równości Little'ego) podać wzór na średni stan systemu $L$.
+ obliczyć powyższe wartości dla parametrów $lambda=a$, $mu=b$

*Uwaga:* We wzorach proszę używać wielkości $rho = lambda/mu$

=== Diagram przejść między stanami
Intensywności przejść:
- Góra (napływ zgłoszeń): $lambda_n$ - podana w treści zadania
- Dół (obsługa / powroty): $mu_n = min(n, x) mu$

#align(center)[
  #diagram(
    node-stroke: 1pt,
    node-fill: white,
    spacing: 4em,
    
    // Definicja węzłów (stanów)
    node((0,0), [0], shape: "circle", radius: 1.5em),
    node((1,0), [1], shape: "circle", radius: 1.5em),
    node((2,0), [...], shape: "circle", stroke: none),
    node((3,0), [$x$], shape: "circle", radius: 1.5em),
    node((4,0), [...], shape: "circle", stroke: none),
    node((5,0), [$y$], shape: "circle", radius: 1.5em),
    
    // Przejścia (dolne, w prawo - napływ zgłoszeń)
    edge((0,0), (1,0), $lambda_0$, "->", bend: 35deg),
    edge((1,0), (2,0), $lambda_1$, "->", bend: 35deg),
    edge((2,0), (3,0), $lambda_(x-1)$, "->", bend: 35deg),
    edge((3,0), (4,0), $lambda_x$, "->", bend: 35deg),
    edge((4,0), (5,0), $lambda_(y-1)$, "->", bend: 35deg),
    
    // Przejścia (górne, w lewo - obsługa)
    edge((1,0), (0,0), $mu$, "->", bend: 35deg),
    edge((2,0), (1,0), $2mu$, "->", bend: 35deg),
    edge((3,0), (2,0), $x mu$, "->", bend: 35deg),
    edge((4,0), (3,0), $x mu$, "->", bend: 35deg),
    edge((5,0), (4,0), $x mu$, "->", bend: 35deg)
  )
]

=== Wzory na prawdopodobieństwa stanów $P_n$ ($n=0,1,2,...,y$)

Wzór na prawdopodobieństwa stanów $P_n$ jest następujący:

$ P_n = (lambda_0 lambda_1 ... lambda_(n-1))/(mu_1 mu_2 ... mu_n) P_0, P_0 = 1 P_0 $

Tak więc $P_1 = lambda_0 / mu_1 P_0$, $P_2 = (lambda_0 lambda_1) / (mu_1 mu_2) P_0$, ..., $P_y = (lambda_0 lambda_1 ... lambda_(y-1)) / (mu_1 mu_2 ... mu_y) P_0$. Podstawiamy $rho = lambda/mu$.

$ sum_(n=0)^infinity P_n = 1 $

Suma wszystkich prawdopodobieństw musi być równa 1, więc:

$ P_0 + P_1 + P_2 + ... + P_y = 1 $

$ P_0 = 1 / (1 + lambda_0 / mu_1 + (lambda_0 lambda_1) / (mu_1 mu_2) + ... + (lambda_0 lambda_1 ... lambda_(y-1)) / (mu_1 mu_2 ... mu_y)) $
_Wartości będą takie same jak wyliczone 2 linie wyżej, tylko bez $P_0$ na końcu._

=== Średni stan kolejki $L_q$ oraz średni czas oczekiwania w kolejce $W_q$

_Jeśli nie trzeba liczyć $L_q$ i $W_q$, to można od razu przejść do obliczenia $W$ i $L$ z użyciem równości Little'ego._

$ L_q = sum_(n=x+1)^y (n-x+1) P_n $
$ L_q = 1 P_(x+1) + 2 P_(x+2) + ... + (y-x+1) P_y $ 

Teraz liczymy $overline(lambda)$:

$ overline(lambda) = sum_(n=0)^(y-1) lambda_n P_n $

I teraz możemy obliczyć $W_q$:

$ W_q = L_q / overline(lambda) $

=== Średni stan systemu $L$ oraz średni czas przebywania klienta w systemie $W$

$ W = W_q + 1/mu, L = overline(lambda) W $

Alternatywnie, można też użyć równości Little'ego:

$ L = sum_(n=0)^(y) n P_n, W = L / overline(lambda) $

=== Obliczyć powyższe wartości dla parametrów $lambda=a$, $mu=b$

$ P_0 = 1 / (1 + (lambda_0 / mu_1) + ((lambda_0 lambda_1) / (mu_1 mu_2)) + ... + ((lambda_0 lambda_1 ... lambda_(y-1)) / (mu_1 mu_2 ... mu_y))) $
$ P_n = (lambda_0 lambda_1 ... lambda_(n-1)) / (mu_1 mu_2 ... mu_n) P_0 $

$ L_q = 1 P_(x+1) + 2 P_(x+2) + ... + (y-x+1) P_y $
$ overline(lambda) = lambda_0 P_0 + lambda_1 P_1 + lambda_2 P_2 + ... + lambda_(y-1) P_(y-1) $
$ W_q = L_q / overline(lambda) $
$ W = W_q + 1/b, L = overline(lambda) W $

== Przykładowe obliczenia 1

2 serwery, 1 miejsce w kolejce, razem 3 miejsca w systemie
$x = 2, y = 3, a = 2, b = 1$

$ lambda_n = lambda, n = 0, 2; lambda_n = 2 lambda, n = 1 $

=== Diagram przejść między stanami

$ lambda_0 = lambda, lambda_1 = 2 lambda, lambda_2 = lambda $
$ mu_1 = min(1, 2) mu = 1 mu, mu_2 = min(2, 2) mu = 2 mu, mu_3 = min(3, 2) mu = 2 mu $

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
    
    // Przejścia (dolne, w prawo - napływ zgłoszeń)
    edge((0,0), (1,0), $lambda$, "->", bend: 35deg),
    edge((1,0), (2,0), $2 lambda$, "->", bend: 35deg),
    edge((2,0), (3,0), $lambda$, "->", bend: 35deg),

    // Przejścia (górne, w lewo - obsługa)
    edge((1,0), (0,0), $mu$, "->", bend: 35deg),
    edge((2,0), (1,0), $2 mu$, "->", bend: 35deg),
    edge((3,0), (2,0), $2 mu$, "->", bend: 35deg)
  )
]

=== Prawdopodobieństwa stanów

$ rho = lambda / mu $

$ P_0 = 1 P_0 $
$ P_1 = lambda / mu P_0 = rho P_0 $
$ P_2 = (lambda * 2 lambda) / (mu * 2 mu) P_0 = rho^2 P_0 $
$ P_3 = (lambda * 2 lambda * lambda) / (mu * 2 mu * 2 mu) P_0 = 1/2 rho^3 P_0 $

$ P_0 = 1 / (1 + rho + rho^2 + 1/2 rho^3) $

=== Średni stan kolejki $L_q$ oraz średni czas oczekiwania w kolejce $W_q$

$ L_q = 1 P_(2+1) = P_3 = 1/2 rho^3 P_0 $

$ overline(lambda) = P_0(lambda + 2 lambda rho + lambda rho^2) = P_0 lambda (1 + 2 rho + rho^2) $

$ W_q = L_q / overline(lambda) $

=== Średni stan systemu $L$ oraz średni czas przebywania klienta w systemie $W$

$ W = W_q + 1/mu, L = overline(lambda) W $

=== Obliczyć powyższe wartości dla parametrów $lambda = 2, mu = 1$

$ rho = 2/1 = 2 $
$ P_0 = 1 / (1 + (lambda / mu) + (lambda * 2 lambda) / (mu * 2 mu) + (lambda * 2 lambda * lambda) / (mu * 2 mu * 2 mu)) = 1 / (1 + rho + rho^2 + 1/2 rho^3) = 1 / (1 + 2 + 4 + 1/2 * 8) = 1 / (7 + 4) = 1 / 11 $
$ P_1 = lambda / mu P_0 = rho P_0 = 2/11 $
$ P_2 = (lambda * 2 lambda) / (mu * 2 mu) P_0 = rho^2 P_0 = 4/11 $
$ P_3 = (lambda * 2 lambda * lambda) / (mu * 2 mu * 2 mu) P_0 = 1/2 rho^3 P_0 = 1/2 * 8 * 1/11 = 4/11 $

$ L_q = 1 P_3 = 4/11 $

$ overline(lambda) = lambda P_0 + 2 lambda P_1 + lambda P_2 = 2 * 1/11 + 2 * 2 * 2/11 + 2 * 4/11 = 18/11 $

$ W_q = L_q / overline(lambda) = 4/11 * 11/18 = 2/9 $

$ W = W_q + 1/mu = 2/9 + 1 = 11/9 $
$ L = overline(lambda) W = 18/11 * 11/9 = 2 $

== Przykładowe obliczenia 2

3 serwery, 3 miejsca w systemie, brak miejsc w kolejce
$x = 3, y = 3, a = 1, b = 1$

$ lambda_n = (3 - n) lambda, n = 0, 1, 2 $

=== Diagram przejść między stanami

$ lambda_0 = 3 lambda, lambda_1 = 2 lambda, lambda_2 = lambda $
$ mu_1 = min(1, 3) mu = 1 mu, mu_2 = min(2, 3) mu = 2 mu, mu_3 = min(3, 3) mu = 3 mu $

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
    
    // Przejścia (dolne, w prawo - napływ zgłoszeń)
    edge((0,0), (1,0), $3 lambda$, "->", bend: 35deg),
    edge((1,0), (2,0), $2 lambda$, "->", bend: 35deg),
    edge((2,0), (3,0), $lambda$, "->", bend: 35deg),

    // Przejścia (górne, w lewo - obsługa)
    edge((1,0), (0,0), $mu$, "->", bend: 35deg),
    edge((2,0), (1,0), $2 mu$, "->", bend: 35deg),
    edge((3,0), (2,0), $3 mu$, "->", bend: 35deg)
  )
]

=== Prawdopodobieństwa stanów

$ rho = lambda / mu $

$ P_0 = 1 P_0 $
$ P_1 = 3 lambda / mu P_0 = 3 rho P_0 $
$ P_2 = (3 lambda * 2 lambda) / (mu * 2 mu) P_0 = 3 rho^2 P_0 $
$ P_3 = (3 lambda * 2 lambda * lambda) / (mu * 2 mu * 3 mu) P_0 = rho^3 P_0 $

$ P_0 = 1 / (1 + 3 rho + 3 rho^2 + rho^3) $

=== Średni stan kolejki $L_q$ oraz średni czas oczekiwania w kolejce $W_q$

_Kolejka nie istnieje, ale liczymy zgodnie z heurystyką_
$ L_q = 0 $
$ overline(lambda) = 3 lambda P_0 + 2 lambda P_1 + lambda P_2 $
$ W_q = L_q / overline(lambda) = 0 $

=== Średni stan systemu $L$ oraz średni czas przebywania klienta w systemie $W$

$ W = W_q + 1/mu = 1/mu $
$ L = overline(lambda) W = 1/mu overline(lambda) = 3 rho P_0 + 2 rho P_1 + rho P_3 $

=== Obliczyć powyższe wartości dla parametrów $lambda = 1, mu = 1$

$ rho = 1 $
$ P_0 = 1 / (1 + 3 + 3 + 1) = 1/8 $
$ P_1 = 3 rho P_0 = 3/8 $
$ P_2 = 3 rho^2 P_0 = 3/8 $
$ P_3 = rho^3 P_0 = 1/8 $

$ L_q = 0 $
$ overline(lambda) = 3 * 1/8 + 2 * 3/8 + 1 * 3/8 = 3/8 + 6/8 + 3/8 = 3/2 $
$ W_q = 0 $

$ W = 1/mu = 1, L = overline(lambda) W = 3/2 $