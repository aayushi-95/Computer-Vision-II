clc;
clear all;
h = [0 12 2; 16 16 4; 12 -12 3; 0 -36 6; -20 -20 5; -28 28 7];
c = hom2cart(h);
fprintf("Corresponding points in (x,y) coordinates\n");
disp(c);
x_cord = c(:,1:1);
y_cord = c(:,2:2);

% axis([-14 14 -14 14]);
% hold on
% for i=1:6
%     xx = x_cord(i);
%     yy = y_cord(i);
%     plot(xx,yy,'kx');
% end
% hold off

hold on
c1 = transpose(c);
axis([-14 14 -14 14]);
plot(c1(1,1:end),c1(2,1:end),'kx-');
plot([-4 0],[4 6],'kx-');

 grid on 
 
t1=4;
t2=5;
 It1=[1 0 t1;0 1 t2;0 0 1];
% % H = [0,16,12,0,-20,-28,0; 12,16,-12,-36,-20,28,12; 2,4,3,6,5,7,2];
H =[0 4 4 0 -4 -4 0; 6 4 -4 -6 -4 4 6; 1 1 1 1 1 1 1];
p1= It1*H;
plot(p1(1,1:end),p1(2,1:end),'rx-');
c1 = hom2cart(p1);
fprintf("Homogenous matrix after translation\n");
disp(p1);
fprintf("Its corresponding (x-y) coordinate\n");
disp(c1);
 
Rt = [cos(30) -sin(30) 0; sin(30) cos(30) 0; 0 0 1];
p2= Rt*H;
fprintf("Homogenous matrix after rotation\n");
disp(p2);
plot(p2(1,1:end),p2(2,1:end),'gx-');
c2 = hom2cart(p2);
fprintf("Its corresponding (x-y) coordinate\n");
disp(c2); 

 Shear = [1 0.5 0; 0.5 1 0; 0 0 1];
 p3 = Shear*H;
 plot(p3(1,1:end),p3(2,1:end),'bx-');
 c3 = hom2cart(p3);
 fprintf("Homogenous matrix after shear\n");
 disp(p3);
 fprintf("Its corresponding (x-y) coordinate\n");
 disp(c3);
 title('2-D Transformations with the original Hexagon'); 
 hold off
 