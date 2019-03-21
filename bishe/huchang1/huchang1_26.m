
clear
k=1
alpha=asin(0.8);
global p
p=sin(alpha/2)
[K,E]=ellipke(p)
l=K/k
xa=2*E/k-l
ya=2*p/k
ss=solve('ya+yp=(tan(pi-alpha))*(xa+xp),(xp-xa)*tan(alpha)=yp-ya','xp,yp');
ss.yp
ss.xp
yp=eval(ss.yp)
xp=eval(ss.xp)
plot(xa,ya,'ro',xp,yp,'ro',0,0,'ro')
xju=[xp,0,xa];
yju=[yp,0,ya];
yy=[yp:0.01:ya];
xx=spline(yju,xju,yy); 
plot(xa,ya,'ro',xp,yp,'ro',0,0,'ro',xx,yy,'b','LineWidth',2);
title(['k= ',num2str(k),'   ','alpha=',num2str(alpha*180/pi),'度'],'Fontsize',15)

xlabel('x位移坐标/m')
ylabel('y挠度位移/m ')
r_wanguan=xa-xp;