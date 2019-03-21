clc;clear;
ei=1;
m=1;f1=1;
moduan=pi/4;zui_length=20;
fin=[0.01:0.01:moduan];
fin_rr=moduan-fin;
fin_r=fliplr(fin);
fx1=f1*cos(fin_rr);fx2=f1*sin(fin_rr);
num=size(fin,2);rao_displace=zeros(num,3);disp=1;
for i=1:num
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( fx1(i),fx2(i),fin_rr(i),zui_length,disp)
end
xa=rao_displace(num,2);ya=rao_displace(num,3);
theta=fin_rr+pi;
% x_pie=x.*cos(theta)+y.*sin(theta)+xa;
% y_pie=y.*cos(theta)-x.*sin(theta)+ya;
x_pie=x.*cos(theta)-y.*sin(theta)+xa;
y_pie=y.*cos(theta)+x.*sin(theta)+ya;
plot(y_pie,x_pie)