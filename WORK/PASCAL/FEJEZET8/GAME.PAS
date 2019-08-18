
(**************************************************************************)
                                UNIT GAME;
(**************************************************************************)



{$A+,B-,D+,E-,F-,G+,I-,L+,N+,O-,P-,Q-,R-,S-,T-,V-,X+}
{$M 16384,0,655360}




(*=----------------------------------------------------------------------=*)


                                INTERFACE


(*=----------------------------------------------------------------------=*)



TYPE


 BOB = Object

       A : wordbool;     { Akt°vit†s-jelzã. Ha true akkor a BOB l†that¢   }
       X : integer;      { X koordin†ta                                   }
       Y : integer;      { X koordin†ta                                   }
       LX: word;         { SzÇlessÇg ( lx=0 -n†l ez 1 kÇppont )           }
       LY: word;         { Magass†g  ( ly=0 -n†l ez 1 kÇppont )           }
       P : word;         { F†zissz†ml†l¢ ( p=0 : elsã f†zis )             }
       DT: pointer;      { Shape helye a mem¢ri†ban                       }
       PL: word;         { Egy f†zis helyfoglal†sa                        }
       W : word;         { Val¢s†gos szÇlessÇg ( width  )                 }
       H : word;         { Val¢s†gos magass†g  ( height )                 }
       LN: word;         { Shape helyfoglal†sa b†jtban ( FreeMem-hez )    }
       PN: word;         { F†zissz†m ( f†zisok 0-val kezdãdnek )          }
       NR: word;         { BOB-sorsz†m a priorit†s-v†ltoztat¢ elj†r†shoz  }

       procedure Init;
{      procedure Done;}
       procedure Load( FileName: string);
       procedure Copy( var B: BOB);
       procedure Put( XX, YY, PP: word; ShowBack: Boolean);
       procedure ShowUpon( var B:BOB);
       function  Collision( var B: BOB): boolean;
       function  CollBack: boolean;
       function  CollColors: boolean;
       function  CollBox:  boolean;
       function  OnScreen: boolean;

   end;


 RGBType = record
         Red, Green, Blue: byte;
  end;



CONST

 Up    = 8;
 Down  = 2;
 Left  = 4;
 Right = 6;

 BackColor:  byte    = 0;
 CFirst:     byte    = 0;
 CLast:      byte    = 0;


VAR

 Colors: array[0..255] of RGBType;

 BackGround: pointer;
 WorkArea  : pointer;
 BoxPtr,
 MapPtr: pointer;
 BPL: word;
 PosX, PosY: word;
 MapLength:  word;
 First, Last: word;

 Mask: array[0..31]  of byte;

 KEY: array [0..255] of boolean;

procedure LoadLBM( FileName: String; p:pointer);
procedure FillBack(Color:byte);
procedure PixelBack( X, Y: word; C: byte);
procedure MakeScr;
procedure RetRace;
procedure ShowScr;
procedure InitGame;
procedure DoneGame;
procedure SetArea( Fst, Lst: word);
procedure DrawBox( P: pointer; BoxNr, X, Y: word);
procedure NewPos( X, Y: word);
procedure Scroll( Dir: byte; Count: word );
procedure LoadMap( FileName: string);

procedure SetRGB( RegNum,  R, G, B: byte);
procedure LoadPal( FileName: string);
procedure ShowPal( Speed: word; First, Last          : byte);
procedure HidePal( Speed: word; First, Last,  R, G, B: byte);
procedure GrayPal( First, Last: word);

procedure InitKey;
procedure DoneKey;
function  _KeyPressed: Boolean;
function  _ReadKey: byte;



(*=----------------------------------------------------------------------=*)


                              IMPLEMENTATION


(*=----------------------------------------------------------------------=*)


uses CRT, DOS;


type
  MemType = record
    P: pointer;
    L: word;
   end;

const
  NextBOB: word = 0;
  SegA000: word = $a000;
  MaxBOB = 512;

