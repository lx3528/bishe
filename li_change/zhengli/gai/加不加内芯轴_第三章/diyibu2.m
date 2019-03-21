%% 2018.11.9
%% 第2步，改变alpha为，32.5,35 分别在beta区间尝试，得到符合规定的半径！
clear all;clc

%% 改变alpha alpha_stack---i_al--30-90度
%start_angle=60;
%end_angle=90;
%alpha_stack1=linspace(start_angle,end_angle,end_angle-start_angle+1);%lie
alpha_stack=32.5/180*pi;
%% 改变f---i_f----1-5
start_f=0.2;
end_f=4.9;
%f_stack=linspace(start_f,end_f,floor((end_f-start_f)/0.01)+1);
f_stack=99;
ei=1;
%% 改变beta
index=50;zui_length=20;

start_beta=0.1;
end_beta=11;
beta_stack1=linspace(start_beta,end_beta,floor((end_beta-start_beta)/0.01)+1);%10度
beta_stack=beta_stack1/180*pi;
%beta_stack=0.1/180*pi;
%% 储存向量的定义
everything_stack=zeros(size(alpha_stack,2),2);
  flag=zeros(size(alpha_stack,2),size(f_stack,2));
out_sum=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2),3);
out_hu=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2));
out_banjing=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2));
for i_a=1:size(alpha_stack,2)
    fprintf('start %d%%',i_a/size(alpha_stack,2)*100)
    
    
  
    %s0=2.1698;%f=1 alpha不变---beta=1.1097du
%s0=2.9957;%f=1 alpha不变---beta=6du
%s0=2.3560;%见后面
%s0=2.9957;
    %f_and_beta=zeros(size(f_stack,2),3);
for i_f=1:size(f_stack,2)
f1=f_stack(i_f);f1_ei=f1/ei;
alpha=alpha_stack(i_a);
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
%% two displacement 参数定义2
rao_displace=zeros(size(beta_stack,2),6);
%% 每一个beta
if ~exist('set1_index','var')
b_start=1;
%%%如果上一个不是第一个
else
b_start=set1_index;
end
for i_b=b_start:size(beta_stack,2)
    %% 求a点
    %beta_transform=beta_long(inp(j));
    beta_transform=beta_stack(i_b);
[rao_displace(i_b,1),rao_displace(i_b,2),rao_displace(i_b,3)] =erjie_gai_func( f5,f6,beta_transform);
    xa=rao_displace(i_b,2);
    ya=rao_displace(i_b,3);
%% 为下一步所做的初始点的数值
    m_ju=f1*rao_displace(i_b,3)+f2*rao_displace(i_b,2);
    x_start=-2*ya;
    y_start=2*xa;

    moduan=alpha;
    disp=1;zui_length=20;yijiedao=-m_ju/ei;

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
     out_sum(i_a,i_f,i_b,1)=rao_displace(i_b,1)*4+zhili_displace1(end,1);%相同
out_hu(i_a,i_f,i_b)=out_sum(i_a,i_f,i_b,1);
%     %% 中段形变
%     out_der=sqrt(xp^2+yp^2-(final_disp(1,1)^2+final_disp(1,2)^2)/4);
      out_sum(i_a,i_f,i_b,2)=sqrt(xp^2+yp^2-x_zhong^2-y_zhong^2);
%         %% 管道半径
        out_sum(i_a,i_f,i_b,3)=-yp/k+xp;
        out_banjing(i_a,i_f,i_b)=out_sum(i_a,i_f,i_b,3);
end
% set1=out_hu(i_a,i_f,floor(size(beta_stack,2)/2));
% for indexx=1:size(beta_stack,2)
%     if(abs(out_hu(i_a,i_f,indexx)-s0)<abs(set1-s0))
%         flag(i_f)=1;
%         set1=out_hu(i_a,i_f,indexx);
%         set1_index=indexx;
%         %beta 
%     end
% end
% fprintf('worked on %d%%',i_f/size(f_stack,2)*100)
% f_and_beta(i_f,1)=f1;
% f_and_beta(i_f,2)=beta_stack(set1_index);%弧度
% f_and_beta(i_f,3)=set1;

