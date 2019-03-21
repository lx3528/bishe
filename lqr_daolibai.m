
%来自 https://wenku.baidu.com/view/8afb62f3284ac850ad02428b.html
clear;         
A=[ 0 1 0 0; 0 0 0 0;    0 0 0 1;   0 0 29.4 0];      
B=[ 0 1 0 3]';  
C=[ 1 0 0 0;    0 0 1 0];  
D=[ 0 0 ]';    
Q11=5000; 
Q33=100;          
Q=[Q11 0 0 0;      0 0 0 0;   0 0 Q33 0;0 0 0 0];   
R = 1;         
K = lqr(A,B,Q,R)                       %算K      
Ac = [(A-B*K)];
Bc = [B]; 
Cc = [C];
Dc = [D];        
T=0:0.005:5;         
U=ones(size(T));                        %输入单位矩阵    
[Y,X]=lsim(Ac,Bc,Cc,Dc,U,T);            %输出响应     
plot(T,X(:,1),':');hold on;       
plot(T,X(:,2),'-.');hold on;         
plot(T,X(:,3),'.');hold on;        
plot(T,X(:,4),'-')         
legend('小车位移','小车速度','摆杆角度','摆杆角速度')