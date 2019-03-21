%%%% 第二章三个不同角度的受力
clear all;clc
max=0;
f=[1,2,4]';
pps=1;
alpha_package=[60*pi/180;75*pi/180;90*pi/180];
%alpha_package=90*pi/180;
for alpha_change=1:size(alpha_package,1)
alpha=alpha_package(alpha_change);
ei=1;f1=f(pps);f1_ei=f1/ei;disp=1;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;

%% find huchang 参数定义1
moduan=alpha;
%% 为下一步所做的初始点的数值
    m_ju=-2;
    x_start=0;
    y_start=0;
    beta1=[pi/1024:0.01:moduan/2]';
    beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2]; 
    %beta=beta1;
    num=size(beta,1);
    index2=size(beta1,1);
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
%     x_zhuanzhuan=[0;flipud(x_zhuan2);x_zhuan3];
%     y_zhuanzhuan=[0;flipud(y_zhuan2);y_zhuan3];
%     num_zhuan=size(x_zhuanzhuan,1);
%     final_disp=zeros(num_zhuan,2);
    xp=xpp1(index2)+x_start;
    yp=ypp1(index2)+y_start;
    %%--%%
%     final_disp(:,2)=((k^2-1)*y_zhuanzhuan+2*k*x_zhuanzhuan-2*k*xp+2*yp)/(k^2+1);
%     final_disp(:,1)=x_zhuanzhuan-k*(final_disp(:,2)-y_zhuanzhuan)
    %%--%%

    %% huchang
%     out_huchang=rao_displace(j,1)*4+zhili_displace1(end,1);
    %% 中段形变
%     out_der=sqrt(xp^2+yp^2-(final_disp(1,1)^2+final_disp(1,2)^2)/4);
        %% 管道半径
 %   lr=final_disp(1,1);
    %% plot
%     plot(x_zhuan2,y_zhuan2,'Color',[0 0 0])
%     hold on;
%     plot(x_zhuan3,y_zhuan3,'Color',[0 0 0])
%     hold on;
    plot(xpp1+x_start,ypp1+y_start,'Color',[0 0 0])%中部长段
    hold on;
%     plot(final_disp(:,1),final_disp(:,2),'Color',[0 0 0]) 
    %% dian
   text(0,0,'O') ;
   plot(0,0,'.','Markersize',13,'Color',[0 0 0])
%    text(x_start/2,y_start/2,'A')
%    plot(x_start/2,y_start/2,'.','Markersize',11,'Color',[0 0 0])
%    text(x_start,y_start,'B');
%    plot(x_start,y_start,'.','Markersize',11,'Color',[0 0 0])
 %  text(xp+0.01,yp+0.01,strcat('C',num2str(alpha_change))) ;
%    plot(xp,yp,'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(end,1),final_disp(end,2),'D');
%    plot(final_disp(end,1),final_disp(end,2),'.','Markersize',11,'Color',[0 0 0])
%    text(final_disp(size(x_zhuan2,1)+1,1),final_disp(size(x_zhuan2,1)+1,2),'E');
%    plot(final_disp(size(x_zhuan2,1)+1,1),final_disp(size(x_zhuan2,1)+1,2),'.','Markersize',11,'Color',[0 0 0])
%     text(final_disp(1,1),final_disp(1,2),strcat('F',num2str(alpha_change)),'FontSize',13);
%    plot(final_disp(1,1),final_disp(1,2),'.','Markersize',11,'Color',[0 0 0])
%    hold on;
%    %% 
%    
%    plot([0 final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
   %annotation('arrow',[xp,final_disp(1,1)/2],[yp,final_disp(1,2)/2])
   
   %%为了能让人看懂图，我再做条垂线

   
%    if ~exist('bb','var')
%        set(gca,'xtick',[-0.5:8:final_disp(1,1)+0.5])
%        set(gca,'ytick',[-0.5:8:final_disp(1,2)+0.5])

%     ylim([-0.5 final_disp(1,2)+0.5])
%  
%    end
%    if alpha_change==size(alpha_package,1)
%           plot([final_disp(1,1) final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
%           plot([0 final_disp(1,1)],[0 0],'--','Color',[0 0 0])
%    else
%           plot([-final_disp(1,2)/tan(pi-alpha)+final_disp(1,1) final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
%           plot([0 -final_disp(1,2)/tan(pi-alpha)+final_disp(1,1)],[0 0],'--','Color',[0 0 0])
%    end
%    if(-final_disp(1,2)/tan(pi-alpha)+final_disp(1,1)>max)
%        max=-final_disp(1,2)/tan(pi-alpha)+final_disp(1,1);
%    end
% bb=1;

end
%     xlim([-0.5 max+0.5])
