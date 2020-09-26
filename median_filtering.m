close all;
% read image
P = imread('Images/lib-gn.jpg');
figure
imshow(P);

% filter image 
% 3x3
P2 = medfilt2(P); % Default filter size is 3x3
figure
imshowpair(P, P2, 'montage');

% 5x5
P3 = medfilt2(P, [5, 5]);
figure
imshowpair(P2, P3, 'montage');

% read image
P4 = imread('Images/lib-sp.jpg');
figure
imshow(P4);

% filter image
% 3x3
P5 = medfilt2(P4); % Default filter size is 3x3
figure
imshowpair(P4, P5, 'montage');

% 5x5
P6 = medfilt2(P4, [5, 5]);
figure
imshowpair(P5, P6, 'montage');