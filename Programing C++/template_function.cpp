#include <iostream>
#include <vector>


using namespace std;

template <typename T>
T maksimum(T a, T b)
{

	return (a > b) ? a : b;

}

int main()
{
	
	cout << "int najwieksza z pary to: " << maksimum(1, 2) << endl;
	cout << "double najwieksza z pary to: " << maksimum(4.1, 3.0) << endl;
    cout << "float najwieksza z pary to: " << maksimum<float>(8, 3.14) << endl;

	//zad2
	cout << "char najwieksza z pary to: " << maksimum('Z','B') << endl; //według ASCII
	cout << "string najwieksza z pary to: " << maksimum<const char*>("dawid", "adam") << endl;
}