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
			Console.WriteLine("BÝLGÝ GÝRÝÞÝ\n");
			
			for (int i = 0; i < KISI_SAYISI; i++)
			{
				// Cinsiyet giriþi
				Console.Write(" {0}.Kiþinin cinsiyeti (1-Bayan, 2-Erkek)= ", i+1);
				kisiBilgileri[i].cinsiyet= Convert.ToInt32(Console.ReadLine());
				while (kisiBilgileri[i].cinsiyet != 1 && kisiBilgileri[i].cinsiyet != 2)
				{
					Console.WriteLine("\nYanlýþ giriþ yaptýnýz. Bayan için 1, Erkek için 2 giriniz.\n");
					// Cinsiyet giriþi
					Console.Write(" {0}.Kiþinin cinsiyeti (1-Bayan, 2-Erkek)= ", i+1);
					kisiBilgileri[i].cinsiyet= Convert.ToInt32(Console.ReadLine());
				}
                
				// Yaþ giriþi
				Console.Write(" {0}.Kiþinin yaþý= ", i+1);
				kisiBilgileri[i].yas= Convert.ToInt32(Console.ReadLine());
			}
		}

		public void YasSorgulama()
		{
			Console.WriteLine("\nYAÞ SORGULAMA\n");
			Console.Write(" Sýnýr Yaþ Deðerini Giriniz = ");
			int sinirYas = Convert.ToInt32(Console.ReadLine());

			for (int i = 0; i < KISI_SAYISI; i++)
			{
				if (kisiBilgileri[i].yas < sinirYas)
					if (kisiBilgileri[i].cinsiyet == 1) bayanSayisi++;
					else erkekSayisi++;
			}
			Console.WriteLine("\nYaþý {0}'ten küçük bayan sayýsý={1}", sinirYas, bayanSayisi);
			Console.WriteLine("\nYaþý {0}'ten küçük erkek sayýsý={1}", sinirYas, erkekSayisi);
			
			Console.WriteLine("\nDevam için ENTER'a basýnýz...");
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
