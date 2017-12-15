using System;

namespace VergiIadeBilgileri
{
	/// <summary>
	/// Summary description for Class1.
	/// </summary>
	class VergiIade
	{
		double kirtasiyeToplamMiktar = 0, giyimToplamMiktar = 0, gidaToplamMiktar = 0;
		
		public void BilgiGirisi()
		{
			Console.WriteLine("VERGÝ ÝADE BÝLGÝ GÝRÝÞÝ\n");
			
			Console.Write(" Harcama türü= ");
			int harcamaTuru = Convert.ToInt32(Console.ReadLine());

			while (harcamaTuru != -1)
			{
				switch (harcamaTuru)
				{
					case 1:	Console.Write(" Harcama miktarý (YTL)= ");
							kirtasiyeToplamMiktar += 0.1*Convert.ToInt32(Console.ReadLine());
							break;
					case 2:	Console.Write(" Harcama miktarý (YTL)= ");
							giyimToplamMiktar += 0.12*Convert.ToInt32(Console.ReadLine());
							break;
					case 3:	Console.Write(" Harcama miktarý (YTL)= ");
							gidaToplamMiktar += 0.18*Convert.ToInt32(Console.ReadLine());
							break;
					default : Console.WriteLine("Yanlýþ giriþ yaptýnýz. 1..3 arasýnda giriþ yapýnýz.");
							break;
				}

				Console.Write(" Harcama türü= ");
				harcamaTuru = Convert.ToInt32(Console.ReadLine());
			}
		}

		public void Rapor()
		{
			Console.WriteLine("\n\nVERGÝ ÝADE MÝKTARLARI\n");
			Console.WriteLine("\nKýrtasiye harcamalarýnýn vergi iade miktarý= {0} YTL", kirtasiyeToplamMiktar);
			Console.WriteLine("\nGiyim harcamalarýnýn vergi iade miktarý= {0} YTL", giyimToplamMiktar);
			Console.WriteLine("\nGýda harcamalarýnýn vergi iade miktarý= {0} YTL\n", gidaToplamMiktar);
			Console.WriteLine("\nToplam harcamalarýnýn vergi iade miktarý= {0} YTL", 
				kirtasiyeToplamMiktar + giyimToplamMiktar + gidaToplamMiktar);
			Console.WriteLine("\nDevam için bir ENTER'a basýnýz...");
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
			VergiIade vergiIade = new VergiIade();
			vergiIade.BilgiGirisi();
			vergiIade.Rapor();
		}
	}
}
