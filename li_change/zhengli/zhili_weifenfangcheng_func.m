function [s_final,x_length,y_length] = zhili_weifenfangcheng_func( f1_jue,f2_jue,beta,yijiedao,zui_length,disp )
%函数下不要写东西
global k3
global k4
k3=sqrt(f1_jue);
k4=sqrt(f2_jue);

options=odeset('events',@events_weifen);
[s,theta,TE,YE,IE]=ode45(@mupli,[0 zui_length],[beta  yijiedao ],options)%%%%theta=0 s=1.58
nums=size(TE,1)

for i=1:nums
s_final=TE(i)
end
if isempty(TE)==1
    [B,IX] = sort(theta(:,1),'ascend')
    s_final=999
end
x_length=0;
y_length=0;
eps=0.000001
if disp
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    x_length=quad(x_theta,0,beta)
    y_length=quad(y_theta,0,beta)
end
end