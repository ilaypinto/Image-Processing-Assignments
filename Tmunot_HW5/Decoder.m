function[decoded_image] = Decoder(image, a)
[s, t] = size(image); decoded_image = [image(1,:) ; zeros(s-1,t)];
for k=1:(s-1)
 decoded_image(k+1,:) = image(k+1,:)+round(a*decoded_image(k,:));
end
