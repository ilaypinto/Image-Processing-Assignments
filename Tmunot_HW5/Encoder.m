function[encoded_image] = Encoder(image, a)
encoded_image=zeros(size(image));encoded_image(1,:) = image(1,:);
encoded_image(2:end,:) = image(2:end,:)-round(a*image(1:end-1,:));
end