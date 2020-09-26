close all;
%read image
P = imread('Images/pck-int.jpg');
imshow(P);

F = fft2(P);

% compute power spectrum S
S = abs(F);
figure
imagesc(fftshift(S.^0.1));
colormap('default');

figure
imagesc(S.^0.1);
colormap('default');

F_new=F;
[x, y] = ginput(2);
%F_new(239:243,7:11)=0;
%F_new(15:19,247:251)=0;
for i = 1: length(x)
    fprintf('Peaks: (%d, %d)\n', round(x(i)), round(y(i)));
    for j=-2:2
        for m=-2:2
            fprintf('At pixel: (%d, %d)\n', round(x(i))+j, round(y(i))+m);
            F_new(round(y(i))+m, round(x(i))+j) = 0;
        end
    end
end

S_new= abs(F_new);
figure
imagesc(fftshift(S_new.^0.1))
colormap('default')

P_inverse = uint8(ifft2(F_new));
figure
imshow(real(P_inverse));

F_new_better=F;
for i = 1: length(x)
    fprintf('Peaks: (%d, %d)\n', round(x(i)), round(y(i)));
    for j=-7:7
        for m=-7:7
            fprintf('At pixel: (%d, %d)\n', round(x(i))+j, round(y(i))+m);
            F_new_better(round(y(i))+m, round(x(i))+j) = 0;
        end
    end
end
S_new_better= abs(F_new_better);
figure
imagesc(fftshift(S_new_better.^0.1))
colormap('default')

P_inverse_better = uint8(ifft2(F_new_better));
figure
imshowpair(real(P_inverse),real(P_inverse_better),'montage');

%% primate image
close all
primate=imread('Images/primate-caged.jpg');
primate = rgb2gray(primate);
figure
imshow(primate);

F2 = fft2(primate);
S2 = abs(F2);
figure
imagesc(S2.^0.1)
colormap('default')

F2_new = F2;
[x, y] = ginput(4);
% (x, y) => F(y, x)
for i = 1: length(x)
    fprintf('Peaks: (%d, %d)\n', round(x(i)), round(y(i)));
    for j=-2:2
        for m=-2:2
            fprintf('At pixel: (%d, %d)\n', round(x(i))+j, round(y(i))+m);
            F2_new(round(y(i))+m, round(x(i))+j) = 0;
        end
    end
end

S2_new = real(F2_new);
figure
imagesc(fftshift(real(S2_new.^0.1)));
colormap('default');

P2_inverse = uint8(ifft2(F2_new));
figure
imshow(real(P2_inverse));

F2_new_better=F2;
S2 = abs(F2_new_better);
figure
imagesc(S2.^0.1)
colormap('default')

[x2, y2] = ginput(6);
for i = 1: length(x2)
    fprintf('Peaks: (%d, %d)\n', round(x2(i)), round(y2(i)));
    for j=-2:2
        for m=-2:2
            fprintf('At pixel: (%d, %d)\n', round(x2(i))+j, round(y2(i))+m);
            F2_new_better(round(y2(i))+m, round(x2(i))+j) = 0;
        end
    end
end


S2_new_better= abs(F2_new_better);
figure
imagesc(fftshift(S2_new_better.^0.1))
colormap('default')

P2_inverse_better = uint8(ifft2(F2_new_better));
figure
imshowpair(real(P2_inverse),real(P2_inverse_better),'montage');

