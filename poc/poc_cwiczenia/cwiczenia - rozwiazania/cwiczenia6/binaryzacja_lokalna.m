function Img_Final = binaryzacja_lokalna(Img,Window_Size)

Img_Final = Img;
[X Y] = size(Img);

k = 0.15;
R = 128;

for i = 1:X
    for j = 1:Y
        srednia = meanLT(i,j,Window_Size,Img,X,Y);
        Odchylenie_Standardowe = stddevLT(i,j,Window_Size,Img,srednia,X,Y);
        T = srednia * (1+k*((Odchylenie_Standardowe/R)-1));
        if Img(i,j)<T
            Img_Final(i,j) = 255;
        else
            Img_Final(i,j) = 0;
        end
        
    end
end






end

