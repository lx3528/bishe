%第三章--迭代得到原始迭代方法的速度
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
start_score = point2;
final_score = length_stack(:,number);




x1=[1:1:112];
imax=87;
x_shiji=[1:1:imax];

x_mofang=[1:1:number];
x_mofang=x_mofang/number*imax;
figure;
stack_1=x_mofang-x_mofang(1);
anss=length_stack;
plot(stack_1,anss(1,:),'-*',stack_1,anss(2,:),'--',stack_1,anss(3,:),':.',stack_1,anss(4,:))
legend({'标记2','标记3','标记4','标记5'},'location','southeast')
xlabel('迭代次数')
ylabel('软轴长度') 



%% 取整--插值
% x_shiji_1=x_shiji/imax*number;
% score_bian1=zeros(size(length_stack,1),size(x_shiji_1,2));
% for i=1:size(length_stack,1)
%     x_floor=floor(x_shiji_1);
%     x_ceil=ceil(x_shiji_1);
%     for j=1:size(x_shiji_1,2)
%         if x_floor(j)==0
%             score_bian1(i,j)=(length_stack(i,x_ceil(j)))/2;
%         else
%             score_bian1(i,j)=(length_stack(i,x_floor(j))+length_stack(i,x_ceil(j)))/2;
%         end
%     end
% end
% stack_1=x_shiji;
% figure;
% anss=score_bian1;
% plot(stack_1,anss(1,:),'-*',stack_1,anss(2,:),'--',stack_1,anss(3,:),':.',stack_1,anss(4,:))
% legend({'标记2','标记3','标记4','标记5'},'location','southeast')
% xlabel('迭代次数')
% ylabel('软轴长度')
%,stack_1,anss(3,:),stack_1,anss(4,:)