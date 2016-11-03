function transformata_fouriera(Img)

Fourier_2D = fft2(Img);
Fourier_przesuniecie = fftshift(Fourier_2D);
    
Fourier_amplituda = log10(abs(Fourier_przesuniecie)+1);
Fourier_faza = angle(Fourier_przesuniecie.*(Fourier_amplituda>0.0001));

Fourier1 = fft(Img,[],1);
Fourier2 = fft(Fourier1,[],2);

Fourier_przesuniecie2 = fftshift(Fourier2);
    
Fourier_amplituda2 = log10(abs(Fourier_przesuniecie2)+1);
Fourier_faza2 = angle(Fourier_przesuniecie2.*(Fourier_amplituda2>0.0001));



figure; f1_rows = 3; f1_cols = 3;
subplot(f1_rows,f1_cols,2); imshow(Img); title('Img Original');
subplot(f1_rows,f1_cols,4); imshow(Fourier_amplituda,[]); title('Fourier Amplituda 1');
subplot(f1_rows,f1_cols,5); imshow(Fourier_amplituda2,[]); title('Fourier Amplituda 2');
subplot(f1_rows,f1_cols,6); imshow(imabsdiff(Fourier_amplituda2,Fourier_amplituda)); title('Zlozenie Fourier Amplituda');
subplot(f1_rows,f1_cols,7); imshow(Fourier_faza,[]); title('Fourier Faza 1');
subplot(f1_rows,f1_cols,8); imshow(Fourier_faza2,[]); title('Fourier Faza 2');
subplot(f1_rows,f1_cols,9); imshow(imabsdiff(Fourier_faza2,Fourier_faza)); title('Zlozenie Fourier Faza');



end

