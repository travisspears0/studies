
clc;
close all;
clearvars;

load maskiPP;

Filtr_Average = fspecial('average');
Filtr_M = [1 2 1; 2 4 2; 1 2 1]; Filtr_M = Filtr_M/sum(sum(Filtr_M));
Filtr_Gaussian = fspecial('gaussian',[5 5], 0.5);
%Filtr_M_Laplacian = [0 1 0; 1 -4 1; 0 1 0]; %Filtr_M_Laplacian = Filtr_M_Laplacian./9;
Filtr_M_Laplacian = [0/9 1/9 0/9; 1/9 -4/9 1/9; 0/9 1/9 0/9]; 
Filtr_Laplacian = fspecial('laplacian');

Img_Lena = imread('lena.bmp');
Img_Lena_Szum = imread('lenaSzum.bmp');
Img_Lena_RGB = imread('lenaRGBSzum.bmp');
Img_Plansza = imread('plansza.bmp');
Img_Moon = imread('moon.bmp');
Img_Kw = imread('kw.bmp');
%Img_Kw = imread('jet.bmp');

figure1 = figure(1);
subplot(2,2,1); imshow(Img_Lena); title('Lena');
subplot(2,2,2); imshow(uint8(conv2(Img_Lena,Filtr_Average,'same'))); title('Lena Filtr Average');
subplot(2,2,3); imshow(uint8(conv2(Img_Lena,Filtr_M,'same'))); title('Lena Filtr M');
subplot(2,2,4); imshow(imabsdiff(Img_Lena,uint8(conv2(Img_Lena,Filtr_Average,'same')))); title('Lena imabsdiff');

figure2 = figure(2);
subplot(2,2,1); imshow(Img_Plansza); title('Plansza');
subplot(2,2,2); imshow(uint8(conv2(Img_Plansza,Filtr_Average,'same'))); title('Plansza Filtr Average');
subplot(2,2,3); imshow(uint8(conv2(Img_Plansza,Filtr_M,'same'))); title('Plansza Filtr M');
subplot(2,2,4); imshow(imabsdiff(Img_Plansza,uint8(conv2(Img_Plansza,Filtr_Average,'same')))); title('Plansza imabsdiff');

figure3 = figure(3);
subplot(2,2,1); imshow(Img_Lena); title('Lena');
subplot(2,2,2); imshow(uint8(conv2(Img_Lena,fspecial('gaussian',[5 5], 0.5),'same'))); title('Lena Gaussian 0.5');
subplot(2,2,3); imshow(uint8(conv2(Img_Lena,fspecial('gaussian',[5 5], 1.5),'same'))); title('Lena Gaussian 1.5');
subplot(2,2,4); imshow(uint8(conv2(Img_Lena,fspecial('gaussian',[5 5], 2.5),'same'))); title('Lena Gaussian 2.5');

figure4 = figure(4);
subplot(2,2,1); imshow(Img_Lena_Szum); title('LenaSzum');
subplot(2,2,2); imshow(medfilt2(Img_Lena_Szum)); title('LenaSzum MedFilt2');
subplot(2,2,3); imshow(imabsdiff(Img_Lena_Szum,medfilt2(Img_Lena_Szum))); title('LenaSzum imabsdiff');

figure5 = figure(5);
subplot(2,2,1); imshow(Img_Lena); title('Lena');
subplot(2,2,2); imshow(medfilt2(Img_Lena)); title('Lena MedFilt2');
subplot(2,2,3); imshow(imabsdiff(Img_Lena,medfilt2(Img_Lena))); title('Lena imabsdiff');

%figure6 = figure(6);
%subplot(2,2,1); imshow(Img_Lena_RGB); title('LenaRGB');
%subplot(2,2,2); imshow(median3dRGB(Img_Lena_RGB)); title('LenaRGB MedFilt2');
%subplot(2,2,3); imshow(imabsdiff(Img_Lena_RGB,medfilt2(Img_Lena_RGB))); title('LenaRGB imabsdiff');

%load median3dRGB;

