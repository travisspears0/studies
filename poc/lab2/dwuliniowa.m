%clear
clearvars;
close all;
clc;
%interpolacji dwuliniowa

parrot = imread('archiwum/parrot.bmp');
scale = 7.5;

xscale = scale;
yscale = scale;

[x,y] = size(parrot);
nx = round(x*xscale);
ny = round(y*yscale);

xstep = x/nx;
ystep = y/ny;

scaled = uint8(zeros(ny,nx));

parrotdouble = double(parrot);

for i=0:(ny-1)
    xi = i*xstep;
    if(xi>x-2) xi=x-2; end;
    if(xi<1) xi=1; end;
    fxi = floor(xi);
    for j=0:(nx-1)
        yi = j*ystep;
        if(yi>y-2) yi=y-2; end;
        if(yi<1) yi=1; end;
        fyi = floor(yi);
        
        a = parrotdouble(fxi+1,fyi+1);
        b = parrotdouble(fxi+2,fyi+1);
        c = parrotdouble(fxi+2,fyi+2);
        d = parrotdouble(fxi+1,fyi+2);
        
        di = xi-fxi;
        dj = yi-fyi;
        
        scaled(i+1,j+1)=a*(1-di)*(1-dj) + b*di*(1-dj) + c*di*dj + d*(1-di)*dj;
    end
end
figure(1);
imshow(parrot,[]);
figure(2);
imshow(uint8(scaled),[]);

