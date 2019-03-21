%dsolve('Du=1+u^2','t')
%u=tan(t-c)
%dsolve('D2u+2*sin(u)-0.5*cos(u)=0','Du(0)=0','u(0)=pi/4','s')
%dsolve 解析解---not found
%ode数值解


global f
f=0.61
t=[0;20]
[t,y]=ode45('erli',[0,20],[pi/4;0]);%%ode45 怎么用
%%
plot(t,y(:,1),'-')
hold on
title('solution of ode equation');
xlabel('time t');
ylabel('solution y');
legend('y1','y2')
% p21=y(:,1);
% p22=y(:,2);
% [t,y]=ode45('fun2',[0,20],[0;1]);
% plot(t,y(:,1),'x')
% p11=y(:,1);
% p22=y(:,2);
% hold off
% pp=f



