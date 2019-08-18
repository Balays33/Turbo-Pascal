	.file "tenk.pas"
	.stabs "/mnt/disk0-maxtor_6y080l0-part1/program files/tp/work/home/",100,0,0,.Ltext0
	.stabs "tenk.pas",100,0,0,.Ltext0
.Ltext0:
	.stabd	72,0,1

.text
	.stabd	68,0,303
	.type	fpc_compiled,@function
fpc_compiled:
	.type	gcc2_compiled,@function
gcc2_compiled:
	.stabs "longint:t1=r1;-2147483648;2147483647;",128,0,47,0
	.stabs "LONGINT:t2=r1;-2147483648;2147483647;",128,0,50,0
	.stabs "char:t3=-20;",128,0,47,0
	.stabs "void:t4=4;",128,0,47,0
	.stabs "s32real:t5=r1;4;0;",128,0,47,0
	.stabs "SINGLE:t5",128,0,47,0
	.stabs "s64real:t6=r1;8;0;",128,0,47,0
	.stabs "DOUBLE:t6",128,0,47,0
	.stabs "s80real:t7=r1;12;0;",128,0,47,0
	.stabs "EXTENDED:t7",128,0,47,0
	.stabs "REAL:t6",128,0,47,0
	.stabs "void_pointer:t8=*4",128,0,47,0
	.stabs "POINTER:t8",128,0,47,0
	.stabs "void_farpointer:t9=*4",128,0,47,0
	.stabs "FARPOINTER:t9",128,0,47,0
	.stabs "byte:t10=r1;0;255;",128,0,47,0
	.stabs "shortstring:Tt11=s256length:10,0,8;st:ar10;1;255;3,8,2040;;",128,0,47,0
	.stabs "SHORTSTRING:Tt11",128,0,47,0
	.stabs "longstring:Tt12=s4length:1,0,32;dummy:10,32,8;st:ar10;1;-1;3,40,-8;;",128,0,47,0
	.stabs "LONGSTRING:Tt12",128,0,47,0
	.stabs "ansistring:Tt13=*3",128,0,47,0
	.stabs "ANSISTRING:Tt13",128,0,47,0
	.stabs "widestring:Tt14=*3",128,0,47,0
	.stabs "WIDESTRING:Tt14",128,0,47,0
	.stabs "boolean:t15=-21;",128,0,47,0
	.stabs "BOOLEAN:t15",128,0,47,0
	.stabs "BYTEBOOL:t15",128,0,47,0
	.stabs "CHAR:t3",128,0,47,0
	.stabs "widechar:t16=-30;",128,0,47,0
	.stabs "WIDECHAR:t16",128,0,47,0
	.stabs "ulong:t17=r1;0;-1;",128,0,47,0
	.stabs "CARDINAL:t17",128,0,47,0
	.stabs "qword:t18=-32;",128,0,47,0
	.stabs "QWORD:t18",128,0,47,0
	.stabs "int64:t19=-31;",128,0,47,0
	.stabs "INT64:t19",128,0,47,0
	.stabs "DWORD:t17",128,0,53,0
	.stabs "LONGWORD:t17",128,0,54,0
	.stabs "STRLENINT:t2",128,0,58,0
	.stabs "VALSINT:t2",128,0,71,0
	.stabs "VALUINT:t17",128,0,72,0
	.stabs "VALREAL:t7",128,0,73,0
	.stabs "TANSICHAR:t3",128,0,100,0
	.stabs "ANSICHAR:t3",128,0,101,0
	.stabs "PCHAR:t20=*3",128,0,96,0
	.stabs "PANSICHAR:t20",128,0,102,0
	.stabs "CURRENCY:t19",128,0,106,0
	.stabs "HRESULT:t2",128,0,107,0
	.stabs "TDATETIME:t6",128,0,108,0
	.stabs "ERROR:t2",128,0,109,0
	.stabs "SMALLINT:t21=r1;-32768;32767;",128,0,49,0
	.stabs "INTEGER:t21",128,0,143,0
	.stabs "word:t22=r1;0;65535;",128,0,47,0
	.stabs "TEXT:Tt23=s572HANDLE:1,0,32;MODE:1,32,32;RECSIZE:1,64,32;_PRIVATE:ar22;1;32;10,96,256;USERDATA:ar22;1;16;10,352,128;NAME:ar22;0;255;3,480,2048;;",128,0,47,0
	.stabs "TEXTFILE:Tt23",128,0,78,0
	.stabs "INTEGER:t2",128,0,29,0

.text
	.balign 16
	.stabs "main:F4",36,0,5,main
.Ll1:
	.stabn 68,0,5,.Ll1 - main
.globl	main
	.type	main,@function
main:
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	program_init
	.type	program_init,@function
program_init:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$4,%esp
.Ll2:
	.stabn 68,0,5,.Ll2 - program_init
	call	FPC_INITIALIZEUNITS
.Ll3:
	.stabn 68,0,6,.Ll3 - program_init
	call	_CRT$$_CLRSCR
.Ll4:
	.stabn 68,0,7,.Ll4 - program_init
	call	_SYSLINUX$$_RANDOMIZE
.Ll5:
	.stabn 68,0,8,.Ll5 - program_init
	pushl	$0
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll6:
	.stabn 68,0,9,.Ll6 - program_init
	call	_CRT$$_CLRSCR
.Ll7:
	.stabn 68,0,10,.Ll7 - program_init
	pushl	$10
	pushl	$60
	pushl	$7
	pushl	$20
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll8:
	.stabn 68,0,11,.Ll8 - program_init
	pushl	$1
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll9:
	.stabn 68,0,12,.Ll9 - program_init
	pushl	$4
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll10:
	.stabn 68,0,13,.Ll10 - program_init
	call	_CRT$$_CLRSCR
.L17:
.Ll11:
	.stabn 68,0,14,.Ll11 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L20
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L17
	call	FPC_IOCHECK
.L21:
.Ll12:
	.stabn 68,0,15,.Ll12 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L21
	call	FPC_IOCHECK
.L22:
.Ll13:
	.stabn 68,0,16,.Ll13 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L25
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L22
	call	FPC_IOCHECK
