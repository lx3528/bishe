%fuhezhou
clear all;clc

point2=0.0001;
options = struct('GradObj','on','Display','iter','LargeScale','off','HessUpdate','bfgs','InitialHessType','identity','GoalsExactAchieve',1,'GradConstr',false);
% alpha1=10.67
% alpha2=47.24
% alpha_alpha=alpha1-alpha2+90;
% alpha_stack=(alpha_alpha)/180*pi;
% f_stack=0.68*9.8*2.5;
% beta_stack=0.1
%a=fun_func( point2,alpha_stack,f_stack,beta_stack )
options = optimset('GradObj', 'off', 'MaxIter', 20);
x = fminunc(@fun_func,point2,options);
x

