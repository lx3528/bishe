
alpha=asin(0.8);
ei=1;
f1=1;
t=0.1;
index=50;
zui_length=20;
i=12
beta_long=linspace(asin(0.8)/2+0.001,pi/2,index)';
beta=beta_long(i)
disp=0
k3=1
k4=0
if disp
    x_theta=@(theta) cos(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
    y_theta=@(theta) sin(theta)./sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))));
    x_length=quad(x_theta,0,beta)
    y_length=quad(y_theta,0,beta)
end





