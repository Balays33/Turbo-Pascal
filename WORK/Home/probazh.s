	.file "probazh.pas"
	.stabs "/mnt/disk0-maxtor_6y080l0-part1/program files/tp/work/home/",100,0,0,.Ltext0
	.stabs "probazh.pas",100,0,0,.Ltext0
.Ltext0:
	.stabd	72,0,1

.text
	.stabd	68,0,152
	.type	fpc_compiled,@function
fpc_compiled:
	.type	gcc2_compiled,@function
gcc2_compiled:
	.stabs "longint:t1=r1;-2147483648;2147483647;",128,0,47,0
	.stabs "char:t2=-20;",128,0,47,0
	.stabs "byte:t3=r1;0;255;",128,0,47,0
	.stabs " :Tt4=s26length:3,0,8;st:ar3;1;25;2,8,200;;",128,0,0,0
	.stabs " :t5=ar1;1;4;4",128,0,0,0
	.stabs "LONGINT:t6=r1;-2147483648;2147483647;",128,0,50,0
	.stabs "void:t7=7;",128,0,47,0
	.stabs "BYTE:t8=r1;0;255;",128,0,51,0
	.stabs " :t9=ar1;1;10;6",128,0,0,0
	.stabs " :t10=ar1;1;5;9",128,0,0,0
	.stabs " :Tt11=s11length:3,0,8;st:ar3;1;10;2,8,80;;",128,0,0,0
	.stabs "s32real:t12=r1;4;0;",128,0,47,0
	.stabs "SINGLE:t12",128,0,47,0
	.stabs "s64real:t13=r1;8;0;",128,0,47,0
	.stabs "DOUBLE:t13",128,0,47,0
	.stabs "s80real:t14=r1;12;0;",128,0,47,0
	.stabs "EXTENDED:t14",128,0,47,0
	.stabs "REAL:t13",128,0,47,0
	.stabs "void_pointer:t15=*7",128,0,47,0
	.stabs "POINTER:t15",128,0,47,0
	.stabs "void_farpointer:t16=*7",128,0,47,0
	.stabs "FARPOINTER:t16",128,0,47,0
	.stabs "shortstring:Tt17=s256length:3,0,8;st:ar3;1;255;2,8,2040;;",128,0,47,0
	.stabs "SHORTSTRING:Tt17",128,0,47,0
	.stabs "longstring:Tt18=s4length:1,0,32;dummy:3,32,8;st:ar3;1;-1;2,40,-8;;",128,0,47,0
	.stabs "LONGSTRING:Tt18",128,0,47,0
	.stabs "ansistring:Tt19=*2",128,0,47,0
	.stabs "ANSISTRING:Tt19",128,0,47,0
	.stabs "widestring:Tt20=*2",128,0,47,0
	.stabs "WIDESTRING:Tt20",128,0,47,0
	.stabs "boolean:t21=-21;",128,0,47,0
	.stabs "BOOLEAN:t21",128,0,47,0
	.stabs "BYTEBOOL:t21",128,0,47,0
	.stabs "CHAR:t2",128,0,47,0
	.stabs "widechar:t22=-30;",128,0,47,0
	.stabs "WIDECHAR:t22",128,0,47,0
	.stabs "ulong:t23=r1;0;-1;",128,0,47,0
	.stabs "CARDINAL:t23",128,0,47,0
	.stabs "qword:t24=-32;",128,0,47,0
	.stabs "QWORD:t24",128,0,47,0
	.stabs "int64:t25=-31;",128,0,47,0
	.stabs "INT64:t25",128,0,47,0
	.stabs "DWORD:t23",128,0,53,0
	.stabs "LONGWORD:t23",128,0,54,0
	.stabs "STRLENINT:t6",128,0,58,0
	.stabs "VALSINT:t6",128,0,71,0
	.stabs "VALUINT:t23",128,0,72,0
	.stabs "VALREAL:t14",128,0,73,0
	.stabs "TANSICHAR:t2",128,0,100,0
	.stabs "ANSICHAR:t2",128,0,101,0
	.stabs "PCHAR:t26=*2",128,0,96,0
	.stabs "PANSICHAR:t26",128,0,102,0
	.stabs "CURRENCY:t25",128,0,106,0
	.stabs "HRESULT:t6",128,0,107,0
	.stabs "TDATETIME:t13",128,0,108,0
	.stabs "ERROR:t6",128,0,109,0
	.stabs "SMALLINT:t27=r1;-32768;32767;",128,0,49,0
	.stabs "INTEGER:t27",128,0,143,0
	.stabs "word:t28=r1;0;65535;",128,0,47,0
	.stabs "TEXT:Tt29=s572HANDLE:1,0,32;MODE:1,32,32;RECSIZE:1,64,32;_PRIVATE:ar28;1;32;3,96,256;USERDATA:ar28;1;16;3,352,128;NAME:ar28;0;255;2,480,2048;;",128,0,47,0
	.stabs "TEXTFILE:Tt29",128,0,78,0
	.stabs "INTEGER:t6",128,0,29,0

