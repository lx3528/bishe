%% 三个都需要能解出公式的形式

%% 弧长
%f1 beta alpha ei 
%% 2
f1_ei=f1/ei;
f2=f1_ei*sin(alpha)/(1+cos(alpha));
f5=f1_ei;f6=-f2;f9=f5;f10=f6;
f1_jue=f5;f2_jue=f6;
k3=sqrt(f1_jue);
k4=sqrt(f2_jue);
eps=0.000001;
s_theta=@(theta) 1./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))))
s_final=quad(s_theta,0,beta);
%% 
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta)))));
    x_length=quad(x_theta,0,beta);
    y_length=quad(y_theta,0,beta);
    
        x_start=-2*y_length;
    y_start=2*x_length;
    
        fn1=f1*cos(beta)+f2*sin(beta);
    fn2=f1*sin(beta)-f2*cos(beta);
    s_theta=@(theta) 1./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    x_theta=@(theta) cos(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    y_theta=@(theta) sin(theta)./(eps+sqrt(2*(k3^2*(cos(theta)-cos(beta))+k4^2*(sin(theta)-sin(beta))))+yijiedao^2/2);
    x_length=quad(x_theta,0,beta);
    y_length=quad(y_theta,0,beta);
    s_final=quad(s_theta,0,beta);
        [zhili_displace1(1,1),zhili_displace1(1,2),zhili_displace1(1,3)] =zhili_gai_func( fn1,fn2,beta,yijiedao);
    xpp1=zhili_displace1(:,2).*cos(pi/2-beta)-zhili_displace1(:,3).*sin(pi/2-beta);
    ypp1=zhili_displace1(:,2).*sin(pi/2-beta)+zhili_displace1(:,3).*cos(pi/2-beta);
    xp=x_start+xpp1;
    yp=y_start+ypp1; 
    m_ju=f1*rao_displace(i_b,3)+f2*rao_displace(i_b,2);
    yijiedao=-m_ju/ei;
    