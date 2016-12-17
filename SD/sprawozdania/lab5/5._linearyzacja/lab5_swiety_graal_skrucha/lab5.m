% parametry petli
rozmiar = 3; 
b = 0.4;

T = 1.5;
for j = -1:0.20:1

     for i = -rozmiar:b:rozmiar
        % rungego-kutty by rozwiazac system linearyzowany 
        [ tout, X ] = rungekutty(@linearyzowana, [0 T], [j i], 0.1);
        
        % metoda rungego-kutty dla sys. liniowego wokol [0, 0]
        [ tout1, X1 ] = rungekutty(@liniowa1, [0 T], [j i], 0.1);  
        
        % metoda rungego-kutty dla sys. liniowego wokol [0, -2/3]
        [ tout2, X2 ] = rungekutty(@liniowa2, [0 T], [j i], 0.1);  
        
        hold on;
       
        plot(X(:,1),X(:,2), 'magenta');     % sytem linearyzowany
        plot(X1(:,1),X1(:,2),'b');   % linearyzacja wokol [0,0]
        plot(X2(:,1),X2(:,2),'g');   % linearyzacja wokol [0,-2/3]
         
        plot(0,0,'k X'); % punkt rownowagi [0;0]
        plot(-2/3,0,'k X'); % punkt rownowagi [-2/3;0]
        
        title('magenta - sys. linearyzowany; niebieski - linearyzacja w okol [0,0]; zielony - linearyzacja w okol [0, -2/3]; X - pkt. rown.');        

        xlabel('x1');
        ylabel('x2');
        axis([-1 1 -1 1]);
     end % for i = -rozmiar:b:rozmiar
     
 end % for j = -1:0.20:1
hold off;