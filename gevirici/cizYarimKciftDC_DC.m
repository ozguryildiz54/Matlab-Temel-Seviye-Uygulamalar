clear all,close all,
dt=0.01;Vd=400;
t=0:dt:720;t=t';
vref=0*t+150;
vkare=sign(cos(9*pi*t/180));
vucg=t;Ki_dt=500*dt/20;
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
    
end
figure(1),h=plot(t,[vref,vucg,vc-800]),axis([0 80 -1500 300]),ha=gca,
set(h,'LineWidth',2);
%set(h,'Color','k'),
set(ha,'XTick',tik,'XTickLabel',[],'YTick',[-800 0],'YTickLabel',''),grid
set(1,'Name','Yarým köprü veya çift yönlü H köprüsü DC/DC çevirici','color','white')