clear all;clc
ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=0;
f5=f1_ei;f6=-f2;
alpha=0;
%% find huchang
t=0.1;index=50;zui_length=20;beta_long=linspace(0+0.00001,pi/2,index)';
inp=[20,10,15];
%% displacement
num=size(inp,2);rao_displace=zeros(num,3);disp=1;
for i=1:num
    [rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f1,0,beta_long(inp(i)),zui_length,disp)
end
fin_1=[0:0.005:beta_long(inp(1))+0.5]';point1=size(fin_1,1);%%   34.6639
force_disp1=zeros(point1,2);
r1_displace=zeros(point1,3);
force_disp1(:,1)=f5*cos(beta_long(inp(1))-alpha/2-fin_1)+f6*sin(beta_long(inp(1))-alpha/2-fin_1);%%f7
force_disp1(:,2)=-f5*sin(beta_long(inp(1))-alpha/2-fin_1)+f6*cos(beta_long(inp(1))-alpha/2-fin_1);%%f8
for i=1:point1%%%%整块的部分
[r1_displace(i,1),r1_displace(i,2),r1_displace(i,3)]=erjie_weifenfangcheng_func(force_disp1(i,1),force_disp1(i,2),fin_1(i),zui_length,disp)
end
%% transform
theta_zhuan1=(pi/2-beta_long(inp(1))+fin_1);
xa=rao_displace(1,2);
ya=rao_displace(1,3);
%plot(r1_displace(:,2),r1_displace(:,3))
x_zhuan1=r1_displace(:,2).*cos(theta_zhuan1)+r1_displace(:,3).*sin(theta_zhuan1)-ya;
y_zhuan1=r1_displace(:,3).*cos(theta_zhuan1)-r1_displace(:,2).*sin(theta_zhuan1)+xa;
plot(x_zhuan1,y_zhuan1)
% %%%找对称轴，对称创建点
hold on;
plot(r1_displace(:,2),r1_displace(:,3))