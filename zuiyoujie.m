

lmd=[0.002,0.002;
    0.002,-0.002;
    0.001,0];

i(1)=4;
c(1)=50;
for k=1:1000
[Ty,Ax,dTcar,dAcar]=wucha(i(k),c(k),700,600);
i(k+1)=i(k)+lmd(1,1)*dTcar+lmd(1,2)*dAcar;
c(k+1)=c(k)+lmd(2,1)*dTcar+lmd(2,2)*dAcar;
dA(k)=dAcar;
dT(k)=dTcar;
lmd=lmd*0.994;
end
i(k)
c(k)


plot(dA)
hold on

plot(dT)
hold on
grid on



