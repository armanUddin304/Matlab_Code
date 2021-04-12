I = imread('cell.png'); 
subplot (2,4,1); imshow(I), title('original image');
text(size(I,2),size(I,1)+15, ...
'Image courtesy of Alan Partin', ...
'FontSize',7,'HorizontalAlignment','right');
text(size(I,2),size(I,1)+25, ....
'Johns Hopkins University', ...
'FontSize',7,'HorizontalAlignment','right');
[~, threshold] = edge(I, 'sobel');
fudgeFactor = .5;
BWs = edge(I,'sobel', threshold * fudgeFactor);
subplot(2,4,2);imshow(BWs), title('binary gradient mask');
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);
BWsdil = imdilate(BWs, [se90 se0]);
subplot(2,4,3);imshow(BWsdil), title('dilated gradient mask');
BWdfill = imfill(BWsdil, 'holes');
subplot(2,4,4);imshow(BWdfill);
title('binary image with filled holes');
BWnobord = imclearborder(BWdfill, 4);
subplot(2,4,5); imshow(BWnobord), title('cleared border image');
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
BWfinal = imerode(BWfinal,seD);
subplot(2,4,6);imshow(BWfinal), title('segmented image');
BWoutline = bwperim(BWfinal);
Segout = I;
Segout(BWoutline) = 255;
subplot(2,4,7); imshow(Segout), title('outlined original image');
