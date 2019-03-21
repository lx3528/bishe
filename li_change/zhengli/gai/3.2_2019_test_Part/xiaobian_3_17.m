%% 做第三章小变形的表格和图---
h=300*10^-3;
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

s_gang=8*e*ib*h/n/pi/d^3;

f=25;

h_shiji=pi^2/(f*h/b_gang)-((f*h)/s_gang)
h_shiji=h_shiji;

b_gang_bian=b_gang*h/h_shiji;
s_gang_bian=s_gang*h/h_shiji;
q_next=sqrt(f/b_gang_bian*(1+f/s_gang_bian));

x_next=0:0.01:h
plot(x_next,0.03*sin(q_next*x_next))
niu=0.5;
jieduan1=(2-g*(ib+iw)/e/ib);
fc=h/jieduan1*(1-sqrt(1-(pi/niu)^2*jieduan1/(1+g*(ib+iw)/e/iw)*(d/h)^2))

syms fq
result=solve(fq^2*(h^2/s_gang/b_gang)+fq*(h-fc)*h/b_gang-pi^2==0,'fq')
r3=vpa(result,5)
r_f=r3(2);
h_shiji=h-fc;
% temp=h;
% h=h_shiji;h_shiji=h-fc;

b_gang_bian=b_gang*h_shiji/h;
s_gang_bian=s_gang*h_shiji/h;
q_next=sqrt(r_f/b_gang_bian*(1+r_f/s_gang_bian));
figure
x_next=0:0.001:h_shiji;
plot(x_next,0.002*sin(pi/h_shiji*x_next))
hold on



h2=200*10^-3
jieduan2=(2-g*(ib+iw)/e/ib);
fc2=h2/jieduan2*(1-sqrt(1-(pi/niu)^2*jieduan2/(1+g*(ib+iw)/e/iw)*(d/h2)^2))
syms fq
result2=solve(fq^2*(h2^2/s_gang/b_gang)+fq*(h2-fc)*h2/b_gang-pi^2==0,'fq')
r32=vpa(result2,5)
r_f2=r32(2);
h_shiji2=h2-fc2;

x_next2=0:0.001:h_shiji2;
plot(x_next2,0.002*sin(pi/h_shiji2*x_next2),'--')
hold on

h3=150*10^-3
jieduan3=(2-g*(ib+iw)/e/ib);
fc3=h3/jieduan3*(1-sqrt(1-(pi/niu)^2*jieduan3/(1+g*(ib+iw)/e/iw)*(d/h3)^2))
syms fq
result3=solve(fq^2*(h3^2/s_gang/b_gang)+fq*(h3-fc)*h3/b_gang-pi^2==0,'fq')
r33=vpa(result3,5)
r_f2=r33(2);
h_shiji3=h3-fc3;

x_next3=0:0.001:h_shiji3;
plot(x_next3,0.002*sin(pi/h_shiji3*x_next3),'-*')
legend({'h_0=300mm','h_0=200mm','h_0=150mm'},'location','northeast')

xlabel('x轴/mm');ylabel('y轴挠度/mm');
%% 因为画图出错了，我再画一次图
h_h=h-fc3;
figure
plot((0:0.001:h_h)*1000,0.002*sin(pi/h_h*(0:0.001:h_h)))
hold on
plot(x_next2*1000,0.002*sin(pi/h_shiji2*x_next2),'--')

h_h3=h3-fc;
plot((0:0.001:h_h3)*1000,0.002*sin(pi/h_h3*(0:0.001:h_h3)),'-*')
legend({'h_0=300mm','h_0=200mm','h_0=150mm'},'location','northeast')
xlabel('x轴/mm');ylabel('y轴挠度/mm');


%% 用来算力--列表
syms fq
result3=solve(fq^2*(h3^2/s_gang/b_gang)+fq*(h3-fc)*h3/b_gang-pi^2==0,'fq')
%r33(2)
