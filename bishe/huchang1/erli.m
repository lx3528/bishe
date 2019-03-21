function [ dy ] = erli( t,y )
%ERLI 此处显示有关此函数的摘要
%   此处显示详细说明
%   y1=y,y2=y’
% y''+k^2*y=0
%global f
%k=f;

dy=[y(2);0.5*cos(y(1))-2*sin(y(1))];

end

