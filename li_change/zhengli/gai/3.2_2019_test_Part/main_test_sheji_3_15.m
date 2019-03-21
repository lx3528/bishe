%�ڶ���--���ɺ���������
clear all;clc
h=300;
%%%����˿��
e=205.4*10^9;
g=79*10^9;
d=22*10^-3;
b=4*10^-3;
w=3*10^-3;

n=30;
ib=w^3*b/12;
iw=b^3*w/12;
rr=10*pi/180;
b_gang=(2*e*iw*h*cos(rr))/(pi*d*n*(1+(iw/ib*(sin(rr))^2)+(e*iw/g/(ib+iw)*(cos(rr))^2)));
zhouxiang_gang=4*g*(ib+iw)*h*(b*w)/(pi*d*n*cos(rr)*(d^2*b*w+4*(ib+iw)))

%% ruanzhou
% bb=20*10^-3;
% ll=300*10^-3;
% ee=5*10^7;
% gg=ee/(2*(1+0.3));
% bb_gang=pi*ee*bb^4/64/l1;
% kk2=pi*ee*bb^2/4;


%% �������Ƕ���Ӱ��
%����--������---�����ն�Ӱ��
% rr=10*pi/180;
% rr1=[1:0.4:15];
% rr=rr1*pi/180;
% b_gang=(2*e*iw*h*cos(rr))./(pi*d*n*(1+(iw/ib*(sin(rr)).^2)+(e*iw/g/(ib+iw)*(cos(rr)).^2)));
% zhouxiang_gang=4*g*(ib+iw)*h*(b*w)./(pi*d*n*(cos(rr))*(d^2*b*w+4*(ib+iw)))
% 
% figure
% [AX,H1,H2]=plotyy([rr1'],[b_gang'],rr1',zhouxiang_gang);
% 
% set(get(AX(1),'Ylabel'),'string','�����ն�N/m');
% set(get(AX(2),'Ylabel'),'string','ѹ���ն�N/m');
% 
% set(H2,'linestyle','--')
% xlabel('�Ƕȷ�Χ\circ');
% legend([H1(1),H2],'�����ն�','ѹ���ն�')

%% tanhuang d
% ddd=[10:0.4:30];
% d=ddd*10^-3;
% rr=10*pi/180;
% b_gang=(2*e*iw*h*cos(rr))./(pi.*d*n*(1+(iw/ib*(sin(rr))^2)+(e*iw/g/(ib+iw)*(cos(rr))^2)));
% 
% zhouxiang_gang=4*g*(ib+iw)*h*(b*w)./(pi.*d.*n*(cos(rr)).*(d.^2*b*w+4*(ib+iw)))
% figure
% [AX,H1,H2]=plotyy([ddd'],[b_gang'],ddd',zhouxiang_gang);
% 
% set(get(AX(1),'Ylabel'),'string','�����ն�N/m');
% set(get(AX(2),'Ylabel'),'string','ѹ���ն�N/m');
% 
% set(H2,'linestyle','--')
% xlabel('ֱ����Χ/mm');
% legend([H1(1),H2],'�����ն�','ѹ���ն�')

% figure
% plot(ddd,b_gang)
% xlabel('ֱ����Χ/mm');ylabel('���������ն�/(N/m)');
% figure
% plot(ddd,zhouxiang_gang)
% xlabel('ֱ����Χ/mm');ylabel('��������ն�/(N/m)');




%%  b and h 
% xtb=[1:0.5:6];
% xtw=[1:0.5:6];
% 
% b=xtb*10^-3;
% b=b*8.6;
% w=xtw*10^-3;
% aa1=size(b,2);aa2=size(w,2);
% ib=zeros(aa1,aa2);iw=zeros(aa1,aa2);b_gang=zeros(aa1,aa2);zhouxiang_gang=zeros(aa1,aa2);
% for i1=1:aa1
%     for i2 =1:aa2
%         
%     ib(i1,i2)=w(i2).^3.*b(i1)/12;
%     iw(i1,i2)=b(i1).^3.*w(i2)/12;
%     b_gang(i1,i2)=(2*e*iw(i1,i2)*h*cos(rr))/(pi*d*n*(1+(iw(i1,i2)/ib(i1,i2)*(sin(rr))^2)+(e*iw(i1,i2)/g/(ib(i1,i2)+iw(i1,i2))*(cos(rr))^2)));
% zhouxiang_gang(i1,i2)=4*g*(ib(i1,i2)+iw(i1,i2))*h*(b(i1)*w(i2))/(pi.*d.*n*(cos(rr))*(d^2*b(i1)*w(i2)+4*(ib(i1,i2)+iw(i1,i2))))
%     end
% end
% figure
% surf(xtw,xtb,b_gang)
% x1=xlabel('���򳤶�/w');       
% x2=ylabel('���򳤶�/b'); 
% x3=zlabel('�����ն�'); 
% xlim([1 6])
% ylim([1,6])
% figure 
% surf(xtw,xtb,zhouxiang_gang)
% x1=xlabel('���򳤶�/w');       
% x2=ylabel('���򳤶�/b'); 
% x3=zlabel('ѹ���ն�'); 
% xlim([1 6])
% ylim([1,6])
%% xichangzhou-- bb l1
bb=20*10^-3;
l1=300*10^-3;
ee=5*10^7;
gg=ee/(2*(1+0.3));
bb1=[10:0.5:30];
bb=bb1*10^-3;
l11=[100:1:300];

bb_gang=pi*ee*bb.^4/64/l1;
kk2=pi*ee*bb.^2/4;

bb_gang_l1=pi*ee*bb.^4/64/(l1/3);
figure
bb_gang=bb_gang*45;
bb_gang_l1=bb_gang_l1*45;
kk2=kk2*822;

[AX,H1,H2]=plotyy([bb1',bb1'],[bb_gang',bb_gang_l1'],bb1',kk2);

set(get(AX(1),'Ylabel'),'string','�����ն�N/m');
set(get(AX(2),'Ylabel'),'string','ѹ���ն�N/m');

set(H1(2),'linestyle','--','Linewidth',2.5)
set(H1(1),'linestyle','-.')
xlabel('ֱ����Χ/mm');
hold on
legend([H1(1),H1(2),H2],'����300mm�����ն�','����100mm�����ն�','����300mmѹ���ն�')
%% test
% figure
% x11 = 0:0.01:10;
% y11 = sin(x11);
% y21 = cos(x11);
% y31 = 5*sin(2*x11);
%  
% %ʹ��[]��ʾһ������ͼ�Σ�����Ҫת�ó��е���ʽ�����Һ�������Ҫ�ֿ���ʾ
% [AX,H1,H2]=plotyy([x11'],[y21'],x11',y31);
% 
% set(get(AX(1),'Ylabel'),'string','�����ն�N/m');
% set(get(AX(2),'Ylabel'),'string','ѹ���ն�N/m');
% 
% set(H2,'linestyle','--')
% xlabel('ֱ����Χ/mm');
% legend([H1(1),H2],'cos(x)','5*sin(2*x)')
% 
% 






