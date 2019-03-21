ei=1;f1=1;%%%%1.0011   f2=0.4115
m1=0.0029;
%yijiedao=-m1/ei;%%0.8373  x 0.7832 y0.4255
yijiedao=-m1/ei;%%1.0650  x 0.8979 y 0.5163
%beta=pi/4;
%% %%%620,可以正确结果的
% beta=0.7822;
% f1_jue=1.0011 
% f2_jue=0.4115%%%%变量为空的原因，横向力太大。
%%%
beta=0.7822
f1_jue=1
f2_jue=0.43
global k3
global k4
k3=sqrt(f1_jue);
k4=sqrt(f2_jue);
zui_length=10;
options=odeset('events',@events_weifen);
[s,theta,TE,YE,IE]=ode45(@mupli,[0 zui_length],[beta  yijiedao ],options)%%%%theta=0 s=1.58
%[s,theta]=ode45(@mupli,[0 zui_length],[beta  0 ])
plot(s,theta(:,1))
s_final=TE
if isempty(s_final)==1
    [B,IX] = sort(theta(:,1),'ascend')
    s_final=s(IX(1))
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
% end