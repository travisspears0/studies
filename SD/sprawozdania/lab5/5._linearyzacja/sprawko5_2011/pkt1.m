Tspan = 10; %gorna granica chwil czasowych
dt = 10^-1; %krok czasowy
Tvec = [0 Tspan]; % wektor chwil czasowych

%weryfikacja przyk³adu 1.2
subplot(2,2,1);
hold on;
for J=-4:0.5:4
    x0 = [J];
    [T,Y]=rk4(@prawa1,Tvec,x0,dt);
    plot(T,Y,'g');
end
hold off;
axis([0 Tspan -3 3]);
title({'f(x(t)) = -x(t) + eps*x(t)^2'});
ylabel('x(t)');
xlabel('t');


%weryfikacja przyk³adów 1.3 i 1.4
subplot(2,2,2);
hold on;
for I=-2:0.5:2
    for J=-2:0.5:2
        x0 = [I,J];
        [T,Y]=rk4(@prawa3,Tvec,x0,dt);
        plot3(T,Y(:,1),Y(:,2),'g');
    end
end
hold off;
axis([0 Tspan -2 2 -2 2]);
title({'f1(x(t)) = -x1(t)  f2(x(t)) = -x2(t)^2'});
zlabel('x2(t)');
ylabel('x1(t)');
xlabel('t');


subplot(2,2,3);
hold on;
for I=-1:0.2:0
    for J=-0.5:0.2:1
        x0 = [I,J];
        %plot3(0,I,J,'o');
        [T,Y]=rk4(@prawa4,Tvec,x0,dt);
        plot3(T,Y(:,1),Y(:,2),'g');
    end
end
hold off;
axis([0 Tspan -1 0.5 -0.6 0.8]);
title({'f1(x(t)) = x2(t)  f2(x(t)) = -2*x1(t) - 3*x1(t)^2 - x2(t)'});
zlabel('x2(t)');
ylabel('x1(t)');
xlabel('t');

