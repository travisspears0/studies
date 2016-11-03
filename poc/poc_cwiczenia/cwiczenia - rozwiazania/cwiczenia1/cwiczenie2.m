
clc;
close all;
clearvars;

load funkcjeLUT;

Img_Lena_Color = imread('lena_color.bmp');
Img_Lena_Gray = imread('lena_gray.bmp');
Img_Jet_Original  = imread('jet.bmp');
Img_Kolo_Original  = imread('kolo.bmp');
Img_Kwadrat_Original  = imread('kwadrat.bmp');

figure(1); fLUT(Img_Lena_Color,kwadratowa);
figure(2); fLUT(Img_Lena_Color,log);
figure(3); fLUT(Img_Lena_Color,odwlog);
figure(4); fLUT(Img_Lena_Color,odwrotna);
figure(5); fLUT(Img_Lena_Color,pierwiastkowa);
figure(6); fLUT(Img_Lena_Color,pila);
figure(7); fLUT(Img_Lena_Color,wykladnicza);



figure(8);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1');
subplot(2,2,2); imshow(Img_Jet_Original); title('Obraz 2');
subplot(2,2,3:4); imshow(imadd(Img_Lena_Gray,Img_Jet_Original,'uint16'),[]); title('imadd');

figure(9);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1');
subplot(2,2,2); imshow(Img_Jet_Original); title('Obraz 2');
subplot(2,2,3:4); imshow(imlincomb(1,Img_Lena_Gray,1,Img_Jet_Original,'uint16'),[]); title('imlincomb');

figure(10);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1(int8)');
subplot(2,2,2); imshow(Img_Jet_Original); title('Obraz 2(int8)');
subplot(2,2,3:4); imshow(imsubtract(int8(Img_Lena_Gray),int8(Img_Jet_Original)),[]); title('imsubtract');

figure(11);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1(int16)');
subplot(2,2,2); imshow(Img_Jet_Original); title('Obraz 2(int16)');
subplot(2,2,3:4); imshow(imsubtract(int16(Img_Lena_Gray),int16(Img_Jet_Original)),[]); title('imsubtract');

figure(12);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1');
subplot(2,2,2); imshow(Img_Jet_Original); title('Obraz 2');
subplot(2,2,3:4); imshow(imabsdiff(Img_Lena_Gray,Img_Jet_Original),[]); title('imabsdiff');

figure(13);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1');
subplot(2,2,2); imshow(Img_Jet_Original); title('Obraz 2');
subplot(2,2,3:4); imshow(immultiply(Img_Lena_Gray,Img_Jet_Original),[]); title('immultiply');

figure(14);
subplot(2,2,1); imshow(Img_Lena_Gray); title('Obraz 1');
subplot(2,2,2); imshow(immultiply(Img_Lena_Gray,50)); title('immultiply*50');
subplot(2,2,3); imshow(Img_Kolo_Original); title('Obraz 1');
subplot(2,2,4); imshow(immultiply(Img_Kolo_Original,boolean(Img_Kolo_Original))); title('immultiply mask');

figure(15);
subplot(1,2,1); imshow(Img_Lena_Gray); title('Obraz');
subplot(1,2,2); imshow(imcomplement(Img_Lena_Gray)); title('Negatyw');



figure(16);
subplot(3,2,1); imshow(Img_Kolo_Original); title('Kolo');
subplot(3,2,2); imshow(Img_Kwadrat_Original); title('Kwadrat');

subplot(3,2,3); imshow(not(boolean(Img_Kolo_Original))); title('NOT Kolo');
subplot(3,2,4); imshow(and(boolean(Img_Kolo_Original),boolean(Img_Kwadrat_Original))); title('Kolo AND Kwadrat');
subplot(3,2,5); imshow( or(boolean(Img_Kolo_Original),boolean(Img_Kwadrat_Original))); title('Kolo OR Kwadrat');
subplot(3,2,6); imshow(xor(boolean(Img_Kolo_Original),boolean(Img_Kwadrat_Original))); title('Kolo XOR Kwadrat');





















