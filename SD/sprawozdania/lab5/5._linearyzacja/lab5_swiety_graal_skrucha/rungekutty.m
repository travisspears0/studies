%Metoda Rungego-Kutta

function [ T, X ] = rungekutty( f_han, Tspan, x0, dt )

%f_han - function handle do funkcji wyliczajacej prawe strony
%Tspan - wektor dwuelementowy skladajacy sie z czasu poczatkowego i
%koncowego
%dt - krok calkowania
%x0 - warunek startowy


T = Tspan(1):dt:Tspan(2);
X = zeros(length(T), length(x0));
X(1,:) = x0;
for i=1:length(T)-1
    k1 = feval(f_han, T(i), X(i,:));
    k2 = feval(f_han, T(i) + dt/2, X(i,:) + (dt/2)*k1);
    k3 = feval(f_han, T(i) + dt/2, X(i,:) + (dt/2)*k2);
    k4 = feval(f_han, T(i) + dt, X(i,:) + dt*k3);
    X(i+1,:) = X(i,:) + (dt/6)*(k1 + 2*k2 + 2*k3 + k4);
end