.Ll14:
	.stabn 68,0,17,.Ll14 - program_init
	pushl	$25
	pushl	$50
	pushl	$23
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll15:
	.stabn 68,0,18,.Ll15 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll16:
	.stabn 68,0,19,.Ll16 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.L38:
.Ll17:
	.stabn 68,0,20,.Ll17 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L41
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L38
	call	FPC_IOCHECK
.L42:
.Ll18:
	.stabn 68,0,21,.Ll18 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L42
	call	FPC_IOCHECK
.Ll19:
	.stabn 68,0,22,.Ll19 - program_init
	pushl	$200
	call	_CRT$$_SOUND$WORD
.Ll20:
	.stabn 68,0,23,.Ll20 - program_init
	pushl	$300
	call	_CRT$$_DELAY$WORD
.Ll21:
	.stabn 68,0,24,.Ll21 - program_init
	pushl	$300
	call	_CRT$$_SOUND$WORD
.Ll22:
	.stabn 68,0,25,.Ll22 - program_init
	pushl	$300
	call	_CRT$$_DELAY$WORD
.Ll23:
	.stabn 68,0,26,.Ll23 - program_init
	pushl	$400
	call	_CRT$$_SOUND$WORD
.Ll24:
	.stabn 68,0,27,.Ll24 - program_init
	pushl	$100
	call	_CRT$$_DELAY$WORD
.Ll25:
	.stabn 68,0,28,.Ll25 - program_init
	pushl	$100
	call	_CRT$$_SOUND$WORD
.Ll26:
	.stabn 68,0,29,.Ll26 - program_init
	pushl	$200
	call	_CRT$$_DELAY$WORD
.Ll27:
	.stabn 68,0,30,.Ll27 - program_init
	pushl	$300
	call	_CRT$$_SOUND$WORD
.Ll28:
	.stabn 68,0,31,.Ll28 - program_init
	pushl	$200
	call	_CRT$$_DELAY$WORD
.Ll29:
	.stabn 68,0,32,.Ll29 - program_init
	pushl	$200
	call	_CRT$$_SOUND$WORD
.Ll30:
	.stabn 68,0,33,.Ll30 - program_init
	pushl	$300
	call	_CRT$$_DELAY$WORD
.Ll31:
	.stabn 68,0,34,.Ll31 - program_init
	pushl	$300
	call	_CRT$$_SOUND$WORD
.Ll32:
	.stabn 68,0,35,.Ll32 - program_init
	pushl	$300
	call	_CRT$$_DELAY$WORD
.Ll33:
	.stabn 68,0,36,.Ll33 - program_init
	call	_CRT$$_NOSOUND
.Ll34:
	.stabn 68,0,37,.Ll34 - program_init
	pushl	$5
	pushl	$60
	pushl	$1
	pushl	$20
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll35:
	.stabn 68,0,38,.Ll35 - program_init
	pushl	$6
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll36:
	.stabn 68,0,39,.Ll36 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll37:
	.stabn 68,0,40,.Ll37 - program_init
	call	_CRT$$_CLRSCR
.L83:
.Ll38:
	.stabn 68,0,41,.Ll38 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L86
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L83
	call	FPC_IOCHECK
.Ll39:
	.stabn 68,0,42,.Ll39 - program_init
	pushl	$14
	pushl	$60
	pushl	$7
	pushl	$20
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll40:
	.stabn 68,0,43,.Ll40 - program_init
	pushl	$1
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll41:
	.stabn 68,0,44,.Ll41 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll42:
	.stabn 68,0,45,.Ll42 - program_init
	call	_CRT$$_CLRSCR
.L99:
.Ll43:
	.stabn 68,0,46,.Ll43 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L99
	call	FPC_IOCHECK
.L100:
.Ll44:
	.stabn 68,0,47,.Ll44 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L103
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L100
	call	FPC_IOCHECK
.L104:
.Ll45:
	.stabn 68,0,48,.Ll45 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L104
	call	FPC_IOCHECK
.L105:
.Ll46:
	.stabn 68,0,49,.Ll46 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L108
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L105
	call	FPC_IOCHECK
.L109:
.Ll47:
	.stabn 68,0,50,.Ll47 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L109
	call	FPC_IOCHECK
.L110:
.Ll48:
	.stabn 68,0,51,.Ll48 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L113
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L110
	call	FPC_IOCHECK
.L114:
.Ll49:
	.stabn 68,0,52,.Ll49 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L114
	call	FPC_IOCHECK
.L115:
.Ll50:
	.stabn 68,0,53,.Ll50 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L118
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L115
	call	FPC_IOCHECK
.L119:
.Ll51:
	.stabn 68,0,54,.Ll51 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L119
	call	FPC_IOCHECK
.L120:
.Ll52:
	.stabn 68,0,55,.Ll52 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L123
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L120
	call	FPC_IOCHECK
.Ll53:
	.stabn 68,0,56,.Ll53 - program_init
	pushl	$25
	pushl	$80
	pushl	$22
	pushl	$50
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll54:
	.stabn 68,0,57,.Ll54 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll55:
	.stabn 68,0,58,.Ll55 - program_init
	pushl	$1
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll56:
	.stabn 68,0,59,.Ll56 - program_init
	call	_CRT$$_CLRSCR
.L136:
.Ll57:
	.stabn 68,0,60,.Ll57 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L139
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L136
	call	FPC_IOCHECK
.L140:
.Ll58:
	.stabn 68,0,61,.Ll58 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L140
	call	FPC_IOCHECK
.L141:
.Ll59:
	.stabn 68,0,62,.Ll59 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L144
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L141
	call	FPC_IOCHECK
.L145:
.Ll60:
	.stabn 68,0,63,.Ll60 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L145
	call	FPC_IOCHECK
.L146:
.Ll61:
	.stabn 68,0,64,.Ll61 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L149
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L146
	call	FPC_IOCHECK
.Ll62:
	.stabn 68,0,65,.Ll62 - program_init
	pushl	$25
	pushl	$50
	pushl	$23
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll63:
	.stabn 68,0,66,.Ll63 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll64:
	.stabn 68,0,67,.Ll64 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.L162:
.Ll65:
	.stabn 68,0,68,.Ll65 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L41
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L162
	call	FPC_IOCHECK
