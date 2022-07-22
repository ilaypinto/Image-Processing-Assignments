% code for Question 2 of the first home assignment
clear all; clc;
img=imread('test.bmp'); gray_vec=zeros(256,1);
for i=0:255
    gray_vec(i+1)=length(find(i==img));
end
subplot(1,2,1);
bar(0:255,gray_vec); xlabel('Gray Levels'); ylabel('No. of pixels');
title('Histogram using designed code');
subplot(1,2,2);
imhist(img); xlabel('Histogram using imhist cammand'); ylabel('No. of pixels');
