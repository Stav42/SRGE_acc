# SRGE_acc
Study on induced acceleration on surface of a granular asteroid after collisions

## Granular Ellipsoid
Granular ellipsoid rendered on MATLAB. Open './granular_ellipsoid/granular_ellipsoid.m' and run the script to get the body.

Various parameters are:
 * Axes of ellipsoid - a, b, c
 * Centre of ellipsoid - xc, yc, zc
 * Number of grains - n_o_rp
 
Only the upper half is covered by the surface to make the grains visible. Uncomment corresponding line to get 
lower half too.

Result for 20000 granular points

Parameters are:
 * a,b,c = 8,4,6
 * xc,yc,zc = 15, 20, 10
 * Number of grains = 20000

<p align="center">
  <img width="399" height="289" src="https://raw.githubusercontent.com/Stav42/SRGE_acc/main/granular_ellipsoid/granular_ellipsoid_20000.png">
</p>

Result for 5000 granular points

Paramters are:
 * a,b,c = 8,4,6
 * xc,yc,zc = 15, 20, 10
 * Number of grains = 5000

<p align="center">
  <img width="326" height="294" src="https://raw.githubusercontent.com/Stav42/SRGE_acc/main/granular_ellipsoid/granular_ellipsoid_5000.jpg">
</p>

To look at these results through various angle and zoom, open up .fig files in 'granular_ellipsoid/' in MATLAB.

The marker in the plots shown are representative of the grains but don't follow the size distribution of the grains. 

The radii and coordinates of the grains are computed using the function 'growbubbles.m' which returns radii for the points and ensures that no spheres are overlapping. 

The radii and coordinates of 20000 such points are stored in two files - 'pts.txt' and 'pts.mat'.

## Lammps 

### Flow simulations

Download the gifs to look at the animations

**Couette Flow**

![alt text](https://raw.githubusercontent.com/Stav42/SRGE_acc/main/lammps/flow/couette.gif "Couette Flow")





