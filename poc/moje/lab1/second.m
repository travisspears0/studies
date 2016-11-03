figure(1);
bmp = imread('lena/lena.bmp');
bmpgray = rgb2gray(bmp);
imshow(bmpgray);
%czytanie obrazu z mapa kolorow
figure(2);
[x, map] = gray2ind(bmpgray, 256);
imshow(x, map);
%zmiana mapy kolorow
%rozne predefiniowane np summer winter autumn etc
figure(3);
map = colormap(summer(256));
imshow(x, map);
figure(4);
map = colormap(winter(256));
imshow(x, map);
figure(5);
map = colormap(autumn(256));
imshow(x, map);