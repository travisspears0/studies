function segmentation_rozrost(Img,Wybrany_X,Wybrany_Y,Prog_Jasnosci)

[Img_Y,Img_X] = size(Img);
Img = double(Img);

visited = zeros(Img_Y,Img_X);
segmented = zeros(Img_Y,Img_X);
stosX = zeros(Img_Y*Img_X,1);
stosY = zeros(Img_Y*Img_X,1);

%pierwszy krok
average_luminosity = Img(Wybrany_Y,Wybrany_X);
average_size = 1;

visited(Wybrany_Y,Wybrany_X) = 1;
segmented(Wybrany_Y,Wybrany_X) = Img(Wybrany_Y,Wybrany_X);
stosY(1) = Wybrany_Y;
stosX(1) = Wybrany_X;
stos_wsk = 1;
stos_ilosc_elementow = 1;

while stos_wsk <= stos_ilosc_elementow
    Y = stosY(stos_wsk);
    X = stosX(stos_wsk);
    stos_wsk = stos_wsk + 1;
    average_size = average_size + 1;
    average_luminosity = (average_luminosity*(average_size-1)+Img(Y,X))/(average_size);
    
    if (X>=2 && X<Img_X) && (Y>=2 && Y<Img_Y)
        for i = -1:1
            for j = -1:1
                Y_sprawdzane = Y + i;
                X_sprawdzane = X + j;
                if abs(average_luminosity-Img(Y_sprawdzane,X_sprawdzane)) < Prog_Jasnosci && visited(Y_sprawdzane,X_sprawdzane) == 0
                    segmented(Y_sprawdzane,X_sprawdzane) = Img(Y_sprawdzane,X_sprawdzane);
                    stos_ilosc_elementow = stos_ilosc_elementow + 1;
                    stosY(stos_ilosc_elementow) = Y_sprawdzane;
                    stosX(stos_ilosc_elementow) = X_sprawdzane;
                end
                visited(Y_sprawdzane,X_sprawdzane) = 1;
            end
        end
    end
end   


figure1 = figure(1); %set(figure1, 'Position', [700 200 2000 900]);
subplot(1,3,1); imshow(Img,[]); title('Img Original');
subplot(1,3,2); imshow(segmented,[]); title('Segmented');
subplot(1,3,3); imshow(visited,[]); title('Visited');
    

end

