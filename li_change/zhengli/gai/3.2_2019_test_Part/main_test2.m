%5.4ʵ�鴫��Ч��1--��ͬ���ó���
clear all;clc
%% ʵ���---���ۺ�ʵ����--��ֵ�ö�
%% ����ͼ��Ϊһ�����Ժ��Ϊһ�������ھ��Ƿ���ԭ��
h=200*10^-3;
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];
point2=point-6*r_s;
ei=canshu_func(point2)
%% bҲҪС-[0.025 0.06 0.1 0.2]
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
f_stack0=[0.68,0.68,0.68,0.68]*9.8*2.5;%0.34
f_stack2=cos(alpha1/180*pi);
f_stack=f_stack0.*f_stack2
%% %% ������
for i=1:1
out_retu_sum=case1016_func(ei,alpha_stack,f_stack,beta_stack)
fprintf('out_retu_sum')
for j = 1:size(ei,1)
ei(j)=canshu_func(out_retu_sum(j));
end
end
%% ��������ٶ��Ǽ�С��
rr=10*pi/180;
d=22*10^-3;
k=1.41*10^5;e=205.4*10^9;
t=pi*d*tan(rr);
g=79*10^9;
b=4*10^-3;
w=3*10^-3;
ib=w^3*b/12;
iw=b^3*w/12;
ip=ib+iw;
f_stack=f_stack0;
t_t=f_stack*d/2;
m_ju=2*out_retu_sum(:,4)';
w_you=(1-f_stack/k/t)*tan(rr)*d.*f_stack/2;

w_tan_ya=f_stack.^2*d^3/8/cos(rr).*(cos(rr)^2/g/ip+sin(rr)^2./ei')

w_tan_niu=t_t.^2*d/2/cos(rr).*(sin(rr)^2/g/ip+cos(rr)^2./ei')

w_tan_wan=m_ju.^2*pi*d/4/pi/e/iw/cos(rr)*(1+iw/ib*sin(rr)^2+e*ib/g/ip*cos(rr)^2)
w_tan_wan=fliplr([1-0.13,0.95-0.39,0.88-0.59,0.81-0.66]).*w_tan_wan;
%w_tan_wan=w_tan_wan_decay+w_tan_wan;
w_f_=0.12*f_stack*d/cos(rr);
w_f_=w_f_.*[0.88,0.95,1.05,1.12]
w_you=w_you*2.8;
w_you=([1,0.95,0.91,0.88]+0.14).*w_you;

figure;
%plot(point2,w_you,'-',point2,w_f_,point2,w_tan_wan,'*')

%% ������ֵ
eta_lilun=(1+w_you./(w_f_+w_tan_wan+w_you))*0.486;
zong=w_f_+w_tan_wan+w_you+[0,0,-0,0.01]
plot(point2*1000,eta_lilun,'--',point2*1000,w_you./zong+0.07)
hold on;

legend({'���۽��','ʵ�ʽ��'},'Location','northeast');
ylim([0 1])
xlabel({'�����������'})
ylabel({'����Ч��'})

%�õ�����ƽ��ֵ--ǰ������ƽ��ֵ--Ϊ 5N�ĸ��غ� 10ת��---0.6545
%0.7282    0.6610    0.5742    0.4760

