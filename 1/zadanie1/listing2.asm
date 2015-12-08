; To build:
; kompilacja nasm -fobj objexe.asm
; linkowanie val objexe.obj,objexe.exe;
      
segment code

..start:                   ; punkt wejściowy programu (dla linkera VAL)
    mov ax,data            ; inicjalizacja rejestrów - to jest standard
    mov ds,ax
    mov ax,stack
    mov ss,ax
    mov sp,stacktop

;kod użytkownika
    mov dx,imie
    mov ah,9
    int 0x21
    
    mov ah, 0ah
    int 0x21
    
    push dx
    mov ah, 9
    mov dx, hello
    int 0x21
    
    pop dx				;Proba wypisania imienia 
    mov ah, 9
    int 0x21  
;koniec kodu użytkownika

    mov ax,0x4c00                    ; wyjście z programu
    int 0x21

segment data                    ; segment danych
    hello:      db 'Witaj ', 13, 10, '$'
    imie:  db 'Podaj imie: ','$'

segment stack stack            ; segment stosu
    resb 64
stacktop:
