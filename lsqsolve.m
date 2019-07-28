%% load Dose (X) and Post_exposure time (T) and Response (Y) matrix

%A = Input matrix containing Dose and T data
%B = Response matrix with Y data

function [mdl,aicc,slope] = lsqsolve(A, B)

%model = @(b,x) (b(1)*(b(3) - ((b(3)-1)*exp(-b(2)*x(:,1)))));
myfun = @(b,x) (b(1) - exp(-(b(2)*x(:,1)))); 
%beta0 = [1 0.000001 10];
beta0 = [1 0];

%mdl = fitnlm(A,B,model,beta0);
mdl = fitnlm(A,B,myfun,beta0);
aicc = mdl.ModelCriterion.AIC;
slope = mdl.Coefficients{2,1};
%beta = [mdl.Coefficients{1,1} mdl.Coefficients{2,1} mdl.Coefficients{3,1}];
