clear;
%lsim 没懂
%http://blog.sina.com.cn/s/blog_86c2eb8f0102v44n.html
%很多函数 https://wenku.baidu.com/view/3e23206bddccda38376baf0e.html
num=[1 1];
den=[1 3 6];
%h=tf(num,den);%获得传递函数
[A,B,C,D]=tf2ss(num,den);%将传递函数转化为状态方程
[u,t]=gensig('pulse',2,10,0.1);%采样间隔为0.1，时间长度为10，在2的倍数处信号幅度为1，其余时间为0.
x=u;
sys=ss(A,B,C,D);%转换--状态空间Continuous-time state-space model
x0=[0 0];
t=0:0.1:10;%此处时间为上面采样时间相同
[y,x]=lsim(sys,u,t,x0)%模型的输出响应，连续系统对任意输入函数的响应
plot(t,y,'b',t,u,'g');