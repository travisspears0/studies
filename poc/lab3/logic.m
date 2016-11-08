clearvars;
close all;
clc;

kolo = imread('archiwum/kolo.bmp');
kwadrat = imread('archiwum/kwadrat.bmp');

bkolo = boolean(kolo);
bkwadrat = boolean(kwadrat);

figure(1);
imshow(bkolo);
figure(2);
imshow(bkwadrat);

not = ~bkwadrat;
figure(3);
subplot(1,4,1), imshow(bkwadrat);
subplot(1,4,2), imshow(~bkwadrat);
subplot(1,4,3), imshow(bkolo);
subplot(1,4,4), imshow(~bkolo);

figure(4);
subplot(1,3,1), imshow(bkolo & bkwadrat);
subplot(1,3,2), imshow(bkolo | bkwadrat);
subplot(1,3,3), imshow(xor(bkolo, bkwadrat));
