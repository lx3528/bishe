 clear all;%%��ʾ������б���������ֵ%%
       x=2:1:140;
       
       y=sqrt(1-x.^2/140^2)/0.2*30;
       z=0*x;
       plot3(x,y,z,'Color','r','LineWidth',2);
           xlabel('x');
      ylabel('y');
      zlabel('z')
      title('��ά����ͼ')
      %axis([-1.2 1.2 -1.2 1.2 0.5 2.2]);
      %x+10*cos(pi/6),y+10*sin(pi/6),z
      hold on;
      plot3(x+10*cos(pi/6),y+10*sin(pi/6),z+10*sin(pi/6),'Color','k','LineWidth',0.8);
      plot3(x-10*cos(pi/6),y-10*sin(pi/6),z-10*sin(pi/6),'Color','k','LineWidth',0.8);
      
      
      