%Input the image
Pc = imread('Images/mrt-train.jpg');
whos Pc

%convert to grayscale image
P = rgb2gray(Pc); 
imshow(P);

%Check the minimum and maximum intensities present in the image:
min(P(:)), max(P(:))

% min 13 max 204
P2 = imsubtract(P, 13);
P2 = immultiply(P2, (255/(204-13)));
% check
min(P2(:)), max(P2(:))
figure
imshow(P2);

figure
imshow(P2,[]);