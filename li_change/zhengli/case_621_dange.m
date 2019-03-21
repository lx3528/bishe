%%%单个变形
clear all;clc
f1=1;alpha=pi/2;ei=1;
beta_long=alpha/2+0.1;

f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
zui_length=20;
rao_displace=zeros(1,3);disp=1;
[rao_displace(1,1),rao_displace(1,2),rao_displace(1,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long-alpha/2,zui_length,disp )

fin_2=[0:0.005:beta_long-alpha/2]';
    point2=size(fin_2,1);
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_long-alpha/2-fin_2)+f6*sin(beta_long-alpha/2-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_long-alpha/2-fin_2)+f6*cos(beta_long-alpha/2-fin_2);%%f8
    for i=1:point2%%%%can 部分
    global k3
    global k4
    k3=sqrt(force_disp2(i,1));
    k4=sqrt(force_disp2(i,2));
    eps=0.000001
    hx_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(fin_2(i)))+k4^2*(sin(theta)-sin(fin_2(i))))));
    hy_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(fin_2(i)))+k4^2*(sin(theta)-sin(fin_2(i))))));
    r2_displace(i,2)=quad(hx_theta,0,fin_2(i))
    r2_displace(i,3)=quad(hy_theta,0,fin_2(i))
    end
        theta_zhuan2=(pi/2-(beta_long-alpha/2)+fin_2);
    xaa=rao_displace(1,2);
    yaa=rao_displace(1,3);
    %%%
    global xaa
    global yaa
    x_zhuan2_zhong=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2)-yaa;
    y_zhuan2_zhong=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2)+xaa;
        plot(x_zhuan2_zhong,y_zhuan2_zhong)
    hold on;