.L165:
.Ll66:
	.stabn 68,0,69,.Ll66 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L165
	call	FPC_IOCHECK
.Ll67:
	.stabn 68,0,70,.Ll67 - program_init
	call	_CRT$$_CLRSCR
.Ll68:
	.stabn 68,0,71,.Ll68 - program_init
	pushl	$25
	pushl	$80
	pushl	$1
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll69:
	.stabn 68,0,72,.Ll69 - program_init
	pushl	$0
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll70:
	.stabn 68,0,73,.Ll70 - program_init
	call	_CRT$$_CLRSCR
.Ll71:
	.stabn 68,0,74,.Ll71 - program_init
	pushl	$3
	pushl	$80
	pushl	$1
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll72:
	.stabn 68,0,75,.Ll72 - program_init
	pushl	$1
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll73:
	.stabn 68,0,76,.Ll73 - program_init
	call	_CRT$$_CLRSCR
.L186:
.Ll74:
	.stabn 68,0,77,.Ll74 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L189
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L186
	call	FPC_IOCHECK
.L190:
.Ll75:
	.stabn 68,0,78,.Ll75 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L190
	call	FPC_IOCHECK
.L191:
.Ll76:
	.stabn 68,0,79,.Ll76 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L194
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L191
	call	FPC_IOCHECK
.Ll77:
	.stabn 68,0,80,.Ll77 - program_init
	pushl	$4
	pushl	$80
	pushl	$1
	pushl	$65
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll78:
	.stabn 68,0,81,.Ll78 - program_init
	pushl	$7
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll79:
	.stabn 68,0,82,.Ll79 - program_init
	pushl	$9
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll80:
	.stabn 68,0,83,.Ll80 - program_init
	call	_CRT$$_CLRSCR
.L207:
.Ll81:
	.stabn 68,0,84,.Ll81 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L210
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L207
	call	FPC_IOCHECK
.L211:
.Ll82:
	.stabn 68,0,85,.Ll82 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L211
	call	FPC_IOCHECK
.L212:
.Ll83:
	.stabn 68,0,86,.Ll83 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L215
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L212
	call	FPC_IOCHECK
.L216:
.Ll84:
	.stabn 68,0,87,.Ll84 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L216
	call	FPC_IOCHECK
.L217:
.Ll85:
	.stabn 68,0,88,.Ll85 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L220
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L217
	call	FPC_IOCHECK
.L221:
.Ll86:
	.stabn 68,0,89,.Ll86 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L221
	call	FPC_IOCHECK
.L222:
.Ll87:
	.stabn 68,0,90,.Ll87 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L225
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L222
	call	FPC_IOCHECK
.Ll88:
	.stabn 68,0,91,.Ll88 - program_init
	pushl	$25
	pushl	$80
	pushl	$25
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll89:
	.stabn 68,0,92,.Ll89 - program_init
	pushl	$1
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll90:
	.stabn 68,0,93,.Ll90 - program_init
	pushl	$4
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll91:
	.stabn 68,0,94,.Ll91 - program_init
	call	_CRT$$_CLRSCR
.L238:
.Ll92:
	.stabn 68,0,95,.Ll92 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L241
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L238
	call	FPC_IOCHECK
.Ll93:
	.stabn 68,0,96,.Ll93 - program_init
	pushl	$18
	pushl	$50
	pushl	$4
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll94:
	.stabn 68,0,97,.Ll94 - program_init
	pushl	$0
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll95:
	.stabn 68,0,98,.Ll95 - program_init
	pushl	$9
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll96:
	.stabn 68,0,99,.Ll96 - program_init
	call	_CRT$$_CLRSCR
.L254:
.Ll97:
	.stabn 68,0,100,.Ll97 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L254
	call	FPC_IOCHECK
.L255:
.Ll98:
	.stabn 68,0,101,.Ll98 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L258
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L255
	call	FPC_IOCHECK
.L259:
.Ll99:
	.stabn 68,0,102,.Ll99 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L259
	call	FPC_IOCHECK
.L260:
.Ll100:
	.stabn 68,0,103,.Ll100 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L263
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L260
	call	FPC_IOCHECK
.L264:
.Ll101:
	.stabn 68,0,104,.Ll101 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L264
	call	FPC_IOCHECK
.L265:
.Ll102:
	.stabn 68,0,105,.Ll102 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L268
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L265
	call	FPC_IOCHECK
.L269:
.Ll103:
	.stabn 68,0,106,.Ll103 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L269
	call	FPC_IOCHECK
.L270:
.Ll104:
	.stabn 68,0,107,.Ll104 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L273
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L270
	call	FPC_IOCHECK
.L274:
.Ll105:
	.stabn 68,0,108,.Ll105 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L274
	call	FPC_IOCHECK
.L275:
.Ll106:
	.stabn 68,0,109,.Ll106 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L278
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L275
	call	FPC_IOCHECK
.L279:
.Ll107:
	.stabn 68,0,110,.Ll107 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L279
	call	FPC_IOCHECK
.L280:
.Ll108:
	.stabn 68,0,111,.Ll108 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L283
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L280
	call	FPC_IOCHECK
.L284:
.Ll109:
	.stabn 68,0,112,.Ll109 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L284
	call	FPC_IOCHECK
.L285:
.Ll110:
	.stabn 68,0,113,.Ll110 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L288
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L285
	call	FPC_IOCHECK
.L289:
.Ll111:
	.stabn 68,0,114,.Ll111 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L289
	call	FPC_IOCHECK
.L290:
.Ll112:
	.stabn 68,0,115,.Ll112 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L293
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L290
	call	FPC_IOCHECK
.L294:
.Ll113:
	.stabn 68,0,116,.Ll113 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L294
	call	FPC_IOCHECK
.L295:
.Ll114:
	.stabn 68,0,117,.Ll114 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L298
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L295
	call	FPC_IOCHECK
.L299:
.Ll115:
	.stabn 68,0,118,.Ll115 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L299
	call	FPC_IOCHECK
.L300:
.Ll116:
	.stabn 68,0,119,.Ll116 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L303
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L300
	call	FPC_IOCHECK
.L304:
.Ll117:
	.stabn 68,0,120,.Ll117 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L304
	call	FPC_IOCHECK
