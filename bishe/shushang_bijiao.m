
global f
f=0.61
t=[0;20]
[t,y]=ode45('fun3',[0,20],[0;1]);%%ode45 ‘ı√¥”√
%%
plot(t,y(:,1),'-')
hold on
title('solution of ode equation');
xlabel('time t');
ylabel('solution y');
legend('y1','y2')
p21=y(:,1);
p22=y(:,2);
[t,y]=ode45('fun2',[0,20],[0;1]);
plot(t,y(:,1),'x')
p11=y(:,1);
p22=y(:,2);
hold off
pp=f


clear global