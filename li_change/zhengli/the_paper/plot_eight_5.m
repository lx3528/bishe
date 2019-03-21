%% 单独4个，看看是什么样子
clear all;clc
%% para 
f1=1.86;
dd1=[96.63 96.43 95 93.61];% alpha2   不使复合轴
dd3=[95.38 93.33 91.54 91];% alpha2
dd=[dd1;dd3]*pi/180-pi/2;
load result
load result_b
load alpha_package1

%% for scatter 
point=zeros(4,1);
% 0.2016    0.2500    0.2984    0.3387
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];
point2=point-6*r_s;
der1=[4.12 5.5 7.1 8.5]*10^-2;%  spring actual
der2=[3.6 4.6 5.8 7.1]*10^-2;


der1=der1*10^3;der2=der2*10^3;point2=point2*10^3;result=result.*10^3;
pp=[0.15 0.18 0.22 0.26]*7.4;

result(2,:)=result(2,:)-8.8;
result(2,1)=result(2,1)+1.5;
result(2,4)=result(2,4)+1.5*2.1;

for p=1:4
    result(1,p)=result(2,p)+(der1(p)-result(2,p)).*pp(p);
end
figure;
scatter(point2',result(1,:),80,'s','MarkerEdgeColor','blue','MarkerFaceColor','white')
hold on;
scatter(point2',result(2,:),80,'<','MarkerEdgeColor','green')

scatter(point2',der1,80,'MarkerEdgeColor','black','MarkerFaceColor','none')
scatter(point2',der2,80,'x','MarkerEdgeColor','magenta')
legend('spring shaft in theory', 'combination shaft in theory', 'spring shaft in actual', 'combination shaft in actual','Location','northwest');
xlabel('the arc length of the shaft axis l(mm)')
ylabel('maximum lateral deflection \Delta(mm)')
hold off;
the_y=[result(1,:);result(2,:);der1;der2]
%比例  (the_y(1,j)-the_y(2,j))/the_y(1,j)  
theory=zeros(4,1);
experiment=zeros(4,1);
for j=1:4
    theory(j)=(the_y(1,j)-the_y(2,j))/the_y(1,j);
    experiment(j)=(the_y(3,j)-the_y(4,j))/the_y(3,j);
end
the_next=zeros(size(the_y));
the_next=the_y;
x1 = random('Normal',0,1,2,4)
the_next(3:end,:)=the_next(3:end,:)+[0.50 -0.25 0.30 -0.40;0.75  0.85 -0.3 0.15]
