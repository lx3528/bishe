clear
%y(0)=5,y'(0)=6.
%一个例子，帮助你理解
%y''+y'+y=sin(t)
% [t,y]=ode45(@l1,[0 20],[5 6])
% plot(t,y)
%%单自由度
[s,theta]=ode45(@l2,[0 10],[ asin(0.8)  0])
plot(s,theta(:,1))

% % 
% [s,y]=ode45(@l3,[0 10],[0 0.8]);
% plot(s,y(:,1))
% [s,x]=ode45(@l4,[0 10],[0 0.6 0])
% plot(s,x(:,1))

% [s,theta]=ode45(@l5,[0 10],[pi/2-pi/12 0])%%%%那个方法
% plot(s,theta(:,1))
% [s,y]=ode45(@l6,[0 10],[0 0.8 0])
% plot(s,y(:,1))
