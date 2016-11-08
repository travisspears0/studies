%clear
clearvars;
close all;
clc;
%vars
lena = imread('archiwum/lena1.bmp');
lenad = imadjust(lena);
%odpowiednio dla lena i lenad histogramy dla zwyklego i rozciagnietego
[h,x] = imhist(lenad);
c = cumsum(h);

cc = c/(max(c)/max(h));
%zadanie 9
figure(1);
subplot(1,2,1), imshow(lenad);
subplot(1,2,2), plot(x,h);
hold on;
subplot(1,2,2), plot(x,cc);

%lut
scaled = transpose(uint8(cumsum(h/sum(h))*255));
lut = intlut(lenad, scaled);
lut = uint8(lut);

[h,x] = imhist(lut);
c = cumsum(h);

cc = c/(max(c)/max(h));
%zadanie 11
figure(2);
subplot(1,4,1), imshow(lenad);
subplot(1,4,2), imshow(lut);
subplot(1,4,3), plot(x,h);
hold on;
subplot(1,4,3), plot(x,cc);
subplot(1,4,4), histeq(lenad,256);

%zadanie 14
h2 = imread('archiwum/hist2.bmp');
h3 = imread('archiwum/hist3.bmp');
h4 = imread('archiwum/hist4.bmp');
for i=2:4
    h = imread(sprintf('archiwum/hist%d.bmp',i));
    figure(i+1);
    subplot(1,4,1), imshow(h);
    subplot(1,4,2), imshow(imadjust(h));
    subplot(1,4,3), histeq(h,128);
    subplot(1,4,4), imshow(adapthisteq(h));
end;


