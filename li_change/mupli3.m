function [ dtheta ] = mupli3( s,theta )
%L1 此处显示有关此函数的摘要
%   此处显示详细说明
dtheta=zeros(2,1);
global kp
dtheta(1)=theta(2);
dtheta(2)=-kp^2*sin(theta(1))


end
