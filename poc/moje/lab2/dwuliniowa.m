%clear
clearvars;
close all;
clc;
%vars
lena = imread('archiwum/lena.bmp');
lena256 = imresize(lena,.5);
lena128 = imresize(lena,.25);
lena64 = imresize(lena,.125);
%interpolacji dwuliniowa

parrot = imread('archiwum/parrot.bmp');
scale = 2.5;

xscale = scale;
yscale = scale;

[y,x] = size(parrot);
nx = round(x*xscale);
ny = round(y*yscale);

xstep = x/nx;
ystep = y/ny;
parrotdouble = double(parrot);

scaled = uint8(zeros(ny,nx));
for yi=0:(ny-1)
    yii = floor(yi*ystep);
    for xi=0:(nx-1)
        xii = floor(xi*xstep);
        adx = xii+1;
        bcx = xii+2;
        aby = yii+1;
        cdy = yii+2;
        if (adx > x) adx = x; end
        if (bcx > x) bcx = x; end
        if (aby > y) aby = y; end
        if (cdy > y) cdy = y; end
        fA = parrotdouble((aby), (adx));
        fB = parrotdouble((aby), (bcx));
        fC = parrotdouble((cdy), (bcx));
        fD = parrotdouble((cdy), (adx));
        
        fABCD = [1-yi yi]*[fA fD;fB fC]*[1-xi;xi];
        scaled(yi+1, xi+1) = fABCD;
    end
end
figure(1);
imshow(parrot,[]);
figure(2);
imshow(uint8(scaled),[]);

