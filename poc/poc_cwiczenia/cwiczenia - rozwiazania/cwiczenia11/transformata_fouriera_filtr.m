function transformata_fouriera_filtr(Rodzaj_Filtru,Img)

Fourier_2D = fft2(Img);
Fourier_przesuniecie = fftshift(Fourier_2D);

Fourier_amplituda = log10(abs(Fourier_przesuniecie)+1);
Fourier_faza = angle(Fourier_przesuniecie.*(Fourier_amplituda>0.0001));

[yy,xx] = freqspace(512,'meshgrid');

Matrix = ones(512);
roznica = sqrt(yy.^2 + xx.^2);

if Rodzaj_Filtru=='1' % D
    Matrix((roznica>0.1)) = 0;
end
if Rodzaj_Filtru=='2' % G
    Matrix((roznica<0.3)) = 0;
end
if Rodzaj_Filtru=='3' % DG
    Matrix((roznica<0.1)) = 0;
    Matrix((roznica>0.4)) = 0;
end

Fourier_Filtr = Fourier_przesuniecie.*Matrix;

Fourier_2D_odwrotnie = ifftshift(Fourier_Filtr);
Fourier_przesuniecie_odwrotnie = ifft2(Fourier_2D_odwrotnie);

h = fwind1(Matrix,chebwin(21));
[H yy xx] = freqz2(h,512,512);

Fourier_przesuniecie2 = Fourier_przesuniecie.*H;
Fourier_2D_odwrotnie2 = ifftshift(Fourier_przesuniecie2);
Fourier_przesuniecie_odwrotnie2 = ifft2(Fourier_2D_odwrotnie2);

figure;
subplot(2,3,1); imshow(Img); title('Img Original');
subplot(2,3,2); imshow(Fourier_amplituda,[]); title('Fourier Amplituda');
subplot(2,3,3); imshow(Fourier_faza,[]); title('Fourier Faza');
subplot(2,3,4); imshow(Fourier_przesuniecie_odwrotnie,[]); title('Fourier Przesuniecie 1');
subplot(2,3,5); imshow(Fourier_przesuniecie_odwrotnie2,[]); title('Fourier Przesuniecie 2');
subplot(2,3,6); mesh(yy,xx,Matrix); title('Mesh');






end

