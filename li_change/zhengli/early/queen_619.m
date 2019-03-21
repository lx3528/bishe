clear all;clc
clear clc%%%case  li的问题
alpha=pi/3;ei=1;f1=1;f1_ei=f1/ei;disp=1
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;
t=0.1;index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
inp=[5];
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

    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2]; num=size(beta,1);
    index2=size(beta1,1)+1;
    xpp=zeros(num,1);ypp=zeros(num,1);

    f17=f1;f18=f2;
    f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
    f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    
    
        zhili_displace1=zeros(num,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
    zhili_displace2=zeros(num,3);


    for i=1:num
    [zhili_displace1(i,1),zhili_displace1(i,2),zhili_displace1(i,3)] =zhili_weifenfangcheng_func( fn1(i),fn2(i),beta(i),yijiedao,zui_length,disp)
    end
        for i=1:num
    [zhili_displace2(i,1),zhili_displace2(i,2),zhili_displace2(i,3)] =zhili_weifenfangcheng_func( f19(i),f20(i),beta(i),yijiedao,zui_length,disp)
        end
   month=4;
   switch month
       case {1}%%find f
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
     xpp2=zhili_displace2(:,2).*cos(pi/2-beta)-zhili_displace2(:,3).*sin(pi/2-beta);%sameto1
     ypp2=zhili_displace2(:,2).*sin(pi/2-beta)+zhili_displace2(:,3).*cos(pi/2-beta); 
       plot(xpp1,ypp1,'-',xpp2,ypp2,'*')
       case {2}%%%compare monduan
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
     xpp2=zhili_displace1(:,2).*cos(moduan-beta)-zhili_displace1(:,3).*sin(moduan-beta);
     ypp2=zhili_displace1(:,2).*sin(moduan-beta)+zhili_displace1(:,3).*cos(moduan-beta);
     xpp3=zhili_displace2(:,2).*cos(moduan-beta)-zhili_displace2(:,3).*sin(moduan-beta);%sameto2
     ypp3=zhili_displace2(:,2).*sin(moduan-beta)+zhili_displace2(:,3).*cos(moduan-beta);
      xpp4=zhili_displace1(:,2).*cos(moduan-beta)-zhili_displace1(:,3).*sin(moduan-beta);
     ypp4=zhili_displace1(:,2).*sin(moduan-beta)+zhili_displace1(:,3).*cos(moduan-beta);
       plot(xpp1,ypp1,'-',xpp3,ypp3,'*')
        plot(xpp2,ypp2,'-',xpp4,ypp4,'*')
       case {3} %%33
beta1_33=[pi/1024:0.01:moduan]';beta2_33=[moduan:0.01:pi/2]';
    beta33=[beta1_33;beta2_33];num33=size(beta1_33,1);
    fn1_33=f1*cos(beta33)+f2*sin(beta33);fn2_33=f1*sin(beta33)-f2*cos(beta33);zhi_33=zeros(num33,3);
        for i=1:num33
    [zhi_33(i,1),zhi_33(i,2),zhi_33(i,3)] =zhili_weifenfangcheng_func( fn1_33(i),fn2_33(i),beta33(i),yijiedao,zui_length,disp)
    end
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
    xpp33_1=zhi_33(:,2).*cos(moduan-beta1_33)-zhi_33(:,3).*sin(moduan-beta1_33);%sameto2
    ypp33_1=zhi_33(:,2).*sin(moduan-beta1_33)+zhi_33(:,3).*cos(moduan-beta1_33);
    xpp33_2=zhi_33(:,2).*cos(pi/2-beta1_33)-zhi_33(:,3).*sin(pi/2-beta1_33);%sameto2
    ypp33_2=zhi_33(:,2).*sin(pi/2-beta1_33)+zhi_33(:,3).*cos(pi/2-beta1_33);
  plot(xpp1,ypp1,'-',xpp33_1,ypp33_1,'*',xpp33_2,ypp33_2,'--r')
       case 4
            xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta); 
    plot(xpp1,ypp1,'-')
   end
  %%%末端坐标变换，和新型变换有区别，在不是pi/2---对比1,3
  %%%但在pi/2 下，是相同的
  %%%在两种力的变换下，2种坐标变换都没有区别---对比3,4,-----1,2
  %%%case 3 ,yong新型的力做出的结论是和过去的相同的，差别在于 moduan的变换
  
  %plot(xpp1,ypp1,'-',xpp2,ypp2,'*',xpp4,ypp4,'.-.')
    hold on

   
    
%% 不二次变换坐标不行
%     yijiedao=-m_ju/ei;
%     disp_dan=zeros(size(beta,1),3);
%     for pp=1:size(beta)
%     [disp_dan(pp,1),disp_dan(pp,2),disp_dan(pp,3)]=zhili_weifenfangcheng_func( f1,-f2,beta(pp),yijiedao,20,1)
%     end
%     plot(disp_dan(:,2),disp_dan(:,3))
%     hold on
     
end
    
    
