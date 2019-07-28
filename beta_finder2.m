%% load Dose (X) and Post_exposure time (T) and Response (Y) matrix

%A = Input matrix containing Dose and T data
%B = Response matrix with Y data

function [aicc, beta] = beta_finder2(A,B)

model = @(b,x) (b(1)*(b(3) - ((b(3)-1)*exp(-b(2)*x(:,1)))) - b(4)*x(:,2));
beta0 = [1 0.00000000001 10 1];
         
mdl = fitnlm(A,B,model,beta0);
aicc = mdl.ModelCriterion.AIC;
beta = [mdl.Coefficients{1,1} mdl.Coefficients{2,1} mdl.Coefficients{3,1} mdl.Coefficients{4,1}];
end