= Wzory

== System `M/M/x/y`
- Prawdopodobieństwa kolejnych stanów:
  $P_n = (lambda_0 lambda_1 lambda_2 dots.c lambda_(n-1)) / (mu_1 mu_2 mu_3 dots.c mu_n) P_0 = P_0 product_(k=0)^(n-1) lambda_k / mu_(k+1)$
  $P_1 = lambda_0 / mu_1 P_0, quad P_2 = (lambda_0 lambda_1) / (mu_1 mu_2) P_0$
  w szczególności $P_0 = P_0$, $P_3 = (lambda_0 lambda_1 lambda_2) / (mu_1 mu_2 mu_3) P_0$, itd.

- Jak wyliczyć $P_0$:
  $sum_(n=0)^oo P_n = 1$
  Wszystkie $P_n$ zawierają w sobie $P_0$, więc po ich zsumowaniu wychodzi proste równanie, z którego można wyznaczyć $P_0$.

- Wzór Little'go:
  $L = overline(lambda) times W$
  gdzie $L$ - średni stan systemu, $overline(lambda)$ – średnia intensywność napływu zaakceptowanych zgłoszeń, $W$ – średni czas przebywania w systemie. 
  Można stosować też do kolejki, wtedy $L_q$ oznacza średni stan kolejki, a $W_q$ jest średnim czasem przebywania w kolejce, $overline(lambda)$ pozostaje bez zmian.

- Średni stan systemu:
  $L = sum_(n=0)^N n P_n$
  gdzie $N$ oznacza ostatni stan.

- Średni stan kolejki:
  $L_q = sum_(n=m)^N (n - m + 1) P_n$
  gdzie $m$ oznacza pierwszy stan należący do kolejki, a $N$ oznacza ostatni stan.

- Średnia intensywność napływu zgłoszeń:
  $overline(lambda) = sum_(n=0)^(N-1) lambda_n P_n$
  $N$ oznacza ostatni stan. Wzór działa zarówno dla całego systemu jak i dla samej kolejki.

- Średni stan kolejki gdy mamy średni stan systemu:
  $L_q = L - rho$
  gdzie $rho = lambda / mu$.

- Średni czas oczekiwania w kolejce, gdy mamy średni czas przebywania w systemie:
  $W_q = W - 1 / mu$


== Różne wzory związane z procesami urodzin i śmierci

- Średni czas przebywania w stanie:
  $E[T(n)] = 1 / (lambda_n + mu_n)$
  W przypadku $T(0)$ pomija się $mu_n$, bo $mu_0$ nie istnieje, a w przypadku $T(N)$ pomija się $lambda_N$, bo $lambda_N$ nie istnieje.

- Kolejka ze zniechęcaniem klientów:
  $lambda_n = lambda / (n + 1)$
  w szczególności $lambda_0 = lambda$, $lambda_1 = lambda / 2$, $lambda_3 = lambda / 3$ itd.

- Prawdopodobieństwo blokady zgłoszenia w systemie M/M/m/m:
  Postać standardowa (wzór Erlanga):
  $B = E_m (A) = (A^m / m!) / (sum_(k=0)^m A^k / k!)$
  gdzie $A = lambda / mu$.

  Postać rekurencyjna:
  $E_0 (A) = 1, quad E_m (A) = (A E_(m-1) (A)) / (m + A_(m-1)(A))$
  gdzie $A = lambda / mu$.

- Wzór Little'go dla blokady:
  $L = A(1 - B)$


== System `M/G/1/`$infinity$

- Średni resztowy czas obsługi:
  $E[R] = m_2 / (2h)$
  gdzie $h$ – średni czas obsługi, $m_2$ – drugi moment zwykły.

- Średni czas obsługi (rozkład dyskretny):
  $h = E[X] = sum_(n=0)^oo n P_n$

- Średni czas obsługi (rozkład ciągły):
  $h = E[X] = integral_(t=0)^oo t f(t) d t$
  gdzie $f(t)$ – funkcja gęstości prawdopodobieństwa.

- Drugi moment zwykły (rozkład dyskretny):
  $m_2 = E[X^2] = sum_(n=0)^oo n^2 P_n$

- Drugi moment zwykły (rozkład ciągły):
  $m_2 = E[X^2] = integral_(t=0)^oo t^2 f(t) d t$
  gdzie $f(t)$ – funkcja gęstości prawdopodobieństwa.

- Wzór Pollaczka-Chinczyna (na średni czas przebywania w kolejce):
  $W_q = rho / (1 - rho) dot m_2 / (2h)$
  gdzie $rho = lambda h$.

- Równość Little'go przypomnienie:
  $L_q = overline(lambda) times W_q$


== Systemy z priorytetami

- Kolejka bez wywłaszczania:

  Średni czas oczekiwania w kolejce dla klasy p:
  $W_q (p) = (sum_(q=1)^P lambda(q) m_2 (q)) / (2 (1 - sum_(q=1)^(p-1) rho(q)) (1 - sum_(q=1)^p rho(q)))$
  gdzie $p$ – priorytet, dla którego liczymy czas, $P$ - maksymalny priorytet, $rho(p) = lambda(p) h(p)$, $m_2$ – drugi moment zwykły. Dla kolejek $M/M/x,y$ zachodzi $h(p) = 1 / mu(p)$.

  Średni czas przebywania w systemie dla klasy p:
  $T(p) = W_q (p) + h(p)$

- Kolejka z wywłaszczaniem:

  Średni czas przebywania w systemie dla klasy p:
  $T(p) = 1 / (1 - sum_(q=1)^(p-1) rho(q)) ((sum_(q=1)^p lambda(q) m_2 (q)) / (2 (1 - sum_(q=1)^p rho(q))) + h(p))$
  gdzie $p$ – priorytet, dla którego liczymy czas, $rho(p) = lambda(p) h(p)$, $m_2$ – drugi moment zwykły. Dla kolejek $M/M/x,y$ zachodzi $h(p) = 1 / mu(p)$.

  Średni czas oczekiwania w kolejce dla klasy p:
  $V(p) = T(p) - h(p)$

  Busy period (czas, w którym obsługiwane są kolejki z wyższym priorytetem) dla klasy p:
  $B(p) = (sum_(q=1)^(p-1) rho(q)) / (Lambda(p) (1 - sum_(q=1)^(p-1) rho(q)))$
  gdzie $rho(p) = lambda(p) h(p)$ oraz $Lambda(p) = sum_(q=1)^(p-1) lambda(q)$.

- Najwyższy priorytet (zgłoszenia uprzywilejowane) zachowuje się jak system M/M/1, dla którego:
  - Średni stan systemu wynosi:
    $L = lambda / (mu - lambda)$
    przy czym $mu$ i $lambda$ są parametrami odpowiadającymi najwyższemu priorytetowi.
  - Pozostałe wzory są analogiczne.