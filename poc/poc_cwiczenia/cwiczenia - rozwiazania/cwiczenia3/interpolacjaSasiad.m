function Img_New = interpolacjaSasiad(Img,xReScale,yReScale)


[xImageResolution,yImageResolution] = size(Img);
xNewImageResolution = xImageResolution * xReScale;
yNewImageResolution = yImageResolution * yReScale;

Img_New = uint8(zeros(xNewImageResolution,yNewImageResolution));

xStep = xImageResolution/xNewImageResolution;
yStep = yImageResolution/yNewImageResolution;

for ii = 0:yNewImageResolution-1
    for jj = 0:xNewImageResolution-1
        i = round(ii*xStep);
        j = round(jj*yStep);
        Img_New(jj+1,ii+1) = Img(j+1,i+1);
    end
end

figure;
subplot(1,2,1); imshow(Img); title('Original Img');
subplot(1,2,2); imshow(Img_New); title('New Img');

end

