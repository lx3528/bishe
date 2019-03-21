
%% 小微段等效下
%{
theta0=pi/4;
ei=1;m=1;
len=2;
x=0:0.1:len;
w=1/2*m/ei*(x.^2-x*len);
plot(x,w)
%}
%% 端部想法 m
%{
clc;clear all;
ei=1;
m=10;f1=1;
moduan=pi/2;zui_length=20;
fin=[0:0.01:moduan];%%%0---pi/2
fin_r=moduan-fin;
fin_pi=fin-moduan;%%%%-pi/2---0
num2=size(fin_pi,2);
x=ei/m*(sin(fin));
y=ei/m*(1-cos(fin));
xa=-ei/m*(sin(fin_pi)-sin(fin_pi(1)));
ya=ei/m*(cos(fin_pi)-cos(fin_pi(1)));
xb=-ei/m*(sin(fin_r)-sin(fin_r(1)));
yb=ei/m*(cos(fin_r)-cos(fin_r(1)));
plot(x,y,'-',-xa,-ya,'x',xb,yb,'*')
%}

%% want 在力坐标下，求出和力矩对应的位置

clc;clear all;
ei=1;
m=10;fp=sqrt(2);
fp=1;
moduan=pi/2;
beta=[0:0.01:moduan]';
f13=fp*cos(moduan-beta);
f14=fp*sin(moduan-beta);
f16=-f14;
num=size(beta,1);zui_length=20;
zhili_displace=zeros(num,3);disp=1;
m1=0.3637;
m1=0;
yijiedao=-m1/ei;

for i=1:num
    [zhili_displace(i,1),zhili_displace(i,2),zhili_displace(i,3)] =zhili_weifenfangcheng_func( f13(i),f16(i),beta(i),yijiedao,zui_length,disp)
end

xpp=zhili_displace(:,2).*cos(moduan-beta)-zhili_displace(:,3).*sin(moduan-beta);
ypp=zhili_displace(:,2).*sin(moduan-beta)+zhili_displace(:,3).*cos(moduan-beta);
%plot(zhili_displace(:,2),zhili_displace(:,3))
hold on;
plot(xpp,ypp)
%}