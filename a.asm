; wersja NASM: program zapisany w pliku tekstowym a.asm 
; kompilacja: nasm -fbin -o a.com a.asm

org 0x100

section .data                            ; sekcja danych zainicjalizowanych
    info: db "Hello world!",13, 10, '$'        ; ci�g znak�w zako�czony znakiem dolara - wymagane przez funkcj�                                             ; o numerze 9, wy�wietlaj�c� ci�g, znaki 10 i 13 daj� now� lini�

section .bss                     ; sekcja danych niezainicjalizowanych
    bufor:      resb 5           ; bufor 5 bajt�w 


section .text           ; sekcja kodu

    mov ah, 9
    mov dx, info
    int 0x21            ; wywo�aj przerwanie 0x21 - po za�adowaniu 9 do AH wy�wietlona b�dzie 
                        ; zawarto�� rejestru DX

    mov ah,0    
    int 0x16            ; wywo�aj przerwanie 0x16 - po za�adowaniu 0 do AH program czeka
                        ; na naci�ni�cie klawisza

    mov ax, 0x4C00      ; wyj�cie z programu z kodem b��du 0: w AH wpisane 4C, w AL wpisane 00, 
                        ; czyli kod wyj�cia
    int 0x21
