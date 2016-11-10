function[] = histogram( img, figureindex )
    [h,x] = imhist(img);
    c = cumsum(h);
    cc = c/(max(c)/max(h));
    figure(figureindex);
    subplot(1,2,1), imshow(img);
    subplot(1,2,2), plot(x,h);
    hold on;
    subplot(1,2,2), plot(x,cc);
end

