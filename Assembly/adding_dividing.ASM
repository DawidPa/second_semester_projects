format PE Console 4.0
entry start
include 'win32ax.inc'

section '.text' code readable executable
start:

;Zapytanie i pobranie danych od u¿ytkownika
        cinvoke printf, <"Podaj a = ">
        cinvoke scanf, <"%x">, zm1
        cinvoke printf, <10,13>

        cinvoke printf, <"Podaj b = ">
        cinvoke scanf, <"%x">, zm2
        cinvoke printf, <10,13>

        cinvoke printf, <"Podaj c = ">
        cinvoke scanf, <"%x">, zm3
        cinvoke printf, <10,13>



ety1:
;Przenosimy zmienne do rejestrów eax i ebx
        mov eax,dword [zm1]
        mov ebx,dword [zm2]

;Div oznacza dzielenie, polecenie to dzieli podany rejestr ebx przez eax
        div ebx  ;dzielenie

;Przenosimy zmienna do rejestru ecx
        mov ecx,dword [zm3]

;Dodajemy do wyniku dzielenia eax przez ebx liczbe przechowywana w rejestrze ecx
        add eax,ecx   ;dodawanie
;Przenosimy calosc znajdujaca sie w rejestrze eax do zmiennej wyn
        mov dword [wyn],eax

;Odczytujemy wynik
        cinvoke printf, <"zm1 / zm2 + zm3 = %x",10,13>, dword[wyn]

etyl2:

        cinvoke getch
        invoke ExitProcess


section '.data' data readable writeable
        zm1  dd 0
        zm2  dd 0
        zm3  dd 0
        wyn  dq 0

section '.idata' import data readable writeable
     library msvcrt,'MSVCRT.DLL', kernel32,'kernel32.dll'

     import msvcrt,\
     printf,'printf',\
     getch,'_getch',\
     scanf,'scanf'

     import  kernel32,\
     ExitProcess,'ExitProcess'
