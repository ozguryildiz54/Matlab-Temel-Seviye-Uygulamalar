function [a,b,c,fs,fg,t,ce,k,kc,cc]=seriyeac(N,dt,tciz1,tciz2);
% Fourier seri katsay�lar�n� bulur ve sonlu bir seri olarak �izer.
% Periyodik fonksiyonunuzu serifonk.m dosyas�na yaz�n�z.
% Kullan�m�
%        [a,b,c,fs,fg,t,ce,k,kc,cc]=seriyeac(N,dt,tciz1,tciz2);
% Burada
% N  :  Hesaplanacak en b�y�k harmonik numaras�
% dt :  N�merik olarak Euler y�ntemiyle hesaplanan integral i�in �ok k���k
%       olmas� istenen ad�m
% tciz1 : �izimi istenen zaman aral���n�n alt s�n�r�
% tciz2 : �izimi istenen zaman aral���n�n �st s�n�r�
% a  :  ak katsay�lar�ndan olu�an dizi olup ilk eleman� a0, a(k+1) eleman�
%       ise ak katsay�s�d�r (cos kwt 'nin katsay�s�).
% b  :  bk katsay�lar�ndan olu�an dizi olup ilk eleman� 0, b(k+1) eleman�
%       ise bk katsay�s�d�r (sin kwt 'nin katsay�s�).
% c  :  ck katsay�lar�ndan olu�an dizi olup ilk eleman� c0, c(k+1) eleman�
%       ise ck katsay�s�d�r (Karma��k serideki exp{jkwt} 'nin katsay�s�).
% ce  : ck katsay�lar�n�n negatif k 'lar i�in de�erlerinden olu�an dizi
%       olup ilk eleman� c0, c(k+1) eleman� ise c_-k katsay�s�d�r
% fg :  Verilen fonksiyonun kendisinin dt ad�mlarla istenen aral�ktaki
%       de�erlerinden olu�an dizidir
% fs :  Fourier serisinin N. harmoni�e kadarki toplam�n�n dt ad�mlarla 
%       istenen aral�ktaki de�erlerinden olu�an dizidir
% t  :  Fonksiyon ve serinin hesapland��� zaman ad�mlar�ndan olu�an dizi
%       olup, kolayl�k i�in yine integralinkiyle ayn� dt ad�m� al�nm��t�r.



[f,T]=serifonk(0);
tmin=-T/2; tmax=T/2;
if nargin<3, tciz1=tmin; end,
if nargin<4, tciz2=tmax; end,
nt=ceil((tciz2-tciz1)/dt);
t=zeros(nt,1); fs=t; fg=t;  % Boyutlar� ba�tan belirlemek i�in
w=2*pi/T;
a=zeros(N+1,1); b=a; c=a; ce=a;
% a0 katsay�s� = a(1) olarak kay�tl� olacak
a(1)=0; tt=tmin;
while tt<tmax,
    a(1)=a(1)+serifonk(tt)*dt;
    tt=tt+dt;
end
a(1)=a(1)*2/T;
b(1)=0;         % Asl�nda bu ger�ekte olmayan b0 = 0 de�eri
c(1)=a(1)/2;    % Asl�nda bu c0 = ortalama de�er
for k=1:N,
    % ak katsay�s� = a(k+1) olarak kay�tl�
    a(k+1)=0; tt=tmin;
    while tt<tmax,
        a(k+1)=a(k+1)+serifonk(tt)*cos(k*w*tt)*dt;
        tt=tt+dt;
    end
    a(k+1)=a(k+1)*2/T;
    % bk katsay�s� = b(k+1) olarak kay�tl�
    b(k+1)=0; tt=tmin;
    while tt<tmax,
        b(k+1)=b(k+1)+serifonk(tt)*sin(k*w*tt)*dt;
        tt=tt+dt;
    end
    b(k+1)=b(k+1)*2/T;
    c(k+1)=(a(k+1)-j*b(k+1))/2;
    ce(k+1)=(a(k+1)+j*b(k+1))/2;
end
i=1; t(i)=tciz1-dt;
for i=1:nt,
    t(i)=tciz1+(i-1)*dt;
    fs(i)=a(1)/2;
    for k=1:N
        fs(i)=fs(i)+a(k+1)*cos(k*w*t(i))+b(k+1)*sin(k*w*t(i));
        fg(i)=serifonk(t(i));
    end
end
% figure(1),set(1,'Name','Mavisi ger�egi, yesili serinin yakinsamasi','Position',[360 300 860 300]);
% h1=plot(t,[fg]);set(h1(1),'LineWidth',2),zoom on,axis([tciz1 tciz2 -0.2 1.2])
% hln1=line([tciz1 tciz2],[0 0],'LineWidth',1);
% hln2=line([0 0],[-0.2 1.2],'LineWidth',1);
% T1=1; T=140*T1;
% ha1=gca;set(ha1,'XTick',[-T -T/2 -T1 0 T1 T/2 T],'XTickLabel',[],'YTick',[0 0.5 1]),
% text('Interpreter','latex', 'String','$$-T_0$$','Position',[-T-0.35 -0.1])
% text('Interpreter','latex', 'String','$$-T_0 / 2$$','Position',[-T/2-0.5 -0.1])
% text('Interpreter','latex', 'String','$$-T_1$$','Position',[-T1-0.35 -0.1])
% text('Interpreter','latex', 'String','$$0$$','Position',[-0+0.05 -0.1])
% text('Interpreter','latex', 'String','$$T_1$$','Position',[T1-0.15 -0.1])
% text('Interpreter','latex', 'String','$$T_0 / 2$$','Position',[T/2-0.3 -0.1])
% text('Interpreter','latex', 'String','$$T_0$$','Position',[T-0.2 -0.1])
% figure(1),set(1,'Name','Mavisi ger�egi, yesili serinin yakinsamasi','Position',[360 500 560 200]);
figure(1),h1=plot(t,[fg,fs]);set(h1(1),'LineWidth',2),set(h1(2),'LineWidth',1.5,'LineStyle','-'),zoom on,

% figure(2),h2=plot(t,c(1)+0*t),zoom on,hold on,
% for k=1:N,
%     figure(2),h2=plot(t,a(k+1)*cos(k*w*t)+b(k+1)*sin(k*w*t)),
% end
% hold off

% hln1=line([tciz1 tciz2],[0 0],'LineWidth',2);
% hln2=line([0 0],[-0.55 1.2],'LineWidth',2);
% ha1=gca; set(ha1,'XTick',[-3*pi -2*pi -pi 0 pi 2*pi 3*pi],'XTickLabel','')
% text(-3*pi-0.3,-0.16,'-3\pi'),text(-2*pi-0.3,-0.16,'-2\pi'),text(-pi-0.3,-0.16,'-\pi'),
% text(3*pi-0.3,-0.16,'3\pi'),text(2*pi-0.3,-0.16,'2\pi'),text(pi-0.1,-0.16,'\pi'),text(0+0.1,-0.17,'0'),
% set(ha1,'YTick',[-0.5 0 0.5 1])
k=0:N; k=k';
kc=-N:N;kc=kc';
cc=[ce(N+1:-1:2); c];
% figure(2),set(2,'Name','ck katsay�lar�','Position',[360 400 860 300]);
% h2=stem(kc,cc,'.');axis([-18 18 -0.2 0.6]);
% figure(3),set(3,'Name','ck*T0 katsay�lar� k*w0''a kar��','Position',[360 400 860 300]);
% h3=stem(kc*2*pi/T,cc*T,'.');axis([-6.5 6.5 -0.8 2.4]);
% 
% figure(2),set(2,'Name','ak katsay�lar�');
% h=stem(k,a,'.');set(h,'LineWidth',2),set(h,'LineWidth',1);
% figure(3),set(3,'Name','b','Position',[360 500 560 200]);h=stem(k,b,'.');set(h,'LineWidth',2);

% figure(4),set(4,'Name','sqrt(a.^2+b.^2)'),h=stem(k,sqrt(a.^2+b.^2),'.');axis([-0.5 18 -0.06 0.7]),set(h,'LineWidth',2);
% figure(5),set(5,'Name','�ift harmonik simetrili bile�en','Position',[360 500 560 200]);
% h1=plot(t,[0.5*abs(sin(t))]);set(h1(1),'LineWidth',2),zoom on,axis([tciz1 tciz2 -0.15 1.1])
% hln1=line([tciz1 tciz2],[0 0],'LineWidth',2);
% hln2=line([0 0],[-0.15 1.2],'LineWidth',2);
% ha1=gca; set(ha1,'XTick',[-3*pi -2*pi -pi 0 pi 2*pi 3*pi],'XTickLabel','')
% text(-3*pi-0.3,-0.055,'-3\pi'),text(-2*pi-0.3,-0.055,'-2\pi'),text(-pi-0.3,-0.055,'-\pi'),
% text(3*pi-0.3,-0.055,'3\pi'),text(2*pi-0.3,-0.055,'2\pi'),text(pi-0.1,-0.055,'\pi'),text(0+0.1,-0.055,'0'),
% set(ha1,'YTick',[-0.5 0 0.5 1])
% 
% figure(6),set(6,'Name','|c|','Position',[360 400 860 300]);
% h6=stem(kc,abs(cc),'.');axis([-18 18 0 0.35]),%set(h6,'LineWidth',2);
% ha6=gca;set(ha6,'YTick',[0 0.1 0.2 0.3]);
% figure(7),set(7,'Name','c a��s�','Position',[360 500 860 200]);
% h7=stem(kc,angle(cc)*180/pi,'.');axis([-18 18 -200 200]),%set(h7,'LineWidth',2);
% ha7=gca;set(ha7,'YTick',[-180 -90 0 90 180]);
% figure(8),set(8,'Name','ger�el c','Position',[360 500 860 200]);
% h8=stem(kc,real(cc),'.');axis([-18 18 -0.15 0.35]),%set(h8,'LineWidth',2);
% figure(9),set(9,'Name','sanal c','Position',[360 500 860 200]);
% h9=stem(kc,imag(cc),'.');axis([-18 18 -0.3 0.3]),%set(h9,'LineWidth',2);
end