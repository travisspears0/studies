scale = 2;
xReScale=scale;
yReScale=scale;
Img='parrot.bmp';
[xImageResolution,yImageResolution] = size(Img);
xNewImageResolution = xImageResolution * xReScale;
yNewImageResolution = yImageResolution * yReScale;

Img_New = uint8(zeros(xNewImageResolution,yNewImageResolution));

xStep = xImageResolution/xNewImageResolution;
yStep = yImageResolution/yNewImageResolution;

%Img_New(i,j) = A*i + B*j + C*i + D*j;
for ii = 0:yNewImageResolution-1
    for jj = 0:xNewImageResolution-1
        i = floor(ii*xStep);
        j = floor(jj*yStep);
        A = Img(i+1,j+1);
        B = Img(i+1,j+2);
        C = Img(i+2,j+1);
        D = Img(i+2,j+2);
        Img_New(i,j) = A*i + B*j + C*i + D*j;
    end
end

figure;
subplot(1,2,1); imshow(Img); title('Original Img');
subplot(1,2,2); imshow(Img_New); title('New Img');


