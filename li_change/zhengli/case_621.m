function  [huchang,d] = case_621( f1,ei,alpha,beta_long)
%%%
% clear all;clc
% alpha=pi/2+pi/6;
% ei=1;
% f1=1;
% index=60;beta_long_ni=linspace(alpha/2+0.00001,pi/2,index)';
% inp=[13,26];
% beta_long=beta_long_ni(inp(1));
%%shuchu
%%1 plot  2 弧长

f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
%% find huchang
t=0.1;zui_length=20;
%% two displacement
%0 point
rao_displace=zeros(1,3);disp=1;
[rao_displace(1,1),rao_displace(1,2),rao_displace(1,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long-alpha/2,zui_length,disp )
    
fin_2=[0:0.005:beta_long-alpha/2]';
    point2=size(fin_2,1);
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_long-alpha/2-fin_2)+f6*sin(beta_long-alpha/2-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_long-alpha/2-fin_2)+f6*cos(beta_long-alpha/2-fin_2);%%f8
    for i=1:point2%%%%can 部分
    global k3
    global k4
    k3=sqrt(force_disp2(i,1));
    k4=sqrt(force_disp2(i,2));
    eps=0.000001
    hx_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(fin_2(i)))+k4^2*(sin(theta)-sin(fin_2(i))))));
    hy_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(fin_2(i)))+k4^2*(sin(theta)-sin(fin_2(i))))));
    r2_displace(i,2)=quad(hx_theta,0,fin_2(i))
    r2_displace(i,3)=quad(hy_theta,0,fin_2(i))
    end
    %% transform
    theta_zhuan2=(pi/2-(beta_long-alpha/2)+fin_2);
    xa=rao_displace(1,2);
    ya=rao_displace(1,3);
    %%%
    x_zhuan2_zhong=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2);
    y_zhuan2_zhong=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2);
    x_zhuan2=x_zhuan2_zhong-ya;
    y_zhuan2=y_zhuan2_zhong+xa;
    x_zhuan3=-x_zhuan2_zhong-ya;
    y_zhuan3=-y_zhuan2_zhong+xa;
    plot(x_zhuan2,y_zhuan2)
    hold on;
    plot(x_zhuan3,y_zhuan3)
    hold on;
    m_ju=f1*rao_displace(1,3)+f2*rao_displace(1,2);
    x_start=-2*ya;
    y_start=2*xa;
    %% 弯曲点  弯曲
    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2;moduan]; num=size(beta,1);
    index2=size(beta1,1)+1;
    xpp1=zeros(num,1);ypp1=zeros(num,1);

    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    zhili_displace1=zeros(num,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
    for i=1:num
global k3
global k4
k3=sqrt( fn1(i));
k4=sqrt( fn2(i));
eps=0.000001;
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta(i)))+k4^2*(sin(theta)-sin(beta(i)))))+yijiedao^2/2);
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta(i)))+k4^2*(sin(theta)-sin(beta(i)))))+yijiedao^2/2);
    zhili_displace1(i,2)=quad(x_theta,0,beta(i))
    zhili_displace1(i,3)=quad(y_theta,0,beta(i))
    end
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
    plot(xpp1+x_start,ypp1+y_start)
    hold on;
    
    %%%另一部分 对称表示
    k=tan(pi-alpha/2);
    x_zhuanzhuan=[0;flipud(x_zhuan2);x_zhuan3];
    y_zhuanzhuan=[0;flipud(y_zhuan2);y_zhuan3];
    num_zhuan=size(x_zhuanzhuan,1);
    final_disp=zeros(num_zhuan,2);
    xp=xpp1(index2)+x_start;
    yp=ypp1(index2)+y_start;
    plot(xp,yp,'o')
    
    final_disp(:,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_disp(:,1)=x_zhuanzhuan-k*(final_disp(:,2)-y_zhuanzhuan)
    plot(final_disp(:,1),final_disp(:,2))  
    
    %final_one
    fnn1=f1*cos(moduan)+f2*sin(moduan);
    fnn2=f1*sin(moduan)-f2*cos(moduan);zhi_fin1=zeros(1,3);
    [zhi_fin1(1,1),zhi_fin1(1,2),zhi_fin1(1,3)] =zhili_weifenfangcheng_func( fnn1,fnn2,moduan,yijiedao,zui_length,disp)
    huchang=rao_displace(1,1)*4+zhi_fin1(1,1);
    %%%d
    der_x1=x_zhuanzhuan(1);der_y1=y_zhuanzhuan(1);der_x2=final_disp(1,1);der_y2=final_disp(1,2);
    der_a=der_y2-der_y1;
    der_b=-(der_x2-der_x1);
    der_c=der_y1*(der_x2-der_x1)-der_x1*(der_y2-der_y1);
    d=abs((der_a*xp+der_b*yp+der_c)/sqrt(der_a^2+der_b^2))
end