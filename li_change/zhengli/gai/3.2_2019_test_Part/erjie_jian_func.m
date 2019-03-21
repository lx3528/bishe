function s_final=erjie_jian_func( point2 )
ei=canshu_func(point2);
alpha1=10.67;
alpha2=47.24;
alpha_alpha=alpha1-alpha2+90;
alpha_alpha=0
alpha_stack=(alpha_alpha)/180*pi;
f1=0.68*9.8*2.5;
beta=0.1;
f1_ei=f1/ei;
f2=f1_ei*sin(alpha_stack)/(1+cos(alpha_stack));

k3=sqrt(f1_ei);
k4=sqrt(f2);
eps=0.000001;
s_theta=@(theta) 1./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
s_final=quad(s_theta,0,beta);
end


