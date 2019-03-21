clear all;clc
ei=1;f1=1;f1_ei=f1/ei;disp=1;
alpha=pi/2;
alpha=alpha-0.5*alpha;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f3=f1;f4=f2;
%% find huchang
t=0.1;index=50;zui_length=20;
%% two displacement
f2=0.5;

rao_displace=zeros(1,3);disp=1;
%[rao_displace(1,1),rao_displace(1,2),rao_displace(1,3)] =erjie_weifenfangcheng_func( f1,f2,alpha/2,zui_length,disp )
beta=alpha/11;
f1_jue=f1;
f2_jue=-f2;

global k3
global k4
k3=sqrt(f1_jue);
k4=sqrt(f2_jue);
zui_length=20
%options=odeset('events',@events_weifen);
%[s,theta,TE,YE,IE]=ode45(@mupli,[0 zui_length],[beta  0 ],options)%%%%theta=0 s=1.58
[s,theta]=ode45(@mupli,[0 zui_length],[beta  0 ])%%%%theta=0 s=1.5
plot(s,theta(:,1))
%%te是value的截止数值，已知给出y=0,则得到s=0.48
%% you know
%%ye是截止时刻的y，0和-3.66
%%ie是0就是结果正常
%plot(s,theta(:,1))

x_length=0;
y_length=0;
eps=0.000001
if disp
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_length=quad(x_theta,0,beta)
    y_length=quad(y_theta,0,beta)
end




%{
%% cong 0-alpha/2 du
fin=[0:0.005:alpha/2]';
point=size(fin,1);
force_disp=zeros(point,2);
r_displace=zeros(point,3);
force_disp(:,1)=f3*cos(fin)+f4*sin(fin);%%f7
force_disp(:,2)=-f3*sin(fin)+f4*cos(fin);%%f8
for i=1:point%%%%can 部分
[r_displace(i,1),r_displace(i,2),r_displace(i,3)]=erjie_weifenfangcheng_func(force_disp(i,1),force_disp(i,2),fin(i),zui_length,disp)
end
%plot(r_displace(:,2),r_displace(:,3))
%%%变换坐标系
theta_zhuan=(pi/2-fin);
%%%
x_zhuan=r_displace(:,2).*cos(theta_zhuan)+r_displace(:,3).*sin(theta_zhuan);
y_zhuan=r_displace(:,3).*cos(theta_zhuan)-r_displace(:,2).*sin(theta_zhuan);

plot(x_zhuan,y_zhuan)
hold on;
plot(x_zhuan3,y_zhuan3)

% hold on;
%x_zhuan1=r1_displace(:,2).*cos(theta_zhuan1)+r1_displace(:,3).*sin(theta_zhuan1)-ya;
%y_zhuan1=r1_displace(:,3).*cos(theta_zhuan1)-r1_displace(:,2).*sin(theta_zhuan1)+xa;
% plot(x_zhuan1,y_zhuan1)
%% wan qu
%1
%r_wan_disp=zeros(1,3);
%[r_wan_disp(1),r_wan_disp(2),r_wan_disp(3)]=erjie_weifenfangcheng_func_wan(f1,f2,alpha,zui_length,disp)


%}

% %%%找对称轴，对称创建点
