%% 单独4个，看看是什么样子
clear all;clc

%% para 
f1=1.86;
dd1=[96.63 96.43 95 93.61];% alpha2   不使复合轴
dd3=[95.38 93.33 91.54 91];% alpha2
dd=[dd1;dd3]*pi/180-pi/2;
load result
load result_b
load alpha_package1
    for i_a=1:4
        figure('color',[1 1 1]);
for i_m=1:2
    

[aa1,aa2,index1] = paper1014_dan_func_2( f1,result_b(i_m,i_a),alpha_package1(i_m,i_a),0);
aa=zeros(2,size(aa1,1));
for iop=1:size(aa1,1)  
aa(:,iop)=[cos(dd(i_m,i_a)) sin(dd(i_m,i_a));-sin(dd(i_m,i_a)) cos(dd(i_m,i_a))]*[aa1(iop);aa2(iop)];
end
aa=aa*1000;
plot(aa(1,:),aa(2,:),'Color',[0 0 0])
hold on;
% plot(aa(1),ypp1,'Color',[0 0 0])%中部长段
%     hold on
%       text(0,0,'O');
%    plot(0,0,'.','Markersize',13,'Color',[0 0 0])
     xlabel('x-axis (mm)')
     ylabel('y-axis (mm)')
   plot([0 aa(1,end)],[0 aa(2,end)],'--','Color',[0 0 0])
   scatter(aa(1,end)/2,aa(2,end)/2)
%   plot([aa(1,end)/2 aa(1,index1-1)],[aa(2,end)/2 aa(2,index1-1)],'--','Color',[0 0 0])

          
%     if alpha_change==size(alpha_package,1)
%           plot([final_disp(1,1) final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
%           plot([0 final_disp(1,1)],[0 0],'--','Color',[0 0 0])
%    else
%           plot([-final_disp(1,2)/tan(pi-alpha)+final_disp(1,1) final_disp(1,1)],[0 final_disp(1,2)],'--','Color',[0 0 0])
%           plot([0 -final_disp(1,2)/tan(pi-alpha)+final_disp(1,1)],[0 0],'--','Color',[0 0 0])
%    end  
end
xlim([0 170]);
ylim([0 300]);
    set(gcf,'unit','centimeters','position',[3 5 18 18]);
    set(gca,'Position',[.15 .15 .4 .8]);    
     hold off;
end

%     for i_a=1:4
%         plot
%     end
  
%[aa1,aa2] = paper1014_dan_func( f1,result_b(1,1),alpha_package1(1,1),0)
