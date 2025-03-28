#include <iostream>
#include <vector>
using namespace std;


template <class T>
class Liczba
{
private:
	T mLiczba;

public:
	void ZapiszLiczba(T liczba)
	{
		mLiczba = liczba;
	}
	T PobierzLiczba()
	{
		
		return mLiczba;
	}
};

int main()
{
	

	Liczba<int> liczba1;

	liczba1.ZapiszLiczba(2);
	cout << "wartosc liczby: " << liczba1.PobierzLiczba() << endl;

	Liczba<float> liczba2;
	liczba2.ZapiszLiczba(3.14);
	cout << "WartoscLiczby: " << liczba2.PobierzLiczba() << endl;
	return 0;
}