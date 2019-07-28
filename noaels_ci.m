clc
clear all
warning off
A = xlsread('tcc_new_updated.xlsx','Level3_1');
%load('Comprehensive.mat');
dose_time = [A(:,5) A(:,4) A(:,1) A(:,2)];
response = A(:,6);
%% 
a = [dose_time(:,1)];
b = response;
%%
[mdl,r,J,cov,mse] = noaels(a,b);
ci1 = nlparci(mdl,r,'Jacobian',J);
ci2 = nlparci(mdl,r,'covar',cov);
ci1 = ci1';
ci2 = ci2';
