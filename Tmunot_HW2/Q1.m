%Q1
%A
clear all;clc;
k=imread('Khaleesi.jpg');k=rgb2gray(k);
j=imread('JohnSnow.jpg');j=rgb2gray(j);
figure(1);
subplot(1,2,1);imshow(k,[]);title ('Khaleesi');
subplot(1,2,2);imshow(j,[]);title('John snow');
%B
fft_j=fft2(j);shift_j=fftshift(fft_j);
fft_k=fft2(k);shift_k=fftshift(fft_k);
amp_j=abs(shift_j);amp_k=abs(shift_k);
ang_j=angle(shift_j);
ang_k=angle(shift_k);
figure(2);
subplot(1,2,1);imshow(log10(amp_j+1),[]);title('John"s fft magnitude');
subplot(1,2,2);imshow(log10(amp_k+1),[]);title('Khaleesi"s fft magnitude');
figure(3);
subplot(1,2,1);imshow(ang_j);title('John"s fft phase');
subplot(1,2,2);imshow(ang_k);title('Khaleesi"s fft phase');
%C
amp_j_ang_k=amp_j.*exp(1i*ang_k);
amp_k_ang_j=amp_k.*exp(1i*ang_j);
q1=real(ifft2(amp_j_ang_k));
q2=real(ifft2(amp_k_ang_j));
figure(4);
subplot(1,2,1);imshow(q1,[]);title('Khaleesi Phase  and John Snow Amplitude');
subplot(1,2,2);imshow(q2,[]);title('John Snow Phase and khaleesi Amplitude');