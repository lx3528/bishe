alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f1_jue=f1;
f2_jue=f2;
beta=alpha;
global k3
global k4
k3=sqrt(f1_jue)
k4=sqrt(f2_jue)
zui_length=20
yijie=sqrt(2*(k3^2*(1-cos(beta))+k4^2*(-sin(beta))))+0.000000001;
options=odeset('events',@events_weifen);
%[s,theta]=ode45(@mupli,[0 zui_length],[beta  yijie ])
[s,theta,TE,YE,IE]=ode45(@mupli,[0 zui_length],[beta  yijie ],options)
%%te是value的截止数值，已知给出y=0,则得到s=0.48
%% you know
%%ye是截止时刻的y，0和-3.66
%%ie是0就是结果正常
%plot(s,theta(:,1))
x_length=0;
y_length=0;
eps=0.000001;
if disp
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_length=quad(x_theta,0,beta)
    y_length=quad(y_theta,0,beta)
end
