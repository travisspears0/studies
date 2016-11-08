clearvars;
close all;
clc;

lena = imread('archiwum/lena.bmp');
jet = imread('archiwum/jet.bmp');
kolo = imread('archiwum/kolo.bmp');

%mul = immultiply(lena, jet);
%mul = immultiply(lena, 5);
sum = imadd(uint16(lena),uint16(jet));
sub = imsubtract(uint16(lena),uint16(jet));
mul = immultiply(lena, boolean(kolo));
imc = imcomplement(lena);


figure(1);
imshow(sum, []);
figure(2);
imshow(sub, []);
figure(3);
imshow(mul);

figure(4);
imshow(imc);