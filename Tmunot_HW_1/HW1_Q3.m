%code for Question 3 of the first home assignment
img=imread('pelvis.jpg');
img2=imadjust(img,[0,200/255]);
img3=imadjust(img,[50/255,255/255]);
%matlab's 'imadjust' uses the equation: Gk=round((L-1)*(Sk-low)/(high-low))
%L=no. of grey levels, Sk=T(original grey level)
%low= lowest pixel probability, high=highest pixel probablity
%we will basically do the same thing manually in Q4
subplot(3,2,1);imshow(img);title('original image');
subplot(3,2,2);imhist(img);title('original image histogram')
subplot(3,2,3);imshow(img2);title('adjusted whites');
subplot(3,2,4);imhist(img2);title('adjusted whites histogram')
subplot(3,2,5);imshow(img3);title('adjusted blacks');
subplot(3,2,6);imhist(img3);title('adjusted blacks histogram');