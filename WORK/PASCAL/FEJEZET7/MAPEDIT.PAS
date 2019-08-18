{$A+,B-,D+,E-,F-,G+,I+,L+,N+,O-,P-,Q-,R-,S+,T-,V+,X+}
{$M 16384,0,655360}

program  MAP_EDITOR;

uses CRT, DOS, GAME, MCGA, MENU, MOUSE, _SYSTEM;




type

 MapType = array [0..65534] of byte;
 BoxType = array [0..255,0..63] of byte;
 PalType = array [0..255,0..2] of byte;

 FreshT = object
  procedure Menus;
  procedure RMap;
  procedure RBox;
  procedure Palette;
  procedure Editor;
  procedure Color;
  procedure BoxNr;
  procedure CopyRight;
  procedure XY;
  procedure Screen;
  procedure Mask;
  end;

 RecType = record
  x1,y1, x2,y2: word;
  end;

 PufType = array [0..319,0..23] of byte;
 PastePuf = array [0..22,0..21] of byte;
 MaskWType = array [0..15] of word;

var

 BoxX: word;
 BoxY: word;
 i, j, k, rx, ry: word;
 Refresh: FreshT;
 MapHeight: word;
 CopRig: bob;
 Puffer: ^string;
 MesPuf: ^PufType;
 Pal:    ^PalType;
 PasPuf: ^PastePuf;
 OldMap: ^MapType;
 MaskW:  ^MaskWType;
 f: file;
 sx1,sy1, sx2,sy2: word;
 sw, sh: word;

const

 CBack: byte = 0;
 CText: byte = 15;
 CRect: byte = 15;
 CBSrl: byte = 15;
 CFSrl: byte = 0;
 CCurs: byte = 15;
 CDefa: byte = 0;
 CMesB: byte = 15;
 CMesF: byte = 0;
 CSBox: byte = 15;

 DefBox: byte = 0;
{Pal: pointer = @colors;}
 CurrColor: byte = 0;
 CurrBox:   byte = 0;

 OfsX: word = 0;
 OfsY: word = 0;
 Tab:  word = 1;
 Map: ^MapType = nil;
 Box: ^BoxType = nil;
 MapFile: string = '';

 Pal1stLine: byte = 0;
{MapDef:     boolean = false;}
 CRDef:      boolean = false;
 MiniRec:    boolean = false;
 Quit:       boolean = false;
 Scrolled:   boolean = false;
 Selected:   boolean = false;
 BarDef:     boolean = false;
{MapSaved:   boolean = false;
}
 AMax  = 7;
 ANoHr = 0;
 AMenu = 1;
 AMap  = 2;
 ABox  = 3;
 APalU = 4;
 APal  = 5;
 APalD = 6;
 AEdit = 7;
 Coords: array [1..AMax] of RecType = (
  ( x1: 0     ; y1: 0     ; x2: 22*8-1; y2: 7     ),
  ( x1: 1     ; y1: 2 *8  ; x2: 22*8  ; y2: 23*8-1),
  ( x1: 23*8+1; y1: 1     ; x2: 39*8  ; y2: 16*8  ),
  ( x1: 23*8+1; y1: 16*8+2; x2: 31*8-1; y2: 17*8+1),
  ( x1: 23*8+1; y1: 17*8+2; x2: 31*8-1; y2: 23*8+1),
  ( x1: 23*8+1; y1: 23*8+2; x2: 31*8-1; y2: 24*8+1),
  ( x1: 31*8+1; y1: 16*8+2; x2: 39*8  ; y2: 24*8+1)  );




