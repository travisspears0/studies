function [T,X]=runge_kutta(fun_han, Tspan, x0, dt )
%Implementacja metody Rungego-Kutty
%fun han - function handle do funkcji wyliczajacej prawe strony
%Tspan - wektor dwuelementowy, sk³adajacy sie z czasu poczatkowego i czasu koncowego
%x0 - warunek poczatkowy
%dt - krok calkowania

T = Tspan(1):dt:Tspan(2); %tworzymy wektor czasu z krokiem równym dt
[m,n] = size(x0); %pobieramy wymiar argumentu x0
if ( m ~= 1 && n == 1 )%jesli x0 to kolumna
    x0 = x0'; %to transponujemy x0
end
X = zeros(length(T), length(x0)); %alokujemy pamiêæ dla macierzy X wype³niaj¹c j¹ zerami
X(1,:) = x0;
for i=1:length(T)-1
    k1 = feval(fun_han, T(i), X(i,:)' );
    k2 = feval(fun_han, T(i) + dt/2, X(i,:)' + (dt/2)*k1);
    k3 = feval(fun_han, T(i) + dt/2, X(i,:)' + (dt/2)*k2);
    k4 = feval(fun_han, T(i) + dt, X(i,:)' + dt*k3);
    X(i+1,:) = X(i,:) + (dt/6)*(k1 + 2*k2 + 2*k3 + k4)';
end
T = T'; %transponujemy wektor T
end