.text
	.balign 16
	.stabs "MENUIR:F7",36,0,14,_MENUIR
.Ll1:
	.stabn 68,0,14,.Ll1 - _MENUIR
.globl	_MENUIR
	.type	_MENUIR,@function
_MENUIR:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$4,%esp
.Ll2:
	.stabn 68,0,15,.Ll2 - _MENUIR
	pushl	$7
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll3:
	.stabn 68,0,16,.Ll3 - _MENUIR
	call	_CRT$$_CLRSCR
.Ll4:
	.stabn 68,0,17,.Ll4 - _MENUIR
	pushl	$1
	call	_CRT$$_TEXTCOLOR$BYTE
.Ll5:
	.stabn 68,0,18,.Ll5 - _MENUIR
	pushl	$5
	pushl	$25
	call	_CRT$$_GOTOXY$BYTE$BYTE
.Ll6:
	.stabn 68,0,19,.Ll6 - _MENUIR
	movl	$1,_I
	.balign 4,144
.L15:
.Ll7:
	.stabn 68,0,20,.Ll7 - _MENUIR
	call	_CRT$$_WHEREY
	pushl	%eax
	pushl	$25
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L22:
.Ll8:
	.stabn 68,0,21,.Ll8 - _MENUIR
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	movl	_I,%eax
	imull	$26,%eax
	leal	TC__MENU-26(%eax),%edi
	pushl	%edi
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L22
	call	FPC_IOCHECK
.Ll9:
	.stabn 68,0,19,.Ll9 - _MENUIR
	cmpl	$4,_I
	jge	.L14
	incl	_I
	jmp	.L15
