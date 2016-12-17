clear all %
close all %

leg = {'orginalny wykres', 'linearyzacja w zerze', 'linearyzacja w drugim xr',''};
col = {'k', 'g', 'b'};

%%%%%%%%%%%%  Funkcja 1  %%%%%%%%%%%%%%%
%{
winpos = 0;
eps = 0.2;
tmax = 2;
t = 0:0.2:tmax;

for (i = [0,1,0,2])
    f = @(t,x) funkcja_1(t,x,eps,i);
    if (i==0)
        fig = figure;
        title('Przyk³ad 1');
        %grid on;
        set(fig, 'Position', [0 50+winpos*310 400 300]);
        winpos = winpos+1;
        hold on;
    end;
    for (wpc = -4:2:4)
        sys = ode45(f, [0,tmax], wpc);
        y = deval(sys, t);
        if (wpc == 0)
            plot(t,y,col{i+1});
        else
            pl = plot(t,y,col{i+1});
            set(get(get(pl, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');
        end;
    end;
    if (i~=0)
        if (i==2)
            plot([0,tmax],[1/eps,1/eps],'r');
        else
            plot([0,tmax],[0,0],'r');
        end;
            legend(leg{1},leg{i+1},'xr',3);
    end;
end;
%}


%%%%%%%%%%%%  Funkcja 2  %%%%%%%%%%%%%%%
%{
tmax = 8;
t = 0:0.2:tmax;

fig = figure;
title('Przyk³ad 2');
%grid on;
set(fig, 'Position', [400 50 400 300]);
hold on;


for (i = [0,1])
    f = @(t,x) funkcja_2(t,x,i);
    for (j = -3:3)
        for (k = 0:0.02:0.1)
            wpc = [j k];
            sys = ode45(f, [0,tmax], wpc);
            y = deval(sys, t);
            if (wpc == [0 0])
                plot(y(2,:),y(1,:),col{i+1});
            else
                pl = plot(y(2,:),y(1,:),col{i+1});
                set(get(get(pl, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');
            end;
        end;
    end;
    if (i~=0)
        legend(leg{1},leg{i+1},3);
    end;
end;
%}

%%%%%%%%%%%%  Funkcja 3  %%%%%%%%%%%%%%%
%%{
winpos = 0;
tmax = .7;
t = 0:0.2:tmax;

for i = [0,1,0,2]
	f = @(t,x) funkcja_3(t,x,i);
    if (i==0)
        fig = figure;
        title('Przyk³ad 3');
        %grid on;
        set(fig, 'Position', [800 50+winpos*310 400 300]);
        winpos = winpos+1;
        hold on;
    end;
    for (j = -1:0.2:1)
        for (k = -1:0.2:1)
            wpc = [j k];
            sys = ode45(f, [0,tmax], wpc);
            pl = plot(sys.y(1,:),sys.y(2,:),col{i+1});
            if (any(wpc ~= [0 0]))
                set(get(get(pl, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');
            end;
        end;
    end;
    if (i~=0)
        legend(leg{1},leg{i+1},3);
    end;
end;
%}