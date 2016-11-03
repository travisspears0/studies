function transformata_fouriera_odwrotna(Img)

Fourier_2D = fft2(Img);
Fourier_przesuniecie = fftshift(Fourier_2D);

Fourier_2D_odwrotnie = ifftshift(Fourier_przesuniecie);
Fourier_przesuniecie_odwrotnie = ifft2(Fourier_2D_odwrotnie);

figure; f1_rows = 2; f1_cols = 3;
subplot(f1_rows,f1_cols,1); imshow(Img); title('Img Original');
subplot(f1_rows,f1_cols,4); imshow(Fourier_przesuniecie,[]); title('Fourier Przesuniecie');
subplot(f1_rows,f1_cols,5); imshow(Fourier_przesuniecie_odwrotnie); title('Fourier Przesuniecie Odwrotnie');
subplot(f1_rows,f1_cols,6); imshow(imabsdiff(double(Img),Fourier_przesuniecie_odwrotnie)); title('Zlozenie Img Fourier Przesuniecie Odwrotnie');



end

