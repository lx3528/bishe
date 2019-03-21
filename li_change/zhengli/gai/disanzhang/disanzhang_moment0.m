%%%做第三章的力矩范围图---直行
%% 假设是在x为10mm处达到最大失稳力，

clear all;clc;
xmm=9.3;
figure(1);

k=12;
x=[2:0.4:14];
eta=0.8;
mu_g=0.07;
mu_s=0.37;
D=22*0.001;
p=pi*D*tan(10/180*pi)*10;
f_kx=zeros(size(x,2),1);
f_min=k*x;%not get

fmm=4*k*xmm*mu_s;
for i=1:size(x,2)
if x(i)>xmm
    f_kx(i)=k*xmm;
else f_kx(i)=k*x(i);
end
end
min=mu_g.*(f_min')*p/pi/eta;
max=(mu_g+mu_s).*(f_kx)*p/pi/eta;
%plot(x,min,x,max)
fill([x flip(x)],[min' flip(max')],'k')
%legend('最小值','最大值')
xlim=get(gca,'Xlim'); % 获取当前图形的纵轴的范围
ylim=get(gca,'Ylim');
text('Interpreter','latex','String','$F_{lim}$', 'Position',[(xlim(1)+xlim(2))/7 -(ylim(1)+ylim(2))/19+(mu_g+mu_s).*(k*xmm)*p/pi/eta],'FontSize',16)
hold on
plot(xlim,[(mu_g+mu_s).*(k*xmm)*p/pi/eta,(mu_g+mu_s).*(k*xmm)*p/pi/eta],'m--'); 
%text((xlim(1)+xlim(2))/3,(mu_g+mu_s).*(k*xmm)*p/pi/eta,'F') 
xlabel('x/mm')
ylabel('T/N/m')

alpha(.2)

%