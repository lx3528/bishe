% start_beta end_beta alpha_stack f_stack ei banjing1
% beta_stack1(set1_index) set1_index  size(beta_stack1,2) out_hu(1,1,set1_index) out_der(1,1,set1_index) out_banjing(1,1,set1_index)
clear all;clc
%% �ı�alpha alpha_stack---i_al--30-90��
alpha_stack=35/180*pi;
%% �ն� 0.3���õ�
shaft_ratio=0.3;
f=99;
f_stack=f;
ei=1;
%% �ı�beta
start_beta=0.001;
end_beta=11;
beta_stack1=linspace(start_beta,end_beta,floor((end_beta-start_beta)/0.01)+1);%10��
beta_stack=beta_stack1/180*pi;
%beta_stack=0.1/180*pi;
%% ���������Ķ���
everything_stack=zeros(size(alpha_stack,2),2);
  flag=zeros(size(alpha_stack,2),size(f_stack,2));
out_sum=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2),3);
out_hu=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2));
out_banjing=zeros(size(alpha_stack,2),size(f_stack,2),size(beta_stack,2));
for i_a=1:size(alpha_stack,2)
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
for i_b=b_start:size(beta_stack,2)
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
      out_der(i_a,i_f,i_b)=out_sum(i_a,i_f,i_b,2);
%         %% �ܵ��뾶
        out_sum(i_a,i_f,i_b,3)=-yp/k+xp;
        out_banjing(i_a,i_f,i_b)=out_sum(i_a,i_f,i_b,3);
end

banjing1=0.6457;
set1=out_sum(i_a,i_f,floor(size(beta_stack,2)/2),3);
for indexx=1:size(beta_stack,2)
    if(abs(out_sum(i_a,i_f,indexx,3)-banjing1)<abs(set1-banjing1))
        flag(i_f)=1;
        set1=out_sum(i_a,i_f,indexx,3);
        set1_index=indexx;
    end
end
end
end
fprintf('finish_num2')