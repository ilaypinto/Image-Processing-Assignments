%% HW 4 Image Processing
%3.1
img = im2gray(imread('one_piece.png'));
[rows,cols] = size(img); imshow(img,[]);
figure;
[counts,binLocations] = imhist(img);
P = counts/(rows*cols); bar(binLocations,P);
xlabel('Gray Levels');ylabel("Probability");
xlim([0,256]); title("Image Hist");
grid on;
%3.2
img=double(img); MSE= zeros(8,1);
figure;
for i= 1:8
    L=2^i; k=min(img(:));
    j=max(img(:));t=k:j-1;
    uq=floor((t-k)*L/(j-k));
    r=floor((j-k)*uq/(max(uq)-min(uq)))+k;
    subplot(2,4,i);
    stairs(t,r); xlabel('t');ylabel('r');
    xlim([k j]); title(['Quantization- ' num2str(L) 'Levels']);
    grid on; MSE(i)=immse(r,t);
end
figure;
plot(1:8,MSE); title('MSE/bits');
xlabel('Bits per pixel');ylabel('MSE');
%3.3
MSE= zeros(8,1);
figure;
for i=1:8
    L=2^i; k=min(img(:));
    j=max(img(:));r=sort(j*rand(1,L));
    r_prev=zeros(1,L); t=zeros(1,L-1);
    g=unique(img(:));
    while r~=r_prev
        r_prev = r;
        for p=1:L-1
            t(p)=(r(p)+r(p+1))/2;
        end
        tnew=[k,t,j];
        for h=1:L
            indices_in_range=find(g>=tnew(j)& g<tnew(h+1));
            r(h)= sum(g(indices_in_range).*P(indices_in_range)/sum(...
                P(indices_in_range)));
            if isempty(indices_in_range)
                r(h) = r(h-1);
            end
        end
    end
    g_new=g;t=round([k t j]);
    r=round([r max(r)]);
    for y=1:L
        indices_in_range=find(g>=t(y)&g(t(y+1)));
        if ~isempty(indices_in_range)
            g_new(indices_in_range)=r(y);
        end
    end
    subplot(2,4,i); stairs(t,r);
    xlabel('t');tlabel('r');
    xlim([k j]); title(['Lloyd to' num2str(L) 'Levels']);
    grid on; MSE(i)=immse(g,gnew);

end
figure;
plot(1:8, MSE); title('MSE/Bits');
xlabel('Bits per pixel');ylabel('MSE');