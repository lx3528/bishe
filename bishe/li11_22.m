% theta=[0:0.01:pi/2];
% y=theta-2*sin(theta/2);
% plot(theta,y)
% 
% u=[0:0.01:pi];
% eta=(tan(u)-u)./u.^3;
% plot(u,eta)

theta2=[pi/2:0.01:pi*17/18];
y2=sin(theta2)./(1+cos(theta2))
y3=2.^theta2
plot(theta2,y2,'-',theta2,y3,'*')