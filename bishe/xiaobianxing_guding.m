%%%看看转角，能不能变化。---对于1。25
k=pi*2
l=1
theta=pi/3
%syms k l theta
pp=[0 1 0 1;sin(k*l) cos(k*l) l 1;k 0 1 0;k*cos(k*l) -k*sin(k*l) 1 0]
tar=[0;0;tan(theta);tan(pi-theta)]
pa=pp^-1*tar
x=[0:0.02:l];
y=pa(1)*sin(k*x)+pa(2)*cos(k*x)+pa(3)*x+pa(4);
plot(x,y)
xlabel('x')
ylabel('y')
title('挠度位移曲线')

syms k2
dsolve('1/k2*D2y=-y*((1+(Dy)^2)^1.5)','x') 

