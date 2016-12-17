Tspan=10;
dt=10^-1;
T_sym = [0 Tspan];

fun_han=@prawa;


for I=-2:0.5:2
   
   

   hold on;
    for J=-4:0.5:4
     xx0=[J];
   
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(TT,Y,'r');
     ylabel('x(t)');
    xlabel('Czas t');
    title({'eps=0.5'});
     axis([0 Tspan -3 3]);
    end
    xx0=[2];
   
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot(TT,Y,'b');
    hold off
end


fun_han=@prawa2;


figure(3);
hold on;
for I=-2:0.5:2
    for J=-2:0.5:2
     xx0=[I,J];
     plot3(0,I,J,'o');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot3(TT,Y(:,1),Y(:,2),'r');
    end
end
xx0=[-2/3,0];
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot3(TT,Y(:,1),Y(:,2),'c');

hold off
%plot3(TT,Y(:,1),Y(:,2),'r',TT,Y1(:,1),Y1(:,2),'b',TT,Y2(:,1),Y2(:,2),'k',TT,Y3(:,1),Y3(:,2),'c',TT,Y4(:,1),Y4(:,2),'b',TT,Y5(:,1),Y5(:,2),'k',TT,Y6(:,1),Y6(:,2),'c');
axis([0 Tspan -2 2 -2 2]);
zlabel('x_1(t)');
ylabel('x_2(t)');
xlabel('Czas t');



fun_han=@prawa3;

figure(4);
hold on;
for I=-1:0.2:0
    for J=-0.5:0.2:1

     xx0=[I,J];
     plot3(0,I,J,'o');
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot3(TT,Y(:,1),Y(:,2),'r');
    end
end
xx0=[-2/3,0];
     [TT,Y]=rk4(fun_han,T_sym,xx0, dt);
     plot3(TT,Y(:,1),Y(:,2),'c');

hold off
%plot3(TT,Y(:,1),Y(:,2),'r',TT,Y1(:,1),Y1(:,2),'b',TT,Y2(:,1),Y2(:,2),'k',TT,Y3(:,1),Y3(:,2),'c',TT,Y4(:,1),Y4(:,2),'b',TT,Y5(:,1),Y5(:,2),'k',TT,Y6(:,1),Y6(:,2),'c');
axis([0 Tspan -1 0.5 -0.6 0.8]);
zlabel('x_1(t)');
ylabel('x_2(t)');
xlabel('Czas t');

