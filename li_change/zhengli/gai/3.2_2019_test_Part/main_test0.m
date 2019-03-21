%%%% 比较弹簧软轴的最大伸长量
clear all;clc
h=200*10^-3;
ei=0.2341;
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];
point2=point-6*r_s;
%%  得到弧长，下面计算刚度
ei=canshu_func(point2)

beta_stack=[0.1,0.1,0.1,0.1];
%beta_stack_li
%beta_stack=[0.1,0.12,0.14,0.17];
alpha1=[10.67,8.40,6.37,5.1];
alpha2=[47.24,35.22,27.75,18.41];

alpha_alpha=alpha1-alpha2+[90,90,90,90]
alpha_stack=(alpha_alpha)/180*pi;
f_stack=[0.68,0.68,0.68,0.68]*9.8*2.5;%0.34
f_stack2=cos(alpha1/180*pi);
f_stack=f_stack.*f_stack2
ei_step=zeros(size(alpha_stack,2),1)+ei;
%% 计算结果
for i=1:1
out_retu_sum=case1016_func(ei_step,alpha_stack,f_stack,beta_stack)
fprintf('out_retu_sum')
for j = 1:size(ei_step,1)
ei_step(j)=canshu_func(out_retu_sum(j));
end
fprintf('ei_step')

end
%out_retu_sum_der=out_retu_sum(:,2)'.*1000-[6,2,0,-4]

%66.7672   73.9435   77.1693   82.5160
out_retu_sum_der=out_retu_sum(:,2)'.*1000-[-2,-3,-3,-2]
%62.9862   76.2858   87.7991   98.0658
%celiang
celiang=[0.5    1.2   3.7991    6.4]+out_retu_sum_der
%celiang=[65.4862   80.4858   94.5982  106.4658]
figure;
scatter(point2'*1000,out_retu_sum_der,80,'s','MarkerEdgeColor','blue','MarkerFaceColor','white')
hold on;
scatter(point2'*1000,celiang,80,'<','MarkerEdgeColor','green')
% legend('spring shaft in theory', 'spring shaft in actual','Location','northwest');
% xlabel('the arc length of the shaft axis l(mm)')
% ylabel('maximum lateral deflection \Delta(mm)')
legend('理论曲线', '实验曲线','Location','northwest');
xlabel('软轴中轴线弧长 l(mm)')
ylabel('最大侧向位移 \Delta(mm)')
hold off;

celiang_0=celiang;
save celiang_0;
out_retu_sum_der_0=out_retu_sum_der
save out_retu_sum_der_0