clear all
clc
warning off
A = xlsread('ldh_new_updated.xlsx','LDH');
%load('Comprehensive.mat');
dose_time = [A(:,5) A(:,4) A(:,1)];
response = A(:,6);
%% 
a = [dose_time(:,1) dose_time(:,2) dose_time(:,3)];
b = response;
c=dose_time(:,3);
clc
k = unique(c);
s = length(k);
if(mod(s,2)==0)
q = zeros(s/2,2);
for i=1:s/2
q(i,:) = [i s-i];
end
else
q = zeros((s-1)/2,2);
for i=1:(s-1)/2
q(i,:) = [i s-i];
end
end
x = size(q,1);
min_aicc = [];
min_aicc2 = [];
temp3 = [];
temp4 = [];
temp5 = [];
final1 = [];
final2 = [];
final3 = [];
%%
for i=1:x
fprintf('Status Check: Loop running through %d iteration \n',i);
temp = nchoosek(k,q(i,1));
[z,x,o,y] = nck(a,b,temp);
temp2 = reduce2(a,b,temp);
[v,p,f,w] = nck(a,b,temp2);
temp3 = [z,y,v,w,(z+v)];
temp4 = [x,y,p,w,(z+v)];
temp5 = [o,y,f,w,(z+v)];

if (i==1)
final1 = temp3;
final2 = temp4;
final3 = temp5;
else
final1 = vertcat(final1,temp3);
final2 = vertcat(final2,temp4);
final3 = vertcat(final3,temp5);
end
end
[r, c] = size(final1);
final1 = sortrows(final1,c);
final2 = sortrows(final2,c);
final3 = sortrows(final3,c);

final1 = final1(1,:);
final2 = final2(1,:);
final3 = final3(1,:);

xlswrite('ldh_updated_splits.xlsx',final1,'Sheet1','A1');
xlswrite('ldh_updated_slope.xlsx',final2,'Sheet1','A1');
xlswrite('ldh_updated_rate.xlsx',final3,'Sheet1','A1');


