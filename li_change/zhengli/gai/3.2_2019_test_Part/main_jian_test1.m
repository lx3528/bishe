%%%原始迭代--应该没用

erjie_jian_func(0.17)

% options = optimset('GradObj', 'off', 'MaxIter', 30);
% x = fminunc(@erjie_jian_func,0.1,options);
% x
number=44
length_stack=zeros(1,number);
point2=0.0001;
for i=1:number
    length_stack(i)=erjie_jian_func(point2)
    if i>1
    length_stack(i)=length_stack(i)-length_stack(i-1)
    end
    point2=length_stack(i)
end
plot(1:number,length_stack)