clear;
% for x=5:1:100
% xdai=x;
% a=1;
% miu=1;
% d=5;
% f=xdai.*(1-sqrt(1-a/miu*(d/xdai)^2));
% end
x=5:1:100
a=1;
aa=1;
miu=1;
d=5;
%y=x.*(1-sqrt(1-1./(x.^2)))
y=aa*x.*(1-sqrt(1-a/miu*d^2./(x.^2)))
% f=x.*(1-sqrt(1-5.*(1./x').^2));
figure(1)
plot(x,y,'r')
%qianti

aa=0.813;
a=6.85;
miu=0.5;
d=4;
panduan=d*sqrt(a/miu);
fin=pi;
%r=7.4:0.1:25
r=10
fin=0.8331:0.1:pi;
px=2*r*sin(fin/2);
%x=14.8:0.1:50
y=aa*px.*(1-sqrt(1-a/miu*d^2./(px.^2)));
figure(2)
plot(px,y,'r')
%≤‚ ‘∂‘≤ª∂‘
%xp=6
%yp=xp*(1-sqrt(1-1./(xp^2)))
%yp-y(2)