.L305:
.Ll118:
	.stabn 68,0,121,.Ll118 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L308
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L305
	call	FPC_IOCHECK
.L309:
.Ll119:
	.stabn 68,0,122,.Ll119 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L309
	call	FPC_IOCHECK
.Ll120:
	.stabn 68,0,123,.Ll120 - program_init
	pushl	$14
	pushl	$74
	pushl	$8
	pushl	$55
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll121:
	.stabn 68,0,124,.Ll121 - program_init
	call	_CRT$$_CLRSCR
.L318:
.Ll122:
	.stabn 68,0,125,.Ll122 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L321
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L318
	call	FPC_IOCHECK
.L322:
.Ll123:
	.stabn 68,0,126,.Ll123 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L322
	call	FPC_IOCHECK
.L323:
.Ll124:
	.stabn 68,0,127,.Ll124 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L326
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L323
	call	FPC_IOCHECK
.L327:
.Ll125:
	.stabn 68,0,128,.Ll125 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L327
	call	FPC_IOCHECK
.L328:
.Ll126:
	.stabn 68,0,129,.Ll126 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L331
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L328
	call	FPC_IOCHECK
.L332:
.Ll127:
	.stabn 68,0,130,.Ll127 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L332
	call	FPC_IOCHECK
.L333:
.Ll128:
	.stabn 68,0,131,.Ll128 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L336
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L333
	call	FPC_IOCHECK
.Ll129:
	.stabn 68,0,132,.Ll129 - program_init
	pushl	$23
	pushl	$80
	pushl	$20
	pushl	$54
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll130:
	.stabn 68,0,133,.Ll130 - program_init
	pushl	$4
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll131:
	.stabn 68,0,134,.Ll131 - program_init
	pushl	$1
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll132:
	.stabn 68,0,135,.Ll132 - program_init
	call	_CRT$$_CLRSCR
.L349:
.Ll133:
	.stabn 68,0,136,.Ll133 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L352
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L349
	call	FPC_IOCHECK
.L353:
.Ll134:
	.stabn 68,0,137,.Ll134 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L353
	call	FPC_IOCHECK
.L354:
.Ll135:
	.stabn 68,0,138,.Ll135 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L357
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L354
	call	FPC_IOCHECK
.L358:
.Ll136:
	.stabn 68,0,139,.Ll136 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L358
	call	FPC_IOCHECK
.L359:
.Ll137:
	.stabn 68,0,140,.Ll137 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L362
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L359
	call	FPC_IOCHECK
.Ll138:
	.stabn 68,0,141,.Ll138 - program_init
	pushl	$23
	pushl	$51
	pushl	$18
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll139:
	.stabn 68,0,142,.Ll139 - program_init
	pushl	$4
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll140:
	.stabn 68,0,143,.Ll140 - program_init
	call	_CRT$$_CLRSCR
.Ll141:
	.stabn 68,0,144,.Ll141 - program_init
	pushl	$4
	call	_SYSLINUX$$_RANDOM$LONGINT
	incl	%eax
	movl	%eax,_N
.Ll142:
	.stabn 68,0,145,.Ll142 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	incl	%eax
	movl	%eax,_B
.L381:
.Ll143:
	.stabn 68,0,146,.Ll143 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L384
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L381
	call	FPC_IOCHECK
.L385:
.Ll144:
	.stabn 68,0,147,.Ll144 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L385
	call	FPC_IOCHECK
.L386:
.Ll145:
	.stabn 68,0,148,.Ll145 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L389
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L386
	call	FPC_IOCHECK
.L390:
.Ll146:
	.stabn 68,0,149,.Ll146 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L390
	call	FPC_IOCHECK
.L391:
.Ll147:
	.stabn 68,0,150,.Ll147 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L391
	call	FPC_IOCHECK
.Ll148:
	.stabn 68,0,151,.Ll148 - program_init
	call	_CRT$$_CLRSCR
.L392:
.Ll149:
	.stabn 68,0,152,.Ll149 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L395
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L392
	call	FPC_IOCHECK
.L396:
.Ll150:
	.stabn 68,0,153,.Ll150 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_N
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L396
	call	FPC_IOCHECK
.L399:
.Ll151:
	.stabn 68,0,154,.Ll151 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L399
	call	FPC_IOCHECK
.L400:
.Ll152:
	.stabn 68,0,155,.Ll152 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L403
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L400
	call	FPC_IOCHECK
.L404:
.Ll153:
	.stabn 68,0,156,.Ll153 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_B
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L404
	call	FPC_IOCHECK
.Ll154:
	.stabn 68,0,157,.Ll154 - program_init
	movl	_N,%eax
	cmpl	_B,%eax
	jnge	.L408
.L409:
.Ll155:
	.stabn 68,0,159,.Ll155 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L412
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L409
	call	FPC_IOCHECK
.Ll156:
	.stabn 68,0,160,.Ll156 - program_init
	pushl	$1000
	call	_CRT$$_SOUND$WORD
.Ll157:
	.stabn 68,0,161,.Ll157 - program_init
	pushl	$100
	call	_CRT$$_DELAY$WORD
.Ll158:
	.stabn 68,0,162,.Ll158 - program_init
	pushl	$500
	call	_CRT$$_SOUND$WORD
.Ll159:
	.stabn 68,0,163,.Ll159 - program_init
	pushl	$600
	call	_CRT$$_DELAY$WORD
.Ll160:
	.stabn 68,0,164,.Ll160 - program_init
	call	_CRT$$_NOSOUND
.L421:
.Ll161:
	.stabn 68,0,165,.Ll161 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L421
	call	FPC_IOCHECK
.Ll162:
	.stabn 68,0,166,.Ll162 - program_init
	pushl	$16
	pushl	$68
	pushl	$5
	pushl	$13
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll163:
	.stabn 68,0,167,.Ll163 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll164:
	.stabn 68,0,168,.Ll164 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll165:
	.stabn 68,0,169,.Ll165 - program_init
	call	_CRT$$_CLRSCR
.L434:
.Ll166:
	.stabn 68,0,170,.Ll166 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L434
	call	FPC_IOCHECK
.L435:
.Ll167:
	.stabn 68,0,171,.Ll167 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L438
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L435
	call	FPC_IOCHECK
