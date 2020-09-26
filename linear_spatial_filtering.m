%Generate the filters

h1 = fspecial('gaussian',[5,5],1);
mesh(h1)

h2 = fspecial('gaussian',[5,5],2);
figure
mesh(h2)

% read image
P = imread('Images/lib-gn.jpg');
figure
imshow(P);

P1 = conv2(P,h1);
figure
imshow(uint8(P1))

P2 = conv2(P,h2);
figure
imshow(uint8(P2))

% read image
P3 = imread('Images/lib-sp.jpg');
figure
imshow(P3);

P4 = conv2(P3,h1);
figure
imshow(uint8(P4))

P5 = conv2(P3,h2);
figure
imshow(uint8(P5))
