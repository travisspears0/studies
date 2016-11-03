function indeksacja()

Img_ccl1 = imread('ccl1.png');
Img_ccl1_original = Img_ccl1;
[ccl1_y,ccl1_x] = size(Img_ccl1);

N = 100;
L = 1;
id = 1:N;
lut = zeros(N);

for y = 2:ccl1_y
    for x  = 2:(ccl1_x-1)
        if (Img_ccl1(y,x) ~= 0)
            A = Img_ccl1(y-1,x-1);
            B = Img_ccl1(y-1,x);
            C = Img_ccl1(y-1,x+1);
            D = Img_ccl1(y,x-1);
            
            if sum([A B C D])==0
                Img_ccl1(y,x) = L;
                L = L + 1;
            else if min(nonzeros([A B C D])) == max(nonzeros([A B C D]))
                    %jeden lub wiecej z etykieta L
                    Img_ccl1(y,x) = min(nonzeros([A B C D]));
                else if min(nonzeros([A B C D])) ~= max(nonzeros([A B C D]))
                        %rozne etykiety
                        piksele_nz = nonzeros([A B C D]);
                        piksele_nz_min = piksele_nz(piksele_nz~=min(nonzeros([A B C D])));
                        piksele_nz_min_2 = min(piksele_nz_min);
                        
                        Img_ccl1(y,x) = min(nonzeros([A B C D]));
                        id = quick_union(id,min(nonzeros([A B C D])),piksele_nz_min_2);
                    end
                end
            end
        end
    end
end
Img_ccl1_before_lut = Img_ccl1;

for i = 1:N
    lut(i) = quick_union_root(id,i);
end

for y = 2:ccl1_y
   for x = 2:(ccl1_x-1)
      if (Img_ccl1(y,x) > 0)
        Img_ccl1(y,x) = lut(Img_ccl1(y,x));
      end
   end
end


% indeksacja wbudowana

Img_ccl2 = imread('ccl2.png');
Img_ccl2_bwlabel_4 = bwlabel(Img_ccl2,4);
Img_ccl2_bwlabel_8 = bwlabel(Img_ccl2,8);


figure1 = figure(1); f1_rows = 3; f1_cols = 2;
subplot(f1_rows,f1_cols,1); imshow(Img_ccl1_original,[]); title('Img ccl1 Original');
subplot(f1_rows,f1_cols,3); imshow(Img_ccl1_before_lut,[]); title('Img ccl1 Before Lut');
subplot(f1_rows,f1_cols,5); imshow(Img_ccl1,[]); title('Img ccl1 Final');

subplot(f1_rows,f1_cols,2); imshow(Img_ccl2,[]); title('Img ccl2 Original');
subplot(f1_rows,f1_cols,4); imshow(Img_ccl2_bwlabel_4,[]); title('Img ccl2 Bwlabel 4');
subplot(f1_rows,f1_cols,6); imshow(Img_ccl2_bwlabel_8,[]); title('Img ccl2 Bwlabel 8');

end

