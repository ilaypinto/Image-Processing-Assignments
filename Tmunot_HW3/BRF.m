function filter=BRF(D0,w)
filter=zeros(256);
for u=0:255
    for v=0:255
        D=sqrt((u-129)^2+(v-129)^2);
        filter(u+1,v+1)=1-exp(-0.5*((D^2-D0^2)/(D*w))^2);
    end
end
end