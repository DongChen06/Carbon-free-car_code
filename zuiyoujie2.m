
dh=0.17;
lmd=[0.002,0.002;
    0.002,-0.002;
    0.001,0];


i(1)=4;
c(1)=50;
dl(1)=1;
for k=1:1000
[Ty,Ax,dTcar,dAcar,dAngle]=wucha2(i(k),c(k),dl(k),1300,600,dh);
i(k+1)=i(k)+lmd(1,1)*dTcar+lmd(1,2)*dAcar;
c(k+1)=c(k)+lmd(2,1)*dTcar+lmd(2,2)*dAcar;
dl(k+1)=dl(k)+lmd(3,1)*dAngle;
dA(k)=dAcar;
dT(k)=dTcar;
ddl(k)=dAngle;
lmd=lmd*0.996;
end
i(k)
c(k)


plot(dA)
hold on
plot(ddl)
hold on
plot(dT)
hold on
grid on

ii=i(k)
cc=c(k)
dldl=dl(k)


guijitu(ii,cc,dldl,dh)


