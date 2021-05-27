%declare coordinate axes o
syms x y z;

%assign values
a = 3;
b = 4;
c = 6;
xc = 0;
yc = 0;
zc = 0;


%plot 3d surface of ellipsoid
z = c*sqrt(((x-xc)/a)^2 + ((y-yc)/b)^2 - 1) +zc;

fsurf(z)
