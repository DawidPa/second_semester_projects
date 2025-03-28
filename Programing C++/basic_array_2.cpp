#include <iostream>
#include <random>

using namespace std;

int main() {

	int tablica1[10] = { };
	int tablica2[10] = { };

	srand(time(0));
	for (int i = 0; i < (sizeof(tablica1) / sizeof(*tablica1)); i++)
	{
		tablica1[i] = rand() % 11;

		cout << "Pozycja " << i + 1 << ": " << tablica1[i] << endl;
	}

	cout << endl;

	for (int i = 0; i < (sizeof(tablica2) / sizeof(*tablica2)); i++)
	{
		tablica2[i] = rand() % 11;


		cout << "Pozycja " << i + 1 << ": " << tablica2[i] << endl;

	}
	for (int i = 0; i < 10; i++)
	{
		tablica1[i] += tablica2[i];   
	}
	cout << endl;
	for (int i = 0; i < 10; i++) 
	{
		cout << "Suma " << i+1 << " pozycji: " << tablica1[i] << " " << endl;
		
	}
	
	return 0;

}