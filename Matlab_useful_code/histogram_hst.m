img = imread('cameraman.png');
subplot(3, 2, 1),
imshow(img);
subplot(3, 2, 2),
imhist(img);

eq_img = histeq(img);
subplot(3, 2, 3),
imshow(eq_img);
subplot(3, 2, 4),
imhist(eq_img);

[J, T] = histeq(img);
subplot(3, 2, 5),
plot((0:255)/255,T);
