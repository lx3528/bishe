%% inp变化，查看 4度 7度 10度---功能，能多个inp，找线
%% 新加beta——tranform为了整数角度
clear all;clc
f=1;pps=1;

alpha=pi/2;ei=1;f1=f(pps);f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;

%% find huchang 参数定义1
index=50;zui_length=20;beta_long=linspace(alpha/2+0.00001,pi/2,index)';
%inp=[5,8,11];
inp=[10/180*pi]';
% for j=1:size(inp,2)
%     beta_long(inp(j))-alpha/2
% end
%% two displacement 参数定义2
%0 point
rao_displace=zeros(size(inp,2),6);
%% 每一个beta
for j=1:size(inp,2)
    %% 求a点
    %beta_transform=beta_long(inp(j))-alpha/2;
    beta_transform=inp(j);
[rao_displace(j,1),rao_displace(j,2),rao_displace(j,3)] =erjie_gai_func( f5,f6,beta_transform);

    fin_2=[0:0.005:beta_transform]';
    point2=size(fin_2,1);
    %% 1求力
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_transform-fin_2)+f6*sin(beta_transform-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_transform-fin_2)+f6*cos(beta_transform-fin_2);%%f8
    %% 2求积分
    for i=1:point2%%%%can 部分
    [r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_gai_func(force_disp2(i,1),force_disp2(i,2),fin_2(i));
    end
    %% 3求位置变换
    theta_zhuan2=(pi/2-(beta_transform)+fin_2);
    xa=rao_displace(j,2);
    ya=rao_displace(j,3);
    %%%
    x_zhuan2_zhong=r2_displace(:,2).*cos(theta_zhuan2)+r2_displace(:,3).*sin(theta_zhuan2);
    y_zhuan2_zhong=r2_displace(:,3).*cos(theta_zhuan2)-r2_displace(:,2).*sin(theta_zhuan2);
    %%% 用于画图的点，对称点。
    x_zhuan2=x_zhuan2_zhong-ya;
    y_zhuan2=y_zhuan2_zhong+xa;
    x_zhuan3=-x_zhuan2_zhong-ya;
    y_zhuan3=-y_zhuan2_zhong+xa;
%%--%%
%% 为下一步所做的初始点的数值
    m_ju=f1*rao_displace(j,3)+f2*rao_displace(j,2);
    x_start=-2*ya;
    y_start=2*xa;
    
    moduan=alpha;
    beta1=[pi/1024:0.01:moduan/2]';beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2]; num=size(beta,1);
    index2=size(beta1,1)+1;
    xpp1=zeros(num,1);ypp1=zeros(num,1);
%% 1力变换
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    zhili_displace1=zeros(num,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
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
    x_zhuanzhuan=[0;flipud(x_zhuan2);x_zhuan3];
    y_zhuanzhuan=[0;flipud(y_zhuan2);y_zhuan3];
    num_zhuan=size(x_zhuanzhuan,1);
    final_disp=zeros(num_zhuan,2);
    xp=xpp1(index2)+x_start;
    yp=ypp1(index2)+y_start;
    %%--%%
    final_disp(:,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
    final_disp(:,1)=x_zhuanzhuan-k*(final_disp(:,2)-y_zhuanzhuan)
    %%--%%

    %% huchang
    out_huchang=rao_displace(j,1)*4+zhili_displace1(end,1);
    %% 中段形变
    out_der=sqrt(xp^2+yp^2-(final_disp(1,1)^2+final_disp(1,2)^2)/4);
        %% 管道半径
    lr=final_disp(1,1);
    %% plot
    plot(x_zhuan2,y_zhuan2,'Color',[0 0 0])
    hold on;
    plot(x_zhuan3,y_zhuan3,'Color',[0 0 0])
    hold on;
    plot(xpp1+x_start,ypp1+y_start,'Color',[0 0 0])%中部长段
    hold on;
    plot(final_disp(:,1),final_disp(:,2),'Color',[0 0 0]) 
    %% dian
%    text(0,0,'O') ;
%    plot(0,0,'.','Markersize',11,'Color',[0 0 0])
%    text(x_start/2,y_start/2,'A')
%    plot(x_start/2,y_start/2,'.','Markersize',11,'Color',[0 0 0])
%    text(x_start,y_start,'B');
%    plot(x_start,y_start,'.','Markersize',11,'Color',[0 0 0])
   text(xp+0.01,yp+0.01,strcat('C',num2str(j))) ;
%    plot(xp,yp,'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(end,1),final_disp(end,2),'D');
%    plot(final_disp(end,1),final_disp(end,2),'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(size(x_zhuan2,1)+1,1),final_disp(size(x_zhuan2,1)+1,2),'E');
%    plot(final_disp(size(x_zhuan2,1)+1,1),final_disp(size(x_zhuan2,1)+1,2),'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(1,1),final_disp(1,2),'F','FontSize',16);
   plot(final_disp(1,1),final_disp(1,2),'.','Markersize',11,'Color',[0 0 0])
   %% 
  plot([0 final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
   %annotation('arrow',[xp,final_disp(1,1)/2],[yp,final_disp(1,2)/2])
%   xlim([-0.5 2.5])
%    ylim([-0.5 2.5])
   %%%手工用其他软件加 双箭头！，夹角！
end