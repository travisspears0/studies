%info o plikach
bmpinfo = imfinfo('lena/lena.bmp');
jpginfo = imfinfo('lena/lena.jpg');

%wyswietlanie obrazow
figure(1);
bmp = imread('lena/lena.bmp');
imshow(bmp);

figure(2);
jpg = imread('lena/lena.jpg');
imshow(jpg);

figure(3);
bmpgray = rgb2gray(bmp);
imshow(bmpgray);
%zapisywanie obrazow
imwrite(bmpgray, 'lena/lena_gray.bmp');

%wyswietlenie czesci obrazu jako funkcji
figure(4);
colormap gray;
%pixele:
%10 wiersz cala kolumna
plot(bmpgray(10,:));
%caly wiersz 5 kolumna
figure(5);
plot(bmpgray(:,5));

%3d
colormap gray;
mesh(bmpgray);


