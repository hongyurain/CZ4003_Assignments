P = imread('Images/mrt-train.jpg');
whos P

%Display the image intensity histogram of P using 10 bins 
imhist(P,10); 
figure
%Display the image intensity histogram of P using 256 bins 
imhist(P, 256);

P3 = histeq(P, 255);

%Redisplay the histograms for P3 with 10 and 256 bins
figure
imhist(P3, 10);
figure
imhist(P3, 256);

P4 = histeq(P3, 255);

figure
imhist(P4, 10);
figure
imhist(P4, 256);