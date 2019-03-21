%
syms 

p=f;p1=q;
w1=p*p1^3/3/B;
fin1=p*p1^2/2/B;
w_fang=w1;
x_fang=p1;

fr=f*cos(fin1)-f*sin(fin1);
p=fr;p2=q;
w2=p*p2^3/3/B;
fin2=p*p2^3/3/B;
w_fang=w_fang+p2*sin(fin1)+w2*cos(fin1);
x_fang=x_fang+p2*cos(fin1)-w2*sin(fin1);

fr=f*cos(fin2+fin1)-f*sin(fin1+fin2);
p=fr;p3=q;
w3=p*p3^3/3/B;
fin3=p*p3^3/3/B;
w_fang=w_fang+p3*sin(fin1+fin2)+w3*cos(fin1+fin2);
x_fang=x_fang+p3*cos(fin1+fin2)-w3*sin(fin1+fin2);
