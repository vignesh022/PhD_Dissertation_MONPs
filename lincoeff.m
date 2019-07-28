%% load Dose (X) and Post_exposure time (T) and Response (Y) matrix

%A = Input matrix containing Dose and T data
%B = Response matrix with Y data

function [mdl] = lincoeff(A, B)

mdl = fitlm(A,B,'linear');
% 