function [x,fval,exitflag,output,population,score] = GA(nvars,MaxGenerations_Data,MaxStallGenerations_Data)

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'PopulationType', 'bitstring');
options = optimoptions(options,'MaxGenerations', MaxGenerations_Data);
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'MutationFcn', {  @mutationuniform [] });
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotstopping});
[x,fval,exitflag,output,population,score] = ...
ga(@BitStringFitnessFcn,nvars,[],[],[],[],[],[],[],[],options);
