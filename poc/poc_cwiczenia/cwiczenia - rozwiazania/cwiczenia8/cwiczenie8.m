
clc;
close all;
clearvars;

Img_Dom = imread('dom.png');

figure1 = figure(1);
subplot(2,3,1); imshow(Img_Dom); title('Dom Original');
subplot(2,3,4); imshow(edge(Img_Dom,'log')); title('Dom Edge Log');
subplot(2,3,5); imshow(edge(Img_Dom,'canny')); title('Dom Edge Canny');
subplot(2,3,6); imshow(edge(Img_Dom,'sobel')); title('Dom Edge Sobel');

%------------------------------------------------------------------------

Img_Zeros1 = zeros(11);
Img_Zeros1(2,2) = 1;

Img_Zeros2 = zeros(11);
Img_Zeros2(2,2) = 1;
Img_Zeros2(4,4) = 1;

Img_Zeros3 = zeros(11);
Img_Zeros3(2,2) = 1;
Img_Zeros3(4,4) = 1;
Img_Zeros3(5,5) = 1;
Img_Zeros3(6,6) = 1;

[H1,T1,R1] = hough(Img_Zeros1,'RhoResolution',0.1,'ThetaResolution',0.5);
[H2,T2,R2] = hough(Img_Zeros2,'RhoResolution',0.1,'ThetaResolution',0.5);
%x=6 y=95

Theta = 90;
Rho = 143;

WektorX = 0:0.1:10;
WektorY = (R1(Rho)-WektorX*cosd(T1(Theta)))/sind(T1(Theta));


figure2 = figure(2);
subplot(2,4,1); imshow(Img_Zeros1); title('Zeros1 Original');
subplot(2,4,2); imshow(Img_Zeros2); title('Zeros2 Original');
subplot(2,4,3); imshow(Img_Zeros3); title('Zeros3 Original');
subplot(2,4,5); imshow(hough(Img_Zeros1,'RhoResolution',0.1,'ThetaResolution',0.5)); title('Zeros1 Hough');
subplot(2,4,6); imshow(hough(Img_Zeros2,'RhoResolution',0.1,'ThetaResolution',0.5)); title('Zeros2 Hough');
subplot(2,4,7); imshow(hough(Img_Zeros3,'RhoResolution',0.1,'ThetaResolution',0.5)); title('Zeros3 Hough');
subplot(2,4,8); imshow(Img_Zeros3); hold on; plot(WektorX+1,WektorY+1); title('Zeros3 Hough');

%------------------------------------------------------------------------


Img_Kwadraty = imread('kwadraty.png');
Img_Kwadraty_Edge = edge(Img_Kwadraty,'canny');

[H_K,T_K,R_K] = hough(Img_Kwadraty_Edge,'RhoResolution',0.1,'ThetaResolution',0.5);

hough_peaks_8 = houghpeaks(H_K,8);
hough_lines = houghlines(Img_Kwadraty_Edge,T_K,R_K,hough_peaks_8,'FillGap',5,'MinLength',7);



figure3 = figure(3);
subplot(2,3,1); imshow(Img_Kwadraty); title('Kwadraty Original');
subplot(2,3,2); imshow(Img_Kwadraty_Edge); title('Kwadraty Edge Canny');
subplot(2,3,3); imshow(hough(Img_Kwadraty_Edge,'RhoResolution',0.1,'ThetaResolution',0.5)); title('Kwadraty Edge Log');
subplot(2,3,4); plot(H_K); title('Kwadraty Hough H');
subplot(2,3,5); plot(hough_peaks_8); title('Kwadraty Hough Peaks');
subplot(2,3,6); imshow(Img_Kwadraty_Edge);hold on
max_len = 0;
for k = 1:length(hough_lines)
   xy = [hough_lines(k).point1; hough_lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(hough_lines(k).point1 - hough_lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
title('Kwadraty Hough Peaks');




%------------------------------------------------------------------------

Img_Lab = imread('lab112.png');



figure4 = figure(4);
subplot(2,2,1); imshow(Img_Lab); title('Lab Original');
subplot(2,2,3); draw_hough_lines(Img_Lab,get_hough_lines(Img_Lab)); title('Kwadraty Hough Peaks');






%------------------------------------------------------------------------


set(figure1, 'Position', [700 200 2000 900]);
set(figure2, 'Position', [700 200 2000 900]);
set(figure3, 'Position', [700 200 2000 900]);
set(figure4, 'Position', [700 200 2000 900]);













