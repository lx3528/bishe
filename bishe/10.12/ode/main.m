%% 第一步测试
%https://zhidao.baidu.com/question/488505101.html
% dy2=@(t,y) y-2*t/y;
% [t,y] = ode45(dy2,[0 1],1);
% plot(t,y)
%% 看不懂的原代码
% dy = @(t,y) [y(2);y(1) + 1];
% options=odeset('events',@events1); 
% [t,y,ai,bi,ci] = ode45(dy,[0 12],[0 1],options);
% plot(t,y)

%% 案例解释
dy = @(t,y) [y(2);y(1) + 1];
%https://wenku.baidu.com/view/ef1f7737c1c708a1294a445c.html
%手工解二阶微分方程得到，y=e^x-1
options=odeset('events',@events1); 
[t,y,ai,bi,ci] = ode45(dy,[0 12],[0 0],options);
%ode第二个参数代表对y赋值，选择取t的范围--[0 12]
%第三个表示y的初始值

%ai表示满足 条件等式的t的数值--2.6338
%bi 1为限定值域，第二个为超过值域后的第一个数值，也是ai的对应y的数值。
%ci 方向？

%@enents内部
% function [value,isterminal,direction] = events1(t,y)
% value = y(1)-6;
% isterminal= 0;
% direction = 0;
% isterminal检测到指定条件时，是否终止ode45函数的运行
% 1表示终止，0表示继续

% direction：value过零点检测的方向
% -1表示由正到负，+1表示由负到正
% 对于我们这个问题，当然是由正到负
%0包括两种--odeset event查看

plot(t,y)

