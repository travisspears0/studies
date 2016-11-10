%clear
clearvars;
close all;
clc;
%

lenargb = imread('archiwum/lenaRGB.bmp');
lenar = lenargb(:,:,1);
lenag = lenargb(:,:,2);
lenab = lenargb(:,:,3);


figure(1);
subplot(1,4,1), imshow(lenargb);
subplot(1,4,2), histeq(lenar);
subplot(1,4,3), histeq(lenag);
subplot(1,4,4), histeq(lenab);

lenaeq = lenargb;
lenaeq(:,:,1) = histeq(lenar,256);
lenaeq(:,:,2) = histeq(lenag,256);
lenaeq(:,:,3) = histeq(lenab,256);

figure(2);
imshow(lenaeq);

lenahsv = rgb2hsv(lenargb);

hsvh = lenahsv(:,:,1);
hsvs = lenahsv(:,:,2);
hsvv = lenahsv(:,:,3);

histogram(hsvh,3);
histogram(hsvs,4);
histogram(hsvv,5);

hsvveq = histeq(hsvv,256);
lenahsv(:,:,3) = hsvveq;

figure(6);
imshow(hsv2rgb(lenahsv));


