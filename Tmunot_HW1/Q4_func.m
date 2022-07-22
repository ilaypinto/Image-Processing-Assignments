%section b for question 4- designed function
function out=Q4_func(in,vec)
L=size(in);out=zeros(L);len=size(vec,2);
for i=0:len-1
    out(in==i)=vec(i+1);
end
out=uint8(out);
end