figure7 = figure(7);
subplot(4,3,1); imshow(Img_Moon); title('Moon');
subplot(4,3,4); imshow(uint8(conv2(Img_Moon,Filtr_Average,'same'))+128,[]); title('Moon Filtr Average +128');
subplot(4,3,5); imshow(abs(uint8(conv2(Img_Moon,Filtr_Average,'same'))),[]); title('Moon Filtr Average abs');
%subplot(4,3,6); imshow(Img_Moon-(uint8(conv2(Img_Moon,Filtr_Average,'same'))+128),[]); title('Moon +');

subplot(4,3,7); imshow(uint8(conv2(Img_Moon,Filtr_M_Laplacian,'same'))+128,[]); title('Moon Filtr M Laplacian +128');
subplot(4,3,8); imshow(abs(uint8(conv2(Img_Moon,Filtr_M_Laplacian,'same'))),[]); title('Moon Filtr M Laplacian abs');
subplot(4,3,9); imshow(Img_Moon-abs(uint8(conv2(Img_Moon,Filtr_M_Laplacian,'same'))),[]); title('Moon +');

subplot(4,3,10); imshow(uint8(conv2(Img_Moon,Filtr_Laplacian,'same'))+128,[]); title('Moon Filtr fspecial Laplacian +128');
subplot(4,3,11); imshow(abs(uint8(conv2(Img_Moon,Filtr_Laplacian,'same'))),[]); title('Moon Filtr fspecial Laplacian abs');
subplot(4,3,12); imshow(Img_Moon-(abs(uint8(conv2(Img_Moon,Filtr_Laplacian,'same')))),[]); title('Moon +');

figure8 = figure(8);
subplot(5,4,1); imshow(Img_Kw); title('Kw');
%subplot(4,4,2); imshow(uint8(conv2(Img_Kw,S1,'same')-conv2(Img_Kw,S2,'same'))); title('S1 - S2');
%subplot(4,4,3); imshow(uint8(conv2(Img_Kw,S1,'same')+conv2(Img_Kw,S2,'same'))); title('S1 + S2');
%subplot(4,4,3); imshow(uint8((((Img_Kw*S1).^2)+((Img_Kw*S2).^2)).^(1/2))); title('Kw Kombinowane S1 S2');

subplot(5,4,5); imshow(uint8(conv2(Img_Kw,R1,'same'))); title('Kw R1');
subplot(5,4,6); imshow(uint8(conv2(Img_Kw,R2,'same'))); title('Kw R2');
subplot(5,4,7); imshow(Img_Kw+uint8(conv2(Img_Kw,R2,'same'))); title('R1 + R2');
subplot(5,4,8); imshow(Img_Kw-uint8(conv2(Img_Kw,R2,'same'))); title('R1 - R2');

subplot(5,4,9); imshow(uint8(conv2(Img_Kw,P1,'same'))); title('Kw P1');
subplot(5,4,10); imshow(uint8(conv2(Img_Kw,P2,'same'))); title('Kw P2');
subplot(5,4,11); imshow(Img_Kw+uint8(conv2(Img_Kw,P2,'same'))); title('P1 + P2');
subplot(5,4,12); imshow(Img_Kw-uint8(conv2(Img_Kw,P2,'same'))); title('P1 - P2');

subplot(5,4,13); imshow(uint8(conv2(Img_Kw,S1,'same'))); title('Kw S1');
subplot(5,4,14); imshow(uint8(conv2(Img_Kw,S2,'same'))); title('Kw S2');
subplot(5,4,15); imshow(Img_Kw+uint8(conv2(Img_Kw,S2,'same'))); title('S1 + S2');
subplot(5,4,16); imshow(Img_Kw-uint8(conv2(Img_Kw,S2,'same'))); title('S1 - S2');

subplot(5,4,17); imshow(uint8((((conv2(Img_Kw,S1,'same')).^2)+((conv2(Img_Kw,S2,'same')).^2)).^(1/2))); title('Kw Kombinowane S1 S2');















