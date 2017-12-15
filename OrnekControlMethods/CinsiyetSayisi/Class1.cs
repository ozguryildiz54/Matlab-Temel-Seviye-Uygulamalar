using System;

namespace CinsiyetBilgileri
{
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	class Cinsiyet
	{
		int erkekSayisi = 0, bayanSayisi = 0;
		
		public struct Bilgi
		{
			public int cinsiyet, yas;
		}

		public const int KISI_SAYISI = 3;
		Bilgi[] kisiBilgileri = new Bilgi[KISI_SAYISI];

		public void BilgiGirisi()
		{
			Console.WriteLine("B�LG� G�R���\n");
			
			for (int i = 0; i < KISI_SAYISI; i++)
			{
				// Cinsiyet giri�i
				Console.Write(" {0}.Ki�inin cinsiyeti (1-Bayan, 2-Erkek)= ", i+1);
				kisiBilgileri[i].cinsiyet= Convert.ToInt32(Console.ReadLine());
				while (kisiBilgileri[i].cinsiyet != 1 && kisiBilgileri[i].cinsiyet != 2)
				{
					Console.WriteLine("\nYanl�� giri� yapt�n�z. Bayan i�in 1, Erkek i�in 2 giriniz.\n");
					// Cinsiyet giri�i
					Console.Write(" {0}.Ki�inin cinsiyeti (1-Bayan, 2-Erkek)= ", i+1);
					kisiBilgileri[i].cinsiyet= Convert.ToInt32(Console.ReadLine());
				}
                
				// Ya� giri�i
				Console.Write(" {0}.Ki�inin ya��= ", i+1);
				kisiBilgileri[i].yas= Convert.ToInt32(Console.ReadLine());
			}
		}

		public void YasSorgulama()
		{
			Console.WriteLine("\nYA� SORGULAMA\n");
			Console.Write(" S�n�r Ya� De�erini Giriniz = ");
			int sinirYas = Convert.ToInt32(Console.ReadLine());

			for (int i = 0; i < KISI_SAYISI; i++)
			{
				if (kisiBilgileri[i].yas < sinirYas)
					if (kisiBilgileri[i].cinsiyet == 1) bayanSayisi++;
					else erkekSayisi++;
			}
			Console.WriteLine("\nYa�� {0}'ten k���k bayan say�s�={1}", sinirYas, bayanSayisi);
			Console.WriteLine("\nYa�� {0}'ten k���k erkek say�s�={1}", sinirYas, erkekSayisi);
			
			Console.WriteLine("\nDevam i�in ENTER'a bas�n�z...");
			Console.ReadLine();
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
			Cinsiyet cinsiyet = new Cinsiyet();
			cinsiyet.BilgiGirisi();
			cinsiyet.YasSorgulama();
		}
	}
}
