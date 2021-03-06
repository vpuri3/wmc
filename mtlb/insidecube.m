%
% replace points inside cube with NaN
%
function [x,y,z] = insidecube(al,x,y,z)

[nx,ny,nz]=size(x);

xx=reshape(x,[nx*ny*nz,1]);
yy=reshape(y,[nx*ny*nz,1]);
zz=reshape(z,[nx*ny*nz,1]);

a=al*pi/180;
M=[cos(a),-sin(a);sin(a),cos(a)];
xz=[xx,zz]*M';
xx=xz(:,1);
zz=xz(:,2);

tol1=5e-2;
tol2=1e-4;
I = find((abs(xx) < 0.50+tol1)...
       & (abs(zz) < 0.50+tol1)...
	   & (yy      < 1.00+tol2));

xx(I)=NaN;
yy(I)=NaN;
zz(I)=NaN;

Mi=[cos(-a),-sin(-a);sin(-a),cos(-a)];
xz=[xx,zz]*Mi';
xx=xz(:,1);
zz=xz(:,2);

x=reshape(xx,[nx,ny,nz]);
y=reshape(yy,[nx,ny,nz]);
z=reshape(zz,[nx,ny,nz]);

%-----------------------------------------------------%
%scatter3(xx,yy,zz);
%xlabel('x');
%ylabel('y');
%zlabel('z');
%daspect([1 1 1]);

