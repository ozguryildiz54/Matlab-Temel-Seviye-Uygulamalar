clear all,close all,
dt=0.01;Vd=400; ihmal=1e-1;
t=0:dt:720;t=t';
vref=0*t-150;
vkare=sign(cos(9*pi*t/180));
vucg=t; Ki_dt=500*dt/20;
vc=t;vc(1)=0; vAN=t; vBN=t;
j=1;tik=[0;0];tik(j)=0;sondurumArti='buyuk';sondurumEksi='buyuk';
for i=2:length(t);
    vucg(i)=vucg(i-1)+Ki_dt*vkare(i);
    if sondurumArti=='buyuk' & vucg(i)<vref(i),
        j=j+1;tik(j)=t(i);
        sondurumArti='kucuk';
    end
    if sondurumArti=='kucuk' & vucg(i)>vref(i),
        j=j+1;tik(j)=t(i);
        sondurumArti='buyuk';
    end
    if sondurumEksi=='buyuk' & vucg(i)<-vref(i),
        j=j+1;tik(j)=t(i);
        sondurumEksi='kucuk';
    end
    if sondurumEksi=='kucuk' & vucg(i)>-vref(i),
        j=j+1;tik(j)=t(i);
        sondurumEksi='buyuk';
    end
    if vucg(i)>vref(i)+ihmal & vucg(i)<-vref(i)+ihmal, vc(i)=-Vd;
    elseif vucg(i)<vref(i)+ihmal & vucg(i)>-vref(i)+ihmal, vc(i)=Vd;
    else vc(i)=0;
    end
    if vucg(i)>vref(i)+ihmal, vAN(i)=0; else vAN(i)=Vd; end
    if vucg(i)>-vref(i)+ihmal, vBN(i)=0; else vBN(i)=Vd; end
    
end
vc(1:2)=vc(3:4)
figure(1),h=plot(t,[vref,-vref,vucg,vAN/4-500,vBN/4-700,vc/4-900]),axis([0 80 -1100 300]),ha=gca,
set(h,'LineWidth',2);
%set(h,'Color','k'),
set(ha,'XTick',tik,'XTickLabel',[],'YTick',[-900 -700 -500 0],'YTickLabel',''),grid
set(1,'Name','H köprüsü (Tek yönlü) DC/DC çevirici','Color','white')

