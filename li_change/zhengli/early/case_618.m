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
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f3=f1_ei*cos(alpha/2)+f2*sin(alpha/2);
f4=f1_ei*sin(alpha/2)-f2*cos(alpha/2);
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
f11=f9*cos(alpha/2)+f10*sin(alpha/2);
f12=-f9*sin(alpha/2)+f10*cos(alpha/2);
%% find huchang
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[5];
%% two displacement
%0 point
num=size(inp,2);rao_displace=zeros(num,6);disp=1;
for i=1:num
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
[rao_displace(i,4),rao_displace(i,5),rao_displace(i,6)] =erjie_weifenfangcheng_func( f11,f12,beta_long(inp(i)),zui_length,disp )
end
%beta_long(inp(1))  s_beta_beta1(1),x_beta1(1),y_beta1(1)
%beta_long(inp(1))-alpha/2 s_beta_beta2(1),x_beta2(1),y_beta2(1)
%1  fin_2
for j=1:size(inp,2)
    
    fin_2=[0:0.005:beta_long(inp(j))-alpha/2]';
    point2=size(fin_2,1);
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_long(inp(j))-alpha/2-fin_2)+f6*sin(beta_long(inp(j))-alpha/2-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_long(inp(j))-alpha/2-fin_2)+f6*cos(beta_long(inp(j))-alpha/2-fin_2);%%f8
    for i=1:point2%%%%can 部分
    [r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_weifenfangcheng_func(force_disp2(i,1),force_disp2(i,2),fin_2(i),zui_length,disp)
    end
    %plot(r2_displace(:,2),r2_displace(:,3))
    %%%%3 fin_3
    fin_3=[0:0.005:beta_long(inp(j))-alpha/2]';
    point3=size(fin_3,1);
    force_disp3=zeros(point3,2);
    r3_displace=zeros(point3,3);
    force_disp3(:,1)=f11*cos(fin_3-beta_long(inp(j)))+f12*sin(fin_3-beta_long(inp(j)));%%f13
    force_disp3(:,2)=-f11*sin(fin_3-beta_long(inp(j)))+f12*cos(fin_3-beta_long(inp(j)));%%f14
    for i=1:point3%%%%can 部分
    [r3_displace(i,1),r3_displace(i,2),r3_displace(i,3)]=erjie_weifenfangcheng_func(force_disp3(i,1),force_disp3(i,2),fin_3(i),zui_length,disp)
    end

    %{
    %%%%%%2  fin_1
    fin_1=[0:0.005:beta_long(inp(1))-alpha/2]';point1=size(fin_1,1);
    force_disp1=zeros(point1,2);
    r1_displace=zeros(point1,3);
    force_disp1(:,1)=f5*cos(beta_long(inp(1))-alpha/2-fin_1)+f6*sin(beta_long(inp(1))-alpha/2-fin_1);%%f7
    force_disp1(:,2)=-f5*sin(beta_long(inp(1))-alpha/2-fin_1)+f6*cos(beta_long(inp(1))-alpha/2-fin_1);%%f8
    for i=1:point1%%%%整块的部分
    [r1_displace(i,1),r1_displace(i,2),r1_displace(i,3)]=erjie_weifenfangcheng_func(force_disp1(i,1),force_disp1(i,2),fin_1(i),zui_length,disp)
    end
    %}
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
    theta_zhuan2=(pi/2-(beta_long(inp(j))-alpha/2)+fin_2);
    %theta_zhuan1=(-pi/2-(beta_long(inp(1))-alpha/2)+fin_1);
    theta_zhuan3=-(pi/2-alpha/2-fin_3+(beta_long(inp(j))));
    xa=rao_displace(1,2);
    ya=rao_displace(1,3);
    %%%
    x_zhuan2=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2)-ya;
    y_zhuan2=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2)+xa;
    x_zhuan3=r3_displace(:,2).*cos(theta_zhuan3)+r3_displace(:,3).*sin(theta_zhuan3)-ya;
    y_zhuan3=r3_displace(:,3).*cos(theta_zhuan3)-r3_displace(:,2).*sin(theta_zhuan3)+xa;
    plot(x_zhuan2,y_zhuan2)
    hold on;
    plot(x_zhuan3,y_zhuan3)
    hold on;
    %m_ju=f1*rao_displace(1,3)+f2*rao_displace(1,2);
    x_start=-2*ya;
    y_start=2*xa;
    load xiaobian_pi2.mat xpp ypp index2
    plot(xpp+x_start,ypp+y_start)
    hold on;
    k=tan(pi-alpha/2);
    k_ni=inv([1 -k;k 1]);
    x_zhuanzhuan=[0;flipud(x_zhuan2);x_zhuan3];
    y_zhuanzhuan=[0;flipud(y_zhuan2);y_zhuan3];
    num_zhuan=size(x_zhuanzhuan,1);
    final_disp=zeros(num_zhuan,2);
    xp=xpp(index2)+x_start;
    yp=ypp(index2)+y_start;
    final_disp(:,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_disp(:,1)=x_zhuanzhuan-k*(final_disp(:,2)-y_zhuanzhuan)
    plot(final_disp(:,1),final_disp(:,2))   
    hold on
    line([final_disp(end,1),xpp(end)+x_start],[final_disp(end,2),ypp(end)+y_start])
    hold on
    line([x_zhuan3(end),xpp(1)+x_start],[y_zhuan3(end),ypp(1)+y_start])
    hold on
    der_x1=x_zhuanzhuan(1);der_y1=y_zhuanzhuan(1);der_x2=final_disp(1,1);der_y2=final_disp(1,2);
    der_a=der_y2-der_y1;
    der_b=-(der_x2-der_x1);
    der_c=der_y1*(der_x2-der_x1)-der_x1*(der_y2-der_y1);
    d=abs((der_a*xp+der_b*yp+der_c)/sqrt(der_a^2+der_b^2))
end

% hold on;
%x_zhuan1=r1_displace(:,2).*cos(theta_zhuan1)+r1_displace(:,3).*sin(theta_zhuan1)-ya;
%y_zhuan1=r1_displace(:,3).*cos(theta_zhuan1)-r1_displace(:,2).*sin(theta_zhuan1)+xa;
% plot(x_zhuan1,y_zhuan1)
%% wan qu
%1
%r_wan_disp=zeros(1,3);
%[r_wan_disp(1),r_wan_disp(2),r_wan_disp(3)]=erjie_weifenfangcheng_func_wan(f1,f2,alpha,zui_length,disp)




% %%%找对称轴，对称创建点
