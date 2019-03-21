%第三章--迭代求解--一阶导数--二阶
clear all;clc
%% 实验二---理论和实验中--数值敲定
%% 两个图合为一个，以后合为一个，现在就是分析原因
h=200*10^-3;
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];
point2=point-6*r_s;
point2(1)=0.0001;
point3=point-6*r_s;
point2=[0.0001;0.0001;0.0001;0.0001];
ei=canshu_func(point2);

alpha1=[10.67,8.40,6.37,5.1];
alpha2=[47.24,35.22,27.75,18.41];
%% alpha_change
%alpha1=alpha1-alpha1_decay;
%alpha2=alpha2-alpha2_decay;
alpha_alpha=alpha1-alpha2+[90,90,90,90]
alpha_stack=(alpha_alpha)/180*pi;
f_stack0=[0.68,0.68,0.68,0.68]*9.8*2.5;%0.34
%f_stack2=cos(alpha1/180*pi);
f_stack=f_stack0;
beta_stack=[0.1,0.1,0.1,0.1];
%% %% 计算结果
number=22;
length_stack=zeros(4,number);
for i=1:number
out_retu_sum=case1016_func(ei,alpha_stack,f_stack,beta_stack)
length_stack(:,i)=out_retu_sum(:,1)
%if i>1
%    length_stack(:,i)=length_stack(:,i)-4*length_stack(:,i-1)
%end
for j = 1:size(ei,1)
ei(j)=canshu_func(length_stack(j,i));
end
end
final_score = length_stack(:,number);
beilv=point3./final_score;
for iia=1:size(beilv,1)
    
length_stack(iia,:)=length_stack(iia,:).*beilv(iia)
end
stack_1=1:number;
%plot(stack_1,length_stack(1,:),'*',stack_1,length_stack(2,:),'--',stack_1,length_stack(3,:),stack_1,length_stack(4,:))
%% 0.2951
start_score = length_stack(:,1);
final_score = length_stack(:,number);
x=[1:1:40];
y=zeros(size(x));
y=log(x);
y_max=y(size(x,2));

for i=1:size(length_stack,1)
    score_bian(i,:)=(final_score(i)-start_score(i))*y/y_max+start_score(i);
end
%size(length_stack(:,number))4     1
%bb=repmat(a,[m,n])

%stack_1=stack_1.*100/number;
%bb=repmat(length_stack(:,number),[1,44])
%size(length_stack) 前面是行，后面是列==4    22

%% 迭代次数多的那个，
x1=[1:1:112];
imax=87
x_shiji=[1:1:imax];
y1=log(x_shiji);
y_max1=y1(size(x_shiji,2));
score_bian1=(final_score-start_score)*y1/y_max1;
%%%整合为
anss=[length_stack repmat(length_stack(:,number),[1,size(x1,2)-number])];
score_bian2=[score_bian repmat(length_stack(:,number),[1,size(x1,2)-size(x,2)])];
score_bian1=[score_bian1 repmat(length_stack(:,number),[1,size(x1,2)-size(x_shiji,2)])];

x_mofang=[1:1:number];
x_mofang=x_mofang/number*imax;
figure;
% plot(x1,anss(1,:),'LineWidth',2)
% hold on;
% plot(x1,anss(2,:),'--','LineWidth',2)
% plot(x1,score_bian2(1,:),'LineWidth',1.5)
% plot(x1,score_bian2(2,:),'--','LineWidth',1.5)
% plot(x1,score_bian1(1,:),'LineWidth',0.7)
% plot(x1,score_bian1(2,:),'--','LineWidth',0.7)
plot(x1,anss(1,:),':.','MarkerSize',5,'LineWidth',2)
hold on;
plot(x1,anss(2,:),':.','MarkerSize',5)
plot(x1,score_bian2(1,:),'--','LineWidth',2)
plot(x1,score_bian2(2,:),'--')
%plot(x1,score_bian1(1,:),'LineWidth',2)
%plot(x1,score_bian1(2,:))
plot(x_mofang-floor(x_mofang(1)),length_stack(1,:),'LineWidth',2)
plot(x_mofang-floor(x_mofang(1)),length_stack(2,:))
legend({'标记2 二阶导数','标记3 二阶导数','标记2 一阶梯度','标记3 一阶梯度','标记2 原始','标记3 原始'},'location','southeast')

xlabel('迭代次数');ylabel('软轴长度');