.L439:
.Ll168:
	.stabn 68,0,172,.Ll168 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L439
	call	FPC_IOCHECK
.L440:
.Ll169:
	.stabn 68,0,173,.Ll169 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L443
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L440
	call	FPC_IOCHECK
.L444:
.Ll170:
	.stabn 68,0,174,.Ll170 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L447
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L444
	call	FPC_IOCHECK
.L448:
.Ll171:
	.stabn 68,0,175,.Ll171 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L451
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L448
	call	FPC_IOCHECK
.L452:
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L452
	call	FPC_IOCHECK
.L453:
.Ll172:
	.stabn 68,0,176,.Ll172 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L456
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L453
	call	FPC_IOCHECK
.L457:
.Ll173:
	.stabn 68,0,177,.Ll173 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L460
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L457
	call	FPC_IOCHECK
.L461:
.Ll174:
	.stabn 68,0,178,.Ll174 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L461
	call	FPC_IOCHECK
.Ll175:
	.stabn 68,0,179,.Ll175 - program_init
	pushl	$.L462
	jmp	_SYSLINUX$$_HALT
.L408:
.L463:
.Ll176:
	.stabn 68,0,182,.Ll176 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L466
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L463
	call	FPC_IOCHECK
.L462:
.Ll177:
	.stabn 68,0,184,.Ll177 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	incl	%eax
	movl	%eax,_W
.Ll178:
	.stabn 68,0,185,.Ll178 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	addl	$2,%eax
	movl	%eax,_B
.L475:
.Ll179:
	.stabn 68,0,186,.Ll179 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L478
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L475
	call	FPC_IOCHECK
.L479:
.Ll180:
	.stabn 68,0,187,.Ll180 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L479
	call	FPC_IOCHECK
.L480:
.Ll181:
	.stabn 68,0,188,.Ll181 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L480
	call	FPC_IOCHECK
.Ll182:
	.stabn 68,0,189,.Ll182 - program_init
	call	_CRT$$_CLRSCR
.L481:
.Ll183:
	.stabn 68,0,190,.Ll183 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L395
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L481
	call	FPC_IOCHECK
.L484:
.Ll184:
	.stabn 68,0,191,.Ll184 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_W
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L484
	call	FPC_IOCHECK
.L487:
.Ll185:
	.stabn 68,0,192,.Ll185 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L487
	call	FPC_IOCHECK
.L488:
.Ll186:
	.stabn 68,0,193,.Ll186 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L403
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L488
	call	FPC_IOCHECK
.L491:
.Ll187:
	.stabn 68,0,194,.Ll187 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_B
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L491
	call	FPC_IOCHECK
.Ll188:
	.stabn 68,0,195,.Ll188 - program_init
	movl	_W,%eax
	cmpl	_B,%eax
	jnge	.L495
.L496:
.Ll189:
	.stabn 68,0,197,.Ll189 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L412
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L496
	call	FPC_IOCHECK
.Ll190:
	.stabn 68,0,198,.Ll190 - program_init
	pushl	$1000
	call	_CRT$$_SOUND$WORD
.Ll191:
	.stabn 68,0,199,.Ll191 - program_init
	pushl	$100
	call	_CRT$$_DELAY$WORD
.Ll192:
	.stabn 68,0,200,.Ll192 - program_init
	pushl	$500
	call	_CRT$$_SOUND$WORD
.Ll193:
	.stabn 68,0,201,.Ll193 - program_init
	pushl	$600
	call	_CRT$$_DELAY$WORD
.Ll194:
	.stabn 68,0,202,.Ll194 - program_init
	call	_CRT$$_NOSOUND
.L507:
.Ll195:
	.stabn 68,0,203,.Ll195 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L507
	call	FPC_IOCHECK
.Ll196:
	.stabn 68,0,204,.Ll196 - program_init
	pushl	$16
	pushl	$68
	pushl	$5
	pushl	$13
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll197:
	.stabn 68,0,205,.Ll197 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll198:
	.stabn 68,0,206,.Ll198 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll199:
	.stabn 68,0,207,.Ll199 - program_init
	call	_CRT$$_CLRSCR
.L520:
.Ll200:
	.stabn 68,0,208,.Ll200 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L520
	call	FPC_IOCHECK
.L521:
.Ll201:
	.stabn 68,0,209,.Ll201 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L438
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L521
	call	FPC_IOCHECK
.L524:
.Ll202:
	.stabn 68,0,210,.Ll202 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L524
	call	FPC_IOCHECK
.L525:
.Ll203:
	.stabn 68,0,211,.Ll203 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L443
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L525
	call	FPC_IOCHECK
.L528:
.Ll204:
	.stabn 68,0,212,.Ll204 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L447
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L528
	call	FPC_IOCHECK
.L531:
.Ll205:
	.stabn 68,0,213,.Ll205 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L451
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L531
	call	FPC_IOCHECK
.L534:
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L534
	call	FPC_IOCHECK
.L535:
.Ll206:
	.stabn 68,0,214,.Ll206 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L456
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L535
	call	FPC_IOCHECK
.L538:
.Ll207:
	.stabn 68,0,215,.Ll207 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L460
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L538
	call	FPC_IOCHECK
.L541:
.Ll208:
	.stabn 68,0,216,.Ll208 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L541
	call	FPC_IOCHECK
.Ll209:
	.stabn 68,0,217,.Ll209 - program_init
	pushl	$.L542
	jmp	_SYSLINUX$$_HALT
.L495:
.L543:
.Ll210:
	.stabn 68,0,220,.Ll210 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L546
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L543
	call	FPC_IOCHECK
.L542:
.Ll211:
	.stabn 68,0,222,.Ll211 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	incl	%eax
	movl	%eax,_A
.Ll212:
	.stabn 68,0,223,.Ll212 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	addl	$2,%eax
	movl	%eax,_B
.L555:
.Ll213:
	.stabn 68,0,224,.Ll213 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L558
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L555
	call	FPC_IOCHECK
.L559:
.Ll214:
	.stabn 68,0,225,.Ll214 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L559
	call	FPC_IOCHECK
.L560:
.Ll215:
	.stabn 68,0,226,.Ll215 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L560
	call	FPC_IOCHECK
