%%得到角度不对，必须经过坐标转换，然后才是对的。
clear all;clc
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f3=f1_ei*cos(alpha/2)+f2*sin(alpha/2);
f4=f1_ei*sin(alpha/2)-f2*cos(alpha/2);
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
f11=f9*cos(alpha/2)+f10*sin(alpha/2);
f12=-f9*sin(alpha/2)+f10*cos(alpha/2);
%% find huchang
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[2,5,8,11];
%% two displacement
%0 point
num=size(inp,2);rao_displace=zeros(num,6);disp=1;
for i=1:num
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
end
for j=1:size(inp,2)
    beta_beta=beta_long(inp(j))-alpha/2;
    fin_2=[0:0.005:beta_beta]';
    point2=size(fin_2,1);
    force_disp2=zeros(point2,2);
    force_new2=zeros(point2,2);
    r2_displace=zeros(point2,3);r2_new=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_long(inp(j))-alpha/2-fin_2)+f6*sin(beta_long(inp(j))-alpha/2-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_long(inp(j))-alpha/2-fin_2)+f6*cos(beta_long(inp(j))-alpha/2-fin_2);%%f8
    force_new2(:,1)=f5*cos(fin_2)+f6*sin(fin_2);%%f7
    force_new2(:,2)=-f5*sin(fin_2)+f6*cos(fin_2);%%f8
    for i=1:point2%%%%can 部分
    [r2_new(i,1),r2_new(i,2),r2_new(i,3)]=erjie_weifenfangcheng_func(force_new2(i,1),force_new2(i,2),fin_2(i),zui_length,disp)
    [r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_weifenfangcheng_func(force_disp2(i,1),force_disp2(i,2),fin_2(i),zui_length,disp)
    end
%% 不明白为什么图像不对
%     x_r2=r2_new(:,2).*cos(pi/2-fin_2)+r2_new(:,3).*sin(pi/2-fin_2);
%     y_r2=-r2_new(:,2).*sin(pi/2-fin_2)+r2_new(:,3).*cos(pi/2-fin_2);
%     plot(x_r2,y_r2)
   theta_zhuan2=(pi/2-(beta_long(inp(j))-alpha/2)+fin_2);
   x_r2=r2_new(:,2).*cos(theta_zhuan2)+r2_new(:,3).*sin(theta_zhuan2);
    y_r2=-r2_new(:,2).*sin(theta_zhuan2)+r2_new(:,3).*cos(theta_zhuan2);
    plot(x_r2,y_r2)
    hold on
 
    x_zhuan2=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2);
    y_zhuan2=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2);
    plot(x_zhuan2,y_zhuan2,'-*')
    %%%%3 fin_3


end
