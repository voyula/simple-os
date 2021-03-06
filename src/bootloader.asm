SYS_EXIT  EQU 1
SYS_WRITE EQU 4
STDIN     EQU 0
STDOUT    EQU 1

%macro write_string 2
    MOV EAX, SYS_WRITE
    MOV EBX, STDOUT
    MOV ECX, %1
    MOV EDX, %2
    INT 80h
%endmacro

global _start
    
_start:
    MOV [STRING], DWORD 'Robo'
    MOV ECX, 3

loop:
    PUSH ECX
    write_string STRING, LENGTH
    write_string STARS, STARS_LENGTH
    POP ECX
    LOOP loop

CALL exit

exit:
    MOV EAX, SYS_EXIT
    INT 80h
    RET

section .data
    STRING DB 'Hello world!', 0xa
    LENGTH EQU $ - STRING

    STARS TIMES 10 DB '*'
    STARS_LENGTH EQU $ - STARS
