clear
alpha=asin(0.8);%%%%l=1.66 zuoyou
%alpha=[0:0.1:pi]%1
ei=1;
f1=1;
f2=f1*sin(alpha)/(1+cos(alpha));
f3=f1*cos(alpha/2)+f2*sin(alpha/2);
f4=f1*sin(alpha/2)-f2*cos(alpha/2);
%plot(alpha,f3,'-',alpha,f4,'x')%1


beta=0.49;

k3=sqrt(f3/ei);
k4=sqrt(f4/ei);
length_theta=@(theta) 1./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));%%%和自变量有关的，不加点陈，很可能写成向量
length=quadl(length_theta,0,beta)%%1.5696

x_theta=@(theta) cos(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
y_theta=@(theta) sin(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
x_length=quad(x_theta,0,beta)
y_length=quad(y_theta,0,beta)



