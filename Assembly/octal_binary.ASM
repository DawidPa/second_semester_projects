format PE Console 4.0

entry start
include 'win32ax.inc'
include 'win_macros.inc'  ;makra

section '.text' code readable executable


start:
        wyswietl txt
        mov ecx,0
        mov esi,0
        mov eax,0

ety1:
        ;dlugosc wpisanej liczby
        cmp cx,5
        je wysw_bin

        pob_znak    ;makro

        ;zakonczenie programu poprzez esc patrz ascii
        cmp al,27d
        je koniec2

        ;usuwanie przypisane do backspace patrz ascii
        cmp al,8h
        je ety3


        cmp al,'0'
        jb  ety1
        cmp al,'7'
        ja ety1



ety2:
        wysw_znak al ;bierze przypisane znaki z ety1 i wypisuje je w konsoli
        ;---------------
        mov [zm2+esi],al
        inc esi
        inc cx
        shl bx,3
        sub al,30h
        add bx,ax
        ;---------------
        jmp ety1

ety3:

        dec cx
        dec esi

        shr bx,3
        wysw_znak 8
        wysw_znak ''
        wysw_znak 8
        jmp ety1

;==========[binary]=============
wysw_bin:
        mov [zm1],bx
        wyswietl txt1
        mov ecx,16

ety4:
        push ecx
        rcl bx,1
        jc ety5
        mov al,'0'
        jmp ety6
ety5:
        mov al,'1'

ety6:
        wysw_znak al
        pop ecx
        loop ety4

;==========[decimal]=============

wyswietl txt2
        mov ax,[zm1]

ety8:

        mov ecx,5
        mov ax, [zm1]
        mov bx, 10

ety9:
        ;do dx trafia reszta z dzielenia AX : BX
        mov dx,0

        ;AX otrzymuje wynik dzielenia , BX zostaje takie same
        div bx

        ;dodajemy do dx 30 by móc wypisaæ kod ascii i dajemy wynik do stosu
        add dx,30h
        push dx

        ;powtarzamy 5 razy
        loop ety9

;wyswietlenie popów
        mov ecx,5

wyswietl_decy:
        pop dx
        wysw_znak dl
        loop wyswietl_decy


;==========[hexadecimal]=============
wyswietl txt4
         mov ax,[zm1]
ety10:
        mov ecx, 5
        mov bl, 16

ety11:
        push ecx
        mov ax,[zm1]
        mov cl,bl
        shr ax,cl
        and ax,15
        add ax,30h

wyswietl_hex:
        wysw_znak al
        sub bl,4
        pop ecx
        loop ety11

;====================================
wyswietl_oct:
        wyswietl txt3
        wyswietl zm2

koniec:

        pob_znak
        end_prog
koniec2:  ;koniec przypisany do klaswisza esc


        end_prog

section '.data' code readable writeable

        txt1 db 13,10, '[bin] = ',NULL
        txt2 db 13,10, '[dec] = ',NULL
        txt3 db 13,10, '[oct] = ',NULL
        txt4 db 13,10, '[hex] = ',NULL
        txt db 'Octalny: ',13,10,NULL
        zm1 dw 0
        zm2 db '',NULL