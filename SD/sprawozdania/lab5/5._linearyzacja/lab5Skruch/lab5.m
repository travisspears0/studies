clear all;
p = 0:0.3:2*pi; % tworzymy ci�g od 0 do 2PI z krokiem oko�o 1/10 PI
    
WPC = [cos(p); sin(p)]; %tworzymy macierz warunk�w pocz�tkowych

dt = 10^-4;
T = 2;
   
%wykonujemy p�tle w kt�rej rysujemy portrety fazowe dla macierzy warunk�w pocz�tkowych
%dla systemu niezlinearyzowanego
subplot(3,1,1);
hold on;
axis([-1.5, 1.5 , -1.5, 1.5]);
for i=1:length(p) 
    x0 = WPC(:,i); %wszystkie wiersze i-ta kolumna
    [toutRK, XRK] = runge_kutta(@funkcja, [0 T], x0, dt);
    figure(1);
    plot(XRK(:,1), XRK(:,2));
    %opisujemy wykres
    title('Wykres zaleznosci x1 x2 dla s. niezlinearyzowanego');           
    xlabel('x1');   % os x
    ylabel('x2');   % os y
end;
hold off;
%wykonujemy p�tle w kt�rej rysujemy portrety fazowe dla macierzy warunk�w pocz�tkowych
%dla systemu zlinearyzowanego dla pkt xr1 = (0,0)'
subplot(3,1,2);
hold on;
axis([-1.5, 1.5 , -1.5, 1.5]);
for i=1:length(p) 
    x0 = WPC(:,i); %wszystkie wiersze i-ta kolumna
    [toutRK, XRK] = runge_kutta(@funkcjaxr1, [0 T], x0, dt);
    figure(1);
    plot(XRK(:,1), XRK(:,2));
    %opisujemy wykres
    title('Wykres zaleznosci x1 x2 dla s. zlinearyzowanego dla pkt r�wnowagi (0,0)');           
    xlabel('x1');   % os x
    ylabel('x2');   % os y
end;
hold off;
%wykonujemy p�tle w kt�rej rysujemy portrety fazowe dla macierzy warunk�w pocz�tkowych
%dla systemu zlinearyzowanego dla pkt xr2 = (-2/3,0)'
subplot(3,1,3);
hold on;
axis([-1.5, 1.5 , -1.5, 1.5]);
for i=1:length(p) 
    x0 = WPC(:,i); %wszystkie wiersze i-ta kolumna
    [toutRK, XRK] = runge_kutta(@funkcjaxr2, [0 T], x0, dt);
    figure(1);
    plot(XRK(:,1), XRK(:,2));
    %opisujemy wykres
    title('Wykres zaleznosci x1 x2 dla s. zlinearyzowanego dla pkt r�wnowagi (-2/3,0)');           
    xlabel('x1');   % os x
    ylabel('x2');   % os y
end;
hold off;