%clear
clearvars;
close all;
clc;
%vars
lena = imread('archiwum/lena.bmp');
lena256 = imresize(lena,.5);
lena128 = imresize(lena,.25);
lena64 = imresize(lena,.125);
%{
%skalowanie
init = 200;
%init = 400;
%init = 800;
figure(1);
%imshow(lena,'InitialMagnification',init);
figure(2);
%imshow(lena256,'InitialMagnification',init);
figure(3);
%imshow(lena128,'InitialMagnification',init);
figure(4);
%imshow(lena64,'InitialMagnification',init);
%}
%{
%poziomy jasnosci
figure(5);
adj = imadjust(lena128, [.5 .6], []);
subplot(1,2,1), imshow(adj,[]);
subplot(1,2,2), imshow(lena128,[]);
%}

%interpolacja
parrot = imread('archiwum/parrot.bmp');
%imshow(parrot);
scale = 2.5;

xscale = scale;
yscale = scale;

[y,x] = size(parrot);
nx = round(x*xscale);
ny = round(y*yscale);

xstep = x/nx;
ystep = y/ny;

scaled = uint8(zeros(ny,nx));
for yi=0:(ny-1)
    yii = floor(yi*ystep);
    for xi=0:(nx-1)
        xii = floor(xi*xstep);
        scaled(yi+1, xi+1) = parrot(yii+1, xii+1);
    end
end
figure(1);
imshow(parrot,[]);
figure(2);
imshow(scaled,[]);