banjing1=0.6446;
set1=out_sum(i_a,i_f,floor(size(beta_stack,2)/2),3);
for indexx=1:size(beta_stack,2)
    if(abs(out_sum(i_a,i_f,indexx,3)-banjing1)<abs(set1-banjing1))
        flag(i_f)=1;
        set1=out_sum(i_a,i_f,indexx,3);
        set1_index=indexx;
    end
end

end
%f运行完了，找f
% banjing0=2.7334;
% set2=out_sum(i_a,floor(i_f/2),i_b,3);
% everything_stack(i_a,1)=alpha_stack1(i_a);
% for indexx=1:size(f_stack,2)
%     if(abs(out_sum(i_a,indexx,i_b,3)-banjing0)<abs(set2-banjing0))
%         flag(i_a,indexx)=1;
%         everything_stack(i_a,2)=out_sum(i_a,indexx,i_b,3);
%         set2_index=indexx;
%  
%     end
% end
% save('for2-2.7334-60-90-5.mat','everything_stack')



 %fprintf('worked on %d%%',i_f/size(f_stack,2)*100)
% f_and_alpha(i_f,1)=f1;
% f_and_alpha(i_f,2)=beta_stack(set1_index);%弧度
% f_and_alpha(i_f,3)=set1;
end

% save('alpha_81_f_0.8_2_0.01.mat','f_and_beta')
% %% f公式 0.05025f^2+(-0.03833)f+0.0074
% s0=2.1698;%f=1 alpha不变---beta=1.1097du

% save('alpha_81_f_2.9957.mat','f_and_beta')---前20个
%f 公式 bispuare 0.166 -0.07419 0.01293
% %s0=2.9957;%f=1 alpha不变---beta=6du
% ton2_a=f_and_beta(:,1);
% ton2_b=f_and_beta(:,2);

% s0=2.3560;%f=1 alpha不变-beta=1.8060du
% save('alpha_81_f_2.3560.mat','f_and_beta')
% ton2_a=f_and_beta(:,1);
% ton2_b=f_and_beta(:,2);
%f 0.06941*t.^2+( -0.04841)*t+0.01046

%% 导入画图比较

%% 同样alpha，圆开是我太欢乐，两个弧长的比较
%结论， 1同弧长和alpha，不同力下，不同角度，但变化趋势一样。----弯曲角由弹簧内部自动定义，在不同弯曲角下会发生变化，需要根据实际测量确定
%2同弧长，同力，但角度随alpha变化成倍，说明--alpha仅通过影响力来影响角度变化。
%t=[0.1047:0.001:0.1745];%10*pi/180
%plot(t,0.05025*t.^2+(-0.03833)*t+0.0074,'*',t,0.166*t.^2+( -0.07419)*t+0.01293,'--',t,0.06941*t.^2+( -0.04841)*t+0.01046,'--')

% plot(t,0.05025*t.^2+(-0.03833)*t+0.0074,'*',t,0.166*t.^2+( -0.07419)*t+0.01293,'--',t,0.1437*t.^2+(-0.09368)*t+0.02833,'--')

%% 假如alpha变化10度，beta的变化方法
% save('alpha_71_f_2.9957.mat','f_and_beta')
%plot(f_and_beta(:,1),f_and_beta(:,2))
% ton2_a=f_and_beta(:,1);
% ton2_b=f_and_beta(:,2);
%f 公式 
%% 61
% save('alpha_61_f_2.9957.mat','f_and_beta')%只能用19个，
%% 变化5度，beta变化
% save('alpha_76_f_2.9957.mat','f_and_beta')%只能用19个，
% plot(f_and_beta(:,1),f_and_beta(:,2))
% ton2_a=f_and_beta(:,1);
% ton2_b=f_and_beta(:,2);

fprintf('finish')