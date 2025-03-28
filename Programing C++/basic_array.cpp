#include <iostream>
#include <random>


using namespace std;

int main() {

	int tablica1[10] = { };

	srand(time(0));
	for (int i = 0; i < (sizeof(tablica1) / sizeof(*tablica1)); i++)
	{
		tablica1[i] = rand() % 11;

		cout << "Pozycja " << i + 1 << ": " << tablica1[i] << endl;
	}

	cout << endl;

	for (int i = 0; i < (sizeof(tablica1) / sizeof(*tablica1)); i++)
	{
		tablica1[i] = rand() % 15 + 1;


		cout << "Pozycja " << i + 1 << ": " << tablica1[i] << endl;

	}

	cout << endl;

	for (int i = 0; i < (sizeof(tablica1) / sizeof(*tablica1)); i++)
	{
		tablica1[i] = rand() % 21 + (-10);


		cout << "Pozycja " << i + 1 << ": " << tablica1[i] << endl;

	}
	return 0;

}