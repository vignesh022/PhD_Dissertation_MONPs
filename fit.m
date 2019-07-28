function [aicc,slope,rate] = fit(a,b,s)
n=1;
t = size(s,1);
l = size(s,2);
y=zeros(t,l);
q = size(a,1);

for i=1:t
for k=1:l    
for j=1:q
    if(s(i,k) == a(j,3))
    n=n+1;
    end
end
end
end
temp = zeros(n-1,4);
m=1;
for i=1:t
for k=1:l    
for j=1:q
    if(s(i,k) == a(j,3))
    %fprintf('inner loop %f\n',s(i,k))
    temp(m,:) = [a(j,:) b(j)];
    m=m+1;
    end
end
y(i,k) = s(i,k);
end
[aicc,slope,rate] = nlincoeff([temp(:,1) temp(:,2)],temp(:,4));
%fprintf('outer loop\n')
end

end

