Tspan=10;
dt=10^-1;
Tvec = [0 Tspan];
fc=0;

for I=-2:0.5:2
    fc=fc+1;
    subplot(3,3,fc)
    hold on;
    for J=-4:0.5:4
        x0=[J];
        [T,Y]=rk4eps(@prawa1eps,Tvec,x0,dt,I);
        plot(T,Y,'r');
        ylabel('x(t)');
        xlabel('t');
        title({'epsilon = ';I});
        axis([0 Tspan -3 3]);
    end
    
    x0=[1/I];
    [T,Y]=rk4eps(@prawa1eps,Tvec,x0,dt,I);
    plot(T,Y,'g');
    hold off;
end