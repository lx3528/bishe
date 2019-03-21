%%%% 改变不同管道角度   
%% find final_disp=1.6525!! 0度
%% f 1.5740 6度
clear all;clc
max=0;
f=[1.5740,1,4]';
juzhen=[6,0];
pps=1;
for pps=1:size(juzhen,2)
%alpha_package=[60*pi/180;75*pi/180;90*pi/180];
alpha_package=90*pi/180;
for alpha_change=1:size(alpha_package,1)
alpha=alpha_package(alpha_change);
ei=1;f1=f(pps);f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;

%% find huchang 参数定义1
start_beta=juzhen(pps);
end_beta=juzhen(pps);

beta_stack1=linspace(start_beta,end_beta,floor((end_beta-start_beta)/0.01)+1);%10度

beta_stack=beta_stack1/180*pi;

%% two displacement 参数定义2
%0 point
rao_displace=zeros(size(beta_stack,2),6);
%% 每一个beta
for j=1:size(beta_stack,2)
    %% 求a点
[rao_displace(j,1),rao_displace(j,2),rao_displace(j,3)] =erjie_gai_func( f5,f6,beta_stack(j));

    fin_2=[0:0.005:beta_stack(j)]';
    point2=size(fin_2,1);
    %% 1求力
    force_disp2=zeros(point2,2);
    r2_displace=zeros(point2,3);
    force_disp2(:,1)=f5*cos(beta_stack(j)-fin_2)+f6*sin(beta_stack(j)-fin_2);%%f7
    force_disp2(:,2)=-f5*sin(beta_stack(j)-fin_2)+f6*cos(beta_stack(j)-fin_2);%%f8
    %% 2求积分
    for i=1:point2%%%%can 部分
    [r2_displace(i,1),r2_displace(i,2),r2_displace(i,3)]=erjie_gai_func(force_disp2(i,1),force_disp2(i,2),fin_2(i));
    end
    %% 3求位置变换
    theta_zhuan2=(pi/2-(beta_stack(j))+fin_2);
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
    if ~exist('bb','var')
        sttr='--';
    else
        sttr='-';
        end
    plot(x_zhuan2,y_zhuan2,sttr,'Color',[0 0 0])
    hold on;
    plot(x_zhuan3,y_zhuan3,sttr,'Color',[0 0 0])
    hold on;
    plot(xpp1+x_start,ypp1+y_start,sttr,'Color',[0 0 0])%中部长段
  
    plot(final_disp(:,1),final_disp(:,2),sttr,'Color',[0 0 0]) 
    
    %% dian
   text(0,0,'O') ;
   plot(0,0,'.','Markersize',13,'Color',[0 0 0])
%    text(x_start/2,y_start/2,'A','FontSize',14)
%    plot(x_start/2,y_start/2,'.','Markersize',11,'Color',[0 0 0])
%    text(x_start,y_start,'B','FontSize',14);
%    plot(x_start,y_start,'.','Markersize',11,'Color',[0 0 0])
%   text(xp+0.01,yp+0.01,strcat('C',num2str(pps)),'FontSize',14);
%    plot(xp,yp,'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(end,1),final_disp(end,2),'D','FontSize',14);
%    plot(final_disp(end,1),final_disp(end,2),'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(size(x_zhuan2,1)+1,1),final_disp(size(x_zhuan2,1)+1,2),'E','FontSize',14);
%    plot(final_disp(size(x_zhuan2,1)+1,1),final_disp(size(x_zhuan2,1)+1,2),'.','Markersize',11,'Color',[0 0 0])
    text(final_disp(1,1),final_disp(1,2),'F','FontSize',14);
   plot(final_disp(1,1),final_disp(1,2),'.','Markersize',11,'Color',[0 0 0])
   hold on;
   
   %% 斜边虚线--不需要
   %plot([0 final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
   %annotation('arrow',[xp,final_disp(1,1)/2],[yp,final_disp(1,2)/2])
   
   %%为了能让人看懂图，我再做条垂线

   
   if ~exist('bb','var')
%        set(gca,'xtick',[-0.5:8:final_disp(1,1)+0.5])
%        set(gca,'ytick',[-0.5:8:final_disp(1,2)+0.5])

    ylim([-0.5 final_disp(1,2)+0.5])
 
   end
   %% 画直角虚线和其他虚线
   if alpha_change==size(alpha_package,1)
          plot([final_disp(1,1) final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
          plot([0 final_disp(1,1)],[0 0],'--','Color',[0 0 0])
   end
%% 确定图窗最大边界
   if(-final_disp(1,2)/tan(pi-alpha)+final_disp(1,1)>max)
       max=-final_disp(1,2)/tan(pi-alpha)+final_disp(1,1);
   end
bb=1;
end
end

end
legend({'状态1','状态2'})
   xlim([-0.5 max+0.5])
plot([0 1.6525 ],[0 1.6525 ],':.','k')