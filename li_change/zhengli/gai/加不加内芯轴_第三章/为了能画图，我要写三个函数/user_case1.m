%% ����der2 ��ְ뾶--disizhang
% clear all;clc
% alpha_stack=30/180*pi;
% f_stack=99/1.3;
% ei=1;
% beta_stack=0.21/180*pi;
% [out_hu1,out_der1,out_banjing1] = num1_func( alpha_stack,f_stack,beta_stack,ei )
% start_beta=0.0;
% end_beta=11;
% alpha_stack_2=alpha_stack;
% %%alpha_stack_2=alpha_stack;%%����У׼
% [out_hu2,out_der2,out_banjing2,set1_index,beta_final,beta_num] = num2_func( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_banjing1 )
% 


% %% ��������У׼ huchang
% clear all;clc
% alpha_stack=30/180*pi;
% f_stack=99/1.3;
% ei=1;
% beta_stack=0.91/180*pi;
% [out_hu1,out_der1,out_banjing1] = num1_func( alpha_stack,f_stack,beta_stack,ei )
% start_beta=0.0;
% end_beta=11;
% alpha_stack_2=alpha_stack;
% %%alpha_stack_2=alpha_stack;%%����У׼
% [out_hu2,out_der2,out_banjing2,set1_index,beta_final,beta_num] = num3_func( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_hu1 )

%% �������� huchang ����
% clear all;clc
% alpha_der=2.5/180*pi;
% alpha_stack=30/180*pi;
% f_stack=99/1.3;
% ei=1;
% beta_stack=0.11/180*pi;
% [out_hu1,out_der1,out_banjing1] = num1_func( alpha_stack,f_stack,beta_stack,ei )
% start_beta=0.0;
% end_beta=11;
% alpha_stack_2=alpha_stack+alpha_der;
% out_hu1_b=out_hu1+out_banjing1*alpha_der;
% %%alpha_stack_2=alpha_stack;%%����У׼
% [out_hu2,out_der2,out_banjing2,set1_index,beta_final,beta_num] = num3_func( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_hu1_b )

%% 50bu
% clear all;clc
% step=50;
% alpha_der=5/180*pi/step;
%  f_stack=99/1.3;
% ei=1;
% beta_stack=0.11/180*pi;
% alpha_stack=30/180*pi;
% [out_hu1,out_der1,out_banjing1] = num1_func( alpha_stack,f_stack,beta_stack,ei )
% start_beta=0.0;
% end_beta=2;
% out_hu2=out_hu1
% out_banjing2=out_banjing1
% %fprintf('start %d%%',i_a/size(alpha_stack,2)*100)
% out_inspect1=zeros(step,6);
% for i_der_alpha=1:step
% fprintf('start %d%%',i_der_alpha/step*100)
% alpha_stack_2=alpha_stack+alpha_der;
% out_hu1_b=out_hu2+out_banjing2*alpha_der;
% %%alpha_stack_2=alpha_stack;%%����У׼
% [out_hu2,out_der2,out_banjing2,set1_index,beta_final,beta_num] = num3_func( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_hu1_b )
% out_inspect1(i_der_alpha,1)=out_hu2;
% out_inspect1(i_der_alpha,2)=out_der2;
% out_inspect1(i_der_alpha,3)=out_banjing2;
% out_inspect1(i_der_alpha,4)=set1_index;
% out_inspect1(i_der_alpha,5)=beta_final;
% out_inspect1(i_der_alpha,6)=beta_num;
% end
% 
% save('out_inspect1-0.11-50-30-35.mat','out_inspect1')
%load('out_inspect1-0.11-50-30-35.mat')
%% 2bu
% clear all;clc
% step=2;
% alpha_der=5/180*pi/step;
% f_stack=99/1.3;
% ei=1;
% beta_stack=0.11/180*pi;
% alpha_stack=30/180*pi;
% [out_hu1,out_der1,out_banjing1] = num1_func( alpha_stack,f_stack,beta_stack,ei )
% start_beta=0.0;
% end_beta=2;
% out_hu2=out_hu1
% out_banjing2=out_banjing1
% %fprintf('start %d%%',i_a/size(alpha_stack,2)*100)
% out_inspect1_t=zeros(step,6);
% for i_der_alpha=1:step
% fprintf('start %d%%',i_der_alpha/step*100)
% alpha_stack_2=alpha_stack+alpha_der;
% out_hu1_b=out_hu2+out_banjing2*alpha_der;
% %%alpha_stack_2=alpha_stack;%%����У׼
% [out_hu2,out_der2,out_banjing2,set1_index,beta_final,beta_num] = num3_func( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_hu1_b )
% out_inspect1_t(i_der_alpha,1)=out_hu2;
% out_inspect1_t(i_der_alpha,2)=out_der2;
% out_inspect1_t(i_der_alpha,3)=out_banjing2;
% out_inspect1_t(i_der_alpha,4)=set1_index;
% out_inspect1_t(i_der_alpha,5)=beta_final;
% out_inspect1_t(i_der_alpha,6)=beta_num;
% end
%save('out_inspect1-0.11-2-30-35.mat','out_inspect1')
%% 1000bu
%clear all;clc
step=2;
alpha_der=5/180*pi/step;
f_stack=99/1.3;
ei=1;
beta_stack=0.11/180*pi;
alpha_stack=30/180*pi;
[out_hu1,out_der1,out_banjing1] = num1_func( alpha_stack,f_stack,beta_stack,ei )
start_beta=0.0;
end_beta=1.5;
out_hu2=out_hu1;
out_banjing2=out_banjing1;
%fprintf('start %d%%',i_a/size(alpha_stack,2)*100)
%out_inspect1_t1=zeros(step,6);
out_inspect1_2=zeros(step,6);
alpha_stack_2=alpha_stack;
for i_der_alpha=1:step
fprintf('start %d%%',i_der_alpha/step*100)
%alpha_stack_2=alpha_stack_2+alpha_der;
alpha_stack_2=alpha_stack_2+alpha_der;
out_hu1_b=out_hu2+out_banjing2*alpha_der;
%%alpha_stack_2=alpha_stack;%%����У׼
%%[out_hu2,out_der2,out_banjing2,set1_index,beta_final,beta_num] = num3_func( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_hu1_b )
[out_inspect1_2(i_der_alpha,:)]=num3_func1( alpha_stack_2,start_beta,end_beta,f_stack,ei,out_hu1_b );
out_hu2=out_inspect1_2(i_der_alpha,1);
out_banjing2=out_inspect1_2(i_der_alpha,3);

