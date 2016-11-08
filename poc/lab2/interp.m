%clear
clearvars;
close all;
clc;
%vars
lena = imread('archiwum/lena.bmp');

%interpolacja
scale = 1.5;
[YY,XX] = size(lena);
nYY = floor(YY * scale);
nXX = floor(XX * scale);
xStep=XX/nXX;
yStep=YY/nYY;
scaled = uint8(zeros(nYY,nXX));

for i = 0 : nYY-1
    for j = 0 : nXX-1
        ii = round(i*yStep);
        jj = round(j*xStep); 
        
        if ii > YY-1 
            ii = YY-1;
        end;
        if jj > XX-1
            jj = XX-1;
        end;
        
        scaled(i+1, j+1) = lena(ii+1, jj+1);
     
    end;
end;
figure(1);
imshow(lena);
figure(2);
imshow(scaled);


