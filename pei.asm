.model small
.stack
.data
 info db 10,13,10,13,'Programa que muestra la cantidad de numeros pares e impares$'
 msj db 10,13,10,13,' Los numeros son:$'
 res db 10,13,10,13,'# de impares:$'
 res1 db 10,13,10,13,'# de pares:$'
 k db 0
 impar db 0
 par db 0
 l db 0
 x db ?


 
.code
inicio:

 mov ax,@data
 mov ds,ax

 mov dx,offset info
 mov ah,09h
 int 21h
 
 mov dx,offset msj
 mov ah,09h
 int 21h


 mov bx,0800h 

leer:

 mov ah,01h
 int 21h

 cmp al,0dh
 je previo

 mov x,al
 sub x,030h
 mov al,x
 mov [bx],al
 inc bx
 jmp leer

previo:

 mov cl,bl
 mov bx,0800h

incr:

 mov al,[bx]
 cmp bl,cl
 je terminar

evaluar:
 mov ah,00h
 mov al,[bx] 
 mov dl,2
 div dl
 mov res,ah

 cmp res,0h
 je contador

 inc impar
 inc bx
 jmp incr
  
contador:

 inc par
 inc bx
 jmp incr

terminar:
 
 mov dx,offset res
 mov ah,09h
 int 21h

 mov dl,impar
 add dl,030h
 mov ah,02h
 int 21h 

 mov dx,offset res1
 mov ah,09h
 int 21h

 mov dl,par
 add dl,030h
 mov ah,02h
 int 21h

Salida:
 mov ah,4ch
 int 21h

end inicio