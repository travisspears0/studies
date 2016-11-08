clearvars;
close all;
clc;

sto = imread('archiwum/100zloty.jpg');
gr = rgb2gray(sto);
%1
figure(1);
for i = 1:7
    bit = bitget(gr, i);
    subplot(4,2,i), imshow(logical(bit));
end
subplot(4,2,8), imshow(sto);
%2
[y,x] = size(gr);
add = uint8(zeros(y,x));
for i = 5:7
    bit = bitget(gr, i)*(2.^i);
    add = imadd(add,bit);
end


add2 = uint8(zeros(y,x));
for i = 6:8
    bit = bitget(gr, i)*(2.^i);
    add2 = imadd(add2,bit);
end

figure(2);
subplot(1,3,1), imshow(sto);
subplot(1,3,2), imshow(add);
subplot(1,3,3), imshow(add2);


