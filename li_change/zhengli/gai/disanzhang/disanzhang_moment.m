%%%做第三章的力矩范围图
clear all;clc;
figure(1);
f2=82;
theta3=[90:1:180];
theta1=90;
f2y=f2.*cos((theta3-theta1)/180*pi);
k=12;
x=3.5;
eta=0.8;
mu_g=0.07;
mu_s=0.37;
D=22*0.001;
p=pi*D*tan(10/180*pi)*10;
min=mu_g.*(k*x+f2y./sqrt(2))*p/pi/eta;
max=(mu_g+mu_s).*(k*x+f2y./sqrt(2))*p/pi/eta;
plot(theta3,min,'*',theta3,max,'--')
legend('最小值','最大值')
xlabel('\alpha3/角度')
ylabel('电机转矩/N/m')
figure(2);
title('_')
k=12;
x=7;
min2=mu_g.*(k*x+f2y./sqrt(2))*p/pi/eta;
max2=(mu_g+mu_s).*(k*x+f2y./sqrt(2))*p/pi/eta;
plot(theta3,min2,'*',theta3,max2,'--')
xlabel('\alpha3/角度')
ylabel('T/N/m')
legend('最小值','最大值')
fill([theta3 flip(theta3)],[min flip(max)],'y')
hold on
fill([theta3 flip(theta3)],[min2 flip(max2)],'k')
hold off
xlabel('\alpha3/角度')
ylabel('T/N/m')
legend('x=3.5mm','x=7mm')
alpha(.2)