.Ll216:
	.stabn 68,0,227,.Ll216 - program_init
	call	_CRT$$_CLRSCR
.L561:
.Ll217:
	.stabn 68,0,228,.Ll217 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L395
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L561
	call	FPC_IOCHECK
.L564:
.Ll218:
	.stabn 68,0,229,.Ll218 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_A
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L564
	call	FPC_IOCHECK
.L567:
.Ll219:
	.stabn 68,0,230,.Ll219 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L567
	call	FPC_IOCHECK
.L568:
.Ll220:
	.stabn 68,0,231,.Ll220 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L403
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L568
	call	FPC_IOCHECK
.L571:
.Ll221:
	.stabn 68,0,232,.Ll221 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_B
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L571
	call	FPC_IOCHECK
.Ll222:
	.stabn 68,0,233,.Ll222 - program_init
	movl	_A,%eax
	cmpl	_B,%eax
	jnge	.L575
.L576:
.Ll223:
	.stabn 68,0,235,.Ll223 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L412
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L576
	call	FPC_IOCHECK
.Ll224:
	.stabn 68,0,236,.Ll224 - program_init
	pushl	$1000
	call	_CRT$$_SOUND$WORD
.Ll225:
	.stabn 68,0,237,.Ll225 - program_init
	pushl	$100
	call	_CRT$$_DELAY$WORD
.Ll226:
	.stabn 68,0,238,.Ll226 - program_init
	pushl	$500
	call	_CRT$$_SOUND$WORD
.Ll227:
	.stabn 68,0,239,.Ll227 - program_init
	pushl	$600
	call	_CRT$$_DELAY$WORD
.Ll228:
	.stabn 68,0,240,.Ll228 - program_init
	call	_CRT$$_NOSOUND
.L587:
.Ll229:
	.stabn 68,0,241,.Ll229 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L587
	call	FPC_IOCHECK
.Ll230:
	.stabn 68,0,242,.Ll230 - program_init
	pushl	$16
	pushl	$68
	pushl	$5
	pushl	$13
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll231:
	.stabn 68,0,243,.Ll231 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll232:
	.stabn 68,0,244,.Ll232 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll233:
	.stabn 68,0,245,.Ll233 - program_init
	call	_CRT$$_CLRSCR
.L600:
.Ll234:
	.stabn 68,0,246,.Ll234 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L600
	call	FPC_IOCHECK
.L601:
.Ll235:
	.stabn 68,0,247,.Ll235 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L438
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L601
	call	FPC_IOCHECK
.L604:
.Ll236:
	.stabn 68,0,248,.Ll236 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L604
	call	FPC_IOCHECK
.L605:
.Ll237:
	.stabn 68,0,249,.Ll237 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L443
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L605
	call	FPC_IOCHECK
.L608:
.Ll238:
	.stabn 68,0,250,.Ll238 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L447
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L608
	call	FPC_IOCHECK
.L611:
.Ll239:
	.stabn 68,0,251,.Ll239 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L451
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L611
	call	FPC_IOCHECK
.L614:
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L614
	call	FPC_IOCHECK
.L615:
.Ll240:
	.stabn 68,0,252,.Ll240 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L456
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L615
	call	FPC_IOCHECK
.L618:
.Ll241:
	.stabn 68,0,253,.Ll241 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L460
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L618
	call	FPC_IOCHECK
.L621:
.Ll242:
	.stabn 68,0,254,.Ll242 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L621
	call	FPC_IOCHECK
.Ll243:
	.stabn 68,0,255,.Ll243 - program_init
	pushl	$.L622
	jmp	_SYSLINUX$$_HALT
.L575:
.L623:
.Ll244:
	.stabn 68,0,258,.Ll244 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L626
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L623
	call	FPC_IOCHECK
.L622:
.Ll245:
	.stabn 68,0,260,.Ll245 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	incl	%eax
	movl	%eax,_S
.Ll246:
	.stabn 68,0,261,.Ll246 - program_init
	pushl	$5
	call	_SYSLINUX$$_RANDOM$LONGINT
	addl	$2,%eax
	movl	%eax,_B
.L635:
.Ll247:
	.stabn 68,0,262,.Ll247 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L638
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L635
	call	FPC_IOCHECK
.L639:
.Ll248:
	.stabn 68,0,263,.Ll248 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L639
	call	FPC_IOCHECK
.L640:
.Ll249:
	.stabn 68,0,264,.Ll249 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L640
	call	FPC_IOCHECK
.Ll250:
	.stabn 68,0,265,.Ll250 - program_init
	call	_CRT$$_CLRSCR
.L641:
.Ll251:
	.stabn 68,0,266,.Ll251 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L395
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L641
	call	FPC_IOCHECK
.L644:
.Ll252:
	.stabn 68,0,267,.Ll252 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_S
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L644
	call	FPC_IOCHECK
.L647:
.Ll253:
	.stabn 68,0,268,.Ll253 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L647
	call	FPC_IOCHECK
.L648:
.Ll254:
	.stabn 68,0,269,.Ll254 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L403
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L648
	call	FPC_IOCHECK
.L651:
.Ll255:
	.stabn 68,0,270,.Ll255 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	_B
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L651
	call	FPC_IOCHECK
.Ll256:
	.stabn 68,0,271,.Ll256 - program_init
	movl	_S,%eax
	cmpl	_B,%eax
	jnge	.L655
.L656:
.Ll257:
	.stabn 68,0,273,.Ll257 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L412
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L656
	call	FPC_IOCHECK
.Ll258:
	.stabn 68,0,274,.Ll258 - program_init
	pushl	$1000
	call	_CRT$$_SOUND$WORD
.Ll259:
	.stabn 68,0,275,.Ll259 - program_init
	pushl	$100
	call	_CRT$$_DELAY$WORD
.Ll260:
	.stabn 68,0,276,.Ll260 - program_init
	pushl	$500
	call	_CRT$$_SOUND$WORD
.Ll261:
	.stabn 68,0,277,.Ll261 - program_init
	pushl	$600
	call	_CRT$$_DELAY$WORD
.Ll262:
	.stabn 68,0,278,.Ll262 - program_init
	call	_CRT$$_NOSOUND
