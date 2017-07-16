clear
clc
tic
%符号定义
%重物下降的高度h
%驱动轴转过角度sd2
%驱动轴传动比ii
%转向轮轴心距b
%转向杆的长c
%转向轮转过的角度af
%驱动轮半径R
%驱动轮A与转向轮横向偏距a1
%驱动轮B与转向轮横向偏距a2
%驱动轴与转向轮的距离d
%小车行驶的路程s
%小车x方向的位移x
%小车y方向的位移y
%轨迹曲率半径rou
%曲柄半径r1
%绳轮半径r2
%参数输入
n=10000;
h=linspace(0,0.14,n);

ii=3.239819135;
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
c=29.51190755;

l=sqrt(b^2+r1^2)+(1.841);

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
xb=x-(a1+a2).*cos(bd);
yb=y-(a1+a2).*sin(bd);
xc=x-a1*cos(bd)-d*sin(bd);
yc=y-a1*sin(bd)+d*cos(bd);
[Ax,anumb]=min(x);
Ty=y(anumb);
Ax=-1000*Ax;
Ty=Ty*1000;
% 
% dAcar=Acar-Ax
% dTcar=Tcar-Ty

   plot(x,y,'b',xb,yb,'b',xc,yc,'m');
 %  hold on
    grid on
%     for i=1:9
%     t=0:0.01:2*pi;
%     xy=0.01.*cos(t)-0.23;
%     yy=0.01.*sin(t)+i;
%    plot(xy,yy);
%     hold on
%     end
% 
% af2=asin(c*(1-cos(af))/l);
% figure(2)
% 
% plot(af*180/3.14159)
% 
% grid on
% figure(3)
% plot(af2*180/3.14159)
% grid on
toc