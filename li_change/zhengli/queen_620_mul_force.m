clear all;clc
clear clc%%%%%%%%%%find point  
alpha=pi/3;ei=1;f1=1;f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[4,8,12,16,20];
numr=size(inp,2);rao_displace=zeros(numr,6);disp=1;
for i=1:numr
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func(f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
end
final_y=zeros(size(inp,2),2);
zhong_pp=zeros(size(inp,2),2);
d=zeros(size(inp,2),1);
c=colormap(jet(size(inp,2))); %n是你要用的颜色数量
for j=1:size(inp,2)
    m_ju=f1*rao_displace(j,3)+f2*rao_displace(j,2);
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    x_start=-2*ya;
    y_start=2*xa;
    moduan=alpha;beta=moduan/2;
    f17=f1;f18=f2;
%     f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
%     f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    zhili_displace1=zeros(1,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
    zhili_displace2=zeros(1,3);

    [zhili_displace1(1,1),zhili_displace1(1,2),zhili_displace1(1,3)] =zhili_weifenfangcheng_func( fn1,fn2,beta,yijiedao,zui_length,disp)
   % [zhili_displace2(i,1),zhili_displace2(i,2),zhili_displace2(i,3)] =zhili_weifenfangcheng_func( f19,f20,beta,yijiedao,zui_length,disp)
    xpp1=zhili_displace1(1,2).*cos(pi/2-beta)-zhili_displace1(1,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(1,2).*sin(pi/2-beta)+zhili_displace1(1,3).*cos(pi/2-beta);
    %%真实坐标,中点
    xp=xpp1+x_start;zhong_pp(j,1)=xp;
    yp=ypp1+y_start;zhong_pp(j,2)=yp;
    plot(xp,yp,'r*','color',c(j,:))
    hold on
    x_zhuanzhuan=0;y_zhuanzhuan=0;
    k=tan(pi-alpha/2);
    final_y(j,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_y(j,1)=x_zhuanzhuan-k*(final_y(j,2)-y_zhuanzhuan);
    plot(final_y(j,1),final_y(j,2),'+','color',c(j,:))
    hold on
    plot(0,0,'o')
    der_x1=x_zhuanzhuan;der_y1=y_zhuanzhuan;der_x2=final_y(j,1);der_y2=final_y(j,2);
    der_a=der_y2-der_y1;
    der_b=-(der_x2-der_x1);
    der_c=der_y1*(der_x2-der_x1)-der_x1*(der_y2-der_y1);
    d(j)=abs((der_a*xp+der_b*yp+der_c)/sqrt(der_a^2+der_b^2))
end

  %%%末端坐标变换，和新型变换有区别，在不是pi/2---对比1,3
  %%%但在pi/2 下，是相同的
  %%%在两种力的变换下，2种坐标变换都没有区别---对比3,4,-----1,2
  %%%case 3 ,yong新型的力做出的结论是和过去的相同的，差别在于 moduan的变换
  


   
    
%% 不二次变换坐标不行
%     yijiedao=-m_ju/ei;
%     disp_dan=zeros(size(beta,1),3);
%     for pp=1:size(beta)
%     [disp_dan(pp,1),disp_dan(pp,2),disp_dan(pp,3)]=zhili_weifenfangcheng_func( f1,-f2,beta(pp),yijiedao,20,1)
%     end
%     plot(disp_dan(:,2),disp_dan(:,3))
%     hold on
     

    
    
