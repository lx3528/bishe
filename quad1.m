clear;
x=0:pi/100:2*pi;
y=sin(x);
z=trapz(x,y)%z = pi/100*trapz(y)
z = pi/100*trapz(y)

%椭圆积分 方法1
 A = @(a,b,c) integral(@(s)1./((s+a^2).*sqrt((s+a^2).*(s+b^2).*(s+c^2))),0,Inf);
%方法2
 a = 1;
b = 2;
c = 3;
f = @(s) 1./((s+a^2).*sqrt((s+a^2).*(s+b^2).*(s+c^2)));
result = quadgk(f,0,inf)

