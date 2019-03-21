t=[0;20]
[t,y]=ode45('fun1',[0,20],[2;3]);
plot(t,y(:,1),'-',t,y(:,2),'--')
title('solution of ode equation');
xlabel('time t');
ylabel('solution y');
legend('y1','y2')