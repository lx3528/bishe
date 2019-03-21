%%%单个变形
clear all;clc
f1=1;alpha=pi/2;ei=1;
beta_long=alpha/2+0.1;

f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
zui_length=20;
rao_displace=zeros(1,3);disp=1;
f1_jue=f5;f2_jue=f6;
global k3
global k4
beta=beta_long-alpha/2;
fin_2=[0:0.005:beta_long-alpha/2]';
p=size(fin_2,1)
k3=sqrt(f1_jue);
k4=sqrt(f2_jue);
eps=0.000001
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));

l_theta=@(theta) 1./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
x_length=zeros(p,1);y_length=zeros(p,1);l_length=zeros(p,1);
for i=1:p
    x_length(p)=quad(x_theta,0,beta)
    y_length(p)=quad(y_theta,0,beta)
    l_length(p)=quad(l_theta,0,beta)
end
plot(x_length,y_length)
   