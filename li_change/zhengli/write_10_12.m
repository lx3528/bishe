%%%% alpha f1 ei beta_long--inp  
clear all;clc
f=[0.6];
pps=1;
alpha=pi/2;ei=1;f1=f(pps);f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;

t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[13];

%% displace of b
numr=size(inp,2);rao_displace=zeros(numr,6);disp=1;
i=1;
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )

%% first segment
j=1;
 fin_2=[0:0.005:beta_long(inp(j))-alpha/2]';
 point2=size(fin_2,1);
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
%%%1 force
    force_disp2(:,1)=f5*cos(beta_long(inp(j))-alpha/2-fin_2)+f6*sin(beta_long(inp(j))-alpha/2-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_long(inp(j))-alpha/2-fin_2)+f6*cos(beta_long(inp(j))-alpha/2-fin_2);%%f8
 %%%2 displacement
    for i=1:point2%%%%can ²¿·Ö
    [r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_weifenfangcheng_func(force_disp2(i,1),force_disp2(i,2),fin_2(i),zui_length,disp)
    end
 %%%3 transform
     theta_zhuan2=(pi/2-(beta_long(inp(j))-alpha/2)+fin_2);
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    %%%
    x_zhuan2_zhong=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2);
    y_zhuan2_zhong=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2);
    %%%
    x_zhuan2=x_zhuan2_zhong-ya;
    y_zhuan2=y_zhuan2_zhong+xa;
    x_zhuan3=-x_zhuan2_zhong-ya;
    y_zhuan3=-y_zhuan2_zhong+xa;
    plot(x_zhuan2,y_zhuan2)
    hold on;
    plot(x_zhuan3,y_zhuan3)
    hold on;