var
    xa,xb,ya,yb,
 {  ax1,ax2,ay1,ay2,
    bx1,bx2,by1,by2: word;  { V†ltoz¢k az ÅtkîzÇsvizsg†lathoz     }

  ax1, ax2, ay1, ay2,
  bx1, bx2, by1, by2,
  xx, yy, daa, dbb,
  x1, y1, x2, y2,
  mex1,mex2,mey1,mey2,
  dxx, pnt, bobseg,
  AreaY, AreaLen, AreaLen2: word;
  BOBTable: array[0..MaxBOB] of word;
  BOBDatas: array[0..MaxBOB] of MemType;
  A1: word absolute First; A2: word absolute Last;
  CollByte: byte;
  DrawBoxX, DrawBoxY, BoxNumber: word;
  OLD: procedure;    { A rÇgi billenty˚ megszakt†svektor    }




{----------------------- µltal†nos rutinok -------------------------------}




procedure SetMode( M: word); assembler; asm mov ax, M; int 10h end;


procedure IOError( s: string);
 begin
  if IOResult=0 then exit;
  SetMode( 3);
  WriteLn; WriteLn( 'I/O error with the '''+s+''' file');
  Halt
  end;

(*
procedure GetMem( var p: pointer; l: word);
 begin if MaxAvail<l then begin
  SetMode(3); WriteLn('Not enough memory error'{,#7});
  Halt end;
  System.GetMem( p,l);
  end;
*)

{procedure ClearWindow; begin
  if (WorkArea  <>NIL) and (BackGround<>NIL) then begin
    FreeMem( WorkArea  , AreaLen);
    FreeMem( BackGround, AreaLen);
    WorkArea  := NIL; BackGround:= NIL; end; end;
 }

procedure SetArea; begin
 {ClearWindow;}
  A1:= Fst; A2:= Lst;
  AreaY:= A2-A1+1;
  AreaLen2:= AreaY*160;
  AreaLen := AreaY*320;
{ GetMem( WorkArea  , AreaLen+2) {then begin Memory:= false; exit end}
{ GetMem( BackGround, AreaLen+2) {then begin Memory:= false; exit end}
  end;


procedure FillBack; assembler; asm
  les di,BACKGROUND; cld; mov cx,AREALEN2;
  mov al,COLOR; mov ah,al; rep stosw;
  end;

procedure PixelBack; assembler; asm
   les    di,background
   mov    ax,320        { Egy sor 320 kÇppontb¢l †ll              }
   mul    y             { Megvan a megfelelã sor elsã b†jtja      }
   add    ax,x          { AX a megfelelã c°met tartalmazza,       }
   add    di,ax         { m†r csak hozz† kell adni DI-hez         }
   mov    al,c
   mov    es:[di],al    { A megfelelã b†jt C-re v†ltoztat†sa      }
   end;

procedure InitGame;
 var i: word;
 begin
  for i:=0 to MaxBob do BOBDatas[i].p:=nil;
  SetArea( 0, 199);
  GetMem( WorkArea  , 64002);
  GetMem( BackGround, 64002);
{ if not Memory then exit;}
  SetMode($13);
  FillBack(BackColor);
  end;


procedure DoneGame;
 var
  i: word;
 begin
  {ClearWindow;}
  SetMode(3);
  FreeMem( WorkArea  , 64002);
  FreeMem( BackGround, 64002);
  for i:=0 to MaxBOB do with BOBDatas[i] do if p<>nil then FreeMem(p,l);
  end;



procedure MakeScr; assembler; asm
   push   bp               { BP regisztert adatt†rol†sra haszn†ljuk }
   cld
   push   ds
   mov    cx,AreaLen2
   les    di,WorkArea
   lds    si,BackGround
   rep    movsw            { BackGround -> WorkArea }
   pop    ds

   mov    cx,NextBOB
   cmp    cx,0
   jz     @Exit            { Ha nincs BOB akkor nincs is tîbb dolgunk }

@Next:
   dec    cx
   lea    bx,BOBTable      { BX: offset BobTable }
   add    bx,cx
   add    bx,cx            { [BX]: offset BOB }
   mov    bx,[bx]

   mov    al,[bx]
   cmp    al,0
   jz     @nextbob         { Ha nem akt°v: kîvetkezã }
   mov    ax,[bx+2]        { AX = X koordin†ta }
   cmp    ax,320
   jge    @nextbob
   mov    x1,ax            { X1 = X }
   mov    ax,[bx+4]        { Y }
   cmp    ax,areay
   jge    @nextbob
   mov    y1,ax            { Y1 = Y }
   mov    ax,[bx+6]        { lx }
   add    ax,[bx+2]
   jnge   @nextbob
   mov    x2,ax            { X2 = X+LX }
   mov    ax,[bx+8]        { ly }
   add    ax,[bx+4]
   jnge   @nextbob
   mov    y2,ax            { Y2 = Y+LY }

   les    si,[bx+12]       { ES:[SI]^ = DT }
   mov    ax,[bx+16]       { AX = PL }
   mul    word ptr [bx+10]
   add    si,ax            { ES:[SI]^ = kîvetkezã f†zis }

   cmp    x1,0
   jnge   @halfout
   cmp    y1,0
   jnge   @halfout
   cmp    x2,319
   jg     @halfout
   mov    ax,areay
   cmp    y2,ax
   jge    @halfout         { Ha kil¢g valamerre a @HALFOUT-ra ugrik }

   push   es
   les    di,workarea
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã kirakand¢ pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    bp,ds            { DS elmentÇse }
   pop    bobseg           { Az elãzãleg elmentett ES->BOBSeg }

   push   cx
   mov    cx,[bx+20]       { CX = kirakand¢ sorok sz†ma }
@NextLine:
   push   cx
   mov    cx,[bx+18]       { CX = 1 sorban lÇvã pontok }
   mov    ds,BOBSeg        { DS:[SI]^ = shape (aktu†lis f†zis) }
@Controll:
   lodsb
   and    al,al
   jz     @NotPut
   mov    es:[di],al
@NotPut:
   inc    di
   loop   @Controll
   add    di,dx            { DI = kîv. sor }
   mov    ds,bp            { Vissza az eredeti DS a BP-bãl }
   pop    cx
   loop   @NextLine        { kîv. sor }

   pop    cx               { CX most: BOBsz†m }
@NextBOB:
   cmp    cx,0
   jz     @exit
   jmp    @next            { kîv. BOB         }

@HalfOut:
   push   cx              { A BOBsz†ml†l¢ elmentÇse }
   mov    cx,[bx+20]      { CX-be a BOB magass†ga }
   cmp    y1,0
   jge    @notup           { Ha nem felÅl l¢g ki a @NOTUP-ra ugrik }
   mov    ax,y1
   neg    ax               { AX=-AX }
   sub    cx,ax            { A kirakand¢ sorok csîkkennek }
   mov    dx,[bx+18]       { DX-be a szÇlessÇg }
   mul    dx
   add    si,ax            { SI most a shape kezdã sor†ra mutat }
   mov    y1,0             { Y koordin†ta null†z†sa }
@NotUp:
   mov    dxx,0            { A shape-en belÅli lÇpÇskîz null†z†sa }
   mov    ax,[bx+18]
   mov    pnt,ax           { PNT = 1 sorban kirakand¢ pontok sz†ma }
   cmp    x1,0
   jge    @notleft         { Ha nem baloldalt l¢g ki a @NOTLEFT-re ugrik }
   mov    ax,x1
   neg    ax
   add    si,ax
   mov    dxx,ax           { A lÇpÇskîz AX-szel nã }
   sub    pnt,ax           { A kirakand¢ pontok sz†ma -X1-gyel csîkken }
   mov    x1,0             { X koordin†ta null†z†sa }
@NotLeft:
   cmp    x2,319
   jng    @NotRight
   mov    ax,x2
   sub    ax,319
   add    dxx,ax          { A lÇpÇskîz X2-319-cel nã }
   sub    pnt,ax          { A kirakand¢ pontok sz†ma X2-319-cel csîkken }
   mov    x2,319
@NotRight:
   mov    ax,y2
   cmp    ax,areay
   jnge   @NotDown
   sub    ax,areay
   sub    cx,ax           { CX=CX-(Y2-AREAY) }
   sub    cx,1
@NotDown:

   push   es
   les    di,workarea
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã kirakand¢ pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   pop    ax               { Az elãzãleg elmentett ES->AX }

@2NextLine:
   push   cx
   mov    cx,pnt           { CX = 1 sorban lÇvã kirakand¢ pontok }
   push   ds
   push   ax
   mov    ds,ax            { DS:[SI]^ = shape (aktu†lis f†zis) }
@2Controll:
   lodsb
   cmp    al,0
   jz     @2NotPut
   mov    es:[di],al
@2NotPut:
   inc    di
   loop   @2Controll
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   add    di,dx            { DI = kîv. sor }
   add    si,dxx           { SI = kîv. shape sor }
   loop   @2NextLine       { kîv. sor }

   pop    cx               { CX most: BOBsz†m }
   cmp    cx,0
   jnz    @next            { kîv. BOB         }

@Exit:
   pop    bp
 end;

procedure ShowScr; assembler; asm
   cld
   push   ds
   mov    cx,arealen2
   mov    es,SegA000
   mov    ax,320
   mul    a1
   mov    di,ax
   lds    si,WorkArea
   rep    movsw
   pop    ds
 end;

procedure RetRace; assembler; asm
   mov    dx,3dah  { DX-be a st†tuszregiszter c°me }
@WAIT:
   in     al,dx    { Beolvas†s a $3da portr¢l      }
   test   al,8     { A 4. bit ellenãrzÇse          }
   jz     @WAIT    { Ha nulla akkor £jra           }
 end;



procedure DrawBox; assembler; asm
   push   ds

   mov    ax,320
   mul    y
   add    ax,x
   les    di,P
   add    di,ax

   mov    ax,64
   mul    boxnr
   lds    si,boxptr
   add    si,ax

   mov    dx,8
@nextline:
   mov    cx,8
   rep    movsb
   add    di,312
   dec    dx
   jnz    @nextline

   pop    ds

  end;
(*
procedure NewPic( x1, y1,  x2, y2: word); assembler; asm
   mov    ax,PosY
   add    ax,y1
   mov    bl,8
   div    bl
   mov    yplus,ah    { YPlus-ba a fÅggãleges eltol†s }
   mov    ax,PosX
   add    ax,x1
   mov    bl,8
   div    bl
   mov    xplus,ah    { XPlus-ba a pedig a vizszintes eltol†s }

   mov    ax,x2
   sub    ax,x1
   inc    ax
   mov    xx,ax       { XX = szÇlessÇg }
   mov    ax,y2
   sub    ax,y1
   inc    ax
   mov    yy,ax       { YY = magass†g  }

   mov    ax,x1
   mov    bx,8
   div    bx
   mov    cx,ax
   mov    ax,y1
   div    bx
   mul    BPL
   add    ax,cx
   mov    firstbox,ax { FirstBox:= ( Y1 div 8 ) * BPL + X1 div 8 }




(* cmp    ax,xx
   ja     @vertical   { Ha YY>XX akkor fÅggãlegesen rakjuk ki a pontokat
                        ez†ltal nîvelve a sebit. }*)

procedure HLine( Line: word); assembler; asm
   push   bp
   cld

   mov    ax,posy
   add    ax,line
   mov    dx,ax
   and    dx,7
   mov    drawboxy,dx
   shr    ax,3
   mul    BPL
   mov    cx,ax       { AX ideiglenes elmentÇse }
   mov    ax,posx
   mov    dx,ax
   and    dx,7
   mov    drawboxx,dx
   shr    ax,3
   add    ax,cx       { AX = ( PosY + Line ) div 8 * BPL + PosX div 8 }
   mov    boxnumber,ax

   les    di,background
   mov    ax,320
   mul    line
   add    di,ax       { ES:[DI] most a kezdã kirakand¢ pontra mutat }

   mov    cx,ds       { DS ideigl. mentÇse }
   mov    ax,boxnumber
   inc    boxnumber
   lds    si,mapptr
   add    si,ax
   lodsb              { AL: 1. box sorsz†ma }
   mov    ds,cx       { Eredeti DS vissza }
   xor    ah,ah
   mov    bx,64
   mul    bx
   lds    si,boxptr
   add    si,ax
   mov    bp,ds       { DS mentÇse }
   mov    ds,cx       { Eredeti DS vissza }
   mov    ax,8
   mul    drawboxy
   mov    drawboxy,ax { Ezt azÇrt csin†ltuk, hogy kÇsãbb ne kelljen mindig szorozni }
   add    si,ax       { SI most a boxon belÅli kirakand¢ sorra mutat }
   add    si,drawboxx { ês most az elsã kirakand¢ pontra }
   mov    cx,8
   sub    cx,drawboxx { Az elsã boxban kirakand¢ pontok sz†ma ( a tîbbiben 8, kivÇve az utols¢t ) }
   mov    dx,ds       { DS elmentÇse }
   mov    ds,bp       { DS:[SI] most a boxra mutat, lehet m†solni }
   rep    movsb       { M†solunk is }
   mov    ds,dx       { DS vissza } { KÇsz az elsã box }

   mov    cx,39       { Jîhet a tîbbi, a kîvetkezã 38 }
@nextbox:
   push   cx
   mov    cx,ds       { DS ideigl. mentÇse }
   mov    ax,boxnumber
   inc    boxnumber
   lds    si,mapptr
   add    si,ax
   lodsb              { AL: kîv. box sorsz†ma }
   mov    ds,cx       { Eredeti DS vissza }
   xor    ah,ah
   mov    bx,64
   mul    bx
   lds    si,boxptr
   add    si,ax
   mov    ds,cx       { Eredeti DS vissza }
   mov    bx,ds       { Most m†shova mentjÅk a DS-t, mert a CX-re szÅgsÇg lesz }
   add    si,drawboxy
   mov    ds,bp       { BP m†r kor†bban a boxptr szegmensÇt tartalmazta }
   mov    cx,8        { Egy boxsort rakunk ki ... }
   rep    movsb
   mov    ds,bx
   pop    cx
   loop   @nextbox    { Kîv. box }

   mov    cx,ds       { DS ideigl. mentÇse }
   mov    ax,boxnumber
   lds    si,mapptr
   add    si,ax
   lodsb              { AL: uts¢ box sorsz†ma }
   mov    ds,cx       { Eredeti DS vissza }
   xor    ah,ah
   mov    bx,64
   mul    bx
   lds    si,boxptr
   add    si,ax
   mov    bp,ds       { DS mentÇse }
   mov    ds,cx       { Eredeti DS vissza }
   add    si,drawboxy { SI most a boxon belÅli kirakand¢ sorra mutat }
   mov    cx,drawboxx { Az elsã boxban kirakand¢ pontok sz†ma ( a tîbbiben 8, kivÇve az utols¢t ) }
   mov    dx,ds       { DS elmentÇse }
   mov    ds,bp       { DS:[SI] most a boxra mutat, lehet m†solni }
   rep    movsb       { M†solunk is }
   mov    ds,dx       { DS vissza } { KÇsz az uts¢ box }

   pop    bp

 end;


procedure VLine( Line: word);  assembler; asm
   push   bp
   cld

   mov    ax,posy
   mov    dx,ax
   and    dx,7
   mov    drawboxy,dx
   shr    ax,3
   mul    BPL
   mov    cx,ax
   mov    ax,posx
   add    ax,line
   mov    dx,ax
   and    dx,7
   mov    drawboxx,dx
   shr    ax,3
   add    ax,cx
   mov    boxnumber,ax

   les    di,background
{  mov    es,sega000
   xor    di,di
}  add    di,line

   mov    cx,ds
   lds    si,mapptr
   add    si,ax       { AX itt: BoxNumber }
   lodsb              { AL: a box sorsz†ma }
   mov    ds,cx       { DS vissza }
   xor    ah,ah
   mov    bx,64
   mul    bx
   lds    si,boxptr
   add    si,ax
   mov    bp,ds       { DS mentÇse }
   mov    ds,cx       { Eredeti DS vissza }
   mov    ax,8
   mul    drawboxy
   add    si,ax       { SI most a boxon belÅli kirakand¢ sorra mutat }
   add    si,drawboxx { ês most az elsã kirakand¢ pontra }
   mov    cx,8
   sub    cx,drawboxy { Az elsã boxban kirakand¢ pontok sz†ma ( a tîbbiben 8, kivÇve az utols¢t ) }
   mov    dx,ds       { DS elmentÇse }
   mov    ds,bp       { DS:[SI] most a boxra mutat, lehet m†solni }
@nextput:
   movsb
   add    si,7
   add    di,319
   loop   @nextput
   mov    ds,dx       { DS vissza } { KÇsz az elsã box }

   mov    ax,areay
   sub    ax,8
   add    ax,drawboxy
   mov    bx,8
   xor    dx,dx
   div    bx
   mov    drawboxy,dx   { A maradÇkot majd az uts¢ boxn†l haszn†ljuk fel }
   mov    cx,ax         { CX: a kirakand¢ boxok sz†ma }

@nextbox:
   push   cx
   mov    ax,BPL
   add    boxnumber,ax
   mov    bx,boxnumber
   mov    cx,ds
   lds    si,mapptr
   add    si,bx
   lodsb              { AL: a box sorsz†ma }
   mov    ds,cx       { DS vissza }
   xor    ah,ah
   mov    bx,64
   mul    bx
   lds    si,boxptr
   mov    ds,cx       { Eredeti DS vissza }
   add    si,ax       { BP:[SI] a box-adatra mutat }
   add    si,drawboxx { Most m†r a kirakand¢ pontra }
   mov    bx,ds       { M†shova mentjÅk a DS-t }
   mov    ds,bp
   mov    cx,8
@nextline:
   movsb
   add    si,7
   add    di,319
   loop   @nextline
   mov    ds,bx       { M†r csak a legals¢ box van h†tra }
   pop    cx
   loop   @nextbox    { Kîv. box }

   mov    ax,BPL
   add    boxnumber,ax
	 mov		bx,boxnumber
	 mov    cx,ds
	 lds    si,mapptr
	 add    si,bx
	 lodsb              { AL: a box sorsz†ma }
   mov    ds,cx       { DS vissza }
   xor    ah,ah
   mov    bx,64
   mul    bx
   lds    si,boxptr
   mov    ds,cx       { Eredeti DS vissza }
   add    si,ax       { BP:[SI] a box-adatra mutat }
   add    si,drawboxx { Most m†r a kirakand¢ pontra }
   mov    bx,ds       { M†shova mentjÅk a DS-t }
   mov    cx,drawboxy
   cmp    cx,0
	 jz     @exit
   mov    ds,bp
@nextpixel:
	 movsb
	 add    si,7
	 add    di,319
	 loop   @nextpixel
   mov    ds,bx

@exit:
   pop    bp

  end;


procedure NewPos;  assembler; asm
   mov    ax,x
   mov    posx,ax
   mov    ax,y
   mov    posy,ax
   mov    cx,areay
@nextline:
   push   cx
   dec    cx
   push   cx
   call   hline  {hline}
   pop    cx
   loop   @nextline
 end;


procedure Scroll; assembler; asm
   cmp    dir,up
   jz     @upscroll
   cmp    dir,down
   jz     @downscroll
   cmp    dir,left
   jz     @leftscroll

{rightscroll}
   std
   mov    ax,count
   sub    posx,ax
   les    di,background
{  mov    es,sega000
   xor    di,di
}
   add    di,arealen
   dec    di
   mov    si,di
   sub    si,count
   mov    cx,areay        { Ennyi sort mozgatunk }
   xor    dx,dx
   mov    ax,count
{  mov    bx,2}
   mov    dx,ax
   and    dx,1            { DX =  count mod 2 }
   shr    ax,1
   neg    ax
   add    ax,160          { AX =  160 - count  div 2 }
{  mov    bx,1
   sub    bx,dx
   add    ax,bx }
@nextlinerg:
   push   cx
   mov    cx,ax
   rep    seges movsw
   sub    di,count
   sub    si,count
   add    di,dx
   add    si,dx
{  dec    di
   dec    si
}  pop    cx
   loop   @nextlinerg
{
   cld
   cmp    dx,1
   jz     @noline
   les    si,background
   inc    si
   mov    di,si
   add    di,2
   mov    cx,areay
@nextone:
   movsb
   add    si,319
   add    di,319
   loop   @nextone
@noline:
}
(* add    di,319
   mov    si,di
   sub    si,count
   mov    cx,areay        { Ennyi sort mozgatunk }
   xor    dx,dx
   mov    ax,count
   mov    bx,2
   div    bx              
   neg    ax
   add    ax,160          { AX =  160 - count  div 2 }
@nextlinerg:
   push   cx
   mov    cx,ax
   rep    seges movsw
   add    di,320
   add    si,320
   sub    di,count
   sub    si,count
   pop    cx
   loop   @nextlinerg
*)



   mov    cx,count
   inc    cx
@nextrline:
   push   cx
   dec    cx
   push   cx
   call   vline
   pop    cx
   loop   @nextrline

{  mov    ax,2
   push   ax
   call   vline
}  jmp    @exit

@leftscroll:
   cld
   mov    ax,count
   add    posx,ax
   les    di,background
   mov    si,di
   add    si,count        { ES:SI, ES:DI felvette a megfelelã ÇrtÇket }
   mov    cx,areay        { Ennyi sort mozgatunk }
   xor    dx,dx
   mov    ax,count
   mov    dx,ax
   and    dx,1            { DX =  count mod 2 }
   shr    ax,1
   neg    ax
   add    ax,160          { AX =  160 - count  div 2 }
@nextlinelf:
   push   cx
   mov    cx,ax
   rep    seges movsw
   add    di,count
   add    si,count
   sub    di,dx
   sub    si,dx
   pop    cx
   loop   @nextlinelf
	 mov    cx,count
@nextvline:
   push   cx
   mov    dx,320
   sub    dx,cx
   push   dx
   call   vline
   pop    cx
   loop   @nextvline
   jmp    @exit

@downscroll:
   mov    ax,count
   sub    posy,ax
   mov    cx,arealen2
   les    di,background
   add    di,arealen
   sub    di,2
   mov    si,di
   mov    ax,320
   mul    count
   sub    si,ax
   mov    ax,160
   mul    count
   sub    cx,ax
   std
   rep    seges movsw

   mov    cx,count
@onelinedn:
   push   cx
   dec    cx
   push   cx
   call   hline
   pop    cx
   loop   @onelinedn
   jmp    @exit

@upscroll:
   mov    ax,count
   add    posy,ax
   mov    cx,arealen2
   les    di,background
   mov    si,di
   mov    ax,320
   mul    count
   add    si,ax
   mov    ax,160
   mul    count
   sub    cx,ax
   cld
   rep    seges movsw

   mov    cx,count
@onelineup:
   push   cx
   mov    ax,areay
   sub    ax,cx
   push   ax
   call   hline
   pop    cx
   loop   @onelineup
{  jmp    @exit}

@exit:
 end;


procedure LoadMap;
 var
  f: file;
  l: word;
  ver: byte;
  i,j: byte;
 begin
  Assign( f, FileName);
  Reset( f, 1);
  IOError( FileName);
  BlockRead( f, ver, 1);
  IOError( FileName);
  BlockRead( f, BPL, 2);
  IOError( FileName);
  BlockRead( f, l, 2);
  MapLength:= l;
  IOError( FileName);
{  Memory:= true;}
  if Maxavail<256*64 then begin
   SetMode( 3);
   WriteLn('Not enough memory.'+#7);
   Halt;
   end;
  GetMem( BoxPtr, 256*64);
  BlockRead( f, BoxPtr^, 256*64);
  if MaxAvail<l then begin
   SetMode( 3);
   WriteLn( 'Not enough memory.'#7);
   halt;
   end;
  {Memory:= true;
  if not _}GetMem( MapPtr, l){ then begin Memory:= false; exit end};
  BlockRead( f, MapPtr^, l);
  IOError( FileName);
  if ver=1 then BlockRead( f, Mask, 32) else
   for i:= 0 to 31 do Mask[i]:=0;
  IOError( FileName);
  Close( f);
  IOError( FileName);
  PosX:= 0;
  PosY:= 0;
  end;



procedure LoadLBM;

 var f: file;
     p1, p2: pointer;
     i,j:  byte;
     Error: boolean;
 const
     cimke: array[0..3] of char = 'BODY';
 begin
  mark( p1);
  assign( f, FileName);
  reset( f, 1);  IOERROR( FileName);
  getmem( p2, filesize( f));
  blockread( f, p2^, filesize( f)); IOERROR( FileName);
  close( f); IOERROR( FileName);
  SetMode( $13);
  for  i:= 0 to 255 do begin
   port[$3c8]:=i;
   for j:= 0 to 2 do port[$3c9]:=mem[seg(p2^):ofs(p2^)+$30+3*i+j] shr 2;
   end;
  asm
{  jmp    @start
@start:}
   mov    error,0
   mov    al,byte ptr cimke
   les    di,p2
   mov    bx,di
   add    di,6
   mov    cx,es:[di]
   xchg   cl,ch
@1:
   repnz  scasb
   jnz    @hiba
   mov    si,offset cimke
   push   di
   push   cx
   dec    di
   mov    cx,4
   repz   cmpsb
   pop    cx
   pop    di
   jnz    @1
   mov    dx,es:[di+5]
   xchg   dl,dh
   add    di,7
   push   ds
   mov    ax,di
   les    di,p
   lds    si,p2
   sub    ax,bx
   add    si,ax
   xor    ch,ch
@2:
   and    dx,dx
   jz     @vege
   mov    cl,[si]
   inc    si
   dec    dx
   test   cl,128
   jz     @normal
   neg    cl
   inc    cl
   mov    al,[si]
   inc    si
   dec    dx
   rep    stosb
   jmp    @2
@normal:
   inc    cl
   sub    dx,cx
   rep    movsb
   jmp    @2
@hiba:
   mov    error,1
@vege:
   pop    ds
  end;
 if Error then begin
  SetMode($3); WriteLn('Read error: '''+FileName+''''+#7);
  {readkey;} delay( 5000);
  SetMode($13);
  end;
 release( p1);
 end;






(**************************************************************************)
(*                                                                        *)
(*                             BOB - rutinok                              *)
(*                                                                        *)
(**************************************************************************)




procedure BOB.Init; begin
    if NextBOB=MaxBOB then begin SetMode( 3);
       WriteLn('Too many BOBs error'); Halt; end;
    BOBTable[NextBOB]:=Ofs(Self);
    NR:= NextBOB;
    inc(NextBOB);
    P:= 0;
    A:= true;
   end;

{procedure BOB.Done;
  var i: word;
  begin
   dec( NextBOB);
   for i:= NR to NextBOB do BOBTable[i]:=BOBTable[i+1];
   with BOBDatas[i] do begin
    if p<>nil then begin freemem(p,l); p:=nil; end; end;
   dt:= nil;
  end;
 }

procedure BOB.Load;

  var
    f: file;
    mode: byte;

  begin
    Init;
    Assign( f, FileName);
    Reset( f, 1);
    IOError( FileName);
    BlockRead( f, mode, 1);
    IOError( FileName);
   if mode=0 then begin
    LX:=0; LY:=0; PN:=0;
    BlockRead( f, LX, 1);
    IOError( FileName);
    BlockRead( f, LY, 1);
    IOError( FileName);
    BlockRead( f, PN, 1);
    IOError( FileName);
    end else begin
    BlockRead( f, LX, 2);
    IOError( FileName);
    BlockRead( f, LY, 2);
    IOError( FileName);
    BlockRead( f, PN, 2);
    IOError( FileName);
    end;
    W:=LX+1;
    H:=LY+1;
    PL:= W*H;
    LN:= PL*(PN+1);
    {Memory:= true;}
    GetMem( DT, LN); {then begin Memory:= false; exit end}
    { then begin SetMode( 3); WriteLn('Not enough memory'+#7); Halt end;}
    BlockRead( f, DT^, LN);
    IOError( FileName);
    Close( f);
    IOError( FileName);
    with BOBDatas[NR] do begin
     p:= DT; l:= LN; end;
   end;


function BOB.Collision( var B: BOB): boolean; assembler; asm
   jmp    @start        { K¢dszegmensben t†rolt v†ltoz¢k †tugr†sa }
@W:dw     0             { ABW, a kîzîs rÇsz szÇlessÇge            }
@H:dw     0             { ABH, a kîzîs rÇsz magass†ga             }
@A:dw     0             { AX1+AX2 îsszeget t†roljuk itt           }
@B:dw     0             { BX1+BX2 îsszeg                          }

@start:
   mov    di,word [Self] { [DI] az A BOB adatainak kezdãc°me      }
   mov    si,word [B]   { B BOB adataira pedig az [SI] mutat      }
   push   ds            { DS is kell                              }

 { 1. Megvizsg†ljuk, hogy vannak-e kîzîs pontjaik }

   mov    ax,[di]       { Ha valamelyik BOB nem akt°v, nem kell   }
   and    ax,[si]       { tov†bb vizsg†l¢dni, nem Çrintkezhetnek, }
   jz     @noColl      { mert az egyik nem l†tszik               }
   mov    ax,[di+2]     { 'A' BOB abszcissz†ja                    }
   add    ax,[di+18]    { 'A' BOB szÇlessÇgÇt hozz†adjuk          }
   cmp    ax,[si+2]     { 'B' BOB ettãl jobbra van-e?             }
   jng    @noColl      { Ha igen, nem Çrintkezhetnek             }
   mov    XA,ax         { Az îsszeget t†roljuk                    }
   mov    ax,[di+4]     { Ugyanezt megvizsg†ljuk, csak fÅggãlege- }
   add    ax,[di+20]    { sen                                     }
   cmp    ax,[si+4]
   jng    @noColl
   mov    YA,ax         { Idãsp¢rol†s miatt Y+H-t is elmentjÅk    }
   mov    ax,[si+2]     { Jîhet a m†sik kÇt vizsg†lat:            }
   add    ax,[si+18]    { v°zszintesen...                         }
   cmp    ax,[di+2]
   jng    @noColl
   mov    XB,ax
   mov    ax,[si+4]     { ... Çs fÅggãlegesen                     }
   add    ax,[si+20]
   cmp    ax,[di+4]
   jng    @noColl
   mov    YB,ax

 { 2. Most m†r biztos, hogy van a kÇt BOB-nak kîzîs terÅlete,
      meg kell hat†rozni annak mÇretÇt Çs helyÇt }

 { 2.1. êrtÇket adunk az AX1-BY2 v†ltoz¢knak }
   mov ax,[si+2]; sub ax,[di+2]; mov AX1,ax
   mov ax,[si+4]; sub ax,[di+4]; mov AY1,ax
   mov ax,[di+2]; sub ax,[si+2]; mov BX1,ax
   mov ax,[di+4]; sub ax,[si+4]; mov BY1,ax
   mov ax,XA;     sub ax,XB;     mov AX2,ax
   mov ax,YA;     sub ax,YB;     mov AY2,ax
   mov ax,XB;     sub ax,XA;     mov BX2,ax
   mov ax,YB;     sub ax,YA;     mov BY2,ax

 { 2.2. Amelyik ezek kîzÅl negat°v, null†ra v†ltozik }
         cmp ax1,0; jg @A1; mov ax1,0
    @A1: cmp ax2,0; jg @A2; mov ax2,0
    @A2: cmp ay1,0; jg @A3; mov ay1,0
    @A3: cmp ay2,0; jg @A4; mov ay2,0
    @A4: cmp bx1,0; jg @B1; mov bx1,0
    @B1: cmp bx2,0; jg @B2; mov bx2,0
    @B2: cmp by1,0; jg @B3; mov by1,0
    @B3: cmp by2,0; jg @B4; mov by2,0
    @B4:

   mov    ax,ax1        { Az AX1+AX2 îsszeg a sorok vÇgÇn az ug-  }
   add    ax,ax2        { r†shoz szÅksÇgesek, ezÇrt t†roljuk a    }
   mov    word [@A],ax  { k¢dszegmensben                          }
   mov    ax,bx1        { Ugyan°gy a BX1+BX2 îsszeget is          }
   add    ax,bx2
   mov    word [@B],ax
   mov    ax,[di+18]    { M†r csak az îsszehasonl°tand¢ terÅlet   }
   sub    ax,word [@A]  { mÇreteit kell megadni:                  }
   mov    word [@W],ax  {  szÇlessÇge: A.W-(AX1+AX2)              }
   mov    ax,[di+20]
   sub    ax,ay1
   sub    ax,ay2
   mov    word [@H],ax  {  magass†ga:  A.H-AY1-AY2                }

 { 2.3. Regiszterek be†ll°t†sa, kezdãc°mek kisz†mol†sa }
   mov    ax,[di+10]    { AX: az aktu†lis f†zis t†vols†ga         }
   mul    word [di+16]  {     (f†zissz†mûf†zishossz)              }
   mov    cx,ax         { AX ideiglenes t†rol†sa                  }
   mov    ax,[di+18]    { Meghat†rozzuk az A BOB-on belÅl a vizs- }
   mul    ay1           { g†lt tartom†ny kezdãpontj†t:            }
   add    ax,cx
   add    ax,ax1        { A.WûAY1+AX1 (+f†zisûf†zishossz)         }
   les    di,[di+12]    { ES:[DI] a Shape kezdãc°mÇre mutat       }
   add    di,ax         { Most m†r az elsã vizsg†land¢ pontra     }

   mov    ax,[si+10]    { Ugyanezeket a sz†m°t†sokat B-re is el-  }
   mul    word [si+16]  { vÇgezzÅk                                }
   mov    cx,ax
   mov    ax,[si+18]
   mul    by1           { Kezdã pont: B.PûB.PL+B.WûBY1+BX1        }
   add    ax,cx
   add    ax,bx1
   lds    si,[si+12]    { A B Shape-re a DS:[SI] mutat            }
   add    si,ax         { SI-hez hozz†adjuk a fenti ÇrtÇket       }

 { 3. ôsszehasonl°t†s }

   mov    dx,word [@H]  { DX szok†s szerint a sorsz†ml†l¢         }
@nextline:
   mov    cx,word [@W]  { CX pedig a pontokat sz†ml†lja           }
@scan:
   lodsb                { Egy pont a B-Shape-bãl                  }
   cmp    al,0          { Ha nulla, akkor ott a kÇt BOB nem       }
   jz     @nil          { Çrintkezhet                             }
   mov    al,es:[di]    { Ha nem nulla, megvizsg†ljuk, hogy az A  }
   cmp    al,0          { BOB ezen a helyen †tl†tsz¢-e            }
   jnz    @Collision        { Ha nem, ÅtkîzÇs van                     }
@nil:
   inc    di            { DI nîvelÇse (SI a LODSB miatt nãtt)     }
   loop   @scan         { Egy sor letapogat†sa                    }
   add    di,word [@A]  { DI Çs SI nîvelÇse, hogy a kîvetkezã sor }
   add    si,word [@B]  { AX1. ill BX1. oszlop†ra mutasson        }
   dec    dx            { Sorsz†ml†l¢ csîkkentÇse                 }
   jnz    @nextline     { ôsszes sor letapogat†sa                 }

@noColl:               { Ha nincs ÅtkîzÇs                        }
   mov    al,0          { AL=0, teh†t a fÅggvÇnyÇrtÇk FALSE       }
   jmp    @exit
@Collision:
   mov    al,1          { Ellenben AL=1, TRUE                     }
@exit:
   pop    ds            { Eredeti DS                              }

 end;




function BOB.CollBack; assembler; asm
   push   bp               { BP regisztert adatt†rol†sra haszn†ljuk }
   cld
   mov    bx,word ptr (self) { [BX]: offset BOB }

   mov    al,[bx]
   cmp    al,0
   jz     @noColl         { Ha nem aktiv: kîvetkezã }
   mov    ax,[bx+2]        { AX = X koordin†ta }
   cmp    ax,320
   jge    @noColl
   mov    x1,ax            { X1 = X }
   mov    ax,[bx+4]        { Y }
   cmp    ax,areay
   jge    @noColl
   mov    y1,ax            { Y1 = Y }
   mov    ax,[bx+6]        { lx }
   add    ax,[bx+2]
   jnge   @noColl
   mov    x2,ax            { X2 = X+LX }
   mov    ax,[bx+8]        { ly }
   add    ax,[bx+4]
   jnge   @noColl
   mov    y2,ax            { Y2 = Y+LY }

   les    si,[bx+12]       { ES:[SI]^ = DT }
   mov    ax,[bx+16]       { AX = PL }
   mul    word ptr [bx+10]
   add    si,ax            { ES:[SI]^ = kîvetkezã f†zis }

   cmp    x1,0
   jnge   @halfout
   cmp    y1,0
   jnge   @halfout
   cmp    x2,319
   jg     @halfout
   mov    ax,areay
   cmp    y2,ax
   jge    @halfout         { Ha kil¢g valamerre a @HALFOUT-ra ugrik }

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã kirakand¢ pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    dxx,dx
   mov    dl,BackColor
   mov    bp,ds            { DS elmentÇse }
   pop    bobseg           { Az elãzãleg elmentett ES->BOBSeg }

   mov    cx,[bx+20]       { CX = kirakand¢ sorok sz†ma }
@NextLine:
   push   cx
   mov    cx,[bx+18]       { CX = 1 sorban lÇvã pontok }
   mov    ds,BOBSeg        { DS:[SI]^ = shape (aktu†lis f†zis) }
@Controll:
   lodsb
   cmp    al,0
   jz     @nil
   mov    al,es:[di]
   cmp    al,dl
   jnz    @Collision
@Nil:
   inc    di
   loop   @Controll
   mov    ds,bp            { Vissza az eredeti DS a BP-bãl }
   add    di,dxx           { DI = kîv. sor }
   pop    cx
   loop   @NextLine        { kîv. sor }

@NoColl:
   mov    al,0
   jmp    @exit

@HalfOut:
   mov    cx,[bx+20]      { CX-be a BOB magass†ga }
   cmp    y1,0
   jge    @notup           { Ha nem felÅl l¢g ki a @NOTUP-ra ugrik }
   mov    ax,y1
   neg    ax               { AX=-AX }
   sub    cx,ax            { A kirakand¢ sorok csîkkennek }
   mov    dx,[bx+18]       { DX-be a szÇlessÇg }
   mul    dx
   add    si,ax            { SI most a shape kezdã sor†ra mutat }
   mov    y1,0             { Y koordin†ta null†z†sa }
@NotUp:
   mov    dxx,0            { A shape-en belÅli lÇpÇskîz null†z†sa }
   mov    ax,[bx+18]
   mov    pnt,ax           { PNT = 1 sorban kirakand¢ pontok sz†ma }
   cmp    x1,0
   jge    @notleft         { Ha nem baloldalt l¢g ki a @NOTLEFT-re ugrik }
   mov    ax,x1
   neg    ax
   add    si,ax
   mov    dxx,ax           { A lÇpÇskîz AX-szel nã }
   sub    pnt,ax           { A kirakand¢ pontok sz†ma -X1-gyel csîkken }
   mov    x1,0             { X koordin†ta null†z†sa }
@NotLeft:
   cmp    x2,319
   jng    @NotRight
   mov    ax,x2
   sub    ax,319
   add    dxx,ax          { A lÇpÇskîz X2-319-cel nã }
   sub    pnt,ax          { A kirakand¢ pontok sz†ma X2-319-cel csîkken }
   mov    x2,319
@NotRight:
   mov    ax,y2
   cmp    ax,areay
   jnge   @NotDown
   sub    ax,areay
   sub    cx,ax           { CX=CX-(Y2-AREAY) }
   sub    cx,1
@NotDown:

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    daa,dx
   mov    dl,BackColor
   pop    ax               { Az elãzãleg elmentett ES->AX }

@2NextLine:
   push   cx
   mov    cx,pnt           { CX = 1 sorban lÇvã kirakand¢ pontok }
   push   ds
   push   ax
   mov    ds,ax            { DS:[SI]^ = shape (aktu†lis f†zis) }
@2Controll:
   lodsb
   cmp    al,0
   jz     @2nil
   mov    al,es:[di]
   cmp    al,dl
   jnz    @2Coll
@2Nil:
   inc    di
   loop   @2Controll
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   add    di,daa           { DI = kîv. sor }
   add    si,dxx           { SI = kîv. shape sor }
   loop   @2NextLine       { kîv. sor }

   mov    al,0
   jmp    @exit
@2Coll:
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   mov    al,1
   jmp    @exit
@Collision:
   pop    cx
   mov    ds,bp
   mov    al,1
@Exit:
   pop    bp
 end;



function BOB.CollColors; assembler; asm
   push   bp               { BP regisztert adatt†rol†sra haszn†ljuk }
   cld
   mov    bx,word ptr (self) { [BX]: offset BOB }

   mov    al,[bx]
   cmp    al,0
   jz     @noColl         { Ha nem aktiv: kîvetkezã }
   mov    ax,[bx+2]        { AX = X koordin†ta }
   cmp    ax,320
   jge    @noColl
   mov    x1,ax            { X1 = X }
   mov    ax,[bx+4]        { Y }
   cmp    ax,areay
   jge    @noColl
   mov    y1,ax            { Y1 = Y }
   mov    ax,[bx+6]        { lx }
   add    ax,[bx+2]
   jnge   @noColl
   mov    x2,ax            { X2 = X+LX }
   mov    ax,[bx+8]        { ly }
   add    ax,[bx+4]
   jnge   @noColl
   mov    y2,ax            { Y2 = Y+LY }

   les    si,[bx+12]       { ES:[SI]^ = DT }
   mov    ax,[bx+16]       { AX = PL }
   mul    word ptr [bx+10]
   add    si,ax            { ES:[SI]^ = kîvetkezã f†zis }

   cmp    x1,0
   jnge   @halfout
   cmp    y1,0
   jnge   @halfout
   cmp    x2,319
   jg     @halfout
   mov    ax,areay
   cmp    y2,ax
   jge    @halfout         { Ha kil¢g valamerre a @HALFOUT-ra ugrik }

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã kirakand¢ pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    dxx,dx
   mov    dl,cfirst
   mov    dh,clast
   mov    bp,ds            { DS elmentÇse }
   pop    bobseg           { Az elãzãleg elmentett ES->BOBSeg }

   mov    cx,[bx+20]       { CX = kirakand¢ sorok sz†ma }
@NextLine:
   push   cx
   mov    cx,[bx+18]       { CX = 1 sorban lÇvã pontok }
   mov    ds,BOBSeg        { DS:[SI]^ = shape (aktu†lis f†zis) }
@Controll:
   lodsb
   cmp    al,0
   jz     @nil
   mov    al,es:[di]
   cmp    al,dl
   jc     @Collision
   cmp    al,dh
   ja     @Collision
@Nil:
   inc    di
   loop   @Controll
   mov    ds,bp            { Vissza az eredeti DS a BP-bãl }
   add    di,dxx           { DI = kîv. sor }
   pop    cx
   loop   @NextLine        { kîv. sor }

@NoColl:
   mov    al,0
   jmp    @exit

@HalfOut:
   mov    cx,[bx+20]      { CX-be a BOB magass†ga }
   cmp    y1,0
   jge    @notup           { Ha nem felÅl l¢g ki a @NOTUP-ra ugrik }
   mov    ax,y1
   neg    ax               { AX=-AX }
   sub    cx,ax            { A kirakand¢ sorok csîkkennek }
   mov    dx,[bx+18]       { DX-be a szÇlessÇg }
   mul    dx
   add    si,ax            { SI most a shape kezdã sor†ra mutat }
   mov    y1,0             { Y koordin†ta null†z†sa }
@NotUp:
   mov    dxx,0            { A shape-en belÅli lÇpÇskîz null†z†sa }
   mov    ax,[bx+18]
   mov    pnt,ax           { PNT = 1 sorban kirakand¢ pontok sz†ma }
   cmp    x1,0
   jge    @notleft         { Ha nem baloldalt l¢g ki a @NOTLEFT-re ugrik }
   mov    ax,x1
   neg    ax
   add    si,ax
   mov    dxx,ax           { A lÇpÇskîz AX-szel nã }
   sub    pnt,ax           { A kirakand¢ pontok sz†ma -X1-gyel csîkken }
   mov    x1,0             { X koordin†ta null†z†sa }
@NotLeft:
   cmp    x2,319
   jng    @NotRight
   mov    ax,x2
   sub    ax,319
   add    dxx,ax          { A lÇpÇskîz X2-319-cel nã }
   sub    pnt,ax          { A kirakand¢ pontok sz†ma X2-319-cel csîkken }
   mov    x2,319
@NotRight:
   mov    ax,y2
   cmp    ax,areay
   jnge   @NotDown
   sub    ax,areay
   sub    cx,ax           { CX=CX-(Y2-AREAY) }
   sub    cx,1
@NotDown:

   push   es
   les    di,background
   mov    ax,320
   mul    y1
   add    ax,x1
   add    di,ax            { DI most az elsã pontra mutat }
   mov    dx,319
   sub    dx,x2
   add    dx,x1            { DX = 319-x2+x1, kÇt sor kîzti ugr†s }
   mov    daa,dx
   mov    dl,cfirst
   mov    dh,clast
   pop    ax               { Az elãzãleg elmentett ES->AX }

@2NextLine:
   push   cx
   mov    cx,pnt           { CX = 1 sorban lÇvã kirakand¢ pontok }
   push   ds
   push   ax
   mov    ds,ax            { DS:[SI]^ = shape (aktu†lis f†zis) }
@2Controll:
   lodsb
   cmp    al,0
   jz     @2nil
   mov    al,es:[di]
   cmp    al,dl
   jc     @2Coll
   cmp    al,dh
   ja     @2Coll
@2Nil:
   inc    di
   loop   @2Controll
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   add    di,daa           { DI = kîv. sor }
   add    si,dxx           { SI = kîv. shape sor }
   loop   @2NextLine       { kîv. sor }

   mov    al,0
   jmp    @exit
@2Coll:
   pop    ax               { AX = seg shape }
   pop    ds               { Vissza az eredeti DS }
   pop    cx
   mov    al,1
   jmp    @exit
@Collision:
   pop    cx
   mov    ds,bp
   mov    al,1
@Exit:
   pop    bp
 end;



function  BOB.CollBox; assembler; asm
   push   bp
   mov    bx,word [self]
   mov    cx,[bx+18]
   mov    ax,cx
   shr    cx,3
   inc    cx
   cmp    ax,8
   ja     @nodec1
   mov    ax,posx
   add    ax,[bx+2]
   and    ax,7
   jnz    @nodec1
   dec    cx
@nodec1:
   mov    bp,cx               { CX elmentÇse }
   mov    cx,[bx+20]          { CX=H }
   mov    ax,cx
   shr    cx,3                { CX=bob magass†ga boxokban }
   inc    cx
   cmp    ax,8
   ja     @nodec2
   mov    ax,posy
   add    ax,[bx+4]
   and    ax,7
   jnz    @nodec2
   dec    cx
@nodec2:

   les    di,mapptr
   mov    ax,posy
   add    ax,[bx+4]
   shr    ax,3
   mul    BPL
   add    di,ax
   mov    ax,posx
   add    ax,[bx+2]
   shr    ax,3
   add    di,ax

   lea    bx,mask
@nextline:
   push   cx
   mov    cx,bp
@nextbox:
   mov    al,byte ptr es:[di]
   xor    ah,ah
   mov    dx,ax
   shr    ax,4
   mov    si,ax
   add    si,ax
   mov    ax,8000h
   and    dx,15
   push   cx
   mov    cl,dl
   shr    ax,cl
   pop    cx
   and    ax,word ptr [bx+si]
   jnz    @Colltrue
   inc    di
   loop   @nextbox
   add    di,BPL
   sub    di,bp
   pop    cx
   loop   @nextline

   mov    al,0
   jmp    @exit
@Colltrue:
   pop    cx
   mov    al,1
@exit:
   pop    bp

 end;



procedure BOB.Put;
 var
  i, j: word;
 begin
  if (XX>319-LX) or (YY>199-LY) then Exit;
  if not ShowBack then asm
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
	mov al, 0

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
  for i:= 0 to LY  do
   for j:= 0 to LX  do
    if Mem[Seg(Dt^):Ofs(Dt^)+PP*(LX+1)*(LY+1)+(LX+1)*i+j]<>0 then
       Mem[     $a000:320*(YY+i)+XX+j]:=
       Mem[Seg(Dt^):Ofs(Dt^)+PP*(LX+1)*(LY+1)+(LX+1)*i+j];
  end;


procedure BOB.ShowUpon;

 var
  poin: word;

 begin
  if Nr>B.Nr then begin
   poin          :=BOBTable[  Nr];
   BOBTable[  Nr]:=BOBTable[B.Nr];
   BOBTable[B.Nr]:=poin;
  end; end;

procedure BOB.Copy; begin
 init; move( B, Self, SizeOf(Self)); end;


function  BOB.OnScreen; assembler; asm
   mov    bx,word ptr (Self)
   mov    ax,[bx]
   cmp    ax,0
   jz     @noscr
   mov    ax,[bx+2]
   cmp    ax,320
   jge    @noscr
   add    ax,[bx+18]
   cmp    ax,0
   jng    @noscr
   mov    ax,[bx+4]
   cmp    ax,areay
   jge    @noscr
   add    ax,[bx+20]
   cmp    ax,0
   jng    @noscr
   mov    al,1
   jmp    @exit
@noscr:
   mov    al,0
@exit:
 end;




(************************  Paletta-rutinok  *******************************)




procedure LoadPal;{$I-}

 type
  FileType = record
   r, g, b: byte;
   end;
 var
  f: file of FileType;
  i: byte;
  dat: FileType;
 begin
  Assign( f, FileName);
  Reset( f);
  IOError( FileName);
  for i:=  0 to 255 do begin
   Read( f,dat);
   IOError( FileName);;
   Port[$3c8]:= i;
   Port[$3c9]:= dat.r;
   Port[$3c9]:= dat.g;
   Port[$3c9]:= dat.b;
   end;
  Close( f);
  IOError( FileName);;
  end;           {$I+}


procedure ShowPal;

  type
    cl = record dr,dg,db: byte; end;
  var
    i, j: byte;
    k: word;
    c: array[0..255] of cl;

  begin
    if First=0 then inc(First);
(*  for i:= 1 to 255 do{ with Colors[i] do} begin
     Port[$3c8]:= i;
     Port[$3c9]:= r;
     Port[$3c9]:= g;
     Port[$3c9]:= b;
     c[i].dr:=r;
     c[i].dg:=g;
     c[i].db:=b;
     end;
*)
  for i:= 1 to 255 do{ with Colors[i] do} begin
     Port[$3c7]:= i;
     c[i].dr:=Port[$3c9];
     c[i].dg:=Port[$3c9];
     c[i].db:=Port[$3c9];
     end;

    repeat {for i:= 0 to 255 do begin}
      k:=0;
      for j:= First to Last do {with Colors[j] do} begin
        if c[j].dr>Colors[j].Red   then dec(c[j].dr) else inc(k);
        if c[j].dr<Colors[j].Red   then inc(c[j].dr) else inc(k);
        if c[j].dg>Colors[j].Green then dec(c[j].dg) else inc(k);
        if c[j].dg<Colors[j].Green then inc(c[j].dg) else inc(k);
        if c[j].db>Colors[j].Blue  then dec(c[j].db) else inc(k);
        if c[j].db<Colors[j].Blue  then inc(c[j].db) else inc(k);
        {if VertBlink then RetRace;}
        Port[$3c8]:=j;
        Port[$3c9]:=c[j].dr;
        Port[$3c9]:=c[j].dg;
        Port[$3c9]:=c[j].db;
       end;
      Delay( Speed);
      RetRace;
     until k=(Last-First+1)*6; {end;}
   end;


procedure HidePal;

  type
    cl = record dr,dg,db: byte; end;
  var
    i, j: byte;
    k: word;
    c: array[0..255] of cl;

  begin
    if First=0 then inc(First);
    for i:= 1 to 255 do begin
      Port[$3c7]:=i;
      c[i].dr:= Port[$3c9];
      c[i].dg:= Port[$3c9];
      c[i].db:= Port[$3c9];
      Colors[i].Red  := c[i].dr;
      Colors[i].Green:= c[i].dg;
      Colors[i].Blue := c[i].db;
     end;
    repeat {for i:= 0 to 255 do begin}
      k:=0;
      for j:= First to Last do {with Colors[j] do} begin
        if c[j].dr>r then dec(c[j].dr) else inc(k);
        if c[j].dr<r then inc(c[j].dr) else inc(k);
        if c[j].dg>g then dec(c[j].dg) else inc(k);
        if c[j].dg<g then inc(c[j].dg) else inc(k);
        if c[j].db>b then dec(c[j].db) else inc(k);
        if c[j].db<b then inc(c[j].db) else inc(k);
      { if VertBlink then RetRace;}
        Port[$3c8]:=j;
        Port[$3c9]:=c[j].dr;
        Port[$3c9]:=c[j].dg;
        Port[$3c9]:=c[j].db;
       end;
     Delay( Speed);
     RetRace;
     until k=(Last-First+1)*6; {end;}
   end;


procedure SetRGB;
  var i:byte;
  begin for i:=0 to 255 do begin
   Port[$3c8]:= regnum;
   Port[$3c9]:= r;
   Port[$3c9]:= g;
   Port[$3c9]:= b;
   end; end;


procedure GrayPal; assembler; asm
  mov ax,101bh; mov bx,FIRST; mov cx,LAST; int 10h; end;



(*************************   Billenty˚zet   *******************************)



procedure NewIRQ; assembler; asm
   push   ds            { Azokat a regisztereket, amelyek a meg-  }
   push   ax            { szak°t†s vÇgrehajt†sa kîzben m¢dosulnak,}
   push   bx            { a veremben t†roljuk                     }
   push   cx
   xor    cl,cl         { NÇh†ny regiszter kezdeti ÇrtÇke         }
   mov    bh,cl
   mov    ax,seg key    { DS a KEY tîmb szegmense                 }
   mov    ds,ax
   in     al,60h        { AL-be beolvassuk a billenty˚ SCAN-k¢dot }
   cmp    al,0e0h       { Ha bãv°tett, elãtte E0-t olvashatunk be }
   jnz    @1            { Ha nem az, azt tesszÅk, amit kor†bban   }
   mov    byte [offset key],1 { JelezzÅk, hogy a kîvetkezã bil-   }
                        { lenty˚ k¢dj†hoz 128-at kell majd adni   }
   jmp    @end          { Most nincs tîbb dolgunk                 }
@1:                     { Ha nem $E0 k¢dot kaptunk                }
   cmp    byte [offset key],1 { Megvizsg†ljuk, hogy elãzãleg nem  }
   jnz    @2            { $E0 k¢dot kaptunk-e                     }
   mov    cl,128        { Ha igen, 128-cal nîveljÅk a SCAN-k¢dot  }
   mov    byte [offset key],0 { Null†zzuk a jelzã-v†ltoz¢t        }
@2:
   mov    bl,al         { BL-be is bevisszÅk a k¢dot              }
   and    bl,127        { Az als¢ 7 bit adja a val¢di SCAN-k¢dot  }
   add    bl,cl         { Ha bãv°tett a billenty˚, BL:= BL+128    }
   xor    cl,cl         { CL regiszter null†z†sa                  }
   shl    al,1          { C jelzãbit (FLAG) = 7. bit              }
   cmc                  { Ezt neg†ljuk, °gy ha 0, felengedtÅk az  }
                        { adott billenty˚t, ha 1, akkor lenyomtuk }
   adc    cl,00         { CL most 0 vagy 1 lehet (FALSE, TRUE)    }
   mov    [offset key+bx],cl { A megszakt†st kiv†lt¢ billenty˚hîz }
                        { tartoz¢ logikai v†ltoz¢ be†llt†sa       }

 { A most kîvetkezã utast†sok vissza†lltj†k a megszakt†si csator- }
 { n†t, rÇszletesebben nem Çrdemes foglalkozni velÅk.             }
@end:
 in al,61h; mov ah,al; or al,80h; out 61h,al; mov al,ah; nop; nop;
 nop; out 61h,al; cli; mov al,20h; out 20h,al; sti

   pop    cx            { Regiszterek visszaolvas†sa a verembãl   }
   pop    bx
   pop    ax
   pop    ds
   iret                 { VÇge a megszakt†snak                    }
   end;

procedure InitKEY;
 begin
   getintvec( $09, @OLD); { A rÇgi megszakit†svektort t†roljuk      }
   setintvec( $09, @NewIRQ); { A $09 megszakt†s ezent£l a NEWIRQ    }
                        { elj†r†st h°vja meg                      }
   fillchar(key,sizeof(key),0); { KEY tîmb null†z†sa (FALSE)        }
  end;

procedure DoneKey;
 begin
  setintvec( $09, @OLD);
  end;


function _KeyPressed;

 var i: byte;
 begin
 _KeyPressed:=false;
 for i:= 1 to 255 do if key[i] then _KeyPressed:=true;
 end;


function  _ReadKey;
 var i: byte;
 begin
  repeat until _KeyPressed;
  for i:= 1 to 255 do if key[i] then begin _ReadKey:= i; i:= 255 end;
  repeat until not _KeyPressed;
  end;

end.
