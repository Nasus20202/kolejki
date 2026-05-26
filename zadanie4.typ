= System `M/M/1,`$infinity$ z priorytetami

Rozważmy priorytetowy system kolejkowy `M/M/1,`$infinity$ z trzema ($P = 3$) Poissonowskimi strumieniami zgłoszeń o intensywnościach
$lambda_(1)$ (priorytet $p = 1$), $lambda_(2)$ (priorytet $p = 2$) i $lambda_(3)$ (priorytet $p = 3$),
oraz wykładniczych czasach obsługi z parametrami (intensywnościami), odpowiednio,
$mu_(1)$, $mu_(2)$ i $mu_(3)$.

Proszę podać wzory (p. slajd nr 24, trzecia część wykładów) na średni czas przebywania w systemie
$T_(1)$, $T_(2)$, $T_(3)$ dla zgłoszeń ze wszystkich strumieni oraz priorytetu z wywłaszczaniem (preemptive) — w sumie trzy wzory.

Proszę obliczyć wartości tych średnich dla parametrów:
$lambda_(1) = lambda_(2) = lambda_(3) = 1 / 4$,
$mu_(1) = mu_(2) = mu_(3) = 1$.

Na koniec proszę porównać te wartości (wraz z komentarzem) ze średnim czasem przebywania zgłoszenia w systemie
`M/M/1,`$infinity$ z jednym strumieniem zgłoszeń o parametrach
$lambda = 3 / 4$, $mu = 1$ (p. slajd nr 6, druga część wykładów).

_Wskazówka: Zmienna losowa o rozkładzie wykładniczym z parametrem $mu$ ma wartość oczekiwaną równą $1 / mu$ oraz drugi moment równy $2 / mu^2$ (p. część 1 wykładu i ćwiczenia 1)._

=== Wzory na średni czas przebywania w systemie z priorytetami i wywłaszczaniem

$ T(p) = 1 / (1 - sum_(q=1)^(p-1) rho(q)) ((sum_(q=1)^p lambda(q)m_2(q)) / (2 (1 - sum_(q=1)^p rho(q))) + h(p)) $
gdzie $p$ to priorytet, $rho(p) = lambda(p) h(p)$

$ T(1) = 1 / (1 - 0) ((lambda(1) m_2(1)) / (2 (1 - rho(1))) + h(1)) = (lambda(1) m_2(1)) / (2 (1 - rho(1))) + h(1) $
$ T(2) = 1/(1 - rho(1)) ((lambda(1) m_2(1) + lambda(2) m_2(2)) / (2 (1 - rho(1) - rho(2))) + h(2)) $
$ T(3) = 1/(1 - rho(1) - rho(2)) ((lambda(1) m_2(1) + lambda(2) m_2(2) + lambda(3) m_2(3)) / (2 (1 - rho(1) - rho(2) - rho(3))) + h(3)) $

=== Obliczenie średniego czasu przebywania w systemie

$ lambda(1) = lambda(2) = lambda(3) = 1/4 $
$ mu(1) = mu(2) = mu(3) = 1 $
Zgodnie ze wskazówką:
$ h(1) = h(2) = h(3) = 1/mu(1) = 1 $
$ m_2(1) = m_2(2) = m_2(3) = 2/mu(1)^2 = 2 $

$ rho(1) = rho(2) = rho(3) = lambda(1) h(1) = 1/4 $
$ lambda(1) m_2(1) = lambda(2) m_2(2) = lambda(3) m_2(3) = 1/2 $

$ T(1) = 1/2 / (2 * 3/4) + 1 = 4/3 $
$ T(2) = 1/(1 - 1/4) ((1/2 + 1/2) / (2 * (1 - 1/4 - 1/4)) + 1) = 1/(3/4) (1 / (2 * 1/2) + 1) = 8/3 $
$ T(3) = 1/(1 - 1/4 - 1/4) ((1/2 + 1/2 + 1/2) / (2 * (1 - 1/4 - 1/4 - 1/4)) + 1) = 2 (3 + 1) = 8 $

=== Porównanie z systemem z jednym strumieniem zgłoszeń
$ lambda = 3/4, mu = 1 $

$ W = rho/(lambda(1 - rho)) = 1 / (mu - lambda) $

$ W = 1 / (1 - 3/4) = 4 $
