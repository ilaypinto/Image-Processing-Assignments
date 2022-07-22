clear all; clc;
%% 1D
y = [zeros(1,3) ones(1,3) zeros(1,3)];
x = [-4:4]; z = fftshift(fft(y));
figure(1);
subplot(2,1,1), stem(x,y), title('1D function');
subplot(2,1,2), stem(x,z), title('DFT');
%% 2D
Z = zeros(9); Z(4:6,4:6)=1;
DFTZ = log10(abs(fftshift(fft2(Z)))+1);
figure(2);
subplot(2,1,1), mesh(Z), title('2D function');
subplot(2,1,2), mesh(DFTZ), title('DFT');
%% Band Reject for Corrupted Blood
BRF=BRF(1,1);
figure(3); mesh(BRF);
im=imread('blood_corrupted.jpg');
im_DFT=fft2(double(im)); BRF_shift=ifftshift(BRF);
im2=ifft2(im_DFT.*BRF_shift);
figure(4);
subplot(2,1,1); imshow(im);
subplot(2,1,2); imshow(im2);