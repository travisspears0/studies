
clc;
close all;
clearvars;

load histogramZadany;

Img_Lena_1 = imread('lena1.bmp');
Img_Lena_2 = imread('lena2.bmp');
Img_Lena_3 = imread('lena3.bmp');
Img_Lena_4 = imread('lena4.bmp');

Img_Lena_RGB = imread('lenaRGB.bmp');
Img_Lena_HSV = rgb2hsv(Img_Lena_RGB);

Img_Jezioro_RGB = imread('jezioro.jpg');
Img_Jezioro_HSV = rgb2hsv(Img_Jezioro_RGB);

Img_Hist_1 = imread('hist1.bmp');
Img_Hist_2 = imread('hist2.bmp');
Img_Hist_3 = imread('hist3.bmp');
Img_Hist_4 = imread('hist4.bmp');

Img_Phobos = imread('phobos.bmp');

figure_1 = figure(1);
subplot(4,2,1); imshow(Img_Lena_1); title('Lena 1');
subplot(4,2,2); imhist(Img_Lena_1,256); title('Lena 1 Histogram');

subplot(4,2,3); imshow(Img_Lena_2); title('Lena 2');
subplot(4,2,4); imhist(Img_Lena_2,256); title('Lena 2 Histogram');

subplot(4,2,5); imshow(Img_Lena_3); title('Lena 3');
subplot(4,2,6); imhist(Img_Lena_3,256); title('Lena 3 Histogram');

subplot(4,2,7); imshow(Img_Lena_4); title('Lena 4');
subplot(4,2,8); imhist(Img_Lena_4,256); title('Lena 4 Histogram');

figure_2 = figure(2);
subplot(2,1,1); imshow(Img_Hist_1); title('Histogram 1');
subplot(2,1,2); imhist(Img_Hist_1,256); title('Histogram 1 Histogram');

figure_3 = figure(3);
subplot(2,1,1); imshow(Img_Hist_1); title('Histogram 1');
subplot(2,1,2); imshow(imadjust(Img_Hist_1)); title('Histogram 1 Adjust');

figure_4 = figure(4);
[H x] = imhist(Img_Hist_1,256);
C2 = cumsum(H)/(max(cumsum(H))/max(H));
subplot(4,1,1); imshow(Img_Hist_1); title('Histogram 1');
subplot(4,1,2); imhist(Img_Hist_1,256); title('Histogram 1 Histogram');
subplot(4,1,3); plot(x,H); title('Plot(x,H)');
subplot(4,1,4); plot(x,C2); title('Plot(x,C2)');

figure_5 = figure(5);
LUT = uint8(255*(C2/max(C2)));
[H2 x2] = imhist(intlut(Img_Hist_1,LUT),256);
C22 = cumsum(H2)/(max(cumsum(H2))/max(H2));
subplot(5,1,1); imshow(intlut(Img_Hist_1,LUT)); title('Histogram 1 LUT');
subplot(5,1,5); histeq(Img_Hist_1,256); title('Histogram 1 histeq');
subplot(5,1,2); imhist(intlut(Img_Hist_1,LUT),256); title('Histogram 1 HIST');
subplot(5,1,3); plot(x2,H2); title('Plot(x,H)');
subplot(5,1,4); plot(x2,C22); title('Plot(x,C2)');


figure_6 = figure(6);
subplot(3,4,1); imshow(Img_Hist_2); title('Histogram 2');
subplot(3,4,2); imshow(imadjust(Img_Hist_2)); title('Histogram 2 Adjust');
subplot(3,4,3); imshow(histeq(Img_Hist_2)); title('Histogram 2 histeq');
subplot(3,4,4); imshow(adapthisteq(Img_Hist_2)); title('Histogram 2 adapthisteq');

subplot(3,4,5); imshow(Img_Hist_3); title('Histogram 3');
subplot(3,4,6); imshow(imadjust(Img_Hist_3)); title('Histogram 3 Adjust');
subplot(3,4,7); imshow(histeq(Img_Hist_3)); title('Histogram 3 histeq');
subplot(3,4,8); imshow(adapthisteq(Img_Hist_3)); title('Histogram 3 adapthisteq');

subplot(3,4,9); imshow(Img_Hist_4); title('Histogram 4');
subplot(3,4,10); imshow(imadjust(Img_Hist_4)); title('Histogram 4 Adjust');
subplot(3,4,11); imshow(histeq(Img_Hist_4)); title('Histogram 4 histeq');
subplot(3,4,12); imshow(adapthisteq(Img_Hist_4)); title('Histogram 4 adapthisteq');


figure_7 = figure(7);
subplot(1,5,1); imshow(Img_Phobos); title('Phobos');
subplot(1,5,2); imshow(histeq(Img_Phobos)); title('Phobos histeq');
subplot(1,5,3); imshow(histeq(Img_Phobos,histogramZadany)); title('Phobos histeq zadany');
subplot(1,5,4); imshow(imadjust(Img_Phobos)); title('Phobos imadjust');
subplot(1,5,5); imshow(adapthisteq(Img_Phobos)); title('Phobos adapthisteq');


figure_8 = figure(8);
subplot(2,4,1); imshow(Img_Lena_RGB); title('Lena RGB');
subplot(2,4,2); imshow(Img_Lena_RGB(:,:,1)); title('Lena R');
subplot(2,4,3); imshow(Img_Lena_RGB(:,:,2)); title('Lena G');
subplot(2,4,4); imshow(Img_Lena_RGB(:,:,3)); title('Lena B');

subplot(2,4,5); imshow(Img_Lena_HSV); title('Lena HSV');
subplot(2,4,6); imshow(Img_Lena_HSV(:,:,1)); title('Lena H');
subplot(2,4,7); imshow(Img_Lena_HSV(:,:,2)); title('Lena S');
subplot(2,4,8); imshow(Img_Lena_HSV(:,:,3)); title('Lena V');


figure_9 = figure(9);
subplot(2,4,1); imshow(Img_Jezioro_RGB); title('Jezioro RGB');
subplot(2,4,2); imshow(Img_Jezioro_RGB(:,:,1)); title('Jezioro R');
subplot(2,4,3); imshow(Img_Jezioro_RGB(:,:,2)); title('Jezioro G');
subplot(2,4,4); imshow(Img_Jezioro_RGB(:,:,3)); title('Jezioro B');

Img_Jezioro_HSV(:,:,3) = histeq(Img_Jezioro_HSV(:,:,3),256);
subplot(2,4,5); imshow(Img_Jezioro_HSV); title('Jezioro HSV');
subplot(2,4,6); imshow(Img_Jezioro_HSV(:,:,1)); title('Jezioro H');
subplot(2,4,7); imshow(Img_Jezioro_HSV(:,:,2)); title('Jezioro S');
subplot(2,4,8); imshow(Img_Jezioro_HSV(:,:,3)); title('Jezioro V');



set(figure_1, 'Position', [700 200 600 800]);
set(figure_2, 'Position', [700 200 600 800]);
set(figure_3, 'Position', [700 200 600 800]);
set(figure_4, 'Position', [700 200 600 800]);
set(figure_5, 'Position', [700 200 600 800]);
set(figure_6, 'Position', [200 200 1100 800]);
set(figure_7, 'Position', [200 200 1100 800]);
set(figure_8, 'Position', [200 200 1100 800]);
set(figure_9, 'Position', [200 200 1100 800]);




















