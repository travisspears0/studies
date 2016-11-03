function hough_lines = get_hough_lines(Img)


Img = edge(Img,'canny',[0.1 0.8]);

[H_K,T_K,R_K] = hough(Img,'RhoResolution',0.1,'ThetaResolution',0.5);

hough_peaks_8 = houghpeaks(H_K,8);
hough_lines = houghlines(Img,T_K,R_K,hough_peaks_8,'FillGap',5,'MinLength',7);



end

