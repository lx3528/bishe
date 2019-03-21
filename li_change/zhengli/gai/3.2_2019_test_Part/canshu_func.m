function [b_gang] = canshu_func( h )
%函数下不要写东西

e=205.4*10^9;
g=79*10^9;
d=22*10^-3;
b=4*10^-3;
w=3*10^-3;
%% h有这么大吗

n=30;
ib=w^3*b/12;
iw=b^3*w/12;
rr=10*pi/180;
b_gang=(2*e*iw*h*cos(rr))/(pi*d*n*(1+(iw/ib*(sin(rr))^2)+(e*iw/g/(ib+iw)*(cos(rr))^2)));
end


