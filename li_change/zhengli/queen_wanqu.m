clear all;clc
clear clc
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[5,6];
numr=size(inp,2);rao_displace=zeros(numr,6);disp=1;
m_ju=size(inp,2);
yijiedao=size(inp,2);
for i=1:numr
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
end

for j=1:size(inp,2)
    m_ju(j)=f1*rao_displace(j,3)+f2*rao_displace(j,2);
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    x_start=-2*ya;
    y_start=2*xa;
    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2]; num=size(beta,1);
    index2=size(beta1,1)+1;
    xpp=zeros(num,1);ypp=zeros(num,1);
    f17=f1;f18=f2;
    f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
    f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    
    zhili_displace1=zeros(num,3);disp=1;zui_length=20;yijiedao(j)=-m_ju(j)/ei*10;
    zhili_displace2=zeros(num,3);
    for i=1:num
    [zhili_displace1(i,1),zhili_displace1(i,2),zhili_displace1(i,3)] =zhili_weifenfangcheng_func( fn1(i),fn2(i),beta(i),yijiedao(j),zui_length,disp)
    end
%         for i=1:num
%     [zhili_displace2(i,1),zhili_displace2(i,2),zhili_displace2(i,3)] =zhili_weifenfangcheng_func( f19(i),f20(i),beta(i),yijiedao,zui_length,disp)
%     end
     xpp=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
     ypp=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
%     
  plot(xpp+x_start,ypp+y_start)

    hold on

   
    
%% 不二次变换坐标不行
%     yijiedao=-m_ju/ei;
%     disp_dan=zeros(size(beta,1),3);
%     for pp=1:size(beta)
%     [disp_dan(pp,1),disp_dan(pp,2),disp_dan(pp,3)]=zhili_weifenfangcheng_func( f1,-f2,beta(pp),yijiedao,20,1)
%     end
%     plot(disp_dan(:,2),disp_dan(:,3))
    hold on
     
end
    
    
