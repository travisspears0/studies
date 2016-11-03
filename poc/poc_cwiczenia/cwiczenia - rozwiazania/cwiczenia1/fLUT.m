function fLUT(obraz,przekodowanie)

subplot(2,2,1:2); plot(przekodowanie); title('Przekodowanie'); xlim([0 256]); ylim([0 256]);
subplot(2,2,3); imshow(obraz); title('Oryginalne');
subplot(2,2,4); imshow(intlut(obraz,przekodowanie)); title('Przerobione');

end

