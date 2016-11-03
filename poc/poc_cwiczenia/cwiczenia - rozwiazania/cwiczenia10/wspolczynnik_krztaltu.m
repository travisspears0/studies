function wspolczynnik_krztaltu()

%shapes - zwykle
Img_shapes = imread('shapes.png');
Img_shapes_wspolczynniki = wspolczynnik_krzaltu_obliczanie1(bwlabel(Img_shapes,4));


%shapes - real
Img_shapes_real = imread('shapesReal.png');
Img_shapes_real_imerode = imerode(imcomplement(im2bw(Img_shapes_real,0.22)),strel('rectangle',[5 5]));
Img_shapes_real_wspolczynniki = wspolczynnik_krzaltu_obliczanie2(bwlabel(Img_shapes_real_imerode,4));

figure2 = figure(2); f1_rows = 2; f1_cols = 3;
subplot(f1_rows,f1_cols,1); imshow(Img_shapes,[]); title('Img Shapes Original');
subplot(f1_rows,f1_cols,2); imshow(bwlabel(Img_shapes,4),[]); title('Img Shapes Bwlabel 4');
subplot(f1_rows,f1_cols,3); imshow(Img_shapes_wspolczynniki,[]); title('Img Shapes Wspolczyniki');

subplot(f1_rows,f1_cols,4); imshow(Img_shapes_real,[]); title('Img Shapes Real Original');
subplot(f1_rows,f1_cols,5); imshow(Img_shapes_real_imerode,[]); title('Img Shapes Real Imerode');
subplot(f1_rows,f1_cols,6); imshow(Img_shapes_real_wspolczynniki,[]); title('Img Shapes Real Wspolczyniki');


end

