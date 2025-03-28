#include <iostream> 
using namespace std;

class Biblioteka
{
private:

	int mRegal, mPolka;

public:
//Regał
	void ZapiszRegal(int regal)
	{
		mRegal = regal;
	}

	int PobierzRegal()
	{
		return mRegal;
	}

//Półka
	void ZapiszPolka(int polka)
	{
		mPolka = polka;
	}
	int PobierzPolka()
	{
		return mPolka;
	}

//Konstruktor domyślny
	
	Biblioteka() {
		cout << "jestem obiektem klasy biblioteka" << endl;
	}
	

//Funckja wyświetl
	void Wyswietl()
	{
		cout << "Regal: " << mRegal << " Polka: " << mPolka << endl;
	}
	
	
	Biblioteka(int regal, int polka)
	{
		cout << "Konstruktor inicjalizujacy klasy biblioteka" << endl;
		mRegal = regal;
		mPolka = polka;
	}
	
};

class Ksiazka : public Biblioteka
{
private:
	int mSygnatura;
public:

//Sygnatura
	void ZapiszSygnatura(int sygnatura)
	{
		mSygnatura = sygnatura;
	}
	int PobierzSygnatura()
	{
		return mSygnatura;
	}

//Konstruktor domyślny
	
	Ksiazka() {
		cout << "jestem obiektem klasy ksiazka" << endl;
	}
	

//Funkcja wyświetl
	void Wyswietl()
	{
		cout << "Sygnatura: " << mSygnatura << endl;
	}

	Ksiazka(int regal, int polka, int sygnatura) :Biblioteka(regal, polka)
	{
		cout << "Konstruktor inicjalizujacy klasy ksiazka" << endl;
		mSygnatura = sygnatura;
	}

};


int main()
{
	Biblioteka b;
	b.ZapiszRegal(2);
	b.ZapiszPolka(10);
	b.Wyswietl();

	Biblioteka bInic(2, 7);
	bInic.Wyswietl();

	Ksiazka k;
	k.ZapiszSygnatura(1111);
	k.Wyswietl();

	Ksiazka kBInic(11, 12, 13);
	kBInic.Wyswietl();
	
	


}