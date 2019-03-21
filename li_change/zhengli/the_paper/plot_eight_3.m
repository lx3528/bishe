%% 8 para 2
clear all;clc

%% para 
f1=1.86;
dd1=[96.63 96.43 95 93.61];% alpha2   不使复合轴
dd3=[95.38 93.33 91.54 91];% alpha2
dd=[dd1;dd3]*pi/180-pi/2;
load result
load result_b
load alpha_package1
for i_m=1:2
    figure;
    for i_a=1:4
        
[aa1,aa2] = paper1014_dan_func_1( f1,result_b(i_m,i_a),alpha_package1(i_m,i_a),0);
aa=zeros(2,size(aa1,1));
for iop=1:size(aa1,1)  
aa(:,iop)=[cos(dd(i_m,i_a)) sin(dd(i_m,i_a));-sin(dd(i_m,i_a)) cos(dd(i_m,i_a))]*[aa1(iop);aa2(iop)];
end
plot(aa(1,:),aa(2,:),'Color',[0 0 0])
hold on;
% plot(aa(1),ypp1,'Color',[0 0 0])%中部长段
%     hold on
%       text(0,0,'O');
%    plot(0,0,'.','Markersize',13,'Color',[0 0 0])
     
xlim([0 0.17]);
ylim([0 0.3]);
    set(gcf,'unit','centimeters','position',[3 5 10 10]);
    set(gca,'Position',[.15 .15 .4 .8]);
   
    end
     hold off;
end

bdgree=[4.4 5.5 7.1 8.5;3.6 4.6 5.8 7.1]*10^-2;
r_s=500*10^-3/62;
point=[(13+12)*r_s;(13+12+6)*r_s;(13+12+6+6)*r_s;(13+12+6+6+5)*r_s];

figure;
scatter(point,bdgree(1,:));
hold on;
    plot(point,bdgree(1,:),'color','g')
       
       scatter(point,bdgree(2,:));
    plot(point,bdgree(2,:),'color','r')
    
    
    plot(point',result(1,:),'--','color','g')
     scatter(point,result(1,:));  
       
    plot(point,result(2,:),'--','color','r')
    scatter(point,result(2,:));
%     for i_a=1:4
%         plot
%     end
  
%[aa1,aa2] = paper1014_dan_func( f1,result_b(1,1),alpha_package1(1,1),0)
