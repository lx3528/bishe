%%%% qiu b  + der
clear all;clc
%% save result
%    0.0647    0.0832    0.1033    0.1210
%    0.0639    0.0817    0.1016    0.1192
%% the length

point=zeros(4,1);
% 0.2016    0.2500    0.2984    0.3387
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s;];
%% 2 八个角度---
dd1=[96.63 96.43 95 93.61];
dd2=[137.55 127.11 114.65 105.03];

dd3=[95.38 93.33 91.54 91];
dd4=[139.87 129.41 115.81 106.39];
alpha_package1=[dd1-90+360-90-dd2;dd3-90+360-90-dd4];
% 139.0800  149.3200  160.3500  168.5800
%  135.5100  143.9200  155.7300  164.6100
result=zeros( size(alpha_package1))
%% 3
f1=1.86;%%  根据拉压传感器--求得的
%% 如果alpha 90du  s=0.01-0.4   alpha 120du 0.01- 0.3973
%% 4 弹簧轴 根据 b alpha 得到l找对应der。
%%% 1 1  i_m material i_a--length
i_m=1;i_a=1;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;

b=[0.003:0.0005:0.1];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index1=i
    break
end
end
if ~exist('index1','var') 
gg=0
end
if exist('index1','var') 
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
end

result(i_m,i_a)=0.0647;
%% 2 1
i_m=2;i_a=1;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.1];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index1=i
    break
end
end
if ~exist('index1','var') 
gg=0
end
if exist('index1','var') 
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
end
result(i_m,i_a)=0.0639;
%% 1 length
i_m=1;i_a=2;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.2];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index1=i
    break
end
end
if ~exist('index1','var') 
gg=0
end
if exist('index1','var') 
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
end
result(i_m,i_a)=0.0832;

%% 2 length 2
i_m=2;i_a=2;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.2];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index1=i
    break
end
end
if ~exist('index1','var') 
gg=0
end
if exist('index1','var') 
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
end
result(i_m,i_a)=0.0817;

%% 1 length 3
i_m=1;i_a=3;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.2];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index1=i
    break
end
end
if ~exist('index1','var') 
gg=0
end
if exist('index1','var') 
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
end
result(i_m,i_a)=0.1033;
%% 2 length 3
i_m=2;i_a=3;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.2];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index1=i
    break
end
end
if ~exist('index1','var') 
gg=0
end
if exist('index1','var') 
    allbatch=der_s(index1)-der_s(index1-1);
result(i_m,i_a)=der_y(index1-1)*(der_s(index1)-l1)/allbatch+der_y(index1)*(l1-der_s(index1-1))/allbatch;
end
result(i_m,i_a)=0.1016;
%% 1 length 4
i_m=1;i_a=4;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.22];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index2=i
    break
end
end
if ~exist('index2','var') 
gg=0
end
if exist('index2','var') 
    allbatch=der_s(index2)-der_s(index2-1);
result(i_m,i_a)=der_y(index2-1)*(der_s(index2)-l1)/allbatch+der_y(index2)*(l1-der_s(index2-1))/allbatch;
end
result(i_m,i_a)=0.1210;
%% 2 4
i_m=2;i_a=4;
l1=point(i_a);
alpha1=alpha_package1(i_m,i_a)*pi/180;
gg=1;
b=[0.003:0.0003:0.24];
% [der_test1,der_test2]=paper1016_func( f1,b(end),alpha1,0);
% der_test2
der_y=size(b,2);
der_s=size(b,2);
for i=1:size(b,2)
[der_y(i),der_s(i)] = paper1016_func( f1,b(i),alpha1,0);
if(der_s(i)>l1)
    index2=i
    break
end
end
if ~exist('index2','var') 
gg=0
end
if exist('index2','var') 
    allbatch=der_s(index2)-der_s(index2-1);
result(i_m,i_a)=der_y(index2-1)*(der_s(index2)-l1)/allbatch+der_y(index2)*(l1-der_s(index2-1))/allbatch;
end
result(i_m,i_a)=0.1192;