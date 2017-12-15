%clear all,close all,
dt=0.01;Vd=400;
t=0:dt:720;t=t';
vref=200*sin(pi*t/180);
vkare=sign(cos(9*pi*t/180));
vucg=t;Ki_dt=500*dt/20; iy=t; dt_L=0.0001; R=1; iy(1)=-96.4834;
vc=t;vc(1)=Vd;
j=1;tik=[0;0];tik(j)=0;sondurum='buyuk';
for i=2:length(t);
    vucg(i)=vucg(i-1)+Ki_dt*vkare(i);
    if sondurum=='buyuk' & vucg(i)<vref(i),
        j=j+1;tik(j)=t(i);
        sondurum='kucuk';
    end
    if sondurum=='kucuk' & vucg(i)>vref(i),
        j=j+1;tik(j)=t(i);
        sondurum='buyuk';
    end
    if vucg(i)>vref(i), vc(i)=-Vd; else vc(i)=Vd; end
    if i>1,
       iy(i)=dt_L*vc(i)+(1-R*dt_L)*iy(i-1);
    end
end
figure(1),h=plot(t,[vref,vucg,vc-800,vref*1.5-800,vref*1.5-800,iy-800]),axis([0 720 -1500 300]),ha=gca,
set(h,'LineWidth',1);
set(h(6),'Color','k'),
set(ha,'XTick',tik,'XTickLabel',[],'YTick',[-800 0],'YTickLabel',''),grid
set(1,'Name','Yarým köprü veya çift yönlü H köprüsü evirici','Color','white')