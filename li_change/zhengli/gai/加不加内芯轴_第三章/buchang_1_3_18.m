
clear all;clc
%% ÁÐ²ÎÊý

%% another alpha
alpha_another=32.5/180*pi;
alpha_stack=30/180*pi;
f_stack=99/1.3;
ei=1;
beta_stack=0.1/180*pi;

f1=f_stack(1);f1_ei=f1/ei;
alpha=alpha_stack(1);
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
k3=sqrt(f5);
k4=sqrt(f6);
eps=0.000001;

s_theta=@(theta) 1./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));

    xa1=quad(x_theta,0,beta);
    ya1=quad(y_theta,0,beta);
    s_final1=quad(s_theta,0,beta);
m_ju=f1*rao_displace(i_b,3)+f2*rao_displace(i_b,2);
x_start=-2*ya1;
y_start=2*xa1;

yijiedao=-m_ju/ei;
beta_2=alpha/2;
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
k5=sqrt(fn1);
k6=sqrt(fn2);    
s_theta=@(theta) 1./(eps+sqrt(2*(k5^2*(cos(theta)-cos(beta_2))+k6^2*(sin(theta)-sin(beta_2))))+yijiedao^2/2);
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k5^2*(cos(theta)-cos(beta_2))+k6^2*(sin(theta)-sin(beta_2))))+yijiedao^2/2);
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k5^2*(cos(theta)-cos(beta_2))+k6^2*(sin(theta)-sin(beta_2))))+yijiedao^2/2);
    xa2=quad(x_theta,0,beta_2);
    ya2=quad(y_theta,0,beta_2);
    s_final2=quad(s_theta,0,beta);
    xpp1=xa2.*cos(pi/2-beta_2)-ya2.*sin(pi/2-beta_2);
    ypp1=xa2.*sin(pi/2-beta_2)+ya2.*cos(pi/2-beta_2);
    xp=x_start+xpp1;
    yp=y_start+ypp1; 
    k=tan(pi-alpha/2); 
       x_zhong=(k*xp-yp)/(k+1/k);
   y_zhong=x_zhong*(-1/k);
   s_1=s_final1*4+s_final2;
   zhongduan_1=sqrt(xp^2+yp^2-x_zhong^2-y_zhong^2);
   banjing_1=-yp/k+xp
   
   
   alpha_another-alpha_stack