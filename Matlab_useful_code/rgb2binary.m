image = imread('peppers_color.jpg');
im1= rgb2gray(image);
im2 = imbinarize(im1);
figure;

subplot(2,2,1),
imshow(image);
title('RGB Image');

subplot(2,2,2);
imshow(im1);
title('Gray Image');

subplot(2,2,3);
imshow(im2);
title('Binary Image');
