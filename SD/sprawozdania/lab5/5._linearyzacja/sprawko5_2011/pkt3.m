Tspan=20;
dt=10^-1;
T_sym = [0 Tspan];

%zalozenia spelnione
subplot(1,2,1);
hold on;
for I=-1:0.2:0
    for J=-0.5:0.2:1
     x0=[I,J];
     plot(I,J,'o');
     [T,Y]=rk4(@prawa4,T_sym,x0, dt);
     plot(Y(:,1),Y(:,2),'r');
     
     [T,Y]=rk4(@prawa6,T_sym,x0, dt);
     plot(Y(:,1),Y(:,2),'b');
    end
end

hold off;
axis([-1 0.5 -0.6 0.8]);
ylabel('x2(t)');
xlabel('x1(t)');
legend('wartoœci pocz¹tkowe','system nieliniowy','system liniowy');

%zalozenia niespelnione
subplot(1,2,2);
hold on;
for I=-1:0.2:0
    for J=-0.5:0.2:1
     x0=[I,J];
     plot(I,J,'o');
     [T,Y]=rk4(@prawa4,T_sym,x0, dt);
     plot(Y(:,1),Y(:,2),'r');
     
     [T,Y]=rk4(@prawa5,T_sym,x0, dt);
     plot(Y(:,1)-2/3,Y(:,2),'b');
    end
end

hold off;
axis([-1 0.5 -0.6 0.8]);
ylabel('x2(t)');
xlabel('x1(t)');
legend('wartoœci pocz¹tkowe','system nieliniowy','system liniowy');