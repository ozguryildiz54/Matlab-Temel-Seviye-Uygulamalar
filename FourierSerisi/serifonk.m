function [f,T]=serifonk(t);
% Fourier serisine açýlacak fonksiyon.
% Açýklama için seriyeac.m fonksiyonuna da bakýnýz.
% t baðýmsýz deðiþkeni (genellikle zaman), f de fonksiyonu (baðýmlý
% deðiþkeni) ifade eder. T ise ana periyottur.
% Yalnýzca hemen aþaðýya periyodu T olarak yazýlýr.
% ve son kýsýmda f deðeri istenilen fonksiyona göre düzenlenir.

T=2*pi; % ANA PERÝYODU BURAYA YAZINIZ
w=2*pi/T;
tmin=-T/2; tmax=T/2; % FONKSÝYONUN FORMÜLE EDÝLECEÐÝ 1 PERÝYODUN SINIRLARI

% ********* Bu arayý deðiþtirmeyiniz **********
m=floor(t/T); tt=t-m*T; % t nin 0 ile T arasýna kaydýrýlmýþýna tt dedik
while tt<tmin, tt=tt+T; end,
while tt>=tmax, tt=tt-T; end,   % Artýk tmin<=tt<tmax oldu.
% *********************************************

% [tmin,tmax) aralýðý için fonksiyon tanýmý (sýnýr parantezlerine dikkat)
% Aþaðýdaki ifade istenilen fonksiyona göre deðiþtirilir.
% Ancak baðýmsýz deðiþken artýk tt olmuþtur.
% Yalnýzca ve tam 1 ana periyod için tanýmlanmalýdýr.

% Simetrik kare dalga
% if tt>-T/4 & tt<T/4,
%    f=1;
% elseif tt>T/4 & tt<3*T/4,
%    f=0;
% else
%    f=0;
% end

% Diyottan geçirilmiþ sinüs (yarým dalga) gerilim
%  f=max([sin(w*tt),0]);

% Köprü diyottan geçirilmiþ sinüs (tam dalga) gerilim
%  f=abs(sin(w*tt));

% AC kýyýlmýþ sinüs (alfa)
% alfa=pi/2; theta=mod(w*tt,2*pi);
% f=sin(theta);
% if (theta > 0 && theta < alfa)||(theta > pi && theta < pi+alfa),
%    f=0;
% end

% Simetrik testere diþi
% f=tt;

% Asimetrik testere (tek harmonik simetrili)
if tt<0, f=1+tt/pi;
else f=-tt/pi;
end

% Meþhur örnek
% T1=T/4;
% if tt>-T1 & tt<T1,
%    f=1;
% else
%    f=0;
% end

% if tt>=-2*pi & tt<-0
%     f=-1;
% elseif tt>=0 & tt<2*pi
%     f=1;
% else
%     f=0;
% end
