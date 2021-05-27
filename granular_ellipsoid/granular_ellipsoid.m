%declare coordinate axes 
syms x y z;

%assign values
a = 8;
b = 4;
c = 6;
xc = 15;
yc = 20;
zc = 10;


%plot 3d surface of ellipsoid
z1 = c*sqrt(1 - ((x-xc)/a)^2 - ((y-yc)/b)^2 ) +zc; %positive side
z2 = -c*sqrt(1 - ((x-xc)/a)^2 - ((y-yc)/b)^2 ) +zc; %negative side
fsurf(z1)
hold on
%uncomment the line below if you want the lower half of ellipsoid to be
%visible.
%fsurf(z2)

%no of random points
n_o_rp = 5000;

%picking random points
x_rnd = -(a-xc) + 2*a*rand(1,n_o_rp);
y_rnd = -(b-yc) + 2*b*rand(1,n_o_rp);
z_rnd = -(c-zc) + 2*c*rand(1,n_o_rp);

%mean_size of grains
mean_size = 36;

%acquire random size distribution for grains around mean 36. distribution
%is +-10.
spread = 10;
rnd_size = mean_size + spread*rand(1,n_o_rp);

%function defining the ellipsoid
F1 = ((x_rnd-xc)/a).^2 + ((y_rnd-yc)/b).^2 + ((z_rnd-zc)/c).^2 - 1;

ind = F1<0; %indices for points inside the the surface
x_rnd = x_rnd(ind);  x_rnd = x_rnd(:);    
y_rnd = y_rnd(ind);  y_rnd = y_rnd(:);      
z_rnd = z_rnd(ind);  z_rnd = z_rnd(:);

%number of points inside the ellipsoid
rnd_x_shape = size(x_rnd);

%choose sizes for all the grains from the normal distribution attained
%earlier
rnd_size = rnd_size(1:rnd_x_shape(1));

scatter3(x_rnd, y_rnd, z_rnd, rnd_size,  'MarkerFaceColor','b','MarkerEdgeColor','b')