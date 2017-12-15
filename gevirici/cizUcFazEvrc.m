%clear all,close all,
dt=0.01;Vd=400; ihmal=1e-1;
t=0:dt:720;t=t';
vA=200*sin(pi*t/180);
vB=200*sin(pi*(t-120)/180);
vC=200*sin(pi*(t-240)/180);
vkare=sign(cos(9*pi*t/180));
vucg=t; Ki_dt=500*dt/20; iy=t; dt_L=0.0001; R=1; iy(1)=-54.2487;
vAB=t;vAB(1)=Vd;
vBC=t;vBC(1)=Vd;
j=1;tik=[0;0];tik(j)=0;sondurumA='buyuk';sondurumB='buyuk';sondurumC='kucuk';
for i=2:length(t);
    vucg(i)=vucg(i-1)+Ki_dt*vkare(i);
    if sondurumA=='buyuk' & vucg(i)<vA(i),
        j=j+1;tik(j)=t(i);
        sondurumA='kucuk';
    end
    if sondurumA=='kucuk' & vucg(i)>vA(i),
        j=j+1;tik(j)=t(i);
        sondurumA='buyuk';
    end
    if sondurumB=='buyuk' & vucg(i)<vB(i),
        j=j+1;tik(j)=t(i);
        sondurumB='kucuk';
    end
    if sondurumB=='kucuk' & vucg(i)>vB(i),
        j=j+1;tik(j)=t(i);
        sondurumB='buyuk';
    end
%     if sondurumC=='buyuk' & vucg(i)<vC(i),
%         j=j+1;tik(j)=t(i);
%         sondurumC='kucuk';
%     end
%     if sondurumC=='kucuk' & vucg(i)>vC(i),
%         j=j+1;tik(j)=t(i);
%         sondurumC='buyuk';
%     end
    if vucg(i)>vA(i)+ihmal & vucg(i)<vB(i)+ihmal, vAB(i)=-Vd;
    elseif vucg(i)<vA(i)+ihmal & vucg(i)>vB(i)+ihmal, vAB(i)=Vd;
    else vAB(i)=0;
    end
%     if vucg(i)>vB(i)+ihmal & vucg(i)<vC(i)+ihmal, vBC(i)=-Vd;
%     elseif vucg(i)<vB(i)+ihmal & vucg(i)>vC(i)+ihmal, vBC(i)=Vd;
%     else vBC(i)=0;
%     end
    if i>1,
       iy(i)=dt_L*(vAB(i))+(1-R*dt_L)*iy(i-1);
    end
end
figure(1),h=plot(t,[vA,vB,vC,(vA-vB),vucg,vAB-800,(vA-vB)*0.8-800]),axis([0 720 -1300 400]),ha=gca,
set(h,'LineWidth',1);%set(h(4),'LineWidth',5);
set(h(6),'Color','r'),set(h(7),'Color','c'),
set(ha,'XTick',tik,'XTickLabel',[],'YTick',[-800 0],'YTickLabel',''),grid
set(1,'Name','Üç Fazlý')