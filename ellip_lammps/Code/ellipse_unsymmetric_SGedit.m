tic
clear all
clc

 format long e
% N=11550; %give value ' actual values obtained are sphere=0.52*N , cylinder=0.76*N'
N=12000; 

M=4.8;

R1=0.8*M;D1=2*R1;
R2=0.9*M;D2=2*R2;

R3=M;% give value
D3=2*R3;

R4=1.1*M;D4=2*R4;
R5=1.2*M;D5=2*R5;

rho=3600;
mass1=4/3*pi*R1^3*rho;
mass2=4/3*pi*R2^3*rho;
mass3=4/3*pi*R3^3*rho;
mass4=4/3*pi*R4^3*rho;
mass5=4/3*pi*R5^3*rho;


G=6.67*10^(-11);
% G=1;
C=8.987*10^9;
q1=sqrt(G/C)*mass1;
q2=sqrt(G/C)*mass2;
q3=sqrt(G/C)*mass3;
q4=sqrt(G/C)*mass4;
q5=sqrt(G/C)*mass5;

alpha=1.0; % give values
beta=1.0;

In_nu =0.1;
a=((N/2/alpha/beta/In_nu)^(1/3))*R3;
b=a*alpha;
c=a*beta;
w=0;
w=w*sqrt(2*pi*rho*G); % give value

i=1;
while i<N+1
    
    x(i)=(rand-0.5)*a*2; %give value
    y(i)=(rand-0.5)*b*2;
    z(i)=(rand-0.5)*c*2;
    dummy=1;


   if(i>1)
    for j=1:i-1
    if  sqrt((x(i)-x(j))^2+(y(i)-y(j))^2+(z(i)-z(j))^2)<D5 % give value
      
      dummy=0;
      break;
    end
        
    end
    end
    if (dummy==1)
        i=i+1;
    end
end

count=0;

for n=1:N
    if(x(n)^2/a^2+y(n)^2/b^2+z(n)^2/c^2<1^2)  %2*particle radius
        count=count+1;
         X(count)=x(n);
        Y(count)=y(n);
        Z(count)=z(n);
    end
end

%  a_new=((count/In_nu/alpha/beta)^(1/3))*R;
 

% plot3( X, Y, Z, '.r' );
% hold on;

for m=1:count
r(m)=sqrt(X(m)^2+Y(m)^2);

v(m)=r(m)*w;
theta(m)=atan (abs(Y(m))/abs(X(m)));
vx(m)=v(m)*sin(theta(m));
vy(m)=v(m)*cos(theta(m));

if(X(m)>=0 && Y(m)>=0)
    vy(m)=-abs(vy(m));
    vx(m)=abs(vx(m));
end
if(X(m)<=0 && Y(m)>=0) 
    vy(m)=abs(vy(m));
    vx(m)=abs(vx(m));
end
if(X(m)<=0 && Y(m)<=0)
    vx(m)=-abs(vx(m));
    vy(m)=abs(vy(m));
end
if(X(m)>=0 && Y(m)<=0)
    vx(m)=-abs(vx(m));
    vy(m)=-abs(vy(m));
end
end
maxx=max(X);
maxy=max(Y);

maxz=max(Z);
minx=min(X);
miny=min(Y);
minz=min(Z);

% count
alpha1=(max(Y)-min(Y))/(max(X)-min(X));
beta1=(max(Z)-min(Z))/(max(X)-min(X));


% save('data.txt','maxx','maxy','maxz','minx','miny','minz','alpha1','beta1','nu','w','R','count','-ascii')


fileID= fopen('ellipse.txt','w'); % give file name
% fileID2= fopen('initialvelocity.txt','w');
% fileID3= fopen('initialmass.txt','w');

fprintf(fileID,'Lammps Description\n');
fprintf(fileID,'\n%d atoms\n',count);
fprintf(fileID,'\n5 atom types\n');
fprintf(fileID,'\n-1e3 1e3 xlo xhi\n');
fprintf(fileID,'-1e3 1e3 ylo yhi\n');
fprintf(fileID,'-1e3 1e3 zlo zhi\n\n');
fprintf(fileID,'Atoms\n\n');

% A= round(0.5*(1-0.6827)*count);
% B =round(.6827*count);

A = 0.85;
B = 0.1;
n1 = round((1-A-B)*count*0.5);
n2 = round(B*count*0.5);
n3 = round(A*count);
n4 = round(B*count*0.5);
n5 = round((1-A-B)*count*0.5);

tn=n1+n2+n3+n2+n5;

  nu=((R1^3)*n1+(R2^3)*n2+(R3^3)*n3+(R4^3)*n4+(R5^3)*n5)*8/(maxx-minx)^3/alpha1/beta1;
  sprintf('nu = %.4f \n',nu)
%  nu=(R3^3*tn)*8/(maxx-minx)^3/alpha1/beta1;

for k=1:count
 
    if k <= n1
    fprintf(fileID,'%d %d %0.15f %0.15f %0.15f %0.15f %d %d\n',k,1,X(k),Y(k),Z(k),q1,D1,rho);
    elseif k> n1 && k <= (n1+n2)
    fprintf(fileID,'%d %d %0.15f %0.15f %0.15f %0.15f %d %d\n',k,2,X(k),Y(k),Z(k),q2,D2,rho);
     elseif k> (n1+n2) && k <= (n1+n2+n3)
    fprintf(fileID,'%d %d %0.15f %0.15f %0.15f %0.15f %d %d\n',k,3,X(k),Y(k),Z(k),q3,D3,rho);
     elseif k> (n1+n2+n3) && k <= (n1+n2+n3+n4)
    fprintf(fileID,'%d %d %0.15f %0.15f %0.15f %0.15f %d %d\n',k,4,X(k),Y(k),Z(k),q4,D4,rho);
        else
    fprintf(fileID,'%d %d %0.15f %0.15f %0.15f %0.15f %d %d\n',k,5,X(k),Y(k),Z(k),q5,D5,rho);
    end
%     fprintf(fileID2,'%d %0.15f %0.15f %0.15f %d %d %d\r\n',k,vx(k),vy(k),0,0,0,0);
%    fprintf(fileID3,'%d %0.15f\r\n',k,mass);
end


fprintf(fileID,'\nVelocities\n\n');

for k = 1:count
    fprintf(fileID,'%d %0.15f %0.15f %0.15f %d %d %d\n',k,vx(k),vy(k),0,0,0,0);
end
fclose(fileID);


% fclose(fileID2);
% fclose(fileID3);
% plot3(X,Y,Z,'.')


% 2*((N/2/alpha/beta/0.56)^(1/3))*R5
% Radius = (3.5e10/(1.3333*pi*rho*count*In_nu))^(1/3)
% Mass = mass * count
toc