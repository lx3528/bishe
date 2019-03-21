function dy = fun2(  t,y )
%FUN2 此处显示有关此函数的摘要
%   y1=y,y2=y’
% y''+k^2*y=0
global f
k=f;
dy=[y(2);-k^2*y(1)];


end

