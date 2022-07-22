function [entropy_img,std_img,entropy_encoded,std_encoded,...
    RMS]=HW5(img)
    figure;
    subplot(3,2,1), imshow(img);
    img=double(img);
    % Before actions
    entropy_img = entropy(img); std_img = std(img(:),1);
    subplot(3,2,2), imhist(uint8(img)), title(['Entropy = ' num2str(entropy_img),...
        'std = ' num2str(std_img)]);
    % Encoded
    a = 1; encoded_image = Encoder(img, a);
    entropy_encoded = entropy(encoded_image); std_encoded = std(encoded_image(:),1);
    subplot(3,2,3), imshow(uint8(encoded_image));
    subplot(3,2,4), imhist(uint8(encoded_image)), title([' Entropy = '...
    num2str(entropy_encoded), ' std = ' num2str(std_encoded)]);
    % Decoded
    decoded_image = Decoder(encoded_image,a);
    [s,t] = size(image);
    RMS = sum(sum((img-decoded_image).^2)); RMS = sqrt((1/(s*t)*RMS));
    entropy_decoded = entropy(decoded_image); std_decoded = std(decoded_image(:),1);
    subplot(3,2,5), imshow(uint8(decoded_image));
    subplot(3,2,6), imhist(uint8(decoded_image)), title(['Entropy = '...
    num2str(entropy_decoded),' std = ' num2str(std_decoded), ' ,RMS = '...
    num2str(RMS)]);
end