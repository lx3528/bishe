clear
alpha=asin(0.8)%%%%l=1.66 zuoyou
beta=alpha/2;
f1=1;
f2=f1*(1-cos(alpha))/sin(alpha);

%% ��������
%index=50;
%beta_long=linspace(asin(0.8)/2+0.001,pi/2,index)';

%1 ��p���µ�����Ϊ
%beta1 Ϊp��x�������x��нǡ����Ϊ0,��ʾ����������x��
index2=20;
beta1=linspace(beta,0,index2)';

fx=f1*cos(beta1)+(-f2)*sin(beta1);
fy=(-f1)*sin(beta1)-f2*cos(beta1);

%2 �������
%[sp,xp,yp]
rao_displace=zeros(index2,3);
 for i=1:index2

[rao_displace(i,1),rao_displace(i,2),rao_displace(i,3)]=zijishi_func(beta1(i),fx(i),fy(i),1);
 end
 xx=linspace(0,100,index2)';
% plot(xx,rao_displace(:,2))
% hold on
 %plot(xx,rao_displace(:,3))
plot(rao_displace(:,2),rao_displace(:,3))
%3 ת������
%%1 �˵�����
collect_point=zeros(6,3);
[s_ob,x_ob,y_ob]=zijishi_func(beta1(1),fx(1),fy(1),1);
collect_point(1,:)=[s_ob,-y_ob,x_ob];
% %collect_point(1,2)
% %% ��ת
rao_new_displace=zeros(index2,3);
syms xe1 ye1
for j=1:index2
%rao_new_displace(j,2:3)=[cos(pi/2-beta1(j)),sin(pi/2-beta1(j));-sin(pi/2-beta1(j)),cos(pi/2-beta1(j))]*rao_displace(j,2:3)'+[collect_point(1,2);collect_point(1,3)];
    rao_new_displace(j,2)=cos(-beta1(j))*rao_displace(j,2)+sin(-beta1(j))*rao_displace(j,3);
    rao_new_displace(j,3)=-sin(-beta1(j))*rao_displace(j,2)+cos(-beta1(j))*rao_displace(j,3);
    
end
plot(rao_new_displace(:,2),rao_new_displace(:,3))
% for j=1:index2
% %rao_new_displace(j,2:3)=[cos(pi/2-beta1(j)),sin(pi/2-beta1(j));-sin(pi/2-beta1(j)),cos(pi/2-beta1(j))]*rao_displace(j,2:3)'+[collect_point(1,2);collect_point(1,3)];
%     rao_new_displace(j,2)=cos(pi/2-beta1(j))*rao_displace(j,2)+sin(pi/2-beta1(j))*rao_displace(j,3)-y_ob;
%     rao_new_displace(j,3)=-sin(pi/2-beta1(j))*rao_displace(j,2)+cos(pi/2-beta1(j))*rao_displace(j,3)+x_ob;
%     
% end
%     
% 
% plot(rao_new_displace(:,2),rao_new_displace(:,3))





