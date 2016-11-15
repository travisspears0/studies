%clear
clearvars;
close all;
clc;
%vars
coins = imread('coins.png');

bw = im2bw(coins,100/255);

figure(1);
subplot(1,3,1), imshow(coins);
subplot(1,3,2), imhist(coins);
subplot(1,3,3), imshow(bw);

fig = imread('archiwum/figura.png');
bw = im2bw(fig,100/255);
figure(2);
subplot(1,3,1), imshow(fig);
subplot(1,3,2), imhist(fig);
subplot(1,3,3), imshow(bw);

fig = imread('archiwum/figura2.png');
bw = im2bw(fig,100/255);
figure(3);
subplot(1,3,1), imshow(fig);
subplot(1,3,2), imhist(fig);
subplot(1,3,3), imshow(bw);

fig = imread('archiwum/figura3.png');
bw = im2bw(fig,100/255);
figure(4);
subplot(1,3,1), imshow(fig);
subplot(1,3,2), imhist(fig);
subplot(1,3,3), imshow(bw);

fig = imread('archiwum/figura3.png');
bw = im2bw(fig,100/255);
figure(4);
subplot(1,3,1), imshow(fig);
subplot(1,3,2), imhist(fig);
subplot(1,3,3), imshow(bw);