end
%save('out_inspect1-0.11-10-30-35.mat','out_inspect1_10')
%save('out_inspect1-0.11-50-30-35.mat','out_inspect1_t1')
load('out_inspect1-0.11-10-30-35.mat','out_inspect1_10')
load('out_inspect1-0.11-50-30-35.mat','out_inspect1_t1')

alpha_stack=30/180*pi;
alpha_stack_2=35/180*pi;

pab=(alpha_stack_2-alpha_stack)/size(out_inspect1_2,1)
size(out_inspect1_2,1)

plot((alpha_stack:pab:alpha_stack_2)/pi*180,[out_hu1;out_inspect1_2(:,1)]'*1000,'*')
hold on

pab10=(alpha_stack_2-alpha_stack)/size(out_inspect1_10,1)
plot((alpha_stack:pab10:alpha_stack_2)/pi*180,[out_hu1;out_inspect1_10(:,1)]'*1000,'o')

pab50=(alpha_stack_2-alpha_stack)/size(out_inspect1_t1,1)
plot((alpha_stack:pab50:alpha_stack_2)/pi*180,[out_hu1;out_inspect1_t1(:,1)]'*1000,'--')
legend({'����2��','����10��','����50��'},'location','southeast')
xlabel('�Ƕ�/^o')
ylabel('���᳤��/mm')
hold off;

%% ����뾶
pab=(alpha_stack_2-alpha_stack)/size(out_inspect1_2,1)
plot((alpha_stack:pab:alpha_stack_2)/pi*180,[out_banjing1;out_inspect1_2(:,3)]'*1000,'*')
hold on

pab10=(alpha_stack_2-alpha_stack)/size(out_inspect1_10,1)
plot((alpha_stack:pab10:alpha_stack_2)/pi*180,[out_banjing1;out_inspect1_10(:,3)]'*1000,'o')

pab50=(alpha_stack_2-alpha_stack)/size(out_inspect1_t1,1)
plot((alpha_stack:pab50:alpha_stack_2)/pi*180,[out_banjing1;out_inspect1_t1(:,3)]'*1000,'--')
legend({'����2��','����10��','����50��'},'location','northeast')
xlabel('�Ƕ�/^o')
ylabel('����������/mm')
ylabel('���������뾶/mm')
hold off;
%% �����Ӷ�
pab=(alpha_stack_2-alpha_stack)/size(out_inspect1_2,1)
plot((alpha_stack:pab:alpha_stack_2)/pi*180,[out_der1;out_inspect1_2(:,2)]'*1000,'*')
hold on

pab10=(alpha_stack_2-alpha_stack)/size(out_inspect1_10,1)
plot((alpha_stack:pab10:alpha_stack_2)/pi*180,[out_der1;out_inspect1_10(:,2)]'*1000,'o')

pab50=(alpha_stack_2-alpha_stack)/size(out_inspect1_t1,1)
plot((alpha_stack:pab50:alpha_stack_2)/pi*180,[out_der1;out_inspect1_t1(:,2)]'*1000,'--')
legend({'����2��','����10��','����50��'},'location','southeast')
xlabel('�Ƕ�/^o')
ylabel('����������λ��/mm')
hold off;
%% ��������beta
pab=(alpha_stack_2-alpha_stack)/size(out_inspect1_2,1)
plot((alpha_stack:pab:alpha_stack_2)/pi*180,[beta_stack;out_inspect1_2(:,5)]'/pi*180/10,'*')
hold on

pab10=(alpha_stack_2-alpha_stack)/size(out_inspect1_10,1)
plot((alpha_stack:pab10:alpha_stack_2)/pi*180,[beta_stack;out_inspect1_10(:,5)]'/pi*180/10,'o')

pab50=(alpha_stack_2-alpha_stack)/size(out_inspect1_t1,1)
plot((alpha_stack:pab50:alpha_stack_2)/pi*180,[beta_stack;out_inspect1_t1(:,5)]'/pi*180/10,'--')
legend({'����2��','����10��','����50��'},'location','southeast')
xlabel('�ܵ��Ƕ�/^o')
ylabel('�������ʽǶ�')
hold off;