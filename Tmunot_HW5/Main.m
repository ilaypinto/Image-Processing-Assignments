%% Image Processing HW 5
% Main code for HW 5, make sure 'Coder', 'Decoder', and 'HW5' are
% in the same file
% When chosing a random image for algorithm- chose a 256X256 pic.
clear all; clc; close all;
[x,y] = meshgrid(-128:1:127);
% image in x directon
image=cos(20*pi*(2/size(x,1))*x);
imwrite(image,'x.png');
image = im2gray(imread('x.png'));
[a1,a2,a3,a4,a5]=HW5(image);
% image in y direction
image=cos(20*pi*(2/size(y,1))*y);
imwrite(image,'y.png');
image = im2gray(imread('y.png'));
[b1,b2,b3,b4,b5]=HW5(image);
% image with an undifined direction
image = im2gray(imread('luffy.jpg'));
[c1,c2,c3,c4,c5]=HW5(image);
