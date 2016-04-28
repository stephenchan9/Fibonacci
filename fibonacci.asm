
Include Irvine32.inc
ExitProcess proto,dwExitCode:dword

.data
 array DWORD 1,47 dup(0)							; set array values to be 0
 loop_count DWORD 47								; initialize loop counter to be 47

.code
;-------------------------------------------------------
; generate_fibonacci proc USES eax ebx ecx
; Generates fibonacci values and stores in an array.
; Receives: ESI points to the array, ECX = count
; Returns: nothing
;------------------------------------------------------- 

generate_fibonacci proc uses eax ebx ecx
	L1:
	add eax,ebx								;f(n-1)+f(n-2)
	
	add esi, TYPE esi						;Increment the index
	mov [esi],eax							;Move the eax value into array

	xchg ebx,eax							;Have eax be the F(n-2) value
	
	loop L1
	ret
generate_fibonacci endp

main proc
	mov esi, OFFSET array				; gets the memory address of the array into esi
	mov ecx, loop_count					; Sets loop counter to the array size
	
	mov eax,0							; Set the initial value of eax to 0
	mov ebx,1							; Set the initial value of ebx to 1

	call generate_fibonacci				; Calls the procedure
	
	call WaitMsg
	invoke ExitProcess,0
main endp
end main