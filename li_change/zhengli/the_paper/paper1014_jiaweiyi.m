%%%% �ڶ���������ͬ�Ƕȵ�����
clear all;clc

 m_ju=0;
f=[1]';
pps=1;
alpha_package=[90*pi/180];
%alpha_package=90*pi/180;
der_der=zeros(size(alpha_package,1),1);
der_s=zeros(size(alpha_package,1),1);
for alpha_change=1:size(alpha_package,1)
alpha=alpha_package(alpha_change);
ei=1;f1=f(pps);f1_ei=f1/ei;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;

%% find huchang ��������1
moduan=alpha;
%% Ϊ��һ�������ĳ�ʼ�����ֵ
   
    beta1=[0:0.01:moduan/2]';
    beta2=[moduan/2:0.01:moduan]';beta=[beta1;beta2]; 
    %beta=beta1;
    num=size(beta,1);
    index2=size(beta1,1);
%% 1���任
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    zhili_displace1=zeros(num,3);disp=1;zui_length=20;yijiedao=-m_ju/ei;
    %% 2����
     for i=1:num
    [zhili_displace1(i,1),zhili_displace1(i,2),zhili_displace1(i,3)] =zhili_gai_func( fn1(i),fn2(i),beta(i),yijiedao);
     end
    %% 3λ�ñ任
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
%%--%%
    %% ��Գ���
    %k=tan(pi-alpha/2);
    %xpp1(index2+1)
    %ypp1(index2+1)
    %ypp1(end)
    
    %% �е�
    x_zhong=(0+xpp1(end))/2;
    y_zhong=(0+ypp1(end))/2;
    der_der(alpha_change)=sqrt((xpp1(index2+1)-x_zhong)^2+(ypp1(index2+1)-y_zhong)^2);
    der_s(alpha_change)=zhili_displace1(end,1);
    f=f1/sin(alpha/2);
    
    plot(xpp1,ypp1,'Color',[0 0 0])%�в�����
    hold on;
    %% dian
   text(0,0,'O') ;
   plot(0,0,'.','Markersize',13,'Color',[0 0 0])


end
%     xlim([-0.5 max+0.5])
