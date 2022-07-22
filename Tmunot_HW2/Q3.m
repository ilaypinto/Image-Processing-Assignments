%Q3
clear all; clc;
im1 =double(rgb2gray(imread('blood.jpg')));
im2 =double(rgb2gray(imread('blood_corrupted.jpg')));
sz = size(im1);X = zeros(sz);[dim1,dim2]=size(im2);
X(1:dim1,1:dim2) = im2;im3 = X - im1;im4 = imcrop(im3,[1 1 dim1-1 dim2-1]);
f = log(1+abs(fftshift(fft2(im4))));
figure(1);
subplot(2,2,1);imshow(im1,[]);title('Original');
subplot(2,2,2);imshow(im2,[]);title('Corrupted')
subplot(2,2,3);imshow(im4,[]);title('Two Dimentional Sine Noise');
%Fourier Transform for intuition
%subplot(2,2,4);imshow(f,[]);title('Fourier Transform');