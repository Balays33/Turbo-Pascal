unit MCGA;

interface

procedure SetMode( Mode: word);
procedure PutPixel( X, Y: word; C: byte);
procedure Point( X, Y: word);
procedure Rectangle( X1, Y1, X2, Y2: word);
procedure CBar( Color: byte; X1, Y1, X2, Y2: word);
procedure Bar( X1, Y1, X2, Y2: word);
procedure OutText( X, Y: word; TXT: string);
procedure OutTransparentText( X, Y: word; TXT: string);
procedure SaveBar( P: pointer; X1, Y1, X2, Y2: word);
procedure LoadBar( P: pointer; X1, Y1, X2, Y2: word);
procedure VerticalBlink;
function  GetPixel( X, Y: word): byte;

const
	TxtMode = 3;
	_80x25 = 3;
	MCGAMode = $13;
	_320x200 = $13;
	PointColor: byte = 15;
	TextBackColor: byte = 0;

implementation

uses Dos, _System;

var
	CHAR1_SEG, CHAR1_OFS,
	CHAR2_SEG, CHAR2_OFS: word;
	REG: registers;

procedure SetMode; assembler; asm
	mov ax, Mode; int 10h; end;

procedure PutPixel; assembler; asm
	mov ax, 0a000h
	mov es, ax
	mov ax, Y
	mov bx, 320
	mul bx
	mov di, ax
	add di, X
	mov al, C
	stosb
	end;

function GetPixel; assembler;
 asm
	push ds
	mov ax, 0a000h
	mov ds, ax
	mov ax, Y
	mov bx, 320
	mul bx
	mov si, ax
	add si, X
	lodsb
	pop ds
	end;

procedure Point; begin PutPixel( X, Y, PointColor); end;

procedure RecTangle;   {   begin

  if (x1=x2) and (y1=y2) then Point (x1,y1) else }  assembler; asm

	mov ax, 0a000h
	mov es, ax
	mov ax, Y1
	mov bx, 320
	mul bx
	mov di, ax
	add di, X1
	push di
	mov al, PointColor
	mov cx, X2
	sub cx, X1
	rep stosb	      { (X1;Y1)->(X2;Y1) }

	mov ax, Y2
	mov bx, 320
	mul bx
	mov di, ax
	add di, X1
	mov al, PointColor
	mov cx, X2
	sub cx, X1
	inc cx
	rep stosb	      { (X1;Y2)->(X2;Y2) }

	pop di
	push di
	mov al, PointColor
	mov cx, Y2
	sub cx, Y1
  inc cx
 @FUGG_1:
	stosb
	add di, 319
	loop @FUGG_1		 { (X1;Y1)->(X1;Y2) }

	pop di
	add di, X2
	sub di, X1
	mov cx, Y2
	sub cx, Y1
  inc cx
 @FUGG_2:
	stosb
	add di, 319
	loop @FUGG_2				 { (X2;Y1)->(X2;Y2) }

 end; {end;}

procedure CBar; assembler; asm

	mov ax, 0a000h
	mov es, ax
	mov ax, Y1
	mov bx, 320
	mul bx
	mov di, ax
	add di, X1

	mov cx, Y2
	sub cx, Y1
	inc cx
	mov al, Color

 @FUGG:
	push cx
	push di
	mov cx, X2
	sub cx, X1
	inc cx
	rep stosb
	pop di
	add di, 320
	pop cx
	loop @FUGG

 end;

procedure Bar; begin CBar(  PointColor, x1, y1, x2, y2); end;


procedure OutChar( X, Y: word; C: char; C_FORE: byte);

 var
	ASCII: byte;
	CHAR_SEG, CHAR_OFS: word;

 begin
	if (X>312) or (Y>192) then Exit;
	ASCII:= Ord( C);
	if ASCII>127 then begin
		CHAR_SEG:= CHAR2_SEG; CHAR_OFS:= CHAR2_OFS; ASCII:= ASCII-128; end
	else begin CHAR_SEG:= CHAR1_SEG; CHAR_OFS:= CHAR1_OFS; end;

 asm

	push ds
	mov ds, CHAR_SEG
	mov si, CHAR_OFS
	mov al, ASCII
	mov bl, 8
	mul bl
	add si, ax

	mov ax, 0a000h
	mov es, ax
	mov ax, Y
	mov bx, 320
	mul bx
	mov di, ax
	add di, X

	mov cx, 8
 @BEOLVAS:
	push cx
	lodsb
	mov cx, 8
 @KISZAMOL:
	shl al, 1
	push ax
	jnc @NULLA
	mov al, C_FORE
	stosb
	jmp @NEM_NULLA
 @NULLA:
	inc di
 @NEM_NULLA:
	pop ax
	loop @KISZAMOL
	add di, 312
	pop cx
	loop @BEOLVAS

	pop ds

 end; end;

procedure OutText;

 var
	i, CLR: byte;
	SOR, OSZLOP: word;

 begin
	OSZLOP:= Y; SOR:= X;
	for i:=  1 to Length(TXT) do begin
		if SOR>312 then begin SOR:= 0; OSZLOP:= OSZLOP+8; end;
		if OSZLOP>192 then Exit;
		CLR:= PointColor;
		PointColor:= TextBackColor;
		Bar( SOR, OSZLOP, SOR+7, OSZLOP+7);
		PointColor:= CLR;
		OutChar( SOR, OSZLOP, _copy( TXT, i), PointColor);
		SOR:= SOR+8;
	 end;
 end;

procedure OutTransparentText;

 var
	i: byte;
	SOR, OSZLOP: word;

 begin
	OSZLOP:= Y; SOR:= X;
	for i:=  1 to Length(TXT) do begin
		if SOR>312 then begin SOR:= 0; OSZLOP:= OSZLOP+8; end;
		if OSZLOP>192 then Exit;
		OutChar( SOR, OSZLOP, _copy( TXT, i), PointColor);
		SOR:= SOR+8;
	 end;
 end;


procedure LoadBar; assembler; asm

	push ds
	lds si, P

	mov ax, 0a000h
	mov es, ax
	mov ax, Y1
	mov bx, 320
	mul bx
	mov di, ax
	add di, X1

	mov cx, Y2
	sub cx, Y1
	inc cx

 @ATRAK:
	push di
	push cx
	mov cx, X2
	sub cx, X1
	inc cx
	rep movsb
	pop cx
	pop di
	add di, 320
	loop @ATRAK

	pop ds
 end;

procedure SaveBar; assembler; asm

	push ds
	les di, P

	mov ax, 0a000h
	mov ds, ax
	mov ax, Y1
	mov bx, 320
	mul bx
	mov si, ax
	add si, X1

	mov cx, Y2
	sub cx, Y1
	inc cx

 @ATRAK:
	push si
	push cx
	mov cx, X2
	sub cx, X1
	inc cx
	rep movsb
	pop cx
	pop si
	add si, 320
	loop @ATRAK

	pop ds
 end;

procedure VerticalBlink; assembler; asm
		cli
		mov dx,3DAh
	@l1:
		in al,dx
		and al,08h
		jnz @l1
	@l2:
		in al,dx
		and al,08h
		jz  @l2
		sti
	end;



begin  with REG do begin

	ah:=$11;
	al:=$30;
	bh:= 3;
	Intr( $10, REG);
	CHAR1_SEG:= es;
	CHAR1_OFS:= bp;

	ah:=$11;
	al:=$30;
	bh:= 4;
	Intr( $10, REG);
	CHAR2_SEG:= es;
	CHAR2_OFS:= bp;

 end;
end.