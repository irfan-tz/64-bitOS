global long_mode_start
extern kernel_main
section .text
bits 64
long_mode_start:
    ; load null into all data segment registers
    mov ax, 0
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    
    ; sending memory-mapped data to video-memory bus of addr [0xb8000] with data after the space
    ; first letter for bg color, second for fg color; third + fourth for the character
    mov word [0xb8000], 0x0243 ; "C" in green (0x02) on black background (0x00)
    mov word [0xb8002], 0x0248 ; "H" in green (0x02) on black background (0x00)
    mov word [0xb8004], 0x0255 ; "U" in green (0x02) on black background (0x00)
    mov word [0xb8006], 0x0250 ; "P" in green (0x02) on black background (0x00)
    mov word [0xb8008], 0x0241 ; "A" in green (0x02) on black background (0x00)
    mov word [0xb800a], 0x0243 ; "C" in green (0x02) on black background (0x00)
    mov word [0xb800c], 0x0241 ; "A" in green (0x02) on black background (0x00)
    mov word [0xb800e], 0x0242 ; "B" in green (0x02) on black background (0x00)
    mov word [0xb8010], 0x0252 ; "R" in green (0x02) on black background (0x00)
    mov word [0xb8012], 0x0241 ; "A" in green (0x02) on black background (0x00)
    mov word [0xb8014], 0x0220 ; " " in green (0x02) on black background (0x00)
    mov word [0xb8016], 0x0253 ; "S" in green (0x02) on black background (0x00)
    mov word [0xb8018], 0x0241 ; "A" in green (0x02) on black background (0x00)
    mov word [0xb801a], 0x0259 ; "Y" in green (0x02) on black background (0x00)
    mov word [0xb801c], 0x0253 ; "S" in green (0x02) on black background (0x00)
    mov word [0xb801e], 0x0220 ; " " in green (0x02) on black background (0x00)
    mov word [0xb8020], 0x0248 ; "H" in green (0x02) on black background (0x00)
    mov word [0xb8022], 0x0245 ; "E" in green (0x02) on black background (0x00)
    mov word [0xb8024], 0x024C ; "L" in green (0x02) on black background (0x00)
    mov word [0xb8026], 0x024C ; "L" in green (0x02) on black background (0x00)
    mov word [0xb8028], 0x024F ; "O" in green (0x02) on black background (0x00)
    
    call kernel_main

    hlt; 

