function [out_sum] = case1016_func( ei,alpha_stack,f_stack,beta_stack )
%函数下不要写东西
% return huchang der banjing
%% 储存向量的定义
out_sum=zeros(size(alpha_stack,2),4);
out_hu=zeros(size(alpha_stack,2),1);
out_banjing=zeros(size(alpha_stack,2),1);
out_der=zeros(size(alpha_stack,2),1);
%% two displacement 参数定义2

rao_displace=zeros(size(alpha_stack,2),6);

for i_a=1:size(alpha_stack,2)
    fprintf('start %d%%',i_a/size(alpha_stack,2)*100)
f1=f_stack(i_a);f1_ei=f1/ei(i_a);
alpha=alpha_stack(i_a);
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;

for i_b=1:size(beta_stack,2)
    %% 求a点
    beta_transform=beta_stack(i_b);
[rao_displace(i_b,1),rao_displace(i_b,2),rao_displace(i_b,3)] =erjie_gai_func( f5,f6,beta_transform);
    xa=rao_displace(i_b,2);
    ya=rao_displace(i_b,3);
%% 为下一步所做的初始点的数值
    m_ju=f1*rao_displace(i_b,3)+f2*rao_displace(i_b,2);
	out_sum(i_a,4)=m_ju;
    x_start=-2*ya;
    y_start=2*xa;
    moduan=alpha;
    disp=1;zui_length=20;yijiedao=-m_ju/ei(i_a);
	
    %% new only
    %中点的角度
    beta=moduan/2;
    zhili_displace1=zeros(1,3);
    %% 三套件
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    [zhili_displace1(1,1),zhili_displace1(1,2),zhili_displace1(1,3)] =zhili_gai_func( fn1,fn2,beta,yijiedao);
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
    xp=x_start+xpp1;
    yp=y_start+ypp1; 
%% 坐标变换求对称轴
    k=tan(pi-alpha/2); 
   x_zhong=(k*xp-yp)/(k+1/k);
   y_zhong=x_zhong*(-1/k);
%     %% huchang
     out_sum(i_a,1)=rao_displace(i_a,1)*4+zhili_displace1(end,1);%相同
out_hu(i_a,1)=out_sum(i_a,1);
%     %% 中段形变
     out_der(i_a,1)=sqrt(xp^2+yp^2-x_zhong^2-y_zhong^2);
      out_sum(i_a,2)=out_der(i_a,1);
%         %% 管道半径
        out_sum(i_a,3)=-yp/k+xp;
        out_banjing(i_a,1)=out_sum(i_a,3);
end

end
end