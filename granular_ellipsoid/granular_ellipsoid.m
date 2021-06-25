%declare coordinate axes 
syms x y z;

%assign values
a = 0.08;
b = 0.04;
c = 0.06;
xc = 0;
yc = 0;
zc = 0;


%plot 3d surface of ellipsoid
z1 = c*sqrt(1 - ((x-xc)/a)^2 - ((y-yc)/b)^2 ) +zc; %positive side
z2 = -c*sqrt(1 - ((x-xc)/a)^2 - ((y-yc)/b)^2 ) +zc; %negative side
fsurf(z1)
hold on
%uncomment the line below if you want the lower half of ellipsoid to be
%visible.
%fsurf(z2)

%no of random points
n_o_rp = 16000;

%picking random points
x_rnd = -(a-xc) + 2*a*rand(1,n_o_rp);
y_rnd = -(b-yc) + 2*b*rand(1,n_o_rp);
z_rnd = -(c-zc) + 2*c*rand(1,n_o_rp);

%acquire random size distribution for grains around mean_radius. distribution
%is +-10 pts squared. This is only for scatter3. Scatter3 doesn't plot size
%of grains accurately. Its just a marker function.
mean_size = 36;
spread = 10; % In pts squared unit
rnd_size = mean_size + spread*rand(1,n_o_rp);

%function defining the ellipsoid
F1 = ((x_rnd-xc)/a).^2 + ((y_rnd-yc)/b).^2 + ((z_rnd-zc)/c).^2 - 1;

ind = F1<0; %indices for points inside the the surface
x_rnd = x_rnd(ind);  x_rnd = x_rnd(:);    
y_rnd = y_rnd(ind);  y_rnd = y_rnd(:);      
z_rnd = z_rnd(ind);  z_rnd = z_rnd(:);

pts_rnd = [[x_rnd],[y_rnd],[z_rnd]];

%number of points inside the ellipsoid
rnd_x_shape = size(x_rnd);

%radii through growbubbles.m function. This gives us the radii of all the grains and ensures no overlapping:
rads = growbubbles(pts_rnd);

pts_rnd_size = [[pts_rnd],[rads.']];

%choose sizes for all the grains from the normal distribution attained
%earlier
rnd_size = rnd_size(1:rnd_x_shape(1));

%[xs ys zs] = sphere;
%s1=surf(xs*pts_rnd_size(:,4)+pts_rnd_size(:,1), ys*pts_rnd_size(:,4)+pts_rnd_size(:,2), zs*pts_rnd_size(:,4)+pts_rnd_size(:,3));

%daspect([1 1 1])
%view(30,10)

scatter3(x_rnd, y_rnd, z_rnd, rnd_size,  'MarkerFaceColor','b','MarkerEdgeColor','b')