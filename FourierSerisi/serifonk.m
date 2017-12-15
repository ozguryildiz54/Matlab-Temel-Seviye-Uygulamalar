function [f,T]=serifonk(t);
% Fourier serisine a��lacak fonksiyon.
% A��klama i�in seriyeac.m fonksiyonuna da bak�n�z.
% t ba��ms�z de�i�keni (genellikle zaman), f de fonksiyonu (ba��ml�
% de�i�keni) ifade eder. T ise ana periyottur.
% Yaln�zca hemen a�a��ya periyodu T olarak yaz�l�r.
% ve son k�s�mda f de�eri istenilen fonksiyona g�re d�zenlenir.

T=2*pi; % ANA PER�YODU BURAYA YAZINIZ
w=2*pi/T;
tmin=-T/2; tmax=T/2; % FONKS�YONUN FORM�LE ED�LECE�� 1 PER�YODUN SINIRLARI

% ********* Bu aray� de�i�tirmeyiniz **********
m=floor(t/T); tt=t-m*T; % t nin 0 ile T aras�na kayd�r�lm���na tt dedik
while tt<tmin, tt=tt+T; end,
while tt>=tmax, tt=tt-T; end,   % Art�k tmin<=tt<tmax oldu.
% *********************************************

% [tmin,tmax) aral��� i�in fonksiyon tan�m� (s�n�r parantezlerine dikkat)
% A�a��daki ifade istenilen fonksiyona g�re de�i�tirilir.
% Ancak ba��ms�z de�i�ken art�k tt olmu�tur.
% Yaln�zca ve tam 1 ana periyod i�in tan�mlanmal�d�r.

% Simetrik kare dalga
% if tt>-T/4 & tt<T/4,
%    f=1;
% elseif tt>T/4 & tt<3*T/4,
%    f=0;
% else
%    f=0;
% end

% Diyottan ge�irilmi� sin�s (yar�m dalga) gerilim
%  f=max([sin(w*tt),0]);

% K�pr� diyottan ge�irilmi� sin�s (tam dalga) gerilim
%  f=abs(sin(w*tt));

% AC k�y�lm�� sin�s (alfa)
% alfa=pi/2; theta=mod(w*tt,2*pi);
% f=sin(theta);
% if (theta > 0 && theta < alfa)||(theta > pi && theta < pi+alfa),
%    f=0;
% end

% Simetrik testere di�i
% f=tt;

% Asimetrik testere (tek harmonik simetrili)
if tt<0, f=1+tt/pi;
else f=-tt/pi;
end

% Me�hur �rnek
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
