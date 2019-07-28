function [x,fval,exitflag,output,population,score] = stall_check(nvars,MaxStallGenerations_Data)

%% Start with the default options
options = optimoptions('ga');
%% Modify options setting
options = optimoptions(options,'PopulationType', 'bitstring');
options = optimoptions(options,'MaxStallGenerations', MaxStallGenerations_Data);
options = optimoptions(options,'MutationFcn', {  @mutationuniform [] });
options = optimoptions(options,'Display', 'off');
options = optimoptions(options,'PlotFcn', {  @gaplotbestf @gaplotbestindiv @gaplotstopping });
[x,fval,exitflag,output,population,score] = ...
ga(@BitStringFitnessFcn,nvars,[],[],[],[],[],[],[],[],options);
