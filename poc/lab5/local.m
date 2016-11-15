%clear
clearvars;
close all;
clc;
%vars

im = imread('rice.png');
im = imread('archiwum/katalog.bmp');
[x y] = size(im);

binmean=im;
binsau=im;
w2 = round(15/2);
for i=1:x
    for j=1:y
        mean = meanLT(i,j,w2,im,x,y);
        if im(i,j) < mean
            binmean(i,j)=0;
        else
            binmean(i,j)=255;
        end
        sign = 1;
        os = stddevLT(i,j,w2,im,mean,x,y);
        t=mean*(1+sign*.15*(os/128-1));
        if im(i,j) < t
            binsau(i,j)=0;
        else
            binsau(i,j)=255;
        end
    end
end

figure(1);
subplot(1,3,1),imshow(im);
subplot(1,3,2),imshow(binmean);
subplot(1,3,3),imshow(binsau);


