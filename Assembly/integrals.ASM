format PE Console 4.0
entry start
include 'win32ax.inc'


section '.text' code readable executable

start:

	cinvoke printf, <"Podaj a(dolna granica): ">
	cinvoke scanf, <"%lf">, a

	cinvoke printf, <"Podaj b(gorna granica): ">
	cinvoke scanf, <"%lf">, b
	cinvoke printf, <10,13>


	cinvoke printf, <"Podaj n(liczba przedzialow): ">
	cinvoke scanf, <"%hd">, n
	cinvoke printf, <10,13>



obl:

	; obliczamy wartosc dx = (b - a) / n
	fld [b]     ;³adujemy zmienn¹ rzeczywist¹ b
	fsub [a]    ;odejmujemy od górnej wartoœci zmienn¹ a
	fild [n]    ;³adujemy zmienn¹ ca³kowit¹ n
	fdiv st1, st0  ;dzielimy stosy, st1 = dx
	fstp st0     ; usuniecie st0 ze stosu (obliczona wartosc dx przesunela sie teraz do st0)

	
	;f(a)
	fld [a]
	fmul [pol]
	fsin

	
	;f(b)
	fld [b]
	fmul [pol]
	fsin

	
	;f(a) + f(b)
	fadd st0, st1
	
	;( f(a) + f(b) ) / 2
	fmul [pol]

	fxch st1					       ; zamiana st0 i st1
	fstp st0					       ; usuniecie st0 ze stosu
							       ; f(a)+f(b))/2 = st0
							       ; dx = st1



	mov cx,[n]
petla:
	dec cx
	jz koniec


	fld [a]
	fadd st0, st2
	fst [a]
	
	

	fmul [pol]
	fsin


	; obliczona wartosc dodajemy do rejestru st1
	fadd st1, st0

	; porzadkujemy stos poprzez usuniecie niepotrzebnej juz wartosci st0 ze stosu
	fstp st0
	jmp petla

koniec:

	fmul st0, st1	; pomnozenie obliczonej sumy przez dx

	fst [a]   ; do pamiêci idzie liczba z st0

	cinvoke printf, <'Wynik = %.3lf ',0>, dword [a], dword [a+4] ;wypisanie wyniku + 3 miejsca po przecinku

	invoke getch
	invoke ExitProcess

section '.data' data readable writeable
	
	a	dq 0
	b	dq 0
	n	dw 0
	pol dd 0.5


section '.idata' import data readable writeable
     library msvcrt,'MSVCRT.DLL', kernel32,'kernel32.dll'

     import msvcrt,\
     printf,'printf',\
     getch,'_getch',\
     scanf,'scanf'

     import  kernel32,\
     ExitProcess,'ExitProcess'