# SRGE_acc
Study on induced acceleration on surface of a granular asteroid after collisions

## Granular Ellipsoid
Granular ellipsoid rendered on MATLAB. Open './granular_ellipsoid/granular_ellipsoid.m' and run the script to get the body.

Various parameters are:
 * Axes of ellipsoid - a, b, c
 * Centre of ellipsoid - xc, yc, zc
 * Size of grains can be changed by changing 'mean_size'
 * Number of grains - n_o_rp
 * Deviation of grains from mean_size - spread
 
Only the upper half is covered by the surface to make the grains visible. Uncomment corresponding line to get 
lower half too.

Result for 20000 granular points

Parameters are:
 * a,b,c = 8,4,6
 * xc,yc,zc = 15, 20, 10
 * mean_size = 36
 * Number of grains = 20000
 * Deviation of grains from mean_size = 10

<p align="center">
  <img width="399" height="289" src="https://raw.githubusercontent.com/Stav42/SRGE_acc/main/granular_ellipsoid/granular_ellipsoid_20000.png">
</p>

Result for 5000 granular points

Paramters are:
 * a,b,c = 8,4,6
 * xc,yc,zc = 15, 20, 10
 * mean_size = 36
 * Number of grains = 5000
 * Deviation of grains from mean_size = 10

<p align="center">
  <img width="326" height="294" src="https://raw.githubusercontent.com/Stav42/SRGE_acc/main/granular_ellipsoid/granular_ellipsoid_5000.jpg">
</p>

To look at these results through various angle and zoom, open up .fig files in 'granular_ellipsoid/' in MATLAB.


## Lammps 

### Flow simulation

**Couette Flow**
<p align="center">
  <img src="https://raw.githubusercontent.com/Stav42/SRGE_acc/main/granular_ellipsoid/granular_ellipsoid_5000.jpg">
</p>


**Poisson Flow**
<p align="center">
  <img src="https://raw.githubusercontent.com/Stav42/SRGE_acc/main/granular_ellipsoid/granular_ellipsoid_5000.jpg">
</p>




