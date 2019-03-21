function [s_final,x_length,y_length] = erjie_weifenfangcheng_func_wan( f1_jue,f2_jue,beta,zui_length,disp )
%函数下不要写东西

global k3
global k4
k3=sqrt(f1_jue)
k4=sqrt(f2_jue)
%zui_length=20
yijie=sqrt(2*(k3^2*(1-cos(beta))+k4^2*(-sin(beta))));
options=odeset('events',@events_weifen);
[s,theta,TE,YE,IE]=ode45(@mupli,[0 zui_length],[beta  yijie ],options)%%%%theta=0 s=1.58
%%te是value的截止数值，已知给出y=0,则得到s=0.48
%% you know
%%ye是截止时刻的y，0和-3.66
%%ie是0就是结果正常
%plot(s,theta(:,1))
s_final=TE
x_length=0;
y_length=0;
eps=0.000001
if disp
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_length=quad(x_theta,0,beta)
    y_length=quad(y_theta,0,beta)
end
end