clc;
clear all;

x = 0 : 5;
m = 0.25
b =-0.5;
y = m*x + b;

hold on
plot(x, y)
grid
axis([0  5    0  12])
xline(4);
plot(4,4,'rx')
hold off

