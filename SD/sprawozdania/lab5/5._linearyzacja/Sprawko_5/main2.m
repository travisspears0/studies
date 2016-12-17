
Tspan=10;
dt=10^-1;
T_sym = [0 Tspan];

fun_han=@prawa4;

fig=0;

for I=-2:0.5:2
   fig=fig+1;
   
   
   subplot(3,3,fig)
   hold on;
    for J=-4:0.5:4
     xx0=[J];
   
     [TT,Y]=rk4_op(fun_han,T_sym,xx0, dt,I);
     plot(TT,Y,'r');
     ylabel('x(t)');
    xlabel('Czas t');
    title({'eps=';I});
     axis([0 Tspan -3 3]);
    end
    xx0=[1/I];
   
     [TT,Y]=rk4_op(fun_han,T_sym,xx0, dt,I);
     plot(TT,Y,'b');
    hold off
end






