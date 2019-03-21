clear all
alpha=asin(0.8)
ei=1
f1=1
t=0.1
index=50
zui_length=20
beta_long=linspace(0.1,pi/2,index)';%%%1---20
s_final_stack=zeros(index,1);
% x_length=zeros(index,1);
% y_length=zeros(index,1);
for  i=1:index
    [ s_final_stack(i) ] = erjie_weifenfangcheng_func( alpha,f1,ei,beta_long(i),zui_length )

end
plot(s_final_stack,beta_long)
% x_theta=@(theta) cos(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
% y_theta=@(theta) sin(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
% x_length=quad(x_theta,0,beta)
% y_length=quad(y_theta,0,beta)