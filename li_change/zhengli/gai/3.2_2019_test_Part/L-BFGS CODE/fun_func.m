function [length_stack] = fun_func( point2)
%% alpha_change
alpha1=10.67;
alpha2=47.24;
alpha_alpha=alpha1-alpha2+90;
alpha_stack=(alpha_alpha)/180*pi;
f_stack=0.68*9.8*2.5;
beta_stack=0.1;
ei=canshu_func(point2);

out_retu_sum=case1016_func(ei,alpha_stack,f_stack,beta_stack);
length_stack=-out_retu_sum(1);
%plot(1:number,length_stack(1,:),'*',1:number,length_stack(2,:),'--',1:number,length_stack(3,:),1:number,length_stack(4,:))
end