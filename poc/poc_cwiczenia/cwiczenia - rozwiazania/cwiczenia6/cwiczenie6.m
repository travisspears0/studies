
clc;
close all;
clearvars;

Img_Coins = imread('coins.png');
Img_Figura = imread('figura.png');
Img_Figura2 = imread('figura2.png');
Img_Figura3 = imread('figura3.png');
Img_Figura4 = imread('figura4.png');
Img_Rice = imread('rice.png');
Img_Bart = imread('bart.bmp');

%Img_Coins = imread('rice.png');
%Img_Coins = imread('tekst.bmp');
%Img_Coins = imread('obiekty.bmp');
%Img_Coins = imread('katalog.bmp');

progDolny = 180;
progGorny = 210;
Bart_Skin_Index = 202;
Img_Bart_BW = Img_Bart > progDolny & Img_Bart < progGorny;
Img_Bart_BW = uint8(Img_Bart_BW);
Img_Bart_BW = Img_Bart_BW*255;

Prog_Binaryzacji = 130/255;
Prog_Binaryzacji_Coins_Otsu = graythresh(Img_Coins);
Prog_Binaryzacji_Coins_Cluster_Kittler = clusterKittler(Img_Coins)/255;
Prog_Binaryzacji_Coins_Entropy_Yen = entropyYen(Img_Coins)/255;



figure1 = figure(1);
subplot(1,3,1); imshow(Img_Coins); title('Coins');
subplot(1,3,2); imhist(Img_Coins); title('Coins Histogram');
subplot(1,3,3); imshow(im2bw(Img_Coins,Prog_Binaryzacji)); title(strcat('Coins im2bw ',num2str(Prog_Binaryzacji)));

figure2 = figure(2);
subplot(4,3,1); imshow(Img_Figura); title('Figura');
subplot(4,3,2); imhist(Img_Figura); title('Figura Histogram');
subplot(4,3,3); imshow(im2bw(Img_Figura,Prog_Binaryzacji)); title(strcat('Figura im2bw ',num2str(Prog_Binaryzacji)));

subplot(4,3,4); imshow(Img_Figura2); title('Figura2');
subplot(4,3,5); imhist(Img_Figura2); title('Figura2 Histogram');
subplot(4,3,6); imshow(im2bw(Img_Figura2,Prog_Binaryzacji)); title(strcat('Figura2 im2bw ',num2str(Prog_Binaryzacji)));

subplot(4,3,7); imshow(Img_Figura3); title('Figura3');
subplot(4,3,8); imhist(Img_Figura3); title('Figura3 Histogram');
subplot(4,3,9); imshow(im2bw(Img_Figura3,Prog_Binaryzacji)); title(strcat('Figura3 im2bw ',num2str(Prog_Binaryzacji)));

subplot(4,3,10); imshow(Img_Figura4); title('Figura4');
subplot(4,3,11); imhist(Img_Figura4); title('Figura4 Histogram');
subplot(4,3,12); imshow(im2bw(Img_Figura4,Prog_Binaryzacji)); title(strcat('Figura4 im2bw ',num2str(Prog_Binaryzacji)));

figure3 = figure(3);
subplot(2,4,1); imshow(Img_Coins); title('Coins');
subplot(2,4,2); imhist(Img_Coins); title('Coins Histogram');
subplot(2,4,5); imshow(im2bw(Img_Coins,Prog_Binaryzacji)); title(strcat('Coins im2bw ',num2str(Prog_Binaryzacji)));
subplot(2,4,6); imshow(im2bw(Img_Coins,Prog_Binaryzacji_Coins_Otsu)); title(strcat('Coins Otsu ',num2str(Prog_Binaryzacji_Coins_Otsu)));
subplot(2,4,7); imshow(im2bw(Img_Coins,Prog_Binaryzacji_Coins_Cluster_Kittler)); title(strcat('Coins Cluster Kittler ',num2str(Prog_Binaryzacji_Coins_Cluster_Kittler)));
subplot(2,4,8); imshow(im2bw(Img_Coins,Prog_Binaryzacji_Coins_Entropy_Yen)); title(strcat('Coins Entropy Yen ',num2str(Prog_Binaryzacji_Coins_Entropy_Yen)));

figure4 = figure(4);
subplot(2,2,1); imshow(Img_Rice); title('Coins');
subplot(2,2,2); imshow(binaryzacja_lokalna(Img_Rice,32)); title('Coins binaryzacja lokalna, 32');
subplot(2,2,3); imshow(binaryzacja_lokalna(Img_Rice,16)); title('Coins binaryzacja lokalna, 16');
subplot(2,2,4); imshow(binaryzacja_lokalna(Img_Rice,8)); title('Coins binaryzacja lokalna, 8');

figure5 = figure(5);
subplot(2,2,1); imshow(Img_Bart); title('Bart');
subplot(2,2,2); imhist(Img_Bart); title('Bart Histogram');
subplot(2,2,3); imshow(Img_Bart_BW); title('Bart BW');

set(figure1, 'Position', [700 200 1600 800]);
set(figure2, 'Position', [700 200 1600 800]);
set(figure3, 'Position', [700 200 1600 800]);
set(figure4, 'Position', [700 200 1600 800]);
set(figure5, 'Position', [700 200 1600 800]);

