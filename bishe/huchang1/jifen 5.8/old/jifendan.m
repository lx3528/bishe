clear
alpha=asin(0.8)%%%%l=1.66 zuoyou
k=1
p=sin(alpha/2)
length_fin=@(fin) 1./sqrt(1-p^2*sin(fin).^2)%%%和自变量有关的，不加点陈，很可能写成向量
length=1/k*quad(length_fin,0,pi/2)%%1.6596 比我那个准确


x_fin=@(fin) sqrt(1-p^2*sin(fin).^2)
x_length=2/k*quad(x_fin,0,pi/2)-length
y_length=2*p/k
%fx=@(x,y) x^p+y^q