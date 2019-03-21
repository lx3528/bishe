
%% test jifen
%{
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
%}
%% test force change with alpha and beta
%{
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
%%%采样 角度变化
fin_2=[0:0.005:pi]';
point2=size(fin_2,1);
force_disp2=zeros(point2,2);
force_disp2(:,1)=f1*cos(fin_2)-f2*sin(fin_2);
force_disp2(:,2)=f1*sin(fin_2)+f2*cos(fin_2);
%%%find force_disp2(:,1) f3 max in 472 f4 max in 158 
%}
%% deformation of one element
%wrong
%{
clear all;clc
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1;zui_length=20;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
%%force use f1,f2
%%%足底按摩到脚腕
b=pi/3;
beta=[0:0.001:b];
num=size(beta,2);
f30=f1;f40=-f2;
f41=f40*cos(beta)-f30*sin(beta);
f31=f40*sin(beta)+f30*cos(beta);
disp_test1=zeros(3,num);
for i=1:num
[disp_test1(1,i),disp_test1(2,i),disp_test1(3,i)]=erjie_weifenfangcheng_func( f31(i),f41(i),b-beta(i),zui_length,disp)
end
%%zuo biao
zhuanzhi_test1=zeros(2,num);
zhuanzhi_test1(1,:)=disp_test1(2,:).*cos(beta)-disp_test1(3,:).*sin(beta);%%x
zhuanzhi_test1(2,:)=disp_test1(3,:).*cos(beta)+disp_test1(2,:).*sin(beta);
plot(zhuanzhi_test1(:,1),zhuanzhi_test1(:,2))
plot(disp_test1(:,1),disp_test1(:,2))
px=[[1,2,3,4];[2,3,4,5]];
py=[[2,1,1,1];[2,1,4,5]];
zhuan_(1,:)=px(2,:).*py(2,:)
%}


