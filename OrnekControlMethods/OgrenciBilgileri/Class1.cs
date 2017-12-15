using System;

namespace OgrenciIsleri
{
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	class OgrenciNotlari
	{
		public struct Bilgi
		{
			public string numara, basariDurumu;
			public int vize, final;
			public double ortalama;
		}

		public const int OGRENCI_SAYISI = 50;
		Bilgi[] ogrenciBilgileri = new Bilgi[OGRENCI_SAYISI];
		
		public void OgrenciKayit()
		{
			Console.WriteLine("��RENC� KAYIT VE DERS NOTLARI G�R���\n");
			for (int i = 0; i < OGRENCI_SAYISI; i++)
			{
				// Numara giri�i
				Console.Write(" {0}. ��rencinin Numaras�n� Giriniz = ", i+1);
				ogrenciBilgileri[i].numara = Console.ReadLine();

				// Vize giri�i
				Console.Write(" {0}. ��rencinin Vize Notunu Giriniz = ", i+1);
				ogrenciBilgileri[i].vize = Convert.ToInt32(Console.ReadLine());
				
				// Final giri�i
				Console.Write(" {0}. ��rencinin Final Notunu Giriniz = ", i+1);
				ogrenciBilgileri[i].final = Convert.ToInt32(Console.ReadLine());
				
				// Ortalama Notu hesab�
				ogrenciBilgileri[i].ortalama = ogrenciBilgileri[i].vize*0.40 + ogrenciBilgileri[i].final*0.60;

				// Ba�ar� durumu
				ogrenciBilgileri[i].basariDurumu= ogrenciBilgileri[i].ortalama >= 50 ? "BA�ARILI" : "BA�ARISIZ";
			}
		}

		public void OgrenciSorgulama()
		{
			bool bulundu = false;
			int i = 0;

			Console.WriteLine("��RENC� SORGULAMA\n");
			Console.Write(" Listelenecek ��renci Numaras�n� Giriniz = ");
			string numara = Console.ReadLine();

			while (numara != "-1")
			{
				bulundu = false;
				i = 0;

				while ((i < OGRENCI_SAYISI) && (!bulundu))
				{
					if (ogrenciBilgileri[i].numara == numara)
						bulundu = true;
					else i++;
				}

				if (bulundu) 
					Console.WriteLine("Numaras�= {0}\t Vize Notu= {1}\t Final Notu= {2}\t Ba�ar� Notu={3:f2}\t {4}",
						ogrenciBilgileri[i].numara , ogrenciBilgileri[i].vize, ogrenciBilgileri[i].final,
						ogrenciBilgileri[i].ortalama, ogrenciBilgileri[i].basariDurumu);
				else Console.WriteLine("��RENC� BULUNAMADI");
				
				Console.Write(" Listelenecek ��renci Numaras�n� Giriniz = ");
				numara = Console.ReadLine();
			}
		}
	}

	
	class AnaClass
	{
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{
			OgrenciNotlari ogrNotlari = new OgrenciNotlari();
			ogrNotlari.OgrenciKayit();
			ogrNotlari.OgrenciSorgulama();
		}
	}
}
