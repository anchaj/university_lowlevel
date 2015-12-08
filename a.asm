; wersja NASM: program zapisany w pliku tekstowym a.asm 
; kompilacja: nasm -fbin -o a.com a.asm

org 0x100

section .data                            ; sekcja danych zainicjalizowanych
    info: db "Hello world!",13, 10, '$'        ; ci¹g znaków zakoñczony znakiem dolara - wymagane przez funkcjê                                             ; o numerze 9, wyœwietlaj¹c¹ ci¹g, znaki 10 i 13 daj¹ now¹ liniê

section .bss                     ; sekcja danych niezainicjalizowanych
    bufor:      resb 5           ; bufor 5 bajtów 


section .text           ; sekcja kodu

    mov ah, 9
    mov dx, info
    int 0x21            ; wywo³aj przerwanie 0x21 - po za³adowaniu 9 do AH wyœwietlona bêdzie 
                        ; zawartoœæ rejestru DX

    mov ah,0    
    int 0x16            ; wywo³aj przerwanie 0x16 - po za³adowaniu 0 do AH program czeka
                        ; na naciœniêcie klawisza

    mov ax, 0x4C00      ; wyjœcie z programu z kodem b³êdu 0: w AH wpisane 4C, w AL wpisane 00, 
                        ; czyli kod wyjœcia
    int 0x21
