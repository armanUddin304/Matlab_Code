he = imread('hestain.jpg');
subplot(2,3,1);
imshow(he), title('H&E image');
text(size(he,2),size(he,1)+15,...
     'Image courtesy of Alan Partin, Johns Hopkins University', ...
     'FontSize',7,'HorizontalAlignment','right');
 lab_he = rgb2lab(he);
 ab = lab_he(:,:,2:3);
ab = im2single(ab);
nColors = 3;
pixel_labels = imsegkmeans(ab,nColors,'NumAttempts',3);
subplot(2,3,2);
imshow(pixel_labels,[])
title('Image Labeled by Cluster Index');
mask1 = pixel_labels==1;
cluster1 = he .* uint8(mask1);
subplot(2,3,3);
imshow(cluster1)
title('Objects in Cluster 1');
mask2 = pixel_labels==2;
cluster2 = he .* uint8(mask2);
subplot(2,3,4);
imshow(cluster2)
title('Objects in Cluster 2');
mask3 = pixel_labels==3;
cluster3 = he .* uint8(mask3);
subplot(2,3,5);
imshow(cluster3)
title('Objects in Cluster 3');
L = lab_he(:,:,1);
L_blue = L .* double(mask3);
L_blue = rescale(L_blue);
idx_light_blue = imbinarize(nonzeros(L_blue));
blue_idx = find(mask3);
mask_dark_blue = mask3;
mask_dark_blue(blue_idx(idx_light_blue)) = 0;
blue_nuclei = he .* uint8(mask_dark_blue);
subplot(2,3,6);
imshow(blue_nuclei)
title('Blue Nuclei');
