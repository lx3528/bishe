function [xpp,ypp] = xiaobian_2_func( f17,f18,beta,moduan,m1,ei )
%% want 在力坐标下，求出和力矩对应的位置
%%%ei f17 f18 moduan m1
%%%chu xpp ypp  
%beta=[pi/64:0.01:moduan]';
f19=f17*cos(moduan-beta)+f18*sin(moduan-beta);
f20=-f17*sin(moduan-beta)+f18*cos(moduan-beta);
num=size(beta,1);zui_length=20;
zhili_displace=zeros(num,3);disp=1;
%m1=0;
yijiedao=-m1/ei;
for i=1:num
    [zhili_displace(i,1),zhili_displace(i,2),zhili_displace(i,3)] =zhili_weifenfangcheng_func( f19(i),f20(i),beta(i),yijiedao,zui_length,disp)
end
xpp=zhili_displace(:,2).*cos(moduan-beta)-zhili_displace(:,3).*sin(moduan-beta);
ypp=zhili_displace(:,2).*sin(moduan-beta)+zhili_displace(:,3).*cos(moduan-beta);
end