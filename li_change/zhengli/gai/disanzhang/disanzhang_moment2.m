%%%做第三章的力矩范围图
clear all;clc;
figure(1);
f2=82;
theta3=[90:1:180];
theta1=90;
f2y=f2.*cos((theta3-theta1)/180*pi);
k=1.41*10^5;
D=22*0.001;
kt=k*D*pi*tan(10/180*pi);
% vnn=0.01;
% wn=vnn./(0.5*(1-f2y./kt).*D*tan(10/180*pi));
vn=0.5*(1-f2y./kt).*D*10*tan(10/180*pi)
plot(theta3,vn)

xlabel('\alpha3/角度')
ylabel('vn/m/s')

figure(2);
%0.5*(1-f2y./kt).*D*tan(10/180*pi).*f2y
wu=0.5*(1-f2y./kt).*D*tan(10/180*pi).*f2y;
plot(theta3,wu./(wu+0.036))
xlabel('\alpha3/角度')
ylabel('\eta/机构效率')