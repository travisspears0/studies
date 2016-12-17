clear all
close all

colors=['b';'g';'r'];
%niebieski - orginalny wykres
%zielony - linearyzacja w zerze
%czerwony - linearyzacja w drugim xr

%DO USTAWIENIA w³¹czanie/wy³¹czanie linearyzacji
    nielinearyzuj=false;
    
%PRZYKLAD 1
T = 1.7;
t = 0:0.1:T;
eps = 0.2;

for lin = [0,1,0,2]
    if lin==0
        figure
        hold on;
    end;
    ptr1 = @(t,x) f1(t,x,eps,lin);
    c=colors(lin+1);
    for wpc = 0:1:6
        sys = ode45(ptr1, [0,T], wpc);
        y = deval(sys, t);
        plot(t,y,c);
    end
    if nielinearyzuj
        break;
    end;
end


%PRZYKLAD 2
figure
hold on;

T = 8;
t = 0:0.1:T;


for lin = [0,1]
    ptr2 = @(t,x) f2(t,x,lin);
    c=colors(lin+1);
    for w1 = -3:3
        for w2 =-0.1:0.01:0.1
            wpc = [w1 w2];
            sys = ode45(ptr2, [0,T], wpc);
            y = deval(sys, t);
            plot(y(2,:),y(1,:),c);
            %plot(sys.y(2,:),sys.y(1,:),c);
        end
    end
    if nielinearyzuj
        break;
    end;
end


%PRZYKLAD 3
from=-1;
jump=0.1;
to=0.5;

T = 0.5;
t = 0:0.1:T;

ptr3 = @(t,x) f3(t,x,0);
for lin = [0,1,0,2]
    if lin==0
        figure
        hold on;
    end;
     ptr3 = @(t,x) f3(t,x,lin);
        c=colors(lin+1);
    for w1 = from:jump:to
        for w2 = from:jump:to
            wpc = [w1 w2];
            sys = ode45(ptr3, [0,T], wpc);
            plot(sys.y(1,:),sys.y(2,:),c);
        end
    end
    if nielinearyzuj
        break;
    end;
end;