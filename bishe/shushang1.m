
global f
f=0.61
t=[0;20]
[t,y]=ode45('fun2',[0,20],[0;1]);
plot(t,y(:,1),'-',t,y(:,2),'--')
title('solution of ode equation');
xlabel('time t');
ylabel('solution y');
legend('y1','y2')
pp=f
clear global