Image=imread('einestine.jpg');
Img = rgb2gray(Image);
X = edge(Img,'Prewitt');
Y = edge(Img,'Sobel');
Z = edge(Img,'Roberts');

subplot(2,2,1);
imshow(Image);
title('Original image');

subplot(2,2,2);
imshow(X)
title('prewitt image');

subplot(2,2,3);
imshow(Y)
title('sobel image');

subplot(2,2,4);
imshow(Z)
title('robert image');



