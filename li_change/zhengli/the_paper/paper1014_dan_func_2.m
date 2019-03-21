function [xpp1,ypp1,index2] = paper1014_dan_func_2( f1,ei,alpha,m_ju)
%%% hold on;
% f=1;
% pps=1;
% ei=1;
% f1=f(pps);
%     m_ju=-2;
%     alpha=90/180*pi;
% alpha_package=[60*pi/180;75*pi/180;90*pi/180];
% 
% for alpha_change=1:size(alpha_package,1)
% alpha=alpha_package(alpha_change);
f1_ei=f1/ei;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
% f5=f1_ei;f6=-f2;
moduan=alpha;
%% 为下一步所做的初始点的数值
    beta1=[0:0.01:moduan/2]';
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
    %% 求对称轴
   % k=tan(pi-alpha/2);
    %% plot
    %% dian
%     text(xpp1(end),ypp1(end),'P');
%    plot(xpp1(end),ypp1(end),'.','Markersize',13,'Color',[0 0 0])
end

