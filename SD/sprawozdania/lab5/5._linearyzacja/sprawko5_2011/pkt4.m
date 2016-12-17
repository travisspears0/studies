fun_han2 = @prawa7;
Tspan=20;
dt=10^-1;
Tvec = [0 Tspan];

subplot(2,2,1);
hold on;
for I=-2:0.5:2
    for J=-2:0.5:2
     x0=[I,J];
     %plot(I,J,'o');
     %system niezlinearyzowany
     [T,Y]=rk4(@prawa4,Tvec,x0, dt);
     plot(Y(:,1),Y(:,2),'r');
    end
end
hold off;
axis([-2 2 -2 2]);
ylabel('x1(t)');
xlabel('x2(t)');
%legend('wartoœci pocz¹tkowe','system nieliniowy','system liniowy 0','system liniowy 1');


subplot(2,2,2);
hold on;
for I=-2:0.5:2
    for J=-2:0.5:2
     x0=[I,J];
     %zlinearyzowany w zerowym pkt rownowagi 
     [T,Y]=rk4(@prawa6,Tvec,x0, dt);
     plot(Y(:,1),Y(:,2),'b');
    end
end
hold off;
axis([-2 2 -2 2]);
ylabel('x1(t)');
xlabel('x2(t)');
%legend('wartoœci pocz¹tkowe','system nieliniowy','system liniowy 0','system liniowy 1');


subplot(2,2,3);
hold on;
for I=-2:0.5:2
    for J=-2:0.5:2
     x0=[I,J];
     %zlinearyzowany w pkt [-2/3;0] rownowagi 
     [T,Y]=rk4(@prawa5,Tvec,x0, dt);
     plot(Y(:,1),Y(:,2),'g');
    end
end
hold off;
axis([-2 2 -2 2]);
ylabel('x2(t)');
xlabel('x1(t)');



