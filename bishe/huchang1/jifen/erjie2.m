clear all
alpha=asin(0.8)
ei=1
f1=1
t=0.1%qishi
index=100
s_stack=linspace(1,10,index)';%%%1---20
theta_stack=zeros(index,1);
x_length=zeros(index,1);
y_length=zeros(index,1);
for  i=1:index
    s=s_stack(i)
    [ theta_stack(i),x_length(i),y_length(i) ] =erjie_func( alpha,f1,ei,s,t )
    %theta_stack(i)=s+i
%
end
plot(s_stack,theta_stack)