procedure Beep; begin write(#7); end;

procedure RUNB; begin repeat until not ButtonPressed; end;

procedure InstallMouse;
 begin
  InitMouse;
  if ErrorNumber>0 then begin
   SetMode( 3); Beep; ReadKey; Halt
   end
  end;

procedure FillMap;
 var
  i: word;
 begin
  for i:=0 to 65520 do Map^[i]:=DefBox;
 end;


procedure FillColor;
 var
  i,j: word;
 begin
  FillMap;
  for i:=0 to 255 do
   for j:=0 to 63 do Box^[i,j]:=CDefa;
  end;



procedure GetMemo;
 begin
   if MaxAvail < 148224 then begin
   SetMode( 3);
   WriteLn('Not enough memory error.');
{  WriteLn('This program need at least 145K base memory.');}
   Beep;
   ReadKey;
   Halt
   end;
  New( Map); MapPtr:= Map;
  New( Box); BoxPtr:= Box;
  New( Puffer);
  New( MesPuf);
  New( Pal);
{ i:= maxavail;}
  New( PasPuf);
  New( OldMap);
  {New( Mask);}
  MaskW:= @Mask;
  FillColor;
  end;


procedure FreeMemo; begin
  DisPose( Pal); DisPose( Box); DisPose( Map); end;


procedure OutTxt( X, Y: word; F, B: byte; s: string); begin
 PointColor:= f;
 TextBackColor:= b;
 OutText( X, Y, S );
 end;


function  WhereMouse: byte;

 var
  x,y,i: word;
 begin
  x:= MouseX; y:= MouseY;
  i:= 0;
  repeat
   inc( i);
   until (i=AMax+1) or (
    (( x>=Coords[i].x1 ) and ( x<=Coords[i].x2 )) and
    (( y>=Coords[i].y1 ) and ( y<=Coords[i].y2 )));
  if i=AMax+1 then WhereMouse:=0 else WhereMouse:=i;
  end;


function  Message( s: string): boolean;
 var
  ln, x1, x2: word;
  c: char;
 begin
  PointColor:= CMesB;
  ln:= Length( s)*8;
  x1:= (319-(ln+16)) div 2;
  x2:= x1+ln+16;
  SaveBar( MesPuf, x1, 88, x2, 111);
  Bar    ( x1, 88, x2, 111);
  PointColor:= CMesF;
  Rectangle( x1+4, 92, x2-3, 108);
  TextBackColor:= CMesB;
  OutText( x1+8, 96, s);
  while KeyPressed do ReadKey;
  Runb;
  ShowMouse;
  repeat until ButtonPressed or KeyPressed;
  if KeyPressed then begin
   c:=ReadKey;
   Message:= c in ['Y','y',#13];
   end
   else Message:= false;
{  end else
  if LeftButton then Message:=true else Message:= false;
} HideMouse;
  LoadBar( MesPuf, x1, 88, x2, 111);
  Runb;
  end;




procedure FreshT.Menus; begin
 Menu.Refresh(false);
 PointColor:=MBColor; Bar(22*8,0,22*8+1,7); end;


procedure FreshT.RBox;

 var
  x,y: byte;
 const
  i: byte=0;
 begin
  if Box=nil then exit;
  PointColor:= CRect;
  Rectangle(23*8,0,39*8+1,16*8+1);
  for y:=0 to 15 do for x:=0 to 15 do begin
   DrawBox( ptr($a000,0), i, x*8+23*8+1, y*8+1);
   inc(i);
   end;
  end;


procedure FreshT.Palette;

 var
  x,y: byte;
 begin
  TextBackColor:=Pal1stLine*8;
  for y:=0 to 5 do
   for x:=0 to 7 do begin
    OutText(x*8+23*8+1,y*8+17*8+2,' ');
    inc(TextBackColor);
    end;
  PointColor:= CFsrl;
  TextBackColor:= CBSrl;
  OutText(23*8+1,16*8+2,#24+'  UP  '+#24);
  OutText(23*8+1,23*8+2,#25+' DOWN '+#25);
  PointColor:= CRect;
  Rectangle(23*8,16*8+1,31*8,24*8+2);
  end;


procedure FreshT.Editor;

 var
  x,y,i: byte;
 begin
  i:=0;
  PointColor:= CRect;
  Rectangle(31*8,16*8+1,39*8+1,24*8+2);
  for y:= 0 to 7 do for x:= 0 to 7 do begin
   TextBackColor:= Box^[CurrBox,i];
   OutText(x*8+31*8+1,y*8+16*8+2,' ');
   inc(i);
   end;
  end;


procedure FreshT.RMap;
 var
  x,y: byte;
  i,j,k: word;
 begin
{ if not MapDef then begin
   PointColor:=CBack;
   Bar(0,15,22*8+1,23*8+1);
   Exit
   end;
} PointColor:= CRect;
  i:= MapHeight-1;
  if MapHeight>=21 then begin Rectangle(0,15,22*8+1,23*8); i:=20; end else
   Rectangle(0,15,22*8+1,16+MapHeight*8);
  j:=OfsY*BPL+OfsX;
  k:=j;
  for y:= 0 to i do begin
   for x:= 0 to 21 do begin
    DrawBox( ptr($a000,0), Map^[j], x*8+1, y*8+16);
    inc( j);
    end;
   inc( k,BPL);
   j:= k;
   end;
  end;


procedure Fresht.Color;
 var
  CColor: byte;
 begin
 if WhereMouse in [APal,AEdit] then CColor:= GetPixel(MouseX,MouseY)
  else CColor:=CurrColor;
 PointColor:=CRect;
 Rectangle(0,23*8,22*8+1,24*8+2);
 OutTxt(11*8+1,23*8+2,CText,CBack,'Color:');
 OutText(19*8+1,23*8+2,'   ');
 OutText(19*8+1,23*8+2,_str(CColor));
 TextBackColor:=CColor;
 OutText(17*8+1,23*8+2,' ');
 end;


procedure FreshT.BoxNr;
 var CBox: byte;
 begin
 case WhereMouse of
  AMap : CBox:= Map^[BPL*(OfsY+(MouseY-16) div 8  )+OfsX+(MouseX-1) div 8];
  ABox : with Coords[ABox] do CBox:=((MouseY-y1) div 8)*16+(MouseX-x1) div 8;
  else   CBox:= CurrBox;
  end;
 PointColor:=CRect;
 Rectangle(0,23*8,22*8+1,24*8+2);
 OutTxt(11*8+1,23*8+2,CText,CBack,'  Box:');
 OutText(19*8+1,23*8+2,'   ');
 OutText(19*8+1,23*8+2,_str(CBox));
 DrawBox( ptr($a000,0), CBox, 17*8+1, 23*8+2);
 end;


procedure FreshT.XY; begin
 TextBackColor:= CBack;
 PointColor:=    CText;
 OutText(2,23*8+2,'        ');
 if WhereMouse = AMap then
  OutText(2,23*8+2,_str(OfsX+(MouseX-1) div 8)+':'+
                   _str(OfsY+(MouseY-16) div 8))
 else
  OutText(2,23*8+2,_str(OfsX)+':'+_str(OfsY))
 end;


{procedure CRDatas; external;}


procedure FreshT.CopyRight;
 var i,j: word;
 begin
  with CopRig do begin
  if not CRDef then begin
   Load('MECR.DAT');
   CRDef:= true;
{  i:=seg(CRDatas);
   j:=ofs(CRDatas);
   lx:=memw[i:j];
   ly:=memw[i:j+2];
   pn:=0;
   p:=0;
   W:=LX+1;
   H:=LY+1;
   PL:= W*H;
   LN:= PL;
   DT:= ptr(i,j+6);
}  end;
  PointColor:=CBack; Bar(0,24*8+3,319,199);
  for i:= 0 to LY  do
   for j:= 0 to LX  do
    if Mem[Seg(Dt^):Ofs(Dt^)+(LX+1)*i+j]<>0 then
       Mem[     $a000:320*(199-ly+i)+(319-w) div 2+j]:= CText;
  end; end;


procedure FreshT.Screen; begin
 PointColor:= CBack;
 Bar(0,0,319,199);
 RBox; Palette; Editor; RMap; Color; BoxNr; CopyRight; XY; Menus; end;


procedure FreshT.Mask;
 var
  i,j: byte;
  bit: word;
 begin
  bit:= 32768;
  PointColor:= CText; TextBackColor:= CBack;
  OutText( 0,0,'Right button: mark');
  OutText( 0,10,'Left  button: unmark');
  OutText( 0,20,'ESC         : done');
  PointColor:= CCurs;
  for i:= 0 to 15 do
   for j:= 0 to 15 do with Coords[ABox] do
    if MaskW^[i] and (bit shr j)>0 then
     Rectangle( x1+j*8, y1+i*8, x1+j*8+7, y1+i*8+7)
    else DrawBox( ptr($a000,0), i*16+j, x1+j*8, y1+i*8);
  end;



procedure SetMapCoords; begin with Coords[AMap] do
 if MapHeight<21 then y2:=y1+MapHeight*8-1 else y2:= y1+21*8-1;
 end;


procedure SetMenus; begin
 MainMenu('File Edit Options Help');
 SubMenu(1,'New;Open;Save;Save as;Save pal;Load pal;Exit');
 SubMenu(2,'Delete;Cut;Copy;Paste;Clear map;Go to;Mask');
 SubMenu(3,'Tab size;Map size;Full screen;'+
            'Default Pal' );
 SubMenu(4,'Hot keys;About');
 Refresh.Menus;
 end;


procedure SetColor( Col: byte);

  var
    R, G, B, i: byte;
    C: char;
  begin
    runb;
    PointColor:=CBack;
    Bar(0,0,319,199);
    PointColor:=Col;
    i:= Col;
    Bar(0,14*8,19*8,18*8-1);
    PointColor:=CText;
    TextBackColor:= CBack;
    OutText(0,0*8,'Q: Red  ->Red+1');
    OutText(0,1*8,'A: Red  ->Red-1');
    OutText(0,2*8,'W: Green->Green+1');
    OutText(0,3*8,'S: Green->Green-1');
    OutText(0,4*8,'E: Blue ->Blue+1');
    OutText(0,5*8,'D: Blue ->Blue-1');
    OutText(0,7*8,'Enter or');
    OutText(0,8*8,'right button:  done');
    Refresh.Palette;
    EnableArea( coords[APalU].X1, coords[APalU].Y1,
                coords[APalD].X2, coords[APalD].Y2);
    repeat
      PointColor:=CText;
      asm
        mov bl,COL; mov ah,10h; mov al,15h; int 10h
        mov R,dh; mov G,ch; mov B,cl
       end;
      TextBackColor:= CBack;
      OutText(0,10*8,'Red:   '+_str(R)+' ');
      OutText(0,11*8,'Green: '+_str(G)+' ');
      OutText(0,12*8,'Blue:  '+_str(B)+' ');
      ShowMouse;
      repeat until KeyPressed or ButtonPressed;
      RetRace;
      HideMouse;
      if LeftButton then begin
        case WhereMouse of
         APal: i:= GetPixel( MouseX, MouseY);
         APalU: begin if Pal1stLine>0  then dec( Pal1stLine); Refresh.Palette;
                Delay( 500); end;
         APalD: begin if Pal1stLine<26 then inc( Pal1stLine); Refresh.Palette;
                Delay( 500); end;
         end;
        asm
          mov bl,i; mov ah,10h; mov al,15h; int 10h
          mov R,dh; mov G,ch; mov B,cl
         end;
       end;
      if KeyPressed then begin
        c:= ReadKey; case c of
          'q': if R<63 then inc( R);
          'a': if R>00 then dec( R);
          'w': if G<63 then inc( G);
          's': if G>00 then dec( G);
          'e': if B<63 then inc( B);
          'd': if B>00 then dec( B);
         end;
       end;
      Port[$3c8]:= Col;
      Port[$3c9]:= R;
      Port[$3c9]:= G;
      Port[$3c9]:= B;
      if (not RightButton) and (WhereMouse=APal)
       then repeat until (not ButtonPressed) or MouseMoved;
      until (c=#13) or RightButton;
    EnableArea(0,0,319,199);
    Refresh.Screen;
    ShowMouse;
    runb;
    end;



procedure FileExit; begin
  if Message('Exit Map-Editor?') then Quit:= true; end;


{$I-}
function _Reset( var f:file): Boolean;
  begin
  Reset( f, 1); if IOResult<>0 then begin
    Beep; Message('File not found error.');
    _Reset:=false;
    end
    else _Reset:= true;
  end;

function _ReWrite( var f:file): Boolean;
  begin
  ReSet( f, 1); if IOResult=0 then begin
    if not Message('File already exists. Overwrite?') then begin
     Close( f); _ReWrite:= false; exit; end; end;
  ReWrite( f, 1);
  _ReWrite:= true; end;

function _BlockRead( var f:file; var Buffer; w: word): Boolean;
  begin
  BlockRead( f, buffer, w);
  if IOResult<>0 then begin Beep; Message('File read error'); Close( f);
    _BlockRead:= false; end
  else _BlockRead:= True;
  end;

function _BlockWrite( var f:file; var Buffer; w: word): Boolean;
  begin
  BlockWrite( f, buffer, w);
  If IOResult<>0 then begin Beep; Message('File write error'); Close( f);
    _BlockWrite:= false; end
  else _BlockWrite:= True;
  end;

function _Seek( var f:file; w: word): Boolean;
  begin
  Seek( f, w);
  If IOResult<>0 then begin Beep; Message('File error'); Close( f);
    _Seek:= false; end
  else _Seek:= True;
  end;
{$I+}




function SaveMap( var FileName: string): boolean;
 var
  f: file;
  len: word;
  bol: boolean;
 const
  Marci: byte = 1;
 begin
  Assign( f, FileName);
  len:= BPL*MapHeight;
  BOL    :=_ReWrite( f) and
           _BlockWrite( f, Marci, 1) and
           _BlockWrite( f, BPL, 2) and
           _BlockWrite( f, len, 2) and
           _BlockWrite( f, Box^, 256*64) and
           _BlockWrite( f, Map^, len);
           _BlockWrite( f, Mask, 32);
  if BOL then Close( f);
  SaveMap:= BOL;
  end;


procedure SavePal; assembler;
 asm mov ax,1017h; mov bx,0; mov cx,100h; les dx,Pal; int 10h; end;


procedure LoadPal; assembler;
  asm mov ax,1012h; mov bx,0; mov cx,100h; les dx,Pal; int 10h; end;



procedure FileSaveAs;
 var
  i: byte; s: string;
  D: DirStr;
  N: NameStr;
  E: ExtStr;

 begin
  SavePal;
  SetMode( 3);
  TextBackGround( CBack); TextColor( CText); ClrScr;
  Writeln( 'File save. The name of the file ? (Enter for cancel)');
  for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
  Writeln; Writeln('( The default extersion is *.MAP )');
  GotoXY(1,2);
  TextColor( Yellow); TextBackground( Blue);
  Readln(s);
  FSplit( S, D, N, E);
  if s<>'' then if e='' then s:= s+'.map';
  SetMode( $13); LoadPal; Refresh.Screen;
  if s<>'' then if SaveMap( s) then begin
   MapFile:= s;
   TextBackGround( CBack); TextColor( CText); ClrScr;
   Message('Don''t forget to save palette !');
   end;
  SetMode( $13); LoadPal; Refresh.Screen;
  end;


function FileList( const HL: string): string;
 var
  rec: SearchRec;
  i: integer;
  First: word;
  CurrFile: string[12];
  c: char;
  D: DirStr;
  N: NameStr;
  E: ExtStr;
  Count: word;
  s: string;
 begin
  Window(1,1,40,25);
  TextBackGround( 0);
  ClrScr;
  TextColor( LightGray);
  WriteLn;
  WriteLn('ENTER:'); WriteLn(' select'); WriteLn('ESC:');
  WriteLn(' cancel');
  WriteLn; WriteLn('A-Z:'); WriteLN(' change'); WriteLn(' drive'); WriteLn;
  WriteLn('SPACE:'); WriteLn(' type the'); WriteLn(' file name'); WriteLn;
  WriteLn(#24+','+#25+':'); WriteLn(' scroll'); WriteLn;
  WriteLn('HOME:'); WriteLn(' top'); WriteLn('END:');
  WriteLn(' bottom'); WriteLn; WriteLn('PAGE UP'); WriteLn('PAGE DOWN');
  TextColor( white);
{  Write(#24); GotoXY(1,3); Write(#25); EnableArea(0,0,7,23); ShowMouse;
   GotoMouse(0,8);}
  GotoXY(12,2);
  Write('->            <-');
  TextBackGround( Blue);
  TextColor( LightGray);
  Asm
   mov  ah,1
   mov  ch,1
   mov  cl,0
   and  cx,$1f1f
   int  $10
  End;
  FindFirst('*.*',AnyFile,Rec);
  count:=0;
  while DosError=0 do begin
   inc(count);
   FindNext( Rec);
   end;
  FindFirst('*.*',AnyFile,Rec);
  CurrFile:= rec.name;
  i:= 0;
  First:= 1;
  REPEAT
  Window(14,2,25,24);
  retrace;
  ClrScr;
  Window(14,2,26,25);
  i:= 0;
   while (DosError = 0) and (i<23) do begin
    inc( i);
    FSplit( rec.name, d, n, e);
    if length( rec.name)<=2 then WriteLn( rec.name) else begin
     if e='.'+HL then TextColor( Yellow);
     Write( n);
     GotoXY( WhereX+9-length(n), WhereY);
     WriteLn( copy( e, 2, 3));
     TextColor( LightGray);
     end;
    FindNext( rec);
    end;
   repeat until KeyPressed{or ButtonPressed or
                not (MouseY in [8..15])};
  {if KeyPressed then}c:= ReadKey{else c:=' '};
   if c=#0 then case ReadKey of
    #80: if First<count then inc( First);
    #72: if First>1 then dec( First);
    #73: if First>22 then dec( First,22) else First:=1;
    #81: if First<count-22 then inc( First,22) else First:=count;
    #71: First:=1;
    #79: First:=count;
    end
    else if c in ['a'..'z','A'..'Z'] then begin
     {$I-} ChDir( c+':'); if IOResult<>0 then Beep else begin
       FindFirst('*.*',AnyFile,Rec);
       count:=0;
       while DosError=0 do begin
       inc(count);
       FindNext( Rec);
       end;
       FindFirst('*.*',AnyFile,Rec);
       CurrFile:= rec.name;
       First:= 1;
       end;
     end;
{  if MouseY<8  then if First>1     then begin dec( First); delay( 500); end;
   if MouseY>15 then if First<count then begin inc( First); delay( 500); end;
}  FindFirst('*.*',AnyFile,Rec);
   if First>1 then begin
    if DosError = 0 then FindNext( rec);
    i:= 0;
    while (DosError = 0) and (i<First-2) do begin
     inc( i);
     FindNext( rec);
     end;
    end;
    CurrFile:= rec.name;
   UNTIL c in [#13,#27,' '] { or ButtonPressed};
  if c=#13 then FileList:=CurrFile else FileList:='';
  Window( 1,1,80,25);
  if c=' ' then begin
   SetMode(3); TextBackGround( Black);
   Writeln( 'The name of the file ?');
   for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
   TextColor( Yellow); TextBackground( Blue);
   Readln(s);
   TextColor( 7); TextBackground( 0);
   FileList:=s;
   end;
  end;


procedure LoadMap( s: string);
 var f: file;
     ver: byte;
     a: word;
 begin
  assign( f, s);
  if ( s<>'') and ( _Reset( f) and
           _BlockRead( f, ver, 1) and
           _BlockRead( f, BPL, 2) and
           _BlockRead( f, a, 2) and
           _BlockRead( f, Box^, 256*64) and
           _BlockRead( f, Map^, a) )
  then begin MapFile:=s;
             MapHeight:= a div BPL;
             OfsX:=0; OfsY:=0;
             if ver=1 then _BlockRead( f, Mask, 32) else
              for i:= 0 to 15 do MaskW^[i]:=0;
             end;{ else MapFile:='';}
  SetMapCoords;
  end;



procedure FileOpen;
 var
  s: string[12];
  a: word;
  ver: byte;
  f: file;
  ok: boolean;
 begin
  SavePal;
  SetMode( 1);
  ok:= false;
  repeat
   s:= FileList( 'MAP');{ 'auto.map';}
   assign( f,s);
   GetFAttr( f, a);
   if a=Directory then ChDir( s) else ok:= true;
   until ok or (s='');
  SetMode($13);
  LoadPal;
  Refresh.Screen;
  if ( s<>'') and ( _Reset( f) and
           _BlockRead( f, ver, 1) and
           _BlockRead( f, BPL, 2) and
           _BlockRead( f, a, 2) and
           _BlockRead( f, Box^, 256*64) and
           _BlockRead( f, Map^, a) )
  then begin MapFile:=s;
             MapHeight:= a div BPL;
             OfsX:=0; OfsY:=0;
             if ver=1 then _BlockRead( f, Mask, 32) else
              for i:= 0 to 15 do MaskW^[i]:=0;
             end;{ else MapFile:='';}
  HideMouse;
  SetMapCoords;
  Refresh.Screen;
  ShowMouse;
  end;


procedure FileSavePal;
  var
   f: file;
   s: string;
   i: byte;
   D: DirStr;
   N: NameStr;
   E: ExtStr;
  begin
  SavePal;
  SetMode( 3);
  TextBackGround( CBack); TextColor( CText); ClrScr;
  Writeln( 'Palette save. The name of the file ? (Enter for cancel)');
  WriteLn; WriteLn('( The default extersion is *.PAL )');
  GotoXY(1,2);
  for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
  TextColor( Yellow); TextBackground( Blue);
  Readln(s);
  FSplit( S, D, N, E);
  if s<>'' then if e='' then s:= s+'.pal';
  SetMode($13); LoadPal; Refresh.Screen;
  if s='' then exit;
   Assign( f, s);
   if _ReWrite( f) and _BlockWrite( f, Pal^, 3*256) then
   Close( f);
  end;


procedure FileLoadPal;
 var
  s: string[12];
  a: word;
  f: file;
  ok: boolean;
 begin
  SavePal;
  SetMode( 1);
  ok:= false;
  repeat
   s:= FileList( 'PAL');{ 'auto.map';}
   assign( f,s);
   GetFAttr( f, a);
   if a=Directory then ChDir( s) else ok:= true;
   until ok or (s='');
  SetMode($13);
  LoadPal;
  Refresh.Screen;
  if s='' then begin LoadPal; Refresh.Screen; Exit; end;
  Assign( f, s);
  if _Reset( f) and _BlockRead( f, Pal^, 3*256) then Close( f);
  LoadPal;
  Refresh.Screen;
  end;


procedure DelBar;
 var
  i,j: word;
 begin
  for i:= sy1+OfsY to sy2+OfsY do
   for j:= sx1+OfsX to sx2+OfsX do
    Mem[ seg( Map^): ofs( Map^)+(i-2)*BPL+j]:= DefBox;
  end;


procedure CopyBar;
 var
  i,j: word;
  count: word;
 begin
  sw:= sx2-sx1;
  sh:= sy2-sy1;
  count:= 0;
  for i:= sy1+OfsY to sy2+OfsY do
   for j:= sx1+OfsX to sx2+OfsX do begin
    Mem[ seg( PasPuf^): ofs( PasPuf^)+count]:=
    Mem[ seg( Map^): ofs( Map^)+(i-2)*BPL+j];
    inc( count);
    end;
   BarDef:= true;
  end;


procedure CutBar; begin CopyBar; DelBar; end;


procedure PasteBar;
 var
  i,j: word;
  x,y: word;
  count: word;
  QuitThere: boolean;
 begin
  if (not BarDef) or (sh>MapHeight) then begin Beep; exit; end;
  repeat until not ButtonPressed;
  HideMouse;
  with Coords[AMap] do begin
   EnableArea(x1,y1+8,x2-sw*8-7,y2-sh*8);
   if MouseX>x2-sw*8-7 then GotoMouse(x2-sw*8-7,MouseY);
   if MouseY>y2-sh*8-7 then GotoMouse(MouseX,y2-sh*8-7);
   end;
  QuitThere:= false;
  repeat
   x:= (MouseX-1) div 8;
   y:= (MouseY-1) div 8;
   with Refresh do begin
    RMap; XY; BoxNr; end;
   count:= 0;
   for i:= y to y+sh do
    for j:= x to x+sw do begin
     DrawBox( ptr($a000,0), Mem[ seg( PasPuf^):ofs( PasPuf^)+count], j*8+1, i*8);
     inc( count);
     end;
   PointColor:= CSBox;
   Rectangle( x*8+1, y*8, x*8+sw*8+8, y*8+sh*8+7);
   Retrace;
   repeat until MouseMoved or KeyPressed or ButtonPressed;
   if KeyPressed then begin
    QuitThere:= true;
    case ReadKey of
     #27: begin Refresh.RMap;
          EnableArea(0,0,319,199);
          ShowMouse; exit; end;
     #00: begin
       QuitThere:= false;
        case ReadKey of
        #72: if OfsY>Tab then dec( OfsY, Tab) else OfsY:=0;
        #75: if OfsX>Tab then dec( OfsX, Tab) else OfsX:=0;
        #77: if OfsX<BPL-22 then inc( OfsX, Tab) else
                OfsX:=BPL-22;
        #80: if MapHeight>20 then
             if OfsY<MapHeight-21 then inc( OfsY, Tab) else
                OfsY:=MapHeight-21;
        #115: if OfsX>10 then dec( OfsX, 10) else OfsX:=0;
        #116: if OfsX<BPL-22 then inc( OfsX, 10) else
              OfsX:=BPL-22;
        #$49: if OfsY>10 then dec( OfsY, 10) else OfsY:=0;
        #$51:begin
             if MapHeight>20 then
             if OfsY<MapHeight-31 then inc( OfsY, 10) else
                OfsY:=MapHeight-21;
             if OfsY>MapHeight-21 then OfsY:=MapHeight-21;
             end;
        end;
       end;
     end;
    end;
   until ButtonPressed or QuitThere;
  count:= 0;
  for i:= y+OfsY-2 to y+sh+OfsY-2 do
   for j:= x+OfsX to x+sw+OfsX do begin
    Mem[ seg( Map^):ofs( Map^)+i*BPL+j]:=
    Mem[ seg( PasPuf^):ofs( PasPuf^)+count];
    inc( count);
    end;
  Refresh.RMap;
  EnableArea(0,0,319,199);
  ShowMouse;
  Runb;
  end;



procedure SelectBox;
 var
  QuitFromHere: boolean;
 begin
  PointColor:= CSBox;
  sx1:= (MouseX-1) div 8;
  sy1:= MouseY div 8;
  with Coords[AMap] do EnableArea(x1,y1,x2,y2);
  if MiniRec then begin
   LoadBar( Puffer,rx,ry,rx+7,ry+7);
   MiniRec:= false;
   end;
  sx2:= (MouseX-1) div 8;
  sy2:= MouseY div 8;
  Refresh.RMap;
  PointColor:= CSBox;
  Rectangle(sx1*8+1,sy1*8,sx2*8+8,sy2*8+7);
  repeat
   ShowMouse;
   repeat until MouseMoved or not RightButton;
   HideMouse;
   with Refresh do begin
    RMap; BoxNr; XY; end;
   sx2:= (MouseX-1) div 8;
   sy2:= MouseY div 8;
   if sx1>sx2 then sx1:=sx2;
   if sy1>sy2 then sy1:=sy2;
   PointColor:= CSBox;
   Rectangle(sx1*8+1,sy1*8,sx2*8+8,sy2*8+7);
   until not RightButton;
  Selected:= true;
  EnableArea(0,0,319,199);
  REPEAT
   repeat
    ShowMouse;
    repeat until KeyPressed or MouseMoved or ButtonPressed;
    HideMouse;
    with Refresh do begin
     XY; BoxNr; end;
    until KeyPressed or ButtonPressed;
    MainRes:=0; MenuRes:=0;
    if LeftButton then begin
     QuitFromHere:= true;
     if (MouseX>sx1*8) and (MouseX<sx2*8+9) and
        (MouseY>sy1*8-1) and (MouseY<sy2*8+9)
     then begin
        {with coords[amap] do GotoMouse(x1,y1);}
        CopyBar; Refresh.RMap; PasteBar; end
     else begin
      ShowMouse;
      GetMenu;
      end;
     end;
    if MainRes=2 then begin
     ShowMouse; HideMouse; Refresh.Rmap; ShowMouse;
     case MenuRes of
      1: DelBar;
      2: CutBar;
      3: CopyBar;
      end;
     end;
    if KeyPressed then begin
     QuitFromHere:= true;
     case UpCase( ReadKey) of
      #00: case ReadKey of
           #$52: CopyBar;
           #$53: DelBar;
           end;
      #27: ;
      else QuitFromHere:= false;
      end;
     end;
   UNTIL RightButton or QuitFromHere;
   HideMouse;
   Refresh.RMap;
   ShowMouse;
{  repeat until not LeftButton;}
  end;


procedure FileSave; begin
  if MapFile='' then FileSaveAs else begin
  Assign( f, MapFile);
  Erase( f);
  SaveMap( MapFile);
  end; end;


procedure TabSize;
 var T: string;
     TT: byte;
 begin
  T:='0';
   SavePal; SetMode(3);
  repeat
   TextBackGround( CBack); TextColor( CText); ClrScr;
   WriteLn('The current tab size is: ',Tab);
   Write('Enter the new size! ');
   ReadLn( T);
   TT:= _val( T);
   if not (TT in [1..23]) then begin WriteLn('Tab must be in [1..23]');
    WriteLn('Press a key'); Beep; ReadKey; end;
   until TT in [1..23];
  Tab:=TT;
  SetMode($13); LoadPal; Refresh.Screen;
  end;


procedure MapSize;
 var wi, he, mhe, i,j,y: word;
     s: string;
 begin
  SavePal;
  SetMode( 3);
  TextBackGround( CBack); TextColor( CText); ClrScr;
  WriteLn('Current size is (',BPL,':',MapHeight,').');
  WriteLn('The new sizes? (Enter for cancel)');
  Write('Width? [22..65534] ');
  ReadLn( s);
  wi:= _val(s);
  if (wi<22) or
     (wi>65534) then begin SetMode($13); LoadPal; Refresh.Screen; Exit end;
  mhe:= 65534 div wi;
  Write('Height? (max. ',mhe,') ');
  ReadLn( s);
  he:= _val(s);
  if (he=0) or
     (he>mhe) then begin SetMode($13); LoadPal; Refresh.Screen; Exit end;
  Move( Map^, OldMap^, 65534);
  FillMap;
  if BPL>wi then i:= wi else i:= BPL;
  if MapHeight> he then j:= he else j:= MapHeight;
  y:=0;
  repeat
   Move( OldMap^[y*BPL],Map^[y*wi],i);
   inc( y);
   until y>j;
  BPL:= wi;
  MapHeight:=  he;
  OfsX:= 0; OfsY:= 0;
  SetMode($13);
  LoadPal;
  SetMapCoords;
  Refresh.Screen;
  end;


procedure EditGoto;
 var s:string;
 begin
  SavePal;
  SetMode(3);
  TextBackGround( CBack); TextColor( CText); ClrScr;
  WriteLn('Current position is (',OfsX,';',OfsY,').');
  WriteLn('Where do you want to go to?');
  Write('X: ');
  ReadLn( s);
  OfsX:= _val( s);
  if OfsX>BPL-22 then OfsX:=BPL-22;
  Write('Y: ');
  ReadLn( s);
  OfsY:= _val( s);
  if OfsY>MapHeight-21 then OfsY:=MapHeight-21;
  if MapHeight<21 then OfsY:=0;
  SetMode($13);
  LoadPal;
  Refresh.Screen;
  end;


procedure EditMask;
 var
  i,j: word;
 begin
  runb;
  PointColor:=CBack;
  Bar(0,0,319,199);
  Refresh.RBox;
  with coords[ABox] do EnableArea( x1,y1,x2,y2);
  ShowMouse;
  repeat
   repeat until MouseMoved or KeyPressed or ButtonPressed;
   RetRace;
   HideMouse;
   Refresh.Mask;
   ShowMouse;
   if ButtonPressed then with Coords[Abox] do begin
    i:= ( MouseX-x1) shr 3;
    j:= ( MouseY-y1) shr 3;
    if  LeftButton then
    MaskW^[j]:= MaskW^[j] or (32768 shr i);
    if RightButton then MaskW^[j]:= MaskW^[j] and ( 65535-(32768 shr i));
    end;
   until KeyPressed;
  HideMouse;
  Refresh.Screen;
  ShowMouse;
  EnableArea( 0,0,319,199);
  if KeyPressed then ReadKey;
  end;


procedure DefColors; begin
 CBack:= 0;
 CText:= 15;
 CRect:= 15;
 CBSrl:= 15;
 CFSrl:= 0;
 CCurs:= 15;
 CDefa:= 0;
 CMesB:= 15;
 CMesF:= 0;
 CSBox:= 15;
 MFColor:= 0;
 MBColor:= 15;
 SFColor:= 15;
 SBColor:= 0;
 Refresh.Screen;
 end;

procedure FullScreen;
 var x,y, xe,ye: word;
 begin
  PointColor:= CBack;
  Bar(0,0,319,199);
  xe:= OfsX+39;
  ye:= OfsY+24;
  if xe>BPL-1 then xe:= BPL-1;
  if ye>MapHeight-1  then ye:= MapHeight-1;
  RetRace;
  for x:= OfsX to xe do
   for y:= OfsY to ye do
    DrawBOX( ptr($a000,0), MAP^[y*BPL+x], (x-ofsx)*8, (y-ofsy)*8);
  repeat until keypressed or buttonpressed;
  Refresh.Screen;
  if KeypRessed then ReadKey;
  end;


procedure LoadSetup;
 var t: text;
     d: SearchRec;
 begin
  FindFirst( 'mapedit.col', AnyFile, d);
  if DosError<>0 then exit;
  assign( t, 'mapedit.col');
  reset( t);
  readln( t, CText);
  readln( t, CRect );
  readln( t, CFSrl );
  readln( t, CBSrl);
  readln( t, MFColor      );
  readln( t, MBColor  );
  readln( t, SFColor      );
  readln( t, SBColor  );
  readln( t, CMesB        );
  readln( t, CMesF        );
  readln( t, CCurs);
  close( T);
  end;



begin
 SetMode($13);
 GetMemo;
 MapHeight:=25;
 BPL:=40;
 LoadSetup;
 Case ParamCount of
  1: loadmap(paramstr(1));
  2: begin game.loadpal(paramstr(2)); loadmap(paramstr(1)); end;
  end;

{CText:=14;
 CRect:=13;
 CFSrl:=10;
 CBSrl:=2;
 MFColor:=11;
 MBColor:=4;
 SFColor:=11;
 SBColor:=9;
 CMesB:= 2;
 CMesF:=10;
 CCurs:=LightRed;
}
 Refresh.Screen;
 SetMenus;
 SetMapCoords;
 ShowMouse;
 for i:= 0 to 15 do MaskW^[i]:=0;
{Tab:=10;
{MapFile:= 'marci.map';}
{FileOpen; FileLoadPal;

     showmouse;        }
 REPEAT
  repeat until MouseMoved or KeyPressed or ButtonPressed or Scrolled;
  Scrolled:= false;
  RetRace;
  HideMouse;
  with Refresh do begin
   if (MouseX>=Coords[APalU].x1) and
      (MouseY>=Coords[APalU].y1) then Color else BoxNr;
   XY;
   end;
  if MiniRec then begin
   LoadBar( Puffer,rx,ry,rx+7,ry+7);
   MiniRec:= false;
   end;
  case WhereMouse of
   AMap: begin
         rx:=((MouseX-1 ) div 8)*8+1;
         ry:=((MouseY-16) div 8)*8+16;
         PointColor:=CCurs;
         SaveBar( Puffer,rx,ry,rx+7,ry+7);
         Rectangle(rx,ry,rx+7,ry+7);
         if LeftButton then Retrace;
         MiniRec:= true;
         end;
   ABox: begin
         rx:=((MouseX-23*8-1) div 8)*8+23*8+1;
         ry:=((MouseY-1) div 8)*8+1;
         PointColor:=CCurs;
         SaveBar( Puffer,rx,ry,rx+7,ry+7);
         Rectangle(rx,ry,rx+7,ry+7);
         MiniRec:= true;
         end;
   else  MiniRec:= false;
   end;

  if ButtonPressed then with Refresh do case WhereMouse of
   AMenu: begin ShowMouse; GetMenu;
          if (MenuRes=0) and (WhereMouse<>AMenu) then runb;
          HideMouse;
          case MainRes of
           1: case MenuRes of
              1: if Message('Edit a new map?') then
                  begin
                   FillColor; Screen;
                   MapFile:= '';
                   for i:= 0 to 15 do MaskW^[i]:=0;
                   end;
              2: FileOpen;
              3: FileSave;
              4: FileSaveAs;
              5: FileSavePal;
              6: FileLoadPal;
              7: FileExit;
              end;
           2: case MenuRes of
              4: PasteBar;
              5: if Message('Clear this map?') then begin
                 FillMap; RMap; end;
              6: EditGoto;
              7: EditMask;
              end;
           3: case MenuRes of
              1: TabSize;
              2: MapSize;
              3: FullScreen;
             {4: DefColors;}
              4: if Message('Reset the default palette?') then
                 begin SetMode(3); SetMode($13); Screen; end;
              end;
           end;
          end;
   AMap:  if LeftButton then begin
           Map^[BPL*(OfsY+(MouseY-16) div 8)+OfsX+(MouseX-1) div 8]:=
           CurrBox;
           LoadBar( Puffer,rx,ry,rx+7,ry+7);
           MiniRec:= false;
           DrawBox( ptr($a000,0), CurrBox,((MouseX-1) div 8)*8+1,
                    ((MouseY-16) div 8)*8+16);
           end
          else SelectBox;
   ABox:  if LeftButton then begin
           CurrBox:=((MouseY-1) div 8)*16+(MouseX-23*8-1) div 8;
           Editor;
           end
          else begin
           j:=((MouseY-1) div 8)*16+(MouseX-23*8-1) div 8;
           LoadBar( Puffer,rx,ry,rx+7,ry+7);
           for i:=0 to 63 do Box^[CurrBox,i]:=Box^[j,i];
           RBox; RMap; Editor;
           SaveBar( Puffer,rx,ry,rx+7,ry+7);
           PointColor:= CCurs;
           Rectangle(rx,ry,rx+7,ry+7);
           ShowMouse; RetRace; HideMouse;
           end;
   APalU: if Pal1stLine>0  then begin dec(Pal1stLine); Refresh.Palette;
          Delay(500); end;
   APalD: if Pal1stLine<26 then begin inc(Pal1stLine); Refresh.Palette;
          Delay(500); end;
   APal:  begin CurrColor:= GetPixel( MouseX, MouseY);
          if RightButton then SetColor( GetPixel( MouseX, MouseY));
          end;
   AEdit: with Coords[AEdit] do begin
          TextBackColor:= CurrColor;
          OutText( ((MouseX-x1) div 8)*8+x1,
                   ((MouseY-y1) div 8)*8+y1,' ');
          Box^[CurrBox,(MouseX-x1) div 8+ 8*((MouseY-y1) div 8)]:=
          CurrColor;
          ShowMouse; RetRace; HideMouse;
          RMap; RBox;
          end;
   end;

 if KeyPressed then begin
  if MiniRec then begin
   LoadBar( Puffer,rx,ry,rx+7,ry+7);
   MiniRec:= false;
   end;
  case ReadKey of
   ' ': FullScreen;
   #13: EditGoto;
   #00: begin case ReadKey of
        #72: if OfsY>Tab then dec( OfsY, Tab) else OfsY:=0;
        #75: if OfsX>Tab then dec( OfsX, Tab) else OfsX:=0;
        #77: begin
             if OfsX<BPL-22 then inc( OfsX, Tab) else
                OfsX:=BPL-22;
             if OfsX>BPL-22 then OfsX:= BPL-22;
             end;
        #80: begin
             if MapHeight>20 then
             if OfsY<MapHeight-21 then inc( OfsY, Tab) else
                OfsY:=MapHeight-21;
             if OfsY>MapHeight-21 then OfsY:=MapHeight-21;
             end;
        #115: if OfsX>10 then dec( OfsX, 10) else OfsX:=0;
        #116: if OfsX<BPL-32 then inc( OfsX, 10) else
              OfsX:=BPL-22;
        #$49: if OfsY>10 then dec( OfsY, 10) else OfsY:=0;
        #$51:begin
             if MapHeight>20 then
             if OfsY<MapHeight-31 then inc( OfsY, 10) else
                OfsY:=MapHeight-21;
             if OfsY>MapHeight-21 then OfsY:=MapHeight-21;
             end;
        #45: FileExit;
        #60: FileSave;
        #85: FileSaveAs;
        #61: FileOpen;
        #62: FileSavePal;
        #63: FileLoadPal;
        #64: EditGoto;
        end;
        Refresh.RMap;
        end;
   end;
   Scrolled:= true;
  end;

  ShowMouse;
  UNTIL Quit;
 FreeMemo;
 SetMode(3);
 end.
