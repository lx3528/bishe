%%%% 第二章三个不同角度的受力
clear all;clc
m_ju=0;
f1=1;
moduan=90*pi/180;
ei=1;

alpha=moduan;
f1_ei=f1/ei;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
%% 为下一步所做的初始点的数值
    beta1=[0:0.01:moduan/2]';
    beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2]; 
    %beta=beta1;
    num=size(beta,1);
    index2=size(beta1,1);
%% 1力变换
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    zhili_displace1=zeros(num,3);disp=1;yijiedao=-m_ju/ei;
    %% 2积分
     for i=1:num
    [zhili_displace1(i,1),zhili_displace1(i,2),zhili_displace1(i,3)] =zhili_gai_func( fn1(i),fn2(i),beta(i),yijiedao);
     end
    %% 3位置变换
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
%%--%%
    %% 求对称轴
    k=tan(pi-alpha/2);
    %% 中点
    x_zhong=(0+xpp1(end))/2;
    y_zhong=(0+ypp1(end))/2;
    
    der_y=sqrt((xpp1(index2+1)-x_zhong)^2+(ypp1(index2+1)-y_zhong)^2);
    der_s=zhili_displace1(end,1);
    %% plot
    plot(xpp1,ypp1,'Color',[0 0 0])%中部长段
    hold on;
    index1=index2;
    scatter(xpp1(index2+1),ypp1(index2+1))
    plot([0 xpp1(end)],[0 ypp1(end)],'--','Color',[0 0 0])
    
    xpp1=xpp1';ypp1=ypp1';
    plot([xpp1(end)/2 xpp1(index1-1)],[ypp1(end)/2 ypp1(index1-1)],'--','Color',[0 0 0])


    
    