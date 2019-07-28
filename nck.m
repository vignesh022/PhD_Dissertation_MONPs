function [z,x,o,y] = nck(a,b,temp)
z=zeros(length(temp),1);
y=zeros(length(temp),size(temp,2));
x=zeros(length(temp),1);
o=zeros(length(temp),1);
%z=[];
%x=[];
%y=[];
n=1;
for j=1:size(temp,1)
    m = size(temp,2);
[z(n,1),x(n,1),o(n,1)] = fit(a, b, temp(j,:));
y(n,1:m) = temp(j,1:m);
n=n+1;
end
%fprintf('\n final n value is  %d \n',n-1);
end
