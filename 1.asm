%include "asm_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data

hello: db "Hello World", '$'

segment .bss
;
; dane niezainicjalizowane
;

segment .text
global _asm_main
_asm_main:
enter 0,0         ; setup 
pusha


dump_regs 1 ; wypisuje zawartosc rejestrow (do debugowania)

; ---

popa
mov eax, 0 ; powrót do C
leave
ret
