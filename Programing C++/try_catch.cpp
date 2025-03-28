#include <stdexcept>
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	int licznik, mianownik,ulamek;
	cout << "Podaj liczby" << endl;
	cin >> licznik >> mianownik;
	try 
	{ 
		if (mianownik == 0)
		{ 
			throw mianownik;
		}
	ulamek = sqrt(licznik) / mianownik;

	}
	catch(int ex)
	{ 
		cout << "Nie dziel przez zero!";
	}
	try
	{
		if (licznik < 0)
		{
			throw licznik;
		}
		ulamek = sqrt(licznik) / mianownik;

	}
	catch (int ex2)
	{
		cout << "licznik nie moze byc ujemny!";
	}
	cout << ulamek;
	return 0;
	
}

