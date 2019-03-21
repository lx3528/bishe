%% 1016-3 ������Լ�������ķ���
%% �õ���alpha�йأ�����Ļ������betaӦ�ò�����ϣ��ж���
clear all;clc

%% �ı�alpha alpha_stack---i_al--30-90��
start_angle=60;
end_angle=90;
alpha_stack1=linspace(start_angle,end_angle,end_angle-start_angle+1);%lie
alpha_stack=alpha_stack1/180*pi;
%% �ı�f---i_f----1-5
start_f=20/2.8679;
end_f=20/2.8679;
f_stack=linspace(start_f,end_f,floor((end_f-start_f)/0.05)+1);
ei=1;
%% �ı�beta
index=50;zui_length=20;

start_beta=6;
end_beta=6;
beta_stack1=linspace(start_beta,end_beta,floor((end_beta-start_beta)/0.01)+1);%10��
beta_stack=beta_stack1/180*pi;
%% ���������Ķ���
out_sum=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2),3);
out_hu=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2));
for i_a=1:size(alpha_stack,2)
    fprintf('start %d%%',i_a/size(alpha_stack,2)*100)
    
    
    flag=zeros(size(f_stack,2),1);
    %s0=2.1698;%f=1 alpha����---beta=1.1097du
%s0=2.9957;%f=1 alpha����---beta=6du
%s0=2.3560;%������
s0=2.9957;
    f_and_beta=zeros(size(f_stack,2),3);
for i_f=1:size(f_stack,2)
f1=f_stack(i_f);f1_ei=f1/ei;
alpha=alpha_stack(i_a);
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;

%% two displacement ��������2

rao_displace=zeros(size(beta_stack,2),6);

%% ÿһ��beta
if ~exist('set1_index','var')
b_start=1;
%%%�����һ�����ǵ�һ��
else
b_start=set1_index;
end
%

for i_b=b_start:size(beta_stack,2)
    %% ��a��
    %beta_transform=beta_long(inp(j));
    beta_transform=beta_stack(i_b);
[rao_displace(i_b,1),rao_displace(i_b,2),rao_displace(i_b,3)] =erjie_gai_func( f5,f6,beta_transform);
    xa=rao_displace(i_b,2);
    ya=rao_displace(i_b,3);
%% Ϊ��һ�������ĳ�ʼ�����ֵ
    m_ju=f1*rao_displace(i_b,3)+f2*rao_displace(i_b,2);
    x_start=-2*ya;
    y_start=2*xa;

    moduan=alpha;
    disp=1;zui_length=20;yijiedao=-m_ju/ei;

    %% new only
    %�е�ĽǶ�
    beta=moduan/2;
    zhili_displace1=zeros(1,3);
    %% ���׼�
    fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    [zhili_displace1(1,1),zhili_displace1(1,2),zhili_displace1(1,3)] =zhili_gai_func( fn1,fn2,beta,yijiedao);
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
    xp=x_start+xpp1;
    yp=y_start+ypp1; 
%% ����任��Գ���
    k=tan(pi-alpha/2); 
   x_zhong=(k*xp-yp)/(k+1/k);
   y_zhong=x_zhong*(-1/k);

%     %% huchang
     out_sum(i_a,i_f,i_b,1)=rao_displace(i_b,1)*4+zhili_displace1(end,1);%��ͬ
out_hu(i_a,i_f,i_b)=out_sum(i_a,i_f,i_b,1);
%     %% �ж��α�
%     out_der=sqrt(xp^2+yp^2-(final_disp(1,1)^2+final_disp(1,2)^2)/4);
      out_sum(i_a,i_f,i_b,2)=sqrt(xp^2+yp^2-x_zhong^2-y_zhong^2);
%         %% �ܵ��뾶
        out_sum(i_a,i_f,i_b,3)=-yp/k+xp;

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
% f_and_beta(i_f,2)=beta_stack(set1_index);%����
% f_and_beta(i_f,3)=set1;

end
end
%% ������
p0=plot(alpha_stack1,out_hu','-')
hold on;
%
p1=plot(alpha_stack1(1,1,1),out_hu(1),'.','Markersize',11,'Color',[0 0 0])
text(alpha_stack1(1,1,1),out_hu(1),'F1','FontSize',14);

p2=plot(alpha_stack1(1+15),out_hu(1+15,1,1),'.','Markersize',11,'Color',[0 0 0])
text(alpha_stack1(1+15),out_hu(1+15,1,1),'F2','FontSize',14);

p3=plot(alpha_stack1(1+15+15),out_hu(1+15+15,1,1),'.','Markersize',11,'Color',[0 0 0])
text(alpha_stack1(1+15+15),out_hu(1+15+15,1,1),'F3','FontSize',14);

ylabel('l/����')
xlabel('\alpha/�Ƕ�')
%hold off;
%% ���ܵ��뾶
%figure;
p00=plot(alpha_stack1,out_sum(:,1,1,3)','--')
hold on;
%
p1=plot(alpha_stack1(1,1,1),out_sum(1,1,1,3),'.','Markersize',11,'Color',[0 0 0])
text(alpha_stack1(1,1,1),out_sum(1,1,1,3),'F1','FontSize',14);

p2=plot(alpha_stack1(1+15),out_sum(1+15,1,1,3),'.','Markersize',11,'Color',[0 0 0])
text(alpha_stack1(1+15),out_sum(1+15,1,1,3),'F2','FontSize',14);

p3=plot(alpha_stack1(1+15+15),out_sum(1+30,1,1,3),'.','Markersize',11,'Color',[0 0 0])
text(alpha_stack1(1+15+15),out_sum(1+30,1,1,3),'F3','FontSize',14);
%legend([p1 p2 p3],{'F1 60��','F2 75��','F3 90��'},0); 
legend([p0 p00],{'���᳤��','�����뾶'},0); 
ylabel('l/m/����')
xlabel('\alpha/�Ƕ�')

fprintf('finish')