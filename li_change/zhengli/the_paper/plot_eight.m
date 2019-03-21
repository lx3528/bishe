%% 8 para
clear all;clc
point=zeros(4,1);
% 0.2016    0.2500    0.2984    0.3387
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];


%% 2 八个角度---
dd1=[96.63 96.43 95 93.61];% alpha2   不使复合轴
%dd2=[137.55 127.11 114.65 105.03];%alpha 1
dd2=[53.13 37.14 24.54 15.36];
dd3=[95.38 93.33 91.54 91];% alpha2
%dd4=[139.87 129.41 115.81 106.39];%alpha 1
dd4=[57.68 41.25 27.35 17.93];
%alpha_package1=[dd1-dd2;dd3-dd4]
%alpha_package1=[dd1-90+360-90-dd2;dd3-90+360-90-dd4]*pi/180;
% 139.0800  149.3200  160.3500  168.5800
%  135.5100  143.9200  155.7300  164.6100
alpha_package1=[dd1-dd2;dd3-dd4]*pi/180;
result=zeros( size(alpha_package1));
result_b=zeros( size(alpha_package1));
f1=1.86;

%% another visual plot
for i_m=1:2
    for i_a=1:4
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a);
gg=1;
b=[0.003:0.0005:0.25];
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    gg=0;
    index1=i;
    if(b(end)==b(index1))
    gg=1;
end
    break
end

end
if exist('index1','var') && gg==0
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
result_b(i_m,i_a)=b(index1-1)*(der_s(index1)-l1)/allbatch+b(index1)*(l1-der_s(index1-1))/allbatch;
end
    end
end

