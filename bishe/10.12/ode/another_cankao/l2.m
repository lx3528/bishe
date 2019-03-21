function [ dtheta ] = l2( s,theta )
dtheta=zeros(2,1);
k=1;
dtheta(1)=theta(2);
dtheta(2)=-sin(theta(1))*k^2;
end

