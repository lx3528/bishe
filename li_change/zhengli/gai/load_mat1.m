clear all;clc;
% 
% %% alpha不变的
% load('alpha_81_f_2.9957.mat','f_and_beta')
% a0=f_and_beta;
% a1=f_and_beta(1:20,2);
% load('alpha_81_f_0.8_2_0.01.mat','f_and_beta')
% b0=f_and_beta;
% b1=f_and_beta(1:20,2);
% load('alpha_81_f_2.3560.mat','f_and_beta')
% c0=f_and_beta;
% c1=f_and_beta(1:20,2);
% cc=f_and_beta(1:20,1);
% plot(cc,c1,'r',cc,b1,'g',cc,a1,'b')
% %说明还有一种影响没有算到，变化不是线性的。

%% alpha变化的---距离之差吻合，说明alpha仅改变f的缩放。
load('alpha_71_f_2.9957.mat','f_and_beta')
p0=f_and_beta(1:19,2);
load('alpha_76_f_2.9957.mat','f_and_beta')
p1=f_and_beta(1:19,2);
load('alpha_81_f_2.9957.mat','f_and_beta')
p2=f_and_beta(1:19,2);
pp=f_and_beta(1:19,1);
load('alpha_61_f_2.9957.mat','f_and_beta')
p3=f_and_beta(1:19,2);

plot(pp,p0,'r',pp,p1,'g',pp,p2,'b',pp,p2-p0,'y',pp,2*(p1-p0),'k',pp,p0-p3,'--')
% hold on;
% b=bar(p1-p0);
% hold on
% set(gca,'XGrid','off');
% ch = get(b,'children');
% set(gca,'XTickLabel',{'100','200','300','400','500','600'});