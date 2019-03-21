
alpha=pi/3;
ei=1;
f1=1;


alpha2=[45,50,55,60,65]';
num2=size(alpha2,1);
alpha2_tr=alpha2/180*pi;
index=60;beta_long_ni=linspace(0.00001,pi/2,index)';
inp=[1 2 3 4 5 6 7 8]';
num1=size(inp,1)
%[huchang,d]=case_621(f1,ei,alpha,beta_long)
%[huchang,d]=case_621_notu( f1,ei,alpha,beta_long)%%%4.8690 1.4476

for i=1:num2
    alpha=alpha2_tr(i)%%%%alpha==1.0472
    for j=1:num1%%%j==1 
        beta_long=beta_long_ni(inp(j));%%%beta_long=0.5236
    [huchang(i,j),d(i,j)]=case_621_notu_func( f1,ei,alpha,beta_long)
    
    end
end

