function [ dtheta ] = l5( s,theta )
%L1 此处显示有关此函数的摘要
%   此处显示详细说明

dtheta=zeros(2,1);
%y=x(1)
%z=x(2)
k3=1;
k4=1;
dtheta(1)=theta(2);
dtheta(2)=k4^2*cos(theta(1))-k3^2*sin(theta(1))


end
%
