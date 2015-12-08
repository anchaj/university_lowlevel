%include "asm_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
; dane zainicjalizowane
;

segment .bss
;
; dane niezainicjalizowane
;

segment .text
global _asm_main
_asm_main:
enter 0,0         ; setup 
pusha

; n^3
call read_int
mov ebx, eax 
mul ebx
mul ebx
call print_int
call print_nl 

; reszta z dzielenia n^3 przez podana liczbe
push eax
call read_int
mov ebx, eax
pop eax
div ebx
mov eax, edx
call print_int
call print_nl

dump_regs 1 ; wypisuje zawartosc rejestrow (do debugowania)

; ---

popa
mov eax, 0 ; powrót do C
leave
ret
