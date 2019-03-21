%% 小论文中，比较理论和实际的侧向位移
clear all;clc
%% 经过艰苦的推理
%%  复合轴a1 要小于弹簧轴 同理 a2 大于弹簧轴
%% 因此alpha减小了，结果挠度会减小，但太少，才2mm 3mm是线性变化的
%% 加入gamma
h=200*10^-3;
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];
point2=point-6*r_s;
ei=canshu_func(point2)
%% b也要小-[0.025 0.06 0.1 0.2]
gama=[1,1,1,1]
%gama=[0.50 0.515 0.525 0.545];
%gama=[0.75 0.725 0.70 0.675]+[4 3 2 1]*0.5-0.7;
alpha1_decay=[4.4,3.6,2.7,1.8];
alpha2_decay=-alpha1_decay+[1.1,-2.2,-3.3,-4.4];
beta_stack=[0.1,0.1,0.1,0.1].*gama;
%beta_stack_li
%beta_stack=[0.1,0.12,0.14,0.17];
alpha1=[10.67,8.40,6.37,5.1];
alpha2=[47.24,35.22,27.75,18.41];
%% alpha_change
alpha1=alpha1-alpha1_decay;
alpha2=alpha2-alpha2_decay;
alpha_alpha=alpha1-alpha2+[90,90,90,90]
alpha_stack=(alpha_alpha)/180*pi;
f_stack=[0.68,0.68,0.68,0.68]*9.8*2.5;%0.34
f_stack2=cos(alpha1/180*pi);
f_stack=f_stack.*f_stack2
ei_step=zeros(size(alpha_stack,2),1)+ei;
for i=1:1
out_retu_sum=case1016_func(ei_step,alpha_stack,f_stack,beta_stack)
fprintf('out_retu_sum')
for j = 1:size(ei_step,1)
ei_step(j)=canshu_func(out_retu_sum(j));
end
end
out_retu_sum_der=out_retu_sum(:,2)'.*1000-[-2,-3,-3,-2]
out_retu_sum_der=out_retu_sum_der-[0 1.8 3.2 4.5];
%  61.5998   75.7176   87.7823   98.0192
%celiang
celiang=[-0.6    1.3   2.991    4.6]+out_retu_sum_der
%celiang=[60.9998   75.0176   87.2733   97.6192]
out_retu_sum_der_0=[62.9862   76.2858   87.7991   98.0658];%弹簧软轴
celiang_0=[65.4862   80.4858   94.5982  106.4658];%弹簧软轴
% figure;
% scatter(point2'*1000,out_retu_sum_der-out_retu_sum_der_0,80,'s','MarkerEdgeColor','blue','MarkerFaceColor','white')
% hold on;
% scatter(point2'*1000,celiang-celiang_0,80,'<','MarkerEdgeColor','green')
% legend('the difference of shaft in theory', 'the difference of shaft in actual','Location','northwest');
% xlabel('the arc length of the shaft axis l(mm)')
% ylabel('maximum lateral deflection \Delta(mm)')
% hold off;
figure;
scatter(point2'*1000,celiang_0,'s','MarkerEdgeColor','blue','MarkerFaceColor','white')
hold on;
scatter(point2'*1000,celiang,80,'<','MarkerEdgeColor','green')
legend('弹簧软轴实际挠度', '复合轴实际挠度','Location','northwest');
xlabel('软轴中轴线弧长 l(mm)')
ylabel('最大侧向位移 \Delta(mm)')
hold off;
