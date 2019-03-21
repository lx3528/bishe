clear;
arfra=[pi/12:pi/32:pi/2];
%arfra=pi/4;
k=[1:0.25:4];

for i=1:size(arfra,2)
    for j=1:size(k,2)
        %f = @(s) 1./((s+a^2).*sqrt((s+a^2).*(s+b^2).*(s+c^2)));
        p=sin(arfra(1,i)/2);
f1=@(s) 1./sqrt(1-p^2*sin(s).^2);%
l_changdu(i,j)= quadgk(f1,0,pi/2)/k(1,j);
f2=@(s) sqrt(1-p^2*sin(s).^2);%
x_changdu(i,j)=2*quadgk(f2,0,pi/2)/k(1,j)-l_changdu(i,j);
y_changdu(i,j)=2*p/k(1,j);
%µÈÐ§Ðü±ÛÁº
x_zhong=x_changdu(i,j);
y_zhong=y_changdu(i,j);
arfa=arfra(1,i);
[a,b]=solve(['b/a*tan(pi-',num2str(arfa),')=-1'],['b/2-',num2str(y_zhong),'=tan(pi-',num2str(arfa),')*(a/2-',num2str(x_zhong),')'],'a','b')
x_end(i,j)=a;
y_end(i,j)=b;
    end
end
x_end_num=double(x_end);
y_end_num=double(y_end);
plot(x_end_num,y_end_num,'.')
% arfra_gu=pi/4;
% p_gu=sin(arfra_gu/2);
% f1_gu=@(s) 1./sqrt(1-p_gu^2*sin(s).^2);%
% bili= (quadgk(f1_gu,0,pi/2))^2*4/pi^2;






