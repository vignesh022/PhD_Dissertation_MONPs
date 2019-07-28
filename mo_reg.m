clc
clear all
warning off
A = xlsread('ldh_new.xlsx','LDH');
%load('Comprehensive.mat');
dose_time = [A(:,4) A(:,3) A(:,1)];
response = A(:,5);
a = [dose_time(:,1) dose_time(:,2) dose_time(:,3)];
b = response;
c=dose_time(:,3);
clc
%% 
k = unique(c);
s = length(k);
q = zeros(s,2);

x = length(k);
temp5 = [];
for i=1:x
temp3 = [];
temp4 = [];
z=1;

for j=1:length(b)

if(a(j,3) == k(i));    
temp3(z,:) = [a(j,:)];
temp4(z,:) = b(j);
z=z+1;
end
end
[m, b0] = beta_finder2(temp3(:,1:2),temp4);
temp5(i,:) = [m b0 k(i)];
end

%xlswrite('CNT_reg.xlsx',temp5,'TC','A1');