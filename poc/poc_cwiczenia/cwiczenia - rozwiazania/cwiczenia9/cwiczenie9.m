clc;
close all;
clearvars;

Img_Knee = imread('knee.png');
Img_Umbrella = imread('umbrealla.png');


segmentation_rozrost(Img_Knee,352,181,45);


segmentation_podzial(Img_Umbrella);




