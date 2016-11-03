
clc;
close all;
clearvars;

Img_Ertka = imread('ertka.bmp');
Img_Hom = imread('hom.bmp');
Img_Fingerprint = imread('fingerprint.bmp');
Img_Kosc = imread('kosc.bmp');
Img_Text = imread('text.bmp');
Img_Ferrari = imread('ferrari.bmp');
Img_Rice = imread('rice.png');
Img_Calculator = imread('calculator.bmp');

Img_Ertka_Erode_Square = imerode(Img_Ertka,strel('square',3));
Img_Ertka_Erode_Rectangle = imerode(Img_Ertka,strel('rectangle',[3 6]));
Img_Ertka_Erode_Diamond = imerode(Img_Ertka,strel('diamond',5));

Img_Ertka_Erode_Square1 = imerode(Img_Ertka,strel('square',3));
Img_Ertka_Erode_Square2 = imerode(Img_Ertka_Erode_Square,strel('square',3));
Img_Ertka_Erode_Square3 = imerode(Img_Ertka_Erode_Square2,strel('square',3));

Img_Ertka_Dilate = imdilate(Img_Ertka,strel('square',3));
Img_Ertka_Open = imopen(Img_Ertka,strel('square',3));
Img_Ertka_Close = imclose(Img_Ertka,strel('square',3));

SE1 = [0 1 0; 1 1 1; 0 1 0];
SE2 = [1 0 1; 0 0 0; 1 0 1];





figure1 = figure(1);
subplot(3,3,1); imshow(Img_Ertka); title('Ertka Original');
subplot(3,3,4); imshow(Img_Ertka_Erode_Square); title('Ertka Erode Squarex3');
subplot(3,3,5); imshow(Img_Ertka_Erode_Rectangle); title('Ertka Erode Rectanglex3x6');
subplot(3,3,6); imshow(Img_Ertka_Erode_Diamond); title('Ertka Erode Diamondx5');
subplot(3,3,7); imshow(Img_Ertka_Erode_Square1); title('Ertka Erode Square 1');
subplot(3,3,8); imshow(Img_Ertka_Erode_Square2); title('Ertka Erode Square 2');
subplot(3,3,9); imshow(Img_Ertka_Erode_Square3); title('Ertka Erode Square 3');

figure2 = figure(2);
subplot(3,4,1); imshow(Img_Ertka); title('Ertka Original');
subplot(3,4,5); imshow(Img_Ertka_Erode_Square); title('Ertka Erode');
subplot(3,4,6); imshow(Img_Ertka_Dilate); title('Ertka Dilate');
subplot(3,4,7); imshow(Img_Ertka_Open); title('Ertka Open');
subplot(3,4,8); imshow(Img_Ertka_Close); title('Ertka Close');
subplot(3,4,9); imshow(imdilate(imerode(Img_Ertka,strel('square',3)),strel('square',3))); title('Ertka Dilate/Erode');
subplot(3,4,10); imshow(imerode(imdilate(Img_Ertka,strel('square',3)),strel('square',3))); title('Ertka Erode/Dilate');
subplot(3,4,11); imshow(imopen(imclose(Img_Ertka,strel('square',3)),strel('square',3))); title('Ertka Open/Close');
subplot(3,4,12); imshow(imclose(imopen(Img_Ertka,strel('square',3)),strel('square',3))); title('Ertka Close/Open');

figure3 = figure(3);
subplot(2,2,1); imshow(Img_Hom); title('Hom Original');
subplot(2,2,2); imshow(bwhitmiss(Img_Hom,SE1,SE2)); title('Hom Hit Miss');

