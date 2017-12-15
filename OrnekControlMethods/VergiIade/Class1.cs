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
			Console.WriteLine("VERG� �ADE B�LG� G�R���\n");
			
			Console.Write(" Harcama t�r�= ");
			int harcamaTuru = Convert.ToInt32(Console.ReadLine());

			while (harcamaTuru != -1)
			{
				switch (harcamaTuru)
				{
					case 1:	Console.Write(" Harcama miktar� (YTL)= ");
							kirtasiyeToplamMiktar += 0.1*Convert.ToInt32(Console.ReadLine());
							break;
					case 2:	Console.Write(" Harcama miktar� (YTL)= ");
							giyimToplamMiktar += 0.12*Convert.ToInt32(Console.ReadLine());
							break;
					case 3:	Console.Write(" Harcama miktar� (YTL)= ");
							gidaToplamMiktar += 0.18*Convert.ToInt32(Console.ReadLine());
							break;
					default : Console.WriteLine("Yanl�� giri� yapt�n�z. 1..3 aras�nda giri� yap�n�z.");
							break;
				}

				Console.Write(" Harcama t�r�= ");
				harcamaTuru = Convert.ToInt32(Console.ReadLine());
			}
		}

		public void Rapor()
		{
			Console.WriteLine("\n\nVERG� �ADE M�KTARLARI\n");
			Console.WriteLine("\nK�rtasiye harcamalar�n�n vergi iade miktar�= {0} YTL", kirtasiyeToplamMiktar);
			Console.WriteLine("\nGiyim harcamalar�n�n vergi iade miktar�= {0} YTL", giyimToplamMiktar);
			Console.WriteLine("\nG�da harcamalar�n�n vergi iade miktar�= {0} YTL\n", gidaToplamMiktar);
			Console.WriteLine("\nToplam harcamalar�n�n vergi iade miktar�= {0} YTL", 
				kirtasiyeToplamMiktar + giyimToplamMiktar + gidaToplamMiktar);
			Console.WriteLine("\nDevam i�in bir ENTER'a bas�n�z...");
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
