clear all;clc
alpha=pi/2;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[5,6];
numr=size(inp,2);rao_displace=zeros(numr,6);disp=1;
for i=1:numr
[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)] =erjie_weifenfangcheng_func( f5,f6,beta_long(inp(i))-alpha/2,zui_length,disp )
end

for j=1:size(inp,2)
    m_ju=f1*rao_displace(j,3)+f2*rao_displace(j,2);
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    x_start=-2*ya;
    y_start=2*xa;
%     yijiedao=-m_ju/ei;
%     zhili_displace=zeros(num,3);disp=1;
%     zhili_weifenfangcheng_func( f19(i),f20(i),beta(i),yijiedao,zui_length,disp)
    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';
    beta2=[moduan/2:0.01:moduan]';
    index2=size(beta1,1)+1;
    beta=[beta1;beta2];
    num=size(beta,1);
    xpp=zeros(num,1);
    ypp=zeros(num,1);
    [xpp,ypp] =xiaobian_2_func( f1,f2,beta,moduan,m_ju,ei )
%     plot(xpp+x_start,ypp+y_start)
%     hold on
    yijiedao=-m_ju/ei;
    disp_dan=zeros(size(beta,1),3);
    
    for pp=1:size(beta)
    [disp_dan(pp,1),disp_dan(pp,2),disp_dan(pp,3)]=zhili_weifenfangcheng_func( f1,-f2,beta(pp),yijiedao,20,1)
    end
    plot(disp_dan(:,2),disp_dan(:,3))
    hold on
     
end
    
    
