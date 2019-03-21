clear all
alpha=asin(0.8)%%%%l=1.66 zuoyou
%alpha=[0:0.1:pi]
ei=1;f1=11;
f2=f1*sin(alpha)/(1+cos(alpha))
f3=f1*cos(alpha/2)+f2*sin(alpha/2)
f4=f1*sin(alpha/2)-f2*cos(alpha/2)
%plot(alpha,f3,'-',alpha,f4,'x')
global k3
global k4
k3=sqrt(f3/ei);
k4=sqrt(f4/ei);

% %
beta=1.1;
options=odeset('events',@events_weifen);
[s,theta,TE,YE,IE]=ode45(@mupli,[0 11],[beta  0 ],options)%%%%theta=0 s=1.58
%%te是value的截止数值，已知给出y=0,则得到s=0.48
%%
%%ye是截止时刻的y，0和-3.66
%%ie是0就是结果正常
plot(s,theta(:,1))
s_final=TE
% num=size(s,1)
% for j=1:num
%     if theta(j,1)<0
%         mark=j;
%         break;
%     end
% end
% l1=theta(mark-1,1)
% l2=0-theta(mark,1)
% s_final=l2/(l1+l2)*s(mark-1)+l1/(l1+l2)*s(mark)