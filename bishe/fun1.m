function dy = fun1( t,y )
%FUN1 此处显示有关此函数的摘要
%   y1=y,y2=y’
%   y''=3(1-y^2)*y'-y
dy=[y(2);3*(1-y(1)^2)*y(2)-y(1)];

end

