%% ��һ������
%https://zhidao.baidu.com/question/488505101.html
% dy2=@(t,y) y-2*t/y;
% [t,y] = ode45(dy2,[0 1],1);
% plot(t,y)
%% ��������ԭ����
% dy = @(t,y) [y(2);y(1) + 1];
% options=odeset('events',@events1); 
% [t,y,ai,bi,ci] = ode45(dy,[0 12],[0 1],options);
% plot(t,y)

%% ��������
dy = @(t,y) [y(2);y(1) + 1];
%https://wenku.baidu.com/view/ef1f7737c1c708a1294a445c.html
%�ֹ������΢�ַ��̵õ���y=e^x-1
options=odeset('events',@events1); 
[t,y,ai,bi,ci] = ode45(dy,[0 12],[0 0],options);
%ode�ڶ������������y��ֵ��ѡ��ȡt�ķ�Χ--[0 12]
%��������ʾy�ĳ�ʼֵ

%ai��ʾ���� ������ʽ��t����ֵ--2.6338
%bi 1Ϊ�޶�ֵ�򣬵ڶ���Ϊ����ֵ���ĵ�һ����ֵ��Ҳ��ai�Ķ�Ӧy����ֵ��
%ci ����

%@enents�ڲ�
% function [value,isterminal,direction] = events1(t,y)
% value = y(1)-6;
% isterminal= 0;
% direction = 0;
% isterminal��⵽ָ������ʱ���Ƿ���ֹode45����������
% 1��ʾ��ֹ��0��ʾ����

% direction��value�������ķ���
% -1��ʾ����������+1��ʾ�ɸ�����
% ��������������⣬��Ȼ����������
%0��������--odeset event�鿴

plot(t,y)

