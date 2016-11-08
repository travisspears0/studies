%clear
clearvars;
close all;
clc;

ph = imread('archiwum/phobos.bmp');

subplot(2,1,1), imshow(ph);
subplot(2,1,2), histeq(ph);