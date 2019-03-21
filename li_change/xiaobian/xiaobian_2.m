%% want 在力坐标下，求出和力矩对应的位置
clc;clear all;
ei=1;
m=10;
f17=1;
f18=1;
moduan=pi/2;
%beta=[pi/64:0.01:moduan]';
beta1=[pi/1024:0.01:moduan/2]';
beta2=[moduan/2:0.01:moduan]';
beta=[beta1;beta2];
index2=size(beta1,1)+1;
f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);

num=size(beta,1);zui_length=20;
zhili_displace=zeros(num,3);disp=1;
m1=0.3637;
%m1=0;
yijiedao=-m1/ei;
for i=1:num
    [zhili_displace(i,1),zhili_displace(i,2),zhili_displace(i,3)] =zhili_weifenfangcheng_func( f19(i),f20(i),beta(i),yijiedao,zui_length,disp)
end
xpp=zhili_displace(:,2).*cos(moduan-beta)-zhili_displace(:,3).*sin(moduan-beta);
ypp=zhili_displace(:,2).*sin(moduan-beta)+zhili_displace(:,3).*cos(moduan-beta);
%plot(zhili_displace(:,2),zhili_displace(:,3))  
hold on;
plot(xpp,ypp)
save E:\git\matlab\li_change\xiaobian\xiaobian_pi2.mat xpp ypp index2