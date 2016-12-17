fun_han = @prawa;

Tspan=20;
dt=10^-1;
T_sym = [0 Tspan];




fun_han1=@prawa5;
fun_han2=@prawa6;
fun_han=@prawa3;

figure(4);
subplot(1,2,1)
hold on;
for I=-1:0.2:0
    for J=-0.5:0.2:1
     xx0=[I,J];
     plot(I,J,'o');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(Y(:,1),Y(:,2),'r');
     
     [TT,Y1]=rk4(fun_han2,T_sym,xx0, dt);
     plot(Y1(:,1),Y1(:,2),'b');
    end
end
xx0=[-2/3,0];
     plot(-2/3,0,'*k');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(Y(:,1),Y(:,2),'c');

hold off
%plot3(TT,Y(:,1),Y(:,2),'r',TT,Y1(:,1),Y1(:,2),'b',TT,Y2(:,1),Y2(:,2),'k',TT,Y3(:,1),Y3(:,2),'c',TT,Y4(:,1),Y4(:,2),'b',TT,Y5(:,1),Y5(:,2),'k',TT,Y6(:,1),Y6(:,2),'c');
axis([-1 0.5 -0.6 0.8]);
zlabel('x_1(t)');
ylabel('x_2(t)');
xlabel('Czas t');
legend('wartości początkowe','system nieliniowy','system liniowy');

subplot(1,2,2)
hold on;
for I=-1:0.2:0
    for J=-0.5:0.2:1
     xx0=[I,J];
     plot(I,J,'o');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(Y(:,1),Y(:,2),'r');
     
     [TT,Y1]=rk4(fun_han1,T_sym,xx0, dt);
     plot(Y1(:,1)-2/3,Y1(:,2),'b');
    end
end
xx0=[-2/3,0];
     plot(-2/3,0,'*k');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(Y(:,1),Y(:,2),'c');

hold off
%plot3(TT,Y(:,1),Y(:,2),'r',TT,Y1(:,1),Y1(:,2),'b',TT,Y2(:,1),Y2(:,2),'k',TT,Y3(:,1),Y3(:,2),'c',TT,Y4(:,1),Y4(:,2),'b',TT,Y5(:,1),Y5(:,2),'k',TT,Y6(:,1),Y6(:,2),'c');
axis([-1 0.5 -0.6 0.8]);
zlabel('x_1(t)');
ylabel('x_2(t)');
xlabel('Czas t');
legend('wartości początkowe','system nieliniowy','system liniowy');

