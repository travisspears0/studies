function LUT( img, code )
    subplot(1,3,1), plot(code);
    subplot(1,3,2), imshow(img);
    subplot(1,3,3), imshow(intlut(img, code));
end

