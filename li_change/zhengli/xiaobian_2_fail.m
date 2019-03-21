
f17=1;f18=1;ei=1;m1=0.3637;
%% want 在力坐标下，求出和力矩对应的位置
%%%ei f17 f18 moduan m1
%%%chu xpp ypp 
moduan=pi/2;
beta=[pi/1024:0.01:moduan]';
% f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
% f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);
num=size(beta,1);zui_length=20;
zhili_displace=zeros(num,3);disp=1;
%m1=0;
yijiedao=-m1/ei;
for i=1:num
    [zhili_displace(i,1),zhili_displace(i,2),zhili_displace(i,3)] =zhili_weifenfangcheng_func( f17,-f18,beta(i),yijiedao,zui_length,disp)
end
plot(zhili_displace(:,2),zhili_displace(:,3))
