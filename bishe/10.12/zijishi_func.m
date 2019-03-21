function [s_length,x_length,y_length] = zijishi_func( beta,fx,fy,ei )
%函数下不要写东西
%% beta是什么



k3=sqrt(fx/ei);
k4=sqrt(fy/ei);
eps=0.000001;
s_s=@(theta) 1./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_length=quad(x_theta,0,beta);
    y_length=quad(y_theta,0,beta);
    s_length=quad(s_s,0,beta);
    
end