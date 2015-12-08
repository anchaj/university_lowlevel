%include "asm_io.inc"    ;odpowiednik dyrektywy #include z C
segment .data
;
hello: db "hello world",0
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

mov eax, hello
call print_string
;dump_regs 1 ; wypisuje zawartosc rejestrow (do debugowania)

; ---

popa
mov eax, 0 ; powrót do C
leave
ret
