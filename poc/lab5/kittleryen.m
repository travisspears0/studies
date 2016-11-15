%clear
clearvars;
close all;
clc;
%vars
prog=90;
obrazy = {'rice.png';'archiwum/tekst.bmp';'archiwum/obiekty.bmp';'archiwum/katalog.bmp'};
for i=1:4
    
    im = imread(obrazy{i});

    kittler = clusterKittler(im);
    yen = entropyYen(im);
    
    figure(i);
    subplot(1,6,1), imshow(im);
    title('orginal');
    subplot(1,6,2), imhist(im);
    title('histogram');
    subplot(1,6,3), imshow(im2bw(im,prog/255));
    title(sprintf('bin[%d]',prog));
    subplot(1,6,4), imshow(im2bw(im,kittler/255));
    title(sprintf('kittler[%d]',kittler));
    subplot(1,6,5), imshow(im2bw(im,yen/255));
    title(sprintf('yen[%d]',yen));
    subplot(1,6,6), imshow(im2bw(im,(255-prog)/255));
    title(sprintf('bin[%d]',255-prog));
end

