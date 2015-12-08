org 100h

section .bss
	bufor:      resb 16
section .data       
	null: db '$'
	komunikat: db "Podaj imie: ",'$'
    info: db 13,10,"Witaj ", '$'        ; ciąg znaków zakończony znakiem dolara - wymagane przez funkcję                                             ; o numerze 9, wyświetlającą ciąg, znaki 10 i 13 dają nową linię

section .text           ; sekcja kodu

    mov ah, 9
    mov dx, komunikat
    int 0x21
    
    mov ah, 0ah          ;wszytywanie znakow z klawiatury
    int 0x21

    push dx
    mov ah, 9
    mov dx, info
    int 0x21            ;Witaj  
            
    pop dx				;Proba wypisania imienia 
    mov ah, 9
    int 0x21                    

    mov ah,0    
    int 0x16            ; wywołaj przerwanie 0x16 - po załadowaniu 0 do AH program czeka
                        ; na naciśnięcie klawisza

    mov ax, 0x4C00      ; wyjście z programu z kodem błędu 0: w AH wpisane 4C, w AL wpisane 00, 
                        ; czyli kod wyjścia
    int 0x21
