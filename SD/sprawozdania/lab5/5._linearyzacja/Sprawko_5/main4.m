fun_han = @prawa2;
fun_han2 = @prawa7;
Tspan=20;
dt=10^-1;
T_sym = [0 Tspan];








figure(3);
hold on;
for I=-2:0.5:2
    for J=-2:0.5:2
     xx0=[I,J];
     plot(I,J,'o');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(Y(:,1),Y(:,2),'r');
     [TT,Y1]=rk4(fun_han2,T_sym,xx0, dt);
     plot(Y1(:,1),Y1(:,2),'b');
    end
end


hold off

axis([-2 2 -2 2]);
ylabel('x_1(t)');
xlabel('x_2(t)');

legend('wartości początkowe','system nieliniowy','system liniowy');