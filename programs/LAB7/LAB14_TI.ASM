.model small
display macro msg
      lea dx,msg
      mov ah,09h
      int 21h
endm

.data
timestr db 020h dup(?)
msg1 db "Current Time::$"

.code
start: mov ax,@data
       mov ds,ax
       ;clear the screen
       mov ah,00h
       mov al,03h
       int 10h
  ag: mov bh,00h
      mov dh,01h
      mov dl,01h
      mov ah,02h
      int 10h
      lea si,timestr
      mov ah,2ch
      int 21h
      mov al,ch
      aam
      add ax,3030h
      mov [si],ah
      inc si
      mov [si],al
      inc si
      mov [si],byte ptr ':'
      inc si
      mov al,cl
      aam
      add ax,3030h
      mov [si],ah
      inc si
      mov [si],al
      inc si
      mov [si],byte ptr ':'
      inc si

      mov al,dh
      aam
      add ax,3030h
      mov [si],ah
      inc si
      mov [si],al
      inc si
      mov [si],byte ptr '$'
      display msg1
      display timestr

      mov ah,0bh
      int 21h
      cmp al,00h
      je ag
final: mov ah,4ch
       int 21h
end start