.L14:
.Ll10:
	.stabn 68,0,23,.Ll10 - _MENUIR
	call	_CRT$$_WHEREY
	andl	$255,%eax
	addl	$3,%eax
	pushl	%eax
	pushl	$25
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L29:
.Ll11:
	.stabn 68,0,24,.Ll11 - _MENUIR
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-4(%ebp)
	pushl	$.L32
	pushl	-4(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-4(%ebp)
	call	FPC_WRITE_END
	pushl	$.L29
	call	FPC_IOCHECK
.L33:
.Ll12:
	.stabn 68,0,25,.Ll12 - _MENUIR
	leave
	ret
.Le0:
	.size	_MENUIR, .Le0 - _MENUIR
	.stabn 192,0,0,_MENUIR-_MENUIR
	.stabn 224,0,0,.L33-_MENUIR
	.balign 16
	.stabs "FELADAT1:F7",36,0,46,_FELADAT1
.Ll13:
	.stabn 68,0,46,.Ll13 - _FELADAT1
.globl	_FELADAT1
	.type	_FELADAT1,@function
_FELADAT1:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$8,%esp
.Ll14:
	.stabn 68,0,47,.Ll14 - _FELADAT1
	call	_CRT$$_CLRSCR
.Ll15:
	.stabn 68,0,48,.Ll15 - _FELADAT1
	pushl	$8
	pushl	$20
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L40:
.Ll16:
	.stabn 68,0,49,.Ll16 - _FELADAT1
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	$97
	pushl	-8(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_CHAR
	pushl	-8(%ebp)
	call	FPC_WRITE_END
	pushl	$.L40
	call	FPC_IOCHECK
.Ll17:
	.stabn 68,0,50,.Ll17 - _FELADAT1
	pushl	$8
	pushl	$30
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L47:
.Ll18:
	.stabn 68,0,51,.Ll18 - _FELADAT1
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	$109
	pushl	-8(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_CHAR
	pushl	-8(%ebp)
	call	FPC_WRITE_END
	pushl	$.L47
	call	FPC_IOCHECK
.Ll19:
	.stabn 68,0,52,.Ll19 - _FELADAT1
	pushl	$8
	pushl	$40
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L54:
.Ll20:
	.stabn 68,0,53,.Ll20 - _FELADAT1
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	$.L57
	pushl	-8(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-8(%ebp)
	call	FPC_WRITE_END
	pushl	$.L54
	call	FPC_IOCHECK
.Ll21:
	.stabn 68,0,54,.Ll21 - _FELADAT1
	pushl	$8
	pushl	$50
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L62:
.Ll22:
	.stabn 68,0,55,.Ll22 - _FELADAT1
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	$.L65
	pushl	-8(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-8(%ebp)
	call	FPC_WRITE_END
	pushl	$.L62
	call	FPC_IOCHECK
.L66:
.Ll23:
	.stabn 68,0,56,.Ll23 - _FELADAT1
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	-8(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L66
	call	FPC_IOCHECK
.Ll24:
	.stabn 68,0,57,.Ll24 - _FELADAT1
	movl	$15,_I
	.balign 4,144
.L69:
	pushl	$9
	pushl	_I
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L76:
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	$61
	pushl	-8(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_CHAR
	pushl	-8(%ebp)
	call	FPC_WRITE_END
	pushl	$.L76
	call	FPC_IOCHECK
	cmpl	$65,_I
	jge	.L68
	incl	_I
	jmp	.L69
.L68:
.Ll25:
	.stabn 68,0,58,.Ll25 - _FELADAT1
	pushl	$10
	pushl	$20
	call	_CRT$$_GOTOXY$BYTE$BYTE
.Ll26:
	.stabn 68,0,59,.Ll26 - _FELADAT1
	movl	$1,_I
	.balign 4,144
.L85:
.Ll27:
	.stabn 68,0,60,.Ll27 - _FELADAT1
	movl	_I,%eax
	addl	$10,%eax
	pushl	%eax
	pushl	$20
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L92:
.Ll28:
	.stabn 68,0,61,.Ll28 - _FELADAT1
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-8(%ebp)
	movl	_I,%eax
	leal	(%eax,%eax,4),%eax
	addl	$5,%eax
	pushl	%eax
	pushl	-8(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SINT
	pushl	-8(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L92
	call	FPC_IOCHECK
.Ll29:
	.stabn 68,0,62,.Ll29 - _FELADAT1
	movl	$1,-4(%ebp)
	.balign 4,144
.L97:
	cmpl	$4,-4(%ebp)
	jge	.L96
	incl	-4(%ebp)
	jmp	.L97
.L96:
.Ll30:
	.stabn 68,0,59,.Ll30 - _FELADAT1
	cmpl	$5,_I
	jge	.L84
	incl	_I
	jmp	.L85
.L84:
.L100:
.Ll31:
	.stabn 68,0,64,.Ll31 - _FELADAT1
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-8(%ebp)
	pushl	-8(%ebp)
	call	FPC_READLN_END
	pushl	$.L100
	call	FPC_IOCHECK
.L101:
.Ll32:
	.stabn 68,0,65,.Ll32 - _FELADAT1
	leave
	ret
.Le1:
	.size	_FELADAT1, .Le1 - _FELADAT1
	.stabs "J:6",128,0,45,-4
	.stabn 192,0,0,_FELADAT1-_FELADAT1
	.stabn 224,0,0,.L101-_FELADAT1
	.balign 16
	.stabs "FELADAT2:F7",36,0,76,_FELADAT2
.Ll33:
	.stabn 68,0,76,.Ll33 - _FELADAT2
.globl	_FELADAT2
	.type	_FELADAT2,@function
_FELADAT2:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$216,%esp
.Ll34:
	.stabn 68,0,77,.Ll34 - _FELADAT2
	call	_CRT$$_CLRSCR
.Ll35:
	.stabn 68,0,78,.Ll35 - _FELADAT2
	call	_SYSLINUX$$_RANDOMIZE
.Ll36:
	.stabn 68,0,79,.Ll36 - _FELADAT2
	movb	$1,-201(%ebp)
	.balign 4,144
.L106:
.Ll37:
	.stabn 68,0,80,.Ll37 - _FELADAT2
	movb	$1,-202(%ebp)
	.balign 4,144
.L111:
.Ll38:
	.stabn 68,0,82,.Ll38 - _FELADAT2
	movzbl	-201(%ebp),%eax
	imull	$40,%eax
	movzbl	-202(%ebp),%edx
	leal	-244(%ebp,%eax),%eax
	pushl	%eax
	pushl	%edx
	pushl	$40
	call	_SYSLINUX$$_RANDOM$LONGINT
	movl	%eax,%ebx
	popl	%edx
	popl	%eax
	subl	$20,%ebx
	movl	%ebx,(%eax,%edx,4)
.Ll39:
	.stabn 68,0,80,.Ll39 - _FELADAT2
	cmpb	$10,-202(%ebp)
	jae	.L110
	incb	-202(%ebp)
	jmp	.L111
.L110:
.Ll40:
	.stabn 68,0,79,.Ll40 - _FELADAT2
	cmpb	$5,-201(%ebp)
	jae	.L105
	incb	-201(%ebp)
	jmp	.L106
.L105:
.Ll41:
	.stabn 68,0,84,.Ll41 - _FELADAT2
	movb	$1,-201(%ebp)
	.balign 4,144
.L120:
.L123:
.Ll42:
	.stabn 68,0,86,.Ll42 - _FELADAT2
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-216(%ebp)
	pushl	-216(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L123
	call	FPC_IOCHECK
.Ll43:
	.stabn 68,0,87,.Ll43 - _FELADAT2
	movb	$1,-202(%ebp)
	.balign 4,144
.L126:
.L129:
.Ll44:
	.stabn 68,0,89,.Ll44 - _FELADAT2
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-216(%ebp)
	movzbl	-201(%ebp),%eax
	imull	$40,%eax
	movzbl	-202(%ebp),%edx
	leal	-244(%ebp,%eax),%eax
	pushl	(%eax,%edx,4)
	pushl	-216(%ebp)
	pushl	$4
	call	FPC_WRITE_TEXT_SINT
	pushl	-216(%ebp)
	call	FPC_WRITE_END
	pushl	$.L129
	call	FPC_IOCHECK
.Ll45:
	.stabn 68,0,87,.Ll45 - _FELADAT2
	cmpb	$10,-202(%ebp)
	jae	.L125
	incb	-202(%ebp)
	jmp	.L126
.L125:
.Ll46:
	.stabn 68,0,84,.Ll46 - _FELADAT2
	cmpb	$5,-201(%ebp)
	jae	.L119
	incb	-201(%ebp)
	jmp	.L120
.L119:
.L134:
.Ll47:
	.stabn 68,0,92,.Ll47 - _FELADAT2
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-216(%ebp)
	pushl	-216(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L134
	call	FPC_IOCHECK
.L135:
.L138:
.Ll48:
	.stabn 68,0,94,.Ll48 - _FELADAT2
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-216(%ebp)
	pushl	$.L141
	pushl	-216(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-216(%ebp)
	call	FPC_WRITE_END
	pushl	$.L138
	call	FPC_IOCHECK
.L142:
.Ll49:
	.stabn 68,0,95,.Ll49 - _FELADAT2
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-216(%ebp)
	pushl	-216(%ebp)
	call	FPC_READ_TEXT_SINT
	movl	%eax,-208(%ebp)
	pushl	-216(%ebp)
	call	FPC_READLN_END
	pushl	$.L142
	call	FPC_IOCHECK
.Ll50:
	.stabn 68,0,96,.Ll50 - _FELADAT2
	movl	-208(%ebp),%eax
	cmpl	$5,%eax
	jnle	.L135
	movl	-208(%ebp),%eax
	cmpl	$3,%eax
	je	.L135
.Ll51:
	.stabn 68,0,97,.Ll51 - _FELADAT2
	movb	$1,-201(%ebp)
	.balign 4,144
.L146:
.Ll52:
	.stabn 68,0,98,.Ll52 - _FELADAT2
	movb	$1,-202(%ebp)
	.balign 4,144
.L151:
.Ll53:
	.stabn 68,0,100,.Ll53 - _FELADAT2
	movzbl	-202(%ebp),%eax
	movl	-124(%ebp,%eax,4),%edi
	movl	%edi,-212(%ebp)
.Ll54:
	.stabn 68,0,101,.Ll54 - _FELADAT2
	movzbl	-202(%ebp),%eax
	movl	-208(%ebp),%edx
	imull	$40,%edx
	movzbl	-202(%ebp),%ebx
	leal	-244(%ebp,%edx),%edx
	movl	(%edx,%ebx,4),%edi
	movl	%edi,-124(%ebp,%eax,4)
.Ll55:
	.stabn 68,0,102,.Ll55 - _FELADAT2
	movl	-208(%ebp),%eax
	imull	$40,%eax
	movzbl	-202(%ebp),%edx
	leal	-244(%ebp,%eax),%eax
	movl	-212(%ebp),%edi
	movl	%edi,(%eax,%edx,4)
.Ll56:
	.stabn 68,0,98,.Ll56 - _FELADAT2
	cmpb	$10,-202(%ebp)
	jae	.L150
	incb	-202(%ebp)
	jmp	.L151
.L150:
.Ll57:
	.stabn 68,0,97,.Ll57 - _FELADAT2
	cmpb	$5,-201(%ebp)
	jae	.L145
	incb	-201(%ebp)
	jmp	.L146
.L145:
.Ll58:
	.stabn 68,0,104,.Ll58 - _FELADAT2
	movb	$1,-201(%ebp)
	.balign 4,144
.L162:
.L165:
.Ll59:
	.stabn 68,0,106,.Ll59 - _FELADAT2
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-216(%ebp)
	pushl	-216(%ebp)
	call	FPC_WRITELN_END
	pushl	$.L165
	call	FPC_IOCHECK
.Ll60:
	.stabn 68,0,107,.Ll60 - _FELADAT2
	movb	$1,-202(%ebp)
	.balign 4,144
.L168:
.L171:
.Ll61:
	.stabn 68,0,109,.Ll61 - _FELADAT2
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-216(%ebp)
	movzbl	-201(%ebp),%eax
	imull	$40,%eax
	movzbl	-202(%ebp),%edx
	leal	-244(%ebp,%eax),%eax
	pushl	(%eax,%edx,4)
	pushl	-216(%ebp)
	pushl	$4
	call	FPC_WRITE_TEXT_SINT
	pushl	-216(%ebp)
	call	FPC_WRITE_END
	pushl	$.L171
	call	FPC_IOCHECK
.Ll62:
	.stabn 68,0,107,.Ll62 - _FELADAT2
	cmpb	$10,-202(%ebp)
	jae	.L167
	incb	-202(%ebp)
	jmp	.L168
.L167:
.Ll63:
	.stabn 68,0,104,.Ll63 - _FELADAT2
	cmpb	$5,-201(%ebp)
	jae	.L161
	incb	-201(%ebp)
	jmp	.L162
.L161:
.L176:
.Ll64:
	.stabn 68,0,112,.Ll64 - _FELADAT2
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-216(%ebp)
	pushl	-216(%ebp)
	call	FPC_READLN_END
	pushl	$.L176
	call	FPC_IOCHECK
.L177:
.Ll65:
	.stabn 68,0,113,.Ll65 - _FELADAT2
	leave
	ret
.Le2:
	.size	_FELADAT2, .Le2 - _FELADAT2
	.stabs "M:10",128,0,71,-200
	.stabs "I:8",128,0,72,-201
	.stabs "J:8",128,0,73,-202
	.stabs "S:6",128,0,74,-208
	.stabs "W:6",128,0,75,-212
	.stabn 192,0,0,_FELADAT2-_FELADAT2
	.stabn 224,0,0,.L177-_FELADAT2
	.balign 16
	.stabs "FELADAT3:F7",36,0,119,_FELADAT3
.Ll66:
	.stabn 68,0,119,.Ll66 - _FELADAT3
.globl	_FELADAT3
	.type	_FELADAT3,@function
_FELADAT3:
	pushl	%ebp
	movl	%esp,%ebp
	subl	$16,%esp
.Ll67:
	.stabn 68,0,120,.Ll67 - _FELADAT3
	call	_CRT$$_CLRSCR
.Ll68:
	.stabn 68,0,121,.Ll68 - _FELADAT3
	pushl	$10
	pushl	$50
	pushl	$3
	pushl	$3
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll69:
	.stabn 68,0,122,.Ll69 - _FELADAT3
	pushl	$2
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll70:
	.stabn 68,0,123,.Ll70 - _FELADAT3
	call	_CRT$$_CLRSCR
.L190:
.L193:
.Ll71:
	.stabn 68,0,125,.Ll71 - _FELADAT3
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-16(%ebp)
	pushl	$.L196
	pushl	-16(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-16(%ebp)
	call	FPC_WRITE_END
	pushl	$.L193
	call	FPC_IOCHECK
.L197:
.Ll72:
	.stabn 68,0,126,.Ll72 - _FELADAT3
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-16(%ebp)
	pushl	$10
	leal	-12(%ebp),%edi
	pushl	%edi
	pushl	-16(%ebp)
	call	FPC_READ_TEXT_SHORTSTR
	pushl	-16(%ebp)
	call	FPC_READLN_END
	pushl	$.L197
	call	FPC_IOCHECK
.Ll73:
	.stabn 68,0,127,.Ll73 - _FELADAT3
	movzbl	-12(%ebp),%eax
	cmpl	$10,%eax
	jnle	.L190
.Ll74:
	.stabn 68,0,128,.Ll74 - _FELADAT3
	pushl	$20
	pushl	$60
	pushl	$10
	pushl	$20
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll75:
	.stabn 68,0,129,.Ll75 - _FELADAT3
	pushl	$14
	call	_CRT$$_TEXTBACKGROUND$BYTE
.Ll76:
	.stabn 68,0,130,.Ll76 - _FELADAT3
	call	_CRT$$_CLRSCR
.Ll77:
	.stabn 68,0,131,.Ll77 - _FELADAT3
	pushl	$5
	movzbl	-12(%ebp),%eax
	movl	$41,%edi
	subl	%eax,%edi
	movl	%edi,%eax
	testl	%edi,%edi
	jns	.L214
	incl	%eax
.L214:
	sarl	$1,%eax
	pushl	%eax
	call	_CRT$$_GOTOXY$BYTE$BYTE
.L215:
.Ll78:
	.stabn 68,0,132,.Ll78 - _FELADAT3
	leal	U_SYSLINUX_OUTPUT,%edi
	movl	%edi,-16(%ebp)
	leal	-12(%ebp),%edi
	pushl	%edi
	pushl	-16(%ebp)
	pushl	$0
	call	FPC_WRITE_TEXT_SHORTSTR
	pushl	-16(%ebp)
	call	FPC_WRITE_END
	pushl	$.L215
	call	FPC_IOCHECK
.L218:
.Ll79:
	.stabn 68,0,134,.Ll79 - _FELADAT3
	leal	U_SYSLINUX_INPUT,%edi
	movl	%edi,-16(%ebp)
	pushl	-16(%ebp)
	call	FPC_READLN_END
	pushl	$.L218
	call	FPC_IOCHECK
.L219:
.Ll80:
	.stabn 68,0,135,.Ll80 - _FELADAT3
	leave
	ret
.Le3:
	.size	_FELADAT3, .Le3 - _FELADAT3
	.stabs "SZ:11",128,0,118,-12
	.stabn 192,0,0,_FELADAT3-_FELADAT3
	.stabn 224,0,0,.L219-_FELADAT3
	.balign 16
	.stabs "main:F7",36,0,138,main
.Ll81:
	.stabn 68,0,138,.Ll81 - main
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
.Ll82:
	.stabn 68,0,138,.Ll82 - program_init
	call	FPC_INITIALIZEUNITS
.L226:
.Ll83:
	.stabn 68,0,140,.Ll83 - program_init
	pushl	$25
	pushl	$80
	pushl	$1
	pushl	$1
	call	_CRT$$_WINDOW$BYTE$BYTE$BYTE$BYTE
.Ll84:
	.stabn 68,0,141,.Ll84 - program_init
	call	_MENUIR
.L237:
.Ll85:
	.stabn 68,0,143,.Ll85 - program_init
	call	_CRT$$_READKEY
	movb	%al,_C
.Ll86:
	.stabn 68,0,144,.Ll86 - program_init
	cmpb	$27,%al
	stc
	je	.L242
	cmpb	$49,_C
	jb	.L243
	cmpb	$52,_C
	jb	.L242
.L243:
	clc
.L242:
	jnc	.L237
.Ll87:
	.stabn 68,0,145,.Ll87 - program_init
	movb	_C,%al
	cmpb	$49,%al
	jb	.L245
	subb	$49,%al
	jz	.L220
	decb	%al
	jz	.L222
	decb	%al
	jnz	.L245
.Ll88:
	.stabn 68,0,148,.Ll88 - program_init
	pushl	$.L244
	jmp	_FELADAT3
.L222:
.Ll89:
	.stabn 68,0,147,.Ll89 - program_init
	pushl	$.L244
	jmp	_FELADAT2
.L220:
.Ll90:
	.stabn 68,0,146,.Ll90 - program_init
	call	_FELADAT1
.L245:
.L244:
.Ll91:
	.stabn 68,0,150,.Ll91 - program_init
	movb	_C,%al
	cmpb	$27,%al
	jne	.L226
.Ll92:
	.stabn 68,0,151,.Ll92 - program_init
	call	FPC_DO_EXIT
.L246:
	leave
	ret
.Le4:
	.size	main, .Le4 - main
	.stabn 192,0,0,main-main
	.stabn 224,0,0,.L246-main
	.balign 16

.data
	.stabd	70,0,152
	.ascii	"FPC 1.0.10 [2003/06/26] for i386 - LINUX"
	.balign 4
	.balign 4
	.stabs "MENU:S5",38,0,4,TC__MENU
	.stabd	70,0,4
	.type	TC__MENU,@object
TC__MENU:
	.stabd	70,0,5
	.byte	21
	.ascii	"1    els\223     feladat"
	.ascii	"    "
	.stabd	70,0,6
	.byte	21
	.ascii	"2    m\240sodik  feladat"
	.ascii	"    "
	.stabd	70,0,7
	.byte	21
	.ascii	"3    harmadik feladat"
	.ascii	"    "
	.stabd	70,0,8
	.byte	21
	.ascii	"ESC  v \202 g e         "
	.ascii	"    "
	.stabd	70,0,152
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.long	0
.Le5:
	.size	FPC_RESOURCESTRINGTABLES, .Le5 - FPC_RESOURCESTRINGTABLES
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
.Le6:
	.size	INITFINAL, .Le6 - INITFINAL
.globl	HEAPSIZE
	.type	HEAPSIZE,@object
HEAPSIZE:
	.long	8000000
.globl	__stklen
	.type	__stklen,@object
__stklen:
	.long	8192

.data
.L32:
	.stabd	70,0,24
	.ascii	"\015V \240 l a s z ?\000"
.L57:
	.stabd	70,0,53
	.ascii	"\007Fel\201let\000"
.L65:
	.stabd	70,0,55
	.ascii	"\010T\202rfogat\000"
.L141:
	.stabd	70,0,94
	.ascii	"*K\202rem mivel szeretn\202 kicser\202lni 3 sort s:"
	.ascii	"=\000"
.L196:
	.stabd	70,0,125
	.ascii	"\"K\202rem a sz\224veget (max 10 hossz\243): \000"

.data

.bss
	.stabs "I:S6",40,0,10,_I
	.stabd	72,0,10
	.lcomm	_I,4
	.stabs "C:S2",40,0,11,_C
	.stabd	72,0,11
	.lcomm	_C,1
	.stabd	72,0,152
	.comm	HEAP,8000000

.text
	.stabs "",100,0,0,.Letext
.Letext:

