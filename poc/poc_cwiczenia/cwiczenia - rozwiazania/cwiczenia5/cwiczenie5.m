
clc;
close all;
clearvars;

load MR_data;

local_window = [5 5];

I_noisefree_conv = convolution(I_noisefree,local_window);
I_noisy1_conv = convolution(I_noisy1,local_window);
I_noisy2_conv = convolution(I_noisy2,local_window);
I_noisy3_conv = convolution(I_noisy3,local_window);
I_noisy4_conv = convolution(I_noisy4,local_window);

I_noisefree_bila = bilateral(I_noisefree,local_window);
I_noisy1_bila = bilateral(I_noisy1,local_window);
I_noisy2_bila = bilateral(I_noisy2,local_window);
I_noisy3_bila = bilateral(I_noisy3,local_window);
I_noisy4_bila = bilateral(I_noisy4,local_window);

figure1 = figure(1);
subplot(2,3,1); imshow(I_noisefree,[]); title('Noisefree');
subplot(2,3,2); imshow(I_noisy1,[]); title('Noisy1');
subplot(2,3,3); imshow(I_noisy2,[]); title('Noisy2');
subplot(2,3,4); imshow(I_noisy3,[]); title('Noisy3');
subplot(2,3,5); imshow(I_noisy4,[]); title('Noisy4');

figure2 = figure(2);
subplot(2,3,1); imshow(I_noisefree_conv,[]); title('Noisefree Conv');
subplot(2,3,2); imshow(I_noisy1_conv,[]); title('Noisy1 Conv');
subplot(2,3,3); imshow(I_noisy2_conv,[]); title('Noisy2 Conv');
subplot(2,3,4); imshow(I_noisy3_conv,[]); title('Noisy3 Conv');
subplot(2,3,5); imshow(I_noisy4_conv,[]); title('Noisy4 Conv');

figure3 = figure(3);
subplot(2,3,1); imshow(I_noisefree_bila,[]); title('Noisefree Bila');
subplot(2,3,2); imshow(I_noisy1_bila,[]); title('Noisy1 Bila');
subplot(2,3,3); imshow(I_noisy2_bila,[]); title('Noisy2 Bila');
subplot(2,3,4); imshow(I_noisy3_bila,[]); title('Noisy3 Bila');
subplot(2,3,5); imshow(I_noisy4_bila,[]); title('Noisy4 Bila');






