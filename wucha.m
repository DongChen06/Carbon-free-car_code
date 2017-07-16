function [Ty,Ax,dTcar,dAcar]=wucha(ii,c,Tcar,Acar)
n=10000;
h=linspace(0,0.1,n);

%ii=3.5;
b=150;
R=100;%轮半径
%驱动轮A与转向轮横向偏距a1
a1=80;
%驱动轮B与转向轮横向偏距a2
a2=80;
%曲柄半径r1
r1=17;
%绳轮半径r2
r2=6;
%驱动轴与转向轮的距离d
d=180;
%转向杆的长c
%c=50;

l=sqrt(b^2+r1^2)+(0.841);

b=b/1000;
r1=r1/1000;
l=l/1000;
 
R=R/1000;
a1=a1/1000;
a2=a2/1000;
r2=r2/1000;
d=d/1000;
c=c/1000;

%算法
g=-10;
sd2=h/r2;
sd1=sd2/ii+pi/2;
C=l^2-2*c^2-r1^2.*(cos(sd1)).^2-(b-r1.*sin(sd1)).^2;
A=2.*c.*(b-r1.*sin(sd1));
B=-2*c^2;
af=asin(C./sqrt(A.^2+B.^2))-atan(B./A);
format long
rou=a1+(d)./(tan(af));
s=sd2*R;
ds=s(2)-s(1);
dbd=ds./(rou);
bd=cumsum(dbd);
dy=ds*cos(bd);
dx=-ds*sin(bd);
x=cumsum(dx);
y=cumsum(dy);

[Ax,anumb]=min(x);
Ty=y(anumb);
Ax=-1000*Ax;
Ty=Ty*1000;
dAcar=Acar-Ax;
dTcar=Tcar-Ty;