.L667:
.Ll263:
	.stabn 68,0,279,.Ll263 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L667
	call	FPC_IOCHECK
.Ll264:
	.stabn 68,0,280,.Ll264 - program_init
	pushl	$16
	pushl	$68
	pushl	$5
	pushl	$13
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll265:
	.stabn 68,0,281,.Ll265 - program_init
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll266:
	.stabn 68,0,282,.Ll266 - program_init
	pushl	$15
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll267:
	.stabn 68,0,283,.Ll267 - program_init
	call	_CRT$$_CLRSCR
.L680:
.Ll268:
	.stabn 68,0,284,.Ll268 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L680
	call	FPC_IOCHECK
.L681:
.Ll269:
	.stabn 68,0,285,.Ll269 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L438
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L681
	call	FPC_IOCHECK
.L684:
.Ll270:
	.stabn 68,0,286,.Ll270 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L684
	call	FPC_IOCHECK
.L685:
.Ll271:
	.stabn 68,0,287,.Ll271 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L443
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L685
	call	FPC_IOCHECK
.L688:
.Ll272:
	.stabn 68,0,288,.Ll272 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L447
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L688
	call	FPC_IOCHECK
.L691:
.Ll273:
	.stabn 68,0,289,.Ll273 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L451
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L691
	call	FPC_IOCHECK
.L694:
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L694
	call	FPC_IOCHECK
.L695:
.Ll274:
	.stabn 68,0,290,.Ll274 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L456
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L695
	call	FPC_IOCHECK
.L698:
.Ll275:
	.stabn 68,0,291,.Ll275 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L460
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L698
	call	FPC_IOCHECK
.L701:
.Ll276:
	.stabn 68,0,292,.Ll276 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L701
	call	FPC_IOCHECK
.Ll277:
	.stabn 68,0,293,.Ll277 - program_init
	pushl	$.L702
	jmp	_SYSLINUX$$_HALT
.L655:
.L703:
.Ll278:
	.stabn 68,0,296,.Ll278 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L706
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L703
	call	FPC_IOCHECK
.L702:
.L707:
.Ll279:
	.stabn 68,0,298,.Ll279 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L707
	call	FPC_IOCHECK
.L708:
.Ll280:
	.stabn 68,0,299,.Ll280 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L708
	call	FPC_IOCHECK
.L709:
.Ll281:
	.stabn 68,0,300,.Ll281 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L709
	call	FPC_IOCHECK
.L710:
.Ll282:
	.stabn 68,0,301,.Ll282 - program_init
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L713
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L710
	call	FPC_IOCHECK
.L714:
.Ll283:
	.stabn 68,0,302,.Ll283 - program_init
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	-4(%ebp)
	call	FPC_READLN_END
	pushl	$.L714
	call	FPC_IOCHECK
.Ll284:
	.stabn 68,0,303,.Ll284 - program_init
	call	FPC_DO_EXIT
.L715:
	leave
	ret
.Le0:
	.size	main, .Le0 - main
	.stabn 192,0,0,main-main
	.stabn 224,0,0,.L715-main
	.balign 16

.data
	.ascii	"FPC 1.0.10 [2003/06/26] for i386 - LINUX"
	.balign 4
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.long	0
.Le1:
	.size	FPC_RESOURCESTRINGTABLES, .Le1 - FPC_RESOURCESTRINGTABLES
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.long	5,0
	.long	INIT$$SYSLINUX
	.long	0
	.long	INIT$$OBJPAS
	.long	FINALIZE$$OBJPAS
	.long	INIT$$LINEINFO
	.long	FINALIZE$$LINEINFO
	.long	INIT$$LINUX
	.long	FINALIZE$$LINUX
	.long	INIT$$CRT
	.long	FINALIZE$$CRT
.Le2:
	.size	INITFINAL, .Le2 - INITFINAL
.globl	HEAPSIZE
	.type	HEAPSIZE,@object
HEAPSIZE:
	.long	8000000
.globl	__stklen
	.type	__stklen,@object
__stklen:
	.long	8192

.data
.L20:
	.stabd	70,0,14
	.ascii	"MDEMO verzi\242 A j\240t\202k megjelen\202s\202nek "
	.ascii	"ideje 2000 nyara. Keresd a szak\201zletekben.\000"
.L25:
	.stabd	70,0,16
	.ascii	"-G\202pig\202ny Pentium 400/64 MB RAM/10 MB HDD 3Df"
	.ascii	"x\000"
.L41:
	.stabd	70,0,20
	.ascii	". A folytat\240shoz nyomd meg az ENTER billenty\373"
	.ascii	"t!\000"
.L86:
	.stabd	70,0,41
	.ascii	"\"      A FOX Laboratorium bemutatja\000"
.L103:
	.stabd	70,0,47
	.ascii	"!     \261\261\261\261\261\261\261 \261\261\261\261"
	.ascii	"\261  \261\261    \261 \261   \261\000"
.L108:
	.stabd	70,0,49
	.ascii	"!        \261    \261      \261 \261   \261 \261  \261"
	.ascii	" \000"
.L113:
	.stabd	70,0,51
	.ascii	"!        \261    \261\261\261    \261  \261  \261 \261"
	.ascii	"\261\261\261 \000"
.L118:
	.stabd	70,0,53
	.ascii	"!        \261    \261      \261   \261 \261 \261   "
	.ascii	"\261\000"
.L123:
	.stabd	70,0,55
	.ascii	"\"        \261    \261\261\261\261\261  \261    \261"
	.ascii	"\261 \261    \261\000"
.L139:
	.stabd	70,0,60
	.ascii	"\013K\202sz\241tette:\000"
.L144:
	.stabd	70,0,62
	.ascii	"\030Programoz\242:Barcza Bal\240zs\000"
.L149:
	.stabd	70,0,64
	.ascii	"\023Sound:Barcza Bal\240zs\000"
.L189:
	.stabd	70,0,77
	.ascii	"<                          A FOX Laboratorium K\202"
	.ascii	"sztete TENK  \000"
.L194:
	.stabd	70,0,79
	.ascii	"\0201.02 Verzi\242 DEMO\000"
.L210:
	.stabd	70,0,84
	.ascii	"\014     \261\261 \261 \261\261\000"
.L215:
	.stabd	70,0,86
	.ascii	"\014      \261 \261 \261 \000"