figure4 = figure(4);
subplot(2,5,1); imshow(Img_Fingerprint); title('Fingerprint Original');
subplot(2,5,2); imshow(bwmorph(Img_Fingerprint,'thin')); title('Fingerprint bwmorph thin');
subplot(2,5,3); imshow(bwmorph(Img_Fingerprint,'thin',2)); title('Fingerprint bwmorph thin 2');
subplot(2,5,4); imshow(bwmorph(Img_Fingerprint,'thin',3)); title('Fingerprint bwmorph thin 3');
subplot(2,5,5); imshow(bwmorph(Img_Fingerprint,'thin',Inf)); title('Fingerprint bwmorph thin Inf');
subplot(2,5,6); imshow(Img_Kosc); title('Kosc Original');
subplot(2,5,7); imshow(bwmorph(Img_Kosc,'skel')); title('Kosc bwmorph skel');
subplot(2,5,8); imshow(bwmorph(Img_Kosc,'skel',2)); title('Kosc bwmorph skel 2');
subplot(2,5,9); imshow(bwmorph(Img_Kosc,'skel',3)); title('Kosc bwmorph skel 3');
subplot(2,5,10); imshow(bwmorph(Img_Kosc,'skel',Inf)); title('Kosc bwmorph skel Inf');

figure5 = figure(5);
subplot(2,3,1); imshow(Img_Text); title('Text Original');
subplot(2,3,2); imshow(imopen(Img_Text,ones(51,1))); title('Text Open');
subplot(2,3,3); imshow(imreconstruct(imerode(Img_Text,ones(51,1)),Img_Text)); title('Text Reconstruct');
subplot(2,3,4); imshow(imfill(Img_Text,'holes')); title('Text Fill');
subplot(2,3,5); imshow(imclearborder(Img_Text)); title('Text Clear Border');

figure6 = figure(6);
subplot(4,3,1); imshow(Img_Ferrari); title('Ferrari Original');
subplot(4,3,4); imshow(imerode(Img_Ferrari,strel('square',3))); title('Ferrari Erode');
subplot(4,3,5); imshow(imdilate(Img_Ferrari,strel('square',3))); title('Ferrari Dilate');
%subplot(4,3,6); imshow(imdilate(Img_Ferrari,strel('square',3))-imerode(Img_Ferrari,strel('square',3))); title('Ferrari Dilate-Erode');
subplot(4,3,6); imshow(imdilate(imerode(Img_Ferrari,strel('square',3)),strel('square',3))); title('Ferrari Erode/Dilate');
subplot(4,3,7); imshow(imtophat(Img_Ferrari,strel('square',3))); title('Ferrari TopHat');
subplot(4,3,8); imshow(imbothat(Img_Ferrari,strel('square',3))); title('Ferrari BotHat');
subplot(4,3,9); imshow(imtophat(imbothat(Img_Ferrari,strel('square',3)),strel('square',3))); title('Ferrari BotHat/TopHat');
subplot(4,3,10); imshow(Img_Rice); title('Rice Original');
subplot(4,3,11); imshow(imtophat(Img_Rice,strel('disk',10))); title('Rice TopHat');

figure7 = figure(7);
subplot(3,3,1); imshow(Img_Calculator); title('Calculator Original');
subplot(3,3,2); imshow(imerode(Img_Calculator,ones(1,71))); title('Calculator Erode');
subplot(3,3,3); imshow(imreconstruct(imerode(Img_Calculator,ones(1,71)),Img_Calculator)); title('Calculator Reconstruct');
subplot(3,3,4); imshow(imopen(Img_Calculator,ones(1,71))); title('Calculator Open');
subplot(3,3,5); imshow(Img_Calculator-imreconstruct(imerode(Img_Calculator,ones(1,71)),Img_Calculator)); title('Calculator Original-Reconstruct');
%subplot(2,3,6); imshow(imtophat(Img_Calculator,strel('square',3))); title('Calculator TopHat');
subplot(3,3,7); imshow(imerode(Img_Calculator-imreconstruct(imerode(Img_Calculator,ones(1,71)),Img_Calculator),ones(1,11))); title('Calculator 5');
subplot(3,3,8); imshow(imreconstruct(imerode(Img_Calculator-imreconstruct(imerode(Img_Calculator,ones(1,71)),Img_Calculator),ones(1,11)),imreconstruct(imerode(Img_Calculator,ones(1,71)),Img_Calculator))); title('Calculator 6');







set(figure1, 'Position', [700 200 1800 900]);
set(figure2, 'Position', [700 200 1800 900]);
set(figure3, 'Position', [700 200 1800 900]);
set(figure4, 'Position', [700 200 1800 900]);
set(figure5, 'Position', [700 200 1800 900]);
set(figure6, 'Position', [700 200 1800 900]);
set(figure7, 'Position', [700 200 1800 900]);








