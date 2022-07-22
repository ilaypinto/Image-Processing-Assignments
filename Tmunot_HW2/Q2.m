%Q2
%A
clear all;clc;
im=double(rgb2gray(imread('blood.jpg')));
f=ones(7,7)/49;im_filt=imfilter(im,f);
figure(1);imshow(im_filt,[]);title('Filtered Image');
%B
sz=size(im);F=freqz2(f,sz(1)+7-1,sz(2)+7-1);
figure(2);imshow(log(1+abs(F)),[]);title('Filter in frequency');
%C
fft_im=fft2(im,sz(1)+7-1,sz(2)+7-1);
im_filt2=fft_im.*ifftshift(F)';
im_filt2=real(ifft2(im_filt2));
im_filt2=im_filt2(1:sz(1),1:sz(2));
figure(3);imshow(im_filt2,[]);title('Frequency Filter');