%% load Dose (X) and Post_exposure time (T) and Response (Y) matrix

%A = Input matrix containing Dose and T data
%B = Response matrix with Y data

function [mdl,r,J,cov,mse] = noaels(A, B)

model = @(b,x) (b(1)*(b(3) - ((b(3)-1)*exp(-b(2)*x(:,1)))));
beta0 = [1 0.00000000001 10];
%beta0 = [1 0.00000001 1];

[mdl,r,J,cov,mse] = nlinfit(A,B,model,beta0);
% 