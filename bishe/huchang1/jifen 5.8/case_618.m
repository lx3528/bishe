%{
clear all;clc
f=@(x)x^2-x-1;
a=-1;
b=1;
tol=0.016
while b-a>tol
    fin_k=a+0.382*(b-a)
    miu_k=a+0.618*(b-a)
    if f(fin_k)>f(miu_k)
        a=fin_k
    else 
        b=miu_k
    end
end
fprintf('0.618法求得的极小值为%9.9f\n',(b+a)/2) 
%}
clear all;clc
alpha=asin(0.8);ei=1;f1=1;f1_ei=f1/ei;
%% find huchang
t=0.1;index=50;zui_length=20;beta_long=linspace(asin(0.8)/2+0.001,pi/2,index)';
s_beta1=zeros(index,1);s_beta2=zeros(index,1);s_sum=zeros(index,1);displace=zeros(index,4);
disp=1
for  i=1:index
    [s_beta1(i),displace(i,1),displace(i,3)] =erjie_weifenfangcheng_func( alpha,f1_ei,beta_long(i),zui_length,disp)
    [s_beta2(i),displace(i,2),displace(i,4)] =erjie_weifenfangcheng_func( alpha,f1_ei,beta_long(i)-alpha/2,zui_length,disp )
    s_sum(i)=s_beta1(i)+s_beta2(i)
end
%%%plot(i,s_sum)
inp=[16,19,27];
%% two displacement
%0 point
num=size(inp,2);rao_displace=zeros(num,6);disp=1;
for i=1:num
    [rao_displace(i,1),rao_displace(i,3),rao_displace(i,5)] =erjie_weifenfangcheng_func( alpha,f1_ei,beta_long(inp(i)),zui_length,disp)
    [rao_displace(i,2),rao_displace(i,4),rao_displace(i,6)] =erjie_weifenfangcheng_func( alpha,f1_ei,beta_long(inp(i))-alpha/2,zui_length,disp )
end
%beta_long(inp(1))  s_beta_beta1(1),x_beta1(1),y_beta1(1)
%beta_long(inp(1))-alpha/2 s_beta_beta2(1),x_beta2(1),y_beta2(1)
%1  fin_2
fin_2=[0.002:0.005:beta_long(inp(1))-alpha/2];point2=size(fin_2,2);r2_displace=zeros(point2,3);
for i=1:point2%%%%can 部分
[r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_weifenfangcheng_func( alpha,f1_ei,fin_2(i),zui_length,disp)
end
%2  fin_1
fin_1=[0.02:0.02:beta_long(inp(1))];point1=size(fin_1,2);r1_displace=zeros(point1,3);
for i=1:point1%%%%整块的部分
[r1_displace(i,1),r1_displace(i,2),r1_displace(i,3)]=erjie_weifenfangcheng_func( alpha,f1_ei,fin_1(i),zui_length,disp)
end
%% transform
%%%在原坐标系下连线
%{
%plot(r2_displace(:,2),r2_displace(:,3),'-',r1_displace(:,2),r1_displace(:,3),'x')
%%方法1
line([r2_displace(1:15,2) r2_displace(2:16,2)],[r2_displace(1:15,3) r2_displace(2:16,3)])
%%方法2
% for i=1:point2-1
% line([r2_displace(i,2) r2_displace(i+1,2)],[r2_displace(i,3) r2_displace(i+1,3)])
% end
%}

%%%变换坐标系
theta_zhuan2=(pi/2-(beta_long(inp(1))-alpha/2)+fin_2)';
xa=rao_displace(1,4);
ya=rao_displace(1,6);
x_zhuan2=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2)-ya;
y_zhuan2=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2)+xa;
plot(x_zhuan2,y_zhuan2)
plot(r2_displace(:,2),r2_displace(:,3))
%%%找对称轴，对称创建点





