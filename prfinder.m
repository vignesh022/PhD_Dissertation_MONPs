clear all
clc
warning off
A = xlsread('pmn_levels_new.xlsx','Level1_2');
%load('Comprehensive.mat');
dose_time = [A(:,4) A(:,3) A(:,1)];
response = A(:,5);
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
%%
n=1;
for i=1:length(q)
temp = nchoosek(k,q(i,1));
x = length(temp);
fprintf('Status Check: Loop running through %d iteration \n',i);
for j=1:x
try
    [z,x,y] = nck(a,b,temp(j,:));
catch exception
    n=n+1;
    t = sprintf('%d ',temp(j,:));
    fprintf('Bad combination %s \n',t)
    continue;
end
end
end

fprintf('\n\n Total no. of bad combos: %d \n',n-1);
