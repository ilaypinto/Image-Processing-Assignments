%code for question 4 in the first home assignment
img=imread('pic1.bmp');img=rgb2gray(img);
%section a-normalized histogram
h=imhist(img);h=h/(size(img,1)*size(img,2));
figure(1); bar(h); title('normalized img histogram');
%section c- transforming of the image
figure(2);
subplot(7,2,1);imshow(img);title('original');
subplot(7,2,2);imhist(img);
%negative
vec=255:-2:0;
neg=Q4_func(img,vec);
subplot(7,2,3);imshow(neg);title('negative');
subplot(7,2,4);imhist(neg);
%threshhold
t=50;vec=[zeros(1,t+1),255*ones(1,256-(t+1))];
thresh=Q4_func(img,vec);
subplot(7,2,5);imshow(thresh);title('threshold(50)');
subplot(7,2,6);imhist(thresh);
%linear streching
high=max(double(img(:)));low=min(double(img(:)));level=0:255;
vec=round(255*(level-low)/(high-low));
lin_strech=Q4_func(img,vec);
subplot(7,2,7);imshow(lin_strech);title('linear streching');
subplot(7,2,8);imhist(lin_strech);
%gamma
g=1.5;c=255/255^g;vec=round(c*level.^g);
g1=Q4_func(img,vec);
subplot(7,2,9);imshow(g1);title('gamma=1.5');
subplot(7,2,10);imhist(g1);
g=0.5;c=255/255^g;vec=round(c*level.^g);
g2=Q4_func(img,vec);
subplot(7,2,11);imshow(g2);title('gamma=0.5');
subplot(7,2,12);imhist(g2);
%histogram equalization- couldnt figure out how to do it with the function
%so 'adapthisteq' was used
img2=adapthisteq(img);
subplot(7,2,13);imshow(img2);title('histogram equalization');
subplot(7,2,14);imhist(img2);

