%% 8 para 2
clear all;clc

%% para 
f1=1.86;

load result
load result_b
load alpha_package1
for i_m=1:2
    for i_a=1:4
        figure;
[aa1,aa2] = paper1014_dan_func( f1,result_b(i_m,i_a),alpha_package1(i_m,i_a),0);
hold on ;        
xlim([0 0.15]);
ylim([0 0.3]);
    set(gcf,'unit','centimeters','position',[3 5 10 10]);
    set(gca,'Position',[.15 .15 .4 .8]);
    hold off;
    end
end

%[aa1,aa2] = paper1014_dan_func( f1,result_b(1,1),alpha_package1(1,1),0)