.L220:
	.stabd	70,0,88
	.ascii	"\014       \261\261\261  \000"
.L225:
	.stabd	70,0,90
	.ascii	"\013       {$} \000"
.L241:
	.stabd	70,0,95
	.ascii	"O BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
	.ascii	"BBBBBBBBBBBBBBBBBBBBBBBBBBBBB\000"
.L258:
	.stabd	70,0,101
	.ascii	"\012       \261\261 \000"
.L263:
	.stabd	70,0,103
	.ascii	"\013      \261\261\261\261 \000"
.L268:
	.stabd	70,0,105
	.ascii	"\013     \261\261S\261\261\261\000"
.L273:
	.stabd	70,0,107
	.ascii	"\015    \261\261\261\261\261\261\261\261 \000"
.L278:
	.stabd	70,0,109
	.ascii	"\013     \261\261\261\261\261\261\000"
.L283:
	.stabd	70,0,111
	.ascii	"\014    \261\261\261\261\261\261\261 \000"
.L288:
	.stabd	70,0,113
	.ascii	"#   \261W\261\261\261\261\261\261\261          Ango"
	.ascii	"l sziget \000"
.L293:
	.stabd	70,0,115
	.ascii	"\017   \261\261\261\261\261\261\261\261\261\261  \000"
.L298:
	.stabd	70,0,117
	.ascii	"\021  \261\261\261\261\261\261\261\261\261\261\261\261"
	.ascii	"   \000"
.L303:
	.stabd	70,0,119
	.ascii	"\022 \261\261\261\261\261\261\261\261A\261\261\261\261"
	.ascii	"    \000"
.L308:
	.stabd	70,0,121
	.ascii	"\023 \261    N\261   \261\261\261\261\261   \000"
.L321:
	.stabd	70,0,125
	.ascii	"\016A:=Angol sz\240sz\000"
.L326:
	.stabd	70,0,127
	.ascii	"\011S:=Skocia\000"
.L331:
	.stabd	70,0,129
	.ascii	"\014N:=Normandok\000"
.L336:
	.stabd	70,0,131
	.ascii	"\010W:=Wales\000"
.L352:
	.stabd	70,0,136
	.ascii	"\033Az egys\202g er\213s\202ge :els\224pr\213 \000"
.L357:
	.stabd	70,0,138
	.ascii	"\025A dob\240sok sz\240ma   :4 \000"
.L362:
	.stabd	70,0,140
	.ascii	"\025Az ellens\202g dob\240sa:4 \000"
.L384:
	.stabd	70,0,146
	.ascii	",Megt\240madtad Normadokat a Holland flott\240ddal."
	.ascii	"\000"
.L389:
	.stabd	70,0,148
	.ascii	"1Akkor nyersz ha nagyobbat dobsz mint az ellens\202"
	.ascii	"g.\000"
.L395:
	.stabd	70,0,152
	.ascii	"\023Az ellens\202g dob\240sa:\000"
.L403:
	.stabd	70,0,155
	.ascii	"\015A te dob\240sod:\000"
.L412:
	.stabd	70,0,159
	.ascii	"\012Vesztett\202l\000"
.L438:
	.stabd	70,0,171
	.ascii	"7                                       \261\261   "
	.ascii	"           \000"
.L443:
	.stabd	70,0,173
	.ascii	"8   \261    \261        \261\261       \261        "
	.ascii	"    \261\261       \261       \000"
.L447:
	.stabd	70,0,174
	.ascii	"8   \261    \261       \261  \261      \261        "
	.ascii	"   \261  \261      \261       \000"
.L451:
	.stabd	70,0,175
	.ascii	"8   \261\261\261\261\261\261      \261\261\261\261\261"
	.ascii	"\261     \261          \261\261\261\261\261\261    "
	.ascii	" \261       \000"
.L456:
	.stabd	70,0,176
	.ascii	"7  \261    \261     \261      \261    \261         "
	.ascii	"\261      \261    \261       \000"
.L460:
	.stabd	70,0,177
	.ascii	"8   \261    \261    \261        \261   \261\261\261"
	.ascii	"\261\261\261   \261        \261   \261\261\261\261\261"
	.ascii	"\261  \000"
.L466:
	.stabd	70,0,182
	.ascii	"1Nyert\202l a Normadok gy\240v\240n elhagyt\240k a "
	.ascii	"szigetet.  \000"
.L478:
	.stabd	70,0,186
	.ascii	",  Megt\240madtad Waleset a Holland hadsereggel.\000"
.L546:
	.stabd	70,0,220
	.ascii	"3Nyert\202l a Walesi n\202p gy\240v\240n megal\240s"
	.ascii	"zkodott el\224tted.\000"
.L558:
	.stabd	70,0,224
	.ascii	"2Megt\240madtad Angol uralkodot a Holland hadseregg"
	.ascii	"el.\000"
.L626:
	.stabd	70,0,258
	.ascii	"@Nyert\202l a Angol kir\240ly neked aggyaa l\240nya"
	.ascii	" kez\202t \202s a birodalmat.\000"
.L638:
	.stabd	70,0,262
	.ascii	"#Megt\240madtad Skoci\240t a Hollandokkal.\000"
.L706:
	.stabd	70,0,296
	.ascii	",Nyert\202l Skocia csatlakozott a birodalmadhoz.\000"
.L713:
	.stabd	70,0,301
	.ascii	"@Az egyes\241te birodalmat te ir\240ny\241tod a gy\224"
	.ascii	"zelem aTe kezedben van!\000"

.data

.bss
	.stabs "A:S2",40,0,3,_A
	.stabd	72,0,3
	.lcomm	_A,4
	.stabs "B:S2",40,0,3,_B
	.lcomm	_B,4
	.stabs "N:S2",40,0,3,_N
	.lcomm	_N,4
	.stabs "S:S2",40,0,3,_S
	.lcomm	_S,4
	.stabs "W:S2",40,0,3,_W
	.lcomm	_W,4
	.stabs "M:S3",40,0,4,_M
	.stabd	72,0,4
	.lcomm	_M,1
	.stabd	72,0,303
	.comm	HEAP,8000000

.text
	.stabs "",100,0,0,.Letext
.Letext:

