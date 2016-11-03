function draw_hough_lines( Img,hough_lines )

Img = edge(Img,'canny',[0.1 0.8]);

imshow(Img); hold on
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



end

