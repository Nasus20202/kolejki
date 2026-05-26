= System `M/G/1,`$infinity$ - Pollaczek-Chinczyn


Proszę podać wzór Pollaczka-Chinczyna (P-C) na średni czas oczekiwania zgłoszenia w systemie `M/G/1,`$infinity$ (p. slajd nr 7, czwarta część wykładów) dla czasu obsługi zdefiniowanego za pomocą następującej zmiennej losowej:

$ Y = p_1 Y_1 + p_2 Y_2 + p_3 Y_3 $

gdzie $Y_1, Y_2, Y_3$ są niezależnymi zmiennymi losowymi. Pierwsza z nich ma rozkład wykładniczy z parametrem $mu_1$, a druga i trzecia mają rozkład jednopunktowy z parametrami odpowiednio $h_2$ i $h_3$.

(Powyższy wzór oznacza, że czas zgłoszenia branego do obsługi jest z prawdopodobieństwem $p_1$ wyznaczony przez rozkład ciągłej zmiennej losowej $Y_1$, z prawdopodobieństwem $p_2$ przez stałą zmienną losową $Y_2 = h_2$ oraz z prawdopodobieństwem $p_3$ przez stałą zmienną losową $Y_3 = h_3$.)

Przypomnijmy, że wartość $rho$ używana w ogólnej postaci wzoru P-C jest równa $lambda * h$, gdzie $h = E[Y]$ jest średnim czasem obsługi.

Proszę podać wartość otrzymanego wzoru dla parametrów:

$ lambda = 1/2, mu_1 = 2, h_2 = 1, h_3 = 2, p_1 = 1/2, p_2 = p_3 = 1/4 $

Na koniec proszę obliczyć średni czas oczekiwania zgłoszeń dla systemu `M/M/1,`$infinity$ (p. slajd nr 6, druga część wykładów) dla intensywności napływu zgłoszeń $lambda = 1/2$ oraz intensywności obsługi zgłoszenia $mu = 1/h$, gdzie $h = E[Y]$ obliczone dla powyższych parametrów (czas obsługi zgłoszenia jest wykładniczy z parametrem $mu$).

Proszę porównać tę wartość z wartością uzyskaną ze wzoru P-C i skomentować ich wzajemną relację.

_Wskazówka: Aby otrzymać wzór P-C dla rozpatrywanego przypadku trzeba znaleźć wzory na wartość oczekiwaną $h = E[Y]$ czasu obsługi oraz na drugi moment zwykły tego czasu $m_2 = E[Y^2]$. Wzory te można łatwo otrzymać wiedząc, że:
- zmienna losowa o rozkładzie wykładniczym z parametrem $alpha$ ma wartość oczekiwaną $1/alpha$, a jej drugi moment zwykły wynosi $2/alpha^2$
- $E[Y] = p_1 E[Y_1] + p_2 E[Y_2] + p_3 E[Y_3]$
- $E[Y^2] = p_1 E[Y_1^2] + p_2 E[Y_2^2] + p_3 E[Y_3^2]$
_

=== Wzór Pollaczka-Chinczyna na średni czas oczekiwania zgłoszenia w systemie `M/G/1,`$infinity$

$ W_q = rho/(1 - rho) (m_2)/(2h) $
gdzie $rho = lambda h$

$ h = E[Y] = sum_(m = 0)^infinity n P_n $
$ h = E[Y] = integral_(t = 0)^infinity t f(t) d t $

Zmienna losowa o rozkładzie wykładniczym z parametrem $alpha$ ma wartość oczekiwaną $1/alpha$.
$ h_1 = E[Y_1] = 1/mu_1 = 1/2 $ 
Pozostałe zmienne losowe mają rozkład jednopunktowy, więc ich wartość oczekiwana jest równa wartości tego punktu:
$ h_2 = E[Y_2] = 1 $
$ h_3 = E[Y_3] = 2 $

$ m_2 = E[Y^2] = sum_(m = 0)^infinity n^2 P_n $
$ m_2 = E[Y^2] = integral_(t = 0)^infinity t^2 f(t) d t $

Zmienna losowa o rozkładzie wykładniczym z parametrem $alpha$ ma drugi moment zwykły równy $2/alpha^2$.
$ m_2^1 = E[Y_1^2] = 2/mu_1^2 = 1/2 $
Pozostałe zmienne losowe mają rozkład jednopunktowy, więc ich drugi moment zwykły jest równy kwadratowi wartości tego punktu:
$ m_2^2 = E[Y_2^2] = 1^2 = 1 $
$ m_2^3 = E[Y_3^2] = 2^2 = 4 $

Zgodnie ze wskazówką:
$ h = E[Y] = p_1 h_1 + p_2 h_2 + p_3 h_3 = p_1 E[Y_1] + p_2 E[Y_2] + p_3 E[Y_3] = 1/2 * 1/2 + 1/4 * 1 + 1/4 * 2 = 1 $
$ m_2 = E[Y^2] = p_1 m_2^1 + p_2 m_2^2 + p_3 m_2^3 = p_1 E[Y_1^2] + p_2 E[Y_2^2] + p_3 E[Y_3^2] = 1/2 * 1/2 + 1/4 * 1 + 1/4 * 4 = 3/2 $

=== Obliczenie średniego czasu oczekiwania zgłoszenia dla systemu `M/M/1,`$infinity$

$ rho = lambda * h = 1/2 $
$ W = rho/(1 - rho) (m_2)/(2h) = 3/2 / (2 * 1) = 3/4 $
