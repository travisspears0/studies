
clc;
close all;
clearvars;

Img_Parrot = imread('parrot.bmp');
Img_Chessboard = imread('chessboard.bmp');
Img_Clock = imread('clock.bmp');
Img_Lena = imread('lena.bmp');

Img_Parrot_Sasiad = interpolacjaSasiad(Img_Parrot,1.5,1.5);
Img_Chessboard_New = interpolacjaSasiad(Img_Chessboard,1.5,1.5);
Img_Clock_New = interpolacjaSasiad(Img_Clock,1.5,1.5);

Img_Parrot_Dwuliniowa = interpolacjaSasiad(Img_Parrot,1.5,1.5);
Img_Chessboard_Dwuliniowa = interpolacjaSasiad(Img_Chessboard,1.5,1.5);
Img_Clock_Dwuliniowa = interpolacjaSasiad(Img_Clock,1.5,1.5);


figure;
subplot(2,2,1); imshow(Img_Chessboard); title('Chessboard Normal');
subplot(2,2,2); imshow(imresize(Img_Chessboard,2,'nearest')); title('Chessboard nearest');
subplot(2,2,3); imshow(imresize(Img_Chessboard,2,'bilinear')); title('Chessboard bilinear');
subplot(2,2,4); imshow(imresize(Img_Chessboard,2,'bicubic')); title('Chessboard bicubic');

Img_Lena_256 = imresize(Img_Lena,0.5);
Img_Lena_128 = imresize(Img_Lena_256,0.5);
Img_Lena_64 = imresize(Img_Lena_128,0.5);
figure;
subplot(2,2,1); imshow(Img_Lena,'InitialMagnification',512);  title('Lena 512');
subplot(2,2,2); imshow(Img_Lena_256,'InitialMagnification',512);  title('Lena 256');
subplot(2,2,3); imshow(Img_Lena_128,'InitialMagnification',512);  title('Lena 128');
subplot(2,2,4); imshow(Img_Lena_64,'InitialMagnification',512);  title('Lena 64');

figure;
subplot(3,2,1); imshow(Img_Lena_128,[]);  title('Lena 255');
subplot(3,2,2); imshow(imadjust(Img_Lena_128,[0 1],[0 31/255]),[]);  title('Lena 31');
subplot(3,2,3); imshow(imadjust(Img_Lena_128,[0 1],[0 15/255]),[]);  title('Lena 15');
subplot(3,2,4); imshow(imadjust(Img_Lena_128,[0 1],[0 7/255]),[]);  title('Lena 7');
subplot(3,2,5); imshow(imadjust(Img_Lena_128,[0 1],[0 3/255]),[]);  title('Lena 3');
subplot(3,2,6); imshow(imadjust(Img_Lena_128,[0 1],[0 1/255]),[]);  title('Lena 1');




