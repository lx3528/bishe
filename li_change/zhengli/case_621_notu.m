alpha=pi/4;f1=1;ei=1;
beta_long_ni=linspace(0.00001,pi/2,index)';
inp=[1 2 3 4 5 6 7 8];
beta_long=beta_long_ni(inp(1));

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%shanchu alpha/2
f1_ei=f1/ei;f1=f1_ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
%% find huchang
t=0.1;zui_length=20;
%% two displacement
%0 point
rao_displace=zeros(1,3);disp=1;
[rao_displace(1,1),rao_displace(1,2),rao_displace(1,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long,zui_length,disp )

    m_ju=f1*rao_displace(1,3)+f2*rao_displace(1,2);
    xa=rao_displace(1,2);
    ya=rao_displace(1,3);
    x_start=-2*ya;
    y_start=2*xa;
    %% 弯曲点  弯曲 
    moduan=alpha;beta=moduan/2;
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    zhili_displace1=zeros(1,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
   
global k3
global k4
k3=sqrt( fn1);
k4=sqrt( fn2);
eps=0.000001;
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    zhili_displace1(1,2)=quad(x_theta,0,beta)
    zhili_displace1(1,3)=quad(y_theta,0,beta)

    xpp1=zhili_displace1(1,2).*cos(pi/2-beta)-zhili_displace1(1,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(1,2).*sin(pi/2-beta)+zhili_displace1(1,3).*cos(pi/2-beta);
    zhong_pp=zeros(1,2);
    xp=xpp1+x_start;zhong_pp(1,1)=xp;
    yp=ypp1+y_start;zhong_pp(1,2)=yp;
    plot(xp,yp,'o')
    hold on;

    %%%另一部分 对称表示
   
  final_y=zeros(1,2); 
    x_zhuanzhuan=0;y_zhuanzhuan=0;
    k=tan(pi-alpha/2);
    final_y(1,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_y(1,1)=x_zhuanzhuan-k*(final_y(1,2)-y_zhuanzhuan);
    plot(final_y(1,1),final_y(1,2),'+')
    hold on
    plot(0,0,'o')
        %%%d  pianyi
    der_x1=x_zhuanzhuan;der_y1=y_zhuanzhuan;der_x2=final_y(1,1);der_y2=final_y(1,2);
    der_a=der_y2-der_y1;
    der_b=-(der_x2-der_x1);
    der_c=der_y1*(der_x2-der_x1)-der_x1*(der_y2-der_y1);
    d=abs((der_a*xp+der_b*yp+der_c)/sqrt(der_a^2+der_b^2))
    
    %final_one  HUCHANG
    fnn1=f1*cos(moduan/2)+f2*sin(moduan/2);
    fnn2=f1*sin(moduan/2)-f2*cos(moduan/2);zhi_fin1=zeros(1,3);
    [zhi_fin1(1,1),zhi_fin1(1,2),zhi_fin1(1,3)] =zhili_weifenfangcheng_func( fnn1,fnn2,moduan/2,yijiedao,zui_length,disp)
    huchang=rao_displace(1,1)*4+zhi_fin1(1,1)*2;
%%%%alpha=pi/4;f1=1;ei=1; inp=1 1 0.4142 0.7854 -0.0029 20

