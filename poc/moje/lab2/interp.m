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
    newy = floor(yi*ystep);
    for xi=0:(nx-1)
        newx = floor(xi*xstep);
        adx = newx+1;
        bcx = newx+2;
        aby = newy+1;
        cdy = newy+2;
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



