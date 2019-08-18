{$A-,B-,D+,E-,F-,G+,I+,L+,N+,O+,R-,Q-,S+,V+,X+}
{$M 16384,2048,655360}

program BOB_EDITOR;

uses GAME, MCGA, MOUSE, CRT, DOS, _SYSTEM;


type

  PointType = record
    X, Y: word;
   end;

  PhaseType = record
    Current, Maximum: byte;
   end;

  CoordType = record
    A, B: PointType;
   end;

  RecType = record
   rx1, rx2, ry1, ry2: word;
   end;

  RefreshType = object
    procedure XY;
    procedure XYC;
    procedure CopyRight;
    procedure Palette;
    procedure Menu;
    procedure Up( Invers: boolean);
    procedure Down( Invers: boolean);
    procedure Left( Invers: boolean);
    procedure Right( Invers: boolean);
    procedure WorkArea;
    procedure Phase;
    procedure RZoom;
    procedure DisPlay;
   end;

  SMType = object
    function MFile: byte;
    function MEdit: byte;
    function MTools: byte;
    function MHelp: byte;
   end;

  ColorType = record
    r, g, b: byte;
   end;

  PalType = array [0..255] of ColorType;


const

  NoHere = 0;
  MenuFile = 1;
  MenuEdit = 2;
  MenuTools = 3;
  MenuHelp = 4;
  AreaSprite = 5;
  AreaPalette = 6;
  ArrowUp = 7;
  ArrowLeft = 8;
  ArrowDown = 9;
  ArrowRight = 10;
  MaxAreas = 10;
  Step = 10;

  Zoom: byte = 1;
  SpriteFile: string = '';
        Coordinates: array[1..MaxAreas] of CoordType = (
                ( A:( X: 0 *8; Y: 0 *8); B:( X: 4 *8-1; Y: 1 *8-1)),
                ( A:( X: 5 *8; Y: 0 *8); B:( X: 9 *8-1; Y: 1 *8-1)),
                ( A:( X: 10*8; Y: 0 *8); B:( X: 15*8-1; Y: 1 *8-1)),
                ( A:( X: 12*8; Y: 0 *8); B:( X: 20*8-1; Y: 1 *8-1)),
                ( A:( X: 1   ; Y: 2 *8); B:( X: 22*8-1; Y: 24*8-2)),
                ( A:( X: 24*8; Y: 2 *8); B:( X: 40*8-1; Y: 18*8-1)),
                ( A:( X: 24*8; Y: 21*8); B:( X: 25*8-1; Y: 22*8-1)),
                ( A:( X: 23*8; Y: 22*8); B:( X: 24*8-1; Y: 23*8-1)),
                ( A:( X: 24*8; Y: 22*8); B:( X: 25*8-1; Y: 23*8-1)),
                ( A:( X: 25*8; Y: 22*8); B:( X: 26*8-1; Y: 23*8-1))  );
  DrawColor: byte = 0;
        Offset: PointType = ( X: 0; Y: 0);
  BarDef: Boolean = False;
  PBar: Pointer = Nil;
  ExitProgram: Boolean = False;

var

  CurrPoint: PointType;
  ZoomGreater: boolean;
  Refresh: RefreshType;
  SM: SMType;
  Sp: BOB;
  Rec: RecType;
  Pal: ^PalType;
  Reg: Registers;
  CurDir: string;
  MenuBuffer: pointer;


procedure swc; begin sw_byte(TextBackColor,PointColor); end;
procedure runb; begin repeat until not ButtonPressed; end;
procedure cls; begin swc; Bar(0,0,319,199); swc; end;

function CPX: word; begin
 CPX:=((MouseX-1) div Zoom)+Offset.X; end;

function CPY: word; begin
 CPY:=((MouseY-16) div Zoom)+Offset.Y; end;

procedure Beep; begin write(#7); end;

procedure SavePal; assembler;
 asm mov ax,1017h; mov bx,0; mov cx,100h; les dx,Pal; int 10h; end;


procedure LoadPal; assembler;
 asm mov ax,1012h; mov bx,0; mov cx,100h; les dx,Pal; int 10h; end;
{
procedure GetMem( var o: pointer; l: LongInt);
 begin if MaxAvail<l then begin
  SetMode(3); WriteLn('Not enough memory error');
  Beep; Halt end;
  System.GetMem( o,l);
  end;
}

procedure SetMode( MD: word); begin
 TextBackGround(0); TextColor(LightGray);
 MCGA.SetMode( MD); end;

procedure NOMEMO; begin
  SavePal;
  SetMode(1);
  WriteLn( 'NOT ENOUGH MEMORY ERROR !');
  Beep; Readkey;
  SetMode($13);
  LoadPal;
  Refresh.Display;
  end;

procedure UpDateBOB; begin
 zoom:=1; Offset.X:=0; OFfSet.Y:=0; end;

function WhereMouse: word;

 var
  i, x, y: word;
 begin
  x:= MouseX; y:= MouseY;
  i:= 0;
  repeat
   i:= i+1;
   until ( i = MaxAreas+1) or (
         (( x>=Coordinates[i].A.X) and ( x<=Coordinates[i].B.X)) and
         (( y>=Coordinates[i].A.Y) and ( y<=Coordinates[i].B.Y)) );
         if i = MaxAreas+1 then WhereMouse:= NoHere else WhereMouse:= i;
  end;


procedure RefreshType.Palette;

 var
  x, y: word;

 const
  Number = '0123456789ABCDEF';
  PaletteColor: byte = 0;

 begin
  OutText( 24*8, 8, Number);
  for x:=  1 to 16  do OutText( 23*8, (x+1)*8, _copy( Number, x));
  for y:= 0 to 15 do  for x:=  0 to 15 do begin
   TextBackColor:= PaletteColor;
   OutText( x*8+24*8, y*8+16, ' ');
   PaletteColor:= PaletteColor + 1;
   end;
  TextBackColor:= 0;
  end;


procedure RefreshType.Menu;

 begin
  Bar( 0, 0, 319, 7);
  SWC;
  OutText( 0, 0, 'File Edit Tools Help');
  SWC;
  end;


procedure RefreshType.Copyright;

 begin
  OutText( 0, 24*8, 'BOB  Editor 1.0  by  Varga M rton, 1996.');
  end;


procedure RefreshType.XY;
 begin
  SWC;
  Bar( 23*8, 19*8-1, 40*8-1, 20*8);
  SWC;
  if Sp.DT<>Nil then if (WhereMouse=AreaSprite) then begin
  OutTransparentText( 23*8, 19*8, 'X:'+_str( CPX));
  OutTransparentText( 29*8, 19*8, 'Y:'+_str( CPY));
  end else begin
  OutTransparentText( 23*8, 19*8, 'X:'+_str( Offset.X));
  OutTransparentText( 29*8, 19*8, 'Y:'+_str( Offset.Y)); end;
  end;

procedure RefreshType.XYC;

 var
  i: word;
  WColor: byte;
 begin
  XY;
  if WhereMouse in [AreaPalette,AreaSprite]
  then WColor:= GetPixel( MouseX, MouseY) else
  Wcolor:= DrawColor;
  OutTransparentText( 37*8, 19*8, _str( WColor));
  sw_byte( TextBackColor, WColor);
  OutText( 35*8, 19*8, ' ');
  sw_byte( TextBackColor, WColor);
  OutText( 36*8, 19*8, ':');
  Rectangle( 35*8-1,19*8-1,36*8,20*8 );
  end;

(*      begin
                if WhereMouse in [AreaPalette,AreaSprite]
      then WColor:= GetPixel( MouseX, MouseY) else
                        Wcolor:= DrawColor;
                SWC;
                Bar( 23*8, 19*8, 40*8-1, 20*8-1);
{   Bar( 29*8, 19*8, 34*8-1, 20*8-1);
                Bar( 35*8, 19*8, 40*8-1, 20*8-1);}
                SWC;
                if Sp.DT<>Nil then if (WhereMouse=AreaSprite) then begin
                                OutTransparentText( 23*8, 19*8, 'X:'+_str( CPX));
                                OutTransparentText( 29*8, 19*8, 'Y:'+_str( CPY));
                         end else begin
                                OutTransparentText( 23*8, 19*8, 'X:'+_str( Offset.X));
                                OutTransparentText( 29*8, 19*8, 'Y:'+_str( Offset.Y)); end;
                DrawColorBar;
         end; *)


procedure RefreshType.Up;

 begin
  Rectangle( 24*8-1,21*8-1,25*8,22*8-1 );
  if Invers then SWC;
  OutText( 24*8,21*8, #24 );
  if Invers then SWC;
  end;

procedure RefreshType.Left;

 begin
  Rectangle( 23*8-1,22*8-1,24*8-1,23*8 );
  if Invers then SWC;
  OutText( 23*8,22*8, #27 );
  if Invers then SWC;
  end;

procedure RefreshType.Down;

 begin
  Rectangle( 24*8-1,22*8-1,25*8,23*8 );
  if Invers then SWC;
  OutText( 24*8,22*8, #25 );
  if Invers then SWC;
  end;

procedure RefreshType.Right;

 begin
  Rectangle( 25*8,22*8-1,26*8,23*8 );
  if Invers then SWC;
  OutText( 25*8,22*8, #26 );
  if Invers then SWC;
  end;

procedure RefreshType.WorkArea;

  var
    xx, yy: word;
  begin
    if Sp.DT=nil then begin
     Coordinates[5].B.X:=1 ;
     Coordinates[5].B.Y:=15;
     Exit;
     end;
    yy:= 0;
    swc;
{   Bar(0,15,176,191);}
    repeat
      xx:= 0; repeat  with Sp do
      PointColor:= Mem[Seg(DT^):
                       Ofs(DT^)+
        P*W*H+W*(Offset.Y+yy)+Offset.X+xx];
      Bar( Zoom*xx+1, Zoom*yy+16, Zoom*( xx+1), Zoom*( yy+1)+15);
      inc( xx);
      until (Zoom*xx+1>=176-Zoom) or (Offset.X+xx>Sp.LX);
      inc( yy);
      until (Zoom*yy+16>=191-Zoom) or (Offset.Y+yy>Sp.LY);
    PointColor:=0;
    Bar(Zoom*xx+2,15, 176,191);
    Bar(0, Zoom*yy+17, 176,191);
    swc;
    Rectangle( 0, 15, Zoom*xx+1, Zoom*yy+16);
    Coordinates[5].B.X:=Zoom*xx ;
    Coordinates[5].B.Y:=Zoom*yy+15;
    if BarDef and (Zoom=1) then with Rec do Rectangle( rx1,ry1,rx2,ry2);
    end;

procedure RefreshType.Phase;

  begin
  OutText( 33*8,21*8, ' PHASE ');
  OutText( 33*8, 22*8,'       ');
  if Sp.DT<>Nil then OutText( 35*8,22*8, _Str( Sp.P));
  end;

procedure RefreshType.RZoom;

  begin
  OutText( 27*8,21*8, 'ZOOM');
  if Sp.DT=Nil then OutText( 35*8, 22*8,'     ') else
  OutText( 28*8,22*8, _Str( Zoom)+'  ');
  end;

procedure Refreshtype.Display;

  begin
  Cls;
  Menu; Palette; XYC; WorkArea; RZoom; Phase; CopyRight;
  Left(false); Right(false); Up(false); Down(false);
  EnableArea( 0,0, 319,191);
  end;


procedure SetColor( Col: byte);

  var
    R, G, B, i: byte;
    C: char;
  begin
    runb;
    swc; Bar(0,0,319,199);
    PointColor:= Col;
    Bar(0,14*8,19*8,18*8-1);
    PointColor:=0; swc;
    OutText(0,0*8,'Q: Red  ->Red+1');
    OutText(0,1*8,'A: Red  ->Red-1');
    OutText(0,2*8,'W: Green->Green+1');
    OutText(0,3*8,'S: Green->Green-1');
    OutText(0,4*8,'E: Blue ->Blue+1');
    OutText(0,5*8,'D: Blue ->Blue-1');
    OutText(0,7*8,'Enter or');
    OutText(0,8*8,'right button:  done');
    Refresh.Palette;
    EnableArea(24*8,16,319,18*8-1);
    repeat
      asm
        mov bl,COL; mov ah,10h; mov al,15h; int 10h
        mov R,dh; mov G,ch; mov B,cl
       end;
      OutText(0,10*8,'Red:   '+_str(R)+' ');
      OutText(0,11*8,'Green: '+_str(G)+' ');
      OutText(0,12*8,'Blue:  '+_str(B)+' ');
      ShowMouse;
      repeat until KeyPressed or ButtonPressed;
      HideMouse;
      if LeftButton then begin
        i:= GetPixel( MouseX, MouseY);
        asm
          mov bl,i; mov ah,10h; mov al,15h; int 10h
          mov R,dh; mov G,ch; mov B,cl
         end;
       end;
      if KeyPressed then begin
        c:= ReadKey; case upcase(c) of
          'Q': if R<63 then inc( R);
          'A': if R>00 then dec( R);
          'W': if G<63 then inc( G);
          'S': if G>00 then dec( G);
          'E': if B<63 then inc( B);
          'D': if B>00 then dec( B);
         end;
       end;
      Port[$3c8]:= Col;
      Port[$3c9]:= R;
      Port[$3c9]:= G;
      Port[$3c9]:= B;
      ShowMouse;
      if not RightButton then repeat until (not ButtonPressed) or MouseMoved;
      until (c=#13) or RightButton;
    CLS;
    Refresh.Display;
    runb;
    end;

(*procedure LoadSprite( FileName: string);{$I-}

  var f: file;

  begin   with sp do begin
   if DT<>nil then freemem(DT,LN);
   Assign(f,FileName);
   Reset(f,1); IOError;
   Seek(f,1);                   IOError;
   LX:=0; LY:=0;
   BlockRead(f,LX,1);         IOError;
   BlockRead(f,LY,1);         IOError;
   BlockRead(f,PN,1);       IOError;
   _getmem(DT,LN);
   BlockRead(f,DT^,LN);IOError;
   close(f);
   P:=0;
   end;end;*)



function SMType.MFile;

  begin
{   if not _GetMem( MenuBuffer, 9*8*8*8) then  begin NoMemo; ShowMouse; exit; end;
    GetMem( MenuBuffer, 9*8*8*8);}
    runb;
    SaveBar( MenuBuffer, 0,8,8*8,72+8);
    Bar(0,8,8*8,72+8);
    SWC;
    OutText( 0,   8, 'New');
    OutText( 0, 2*8, 'Open');
    OutText( 0, 3*8, 'Save');
    OutText( 0, 4*8, 'Save as');
    OutText( 0, 5*8, 'Import');
    OutText( 0, 6*8, 'Load Pal');
    OutText( 0, 7*8, 'Save Pal');
    OutText( 0, 8*8, 'DIR');
    OutText( 0, 9*8, 'Exit');
    ShowMouse;
    repeat until ButtonPressed or KeyPressed;
    HideMouse;
    if (MouseX>64) or (MouseY>80) or (MouseY<8) then MFile:= 0
    else MFile:=((MouseY-8) div 8) +1;
    if MouseY<8 then begin
       SWC;
       LoadBar( MenuBuffer, 0,8,8*8,72+8);
{      FreeMem( MenuBuffer, 9*8*8*8);
}      Exit;
      end;
    SWC;
    LoadBar( MenuBuffer, 0,8,8*8,72+8);
{   FreeMem( MenuBuffer, 9*8*8*8);
}   runb;
   end;


function SMType.MEdit;

  begin
 {  GetMem( MenuBuffer, 6*4*8*8) {then  begin NoMemo; ShowMouse; exit; end};
    runb;
    SaveBar( MenuBuffer, 5*8,8,11*8,4*8+8);
    Bar(5*8,8,11*8,4*8+8);
    SWC;
    OutText( 5*8,   8, 'Delete');
    OutText( 5*8, 2*8, 'Cut');
    OutText( 5*8, 3*8, 'Copy');
    OutText( 5*8, 4*8, 'Paste');
    ShowMouse;
    repeat until ButtonPressed or KeyPressed;
    HideMouse;
    if (MouseX>11*8) or (MouseX<5*8) or
       (MouseY>40) or (MouseY<8) then MEdit:= 0
    else MEdit:=((MouseY-8) div 8) +1;
    if MouseY<8 then begin
       SWC;
       LoadBar( MenuBuffer, 5*8,8,11*8,4*8+8);
  {    FreeMem( MenuBuffer, 6*4*8*8);}
       Exit;
      end;
    SWC;
    LoadBar( MenuBuffer, 5*8,8,11*8,4*8+8);
{   FreeMem( MenuBuffer, 6*4*8*8);}
    runb;
   end;


function SMType.MTools;

  begin
{   GetMem( MenuBuffer, 8*8*8*8) {then  begin NoMemo; ShowMouse; exit; end};
    runb;
    SaveBar( MenuBuffer, 10*8,8,18*8,8*8+8);
    Bar( 10*8,8,18*8,8*8+8);
    SWC;
    OutText( 10*8,   8, 'Turn');
    OutText( 10*8, 2*8, 'Inverse');
    OutText( 10*8, 3*8, 'Mirror '+#29);
    OutText( 10*8, 4*8, 'Mirror '+#18);
    OutText( 10*8, 5*8, 'Rotate');
    OutText( 10*8, 6*8, 'Bar');
    OutText( 10*8, 7*8, 'Change');
    OutText( 10*8, 8*8, 'Animate');
    ShowMouse;
    repeat until ButtonPressed or KeyPressed;
    HideMouse;
    if (MouseX>18*8) or (MouseX<10*8) or
       (MouseY>72) or (MouseY<8) then MTools:= 0
    else MTools:=((MouseY-8) div 8) +1;
    if MouseY<8 then begin
       SWC;
       LoadBar( MenuBuffer, 10*8,8,18*8,8*8+8);
 {     FreeMem( MenuBuffer, 8*8*8*8);}
       Exit;
      end;
    SWC;
    LoadBar( MenuBuffer, 10*8,8,18*8,8*8+8);
{   FreeMem( MenuBuffer, 8*8*8*8);    }
    runb;
   end;


function SMType.MHelp;

  begin
 {  GetMem( MenuBuffer, 30 *8*8){ then  begin NoMemo; ShowMouse; exit; end};
    runb;
    SaveBar( MenuBuffer, 16*8,8,26*8,3*8+8);
    Bar( 16*8,8,24*8,2*8+8);
    SWC;
    OutText( 16*8,   8, 'Hot keys');
    OutText( 16*8, 2*8, 'About');
    ShowMouse;
    repeat until ButtonPressed or KeyPressed;
    HideMouse;
    if (MouseX>24*8) or (MouseX<16*8) or
       (MouseY>24) or (MouseY<8) then MHelp:= 0
    else MHelp:=((MouseY-8) div 8) +1;
    if MouseY<8 then begin
       SWC;
       LoadBar( MenuBuffer, 16*8,8,26*8,3*8+8);
  {    FreeMem( MenuBuffer, 30 *8*8);}
       Exit;
      end;
    SWC;
    LoadBar( MenuBuffer, 16*8,8,26*8,3*8+8);
{   FreeMem( MenuBuffer, 30 *8*8);}
    runb;
   end;



procedure PasteBar;

  var xxx,yyy,count:word;
      len: PointType;
  begin
   if (PBar=Nil) or (Zoom>1) then begin Beep; Exit; end;
   with Rec do begin
   Refresh.WorkArea;
   Move(PBar^,Len,4);
   if (len.x-1>Sp.LX) or (len.y-1>Sp.LY) then begin Beep; Exit; end;
   with Coordinates[5] do EnableArea(1,16, b.x-len.x+1, b.y-len.y+1);
   GotoMouse(1,16);
   HideMouse;
   repeat
    count:=4;
    for yyy:=MouseY to Len.Y+MouseY-1 do
     for xxx:=MouseX to Len.X+MouseX-1 do begin
      if Mem[seg(pbar^):ofs(pbar^)+count]>0 then
         Mem[$a000:320*yyy+xxx]:=Mem[seg(pbar^):ofs(pbar^)+count];
      inc(Count);
      end;
    repeat until MouseMoved or ButtonPressed or KeyPressed;
    Refresh.WorkArea;
    Refresh.XY;
    until ButtonPressed or KeyPressed;
   count:=4;
   for yyy:= cpy to cpy+Len.y-1 do
    for xxx:= cpx to cpx+Len.x-1 do with sp do begin
      if Mem[seg(pbar^):ofs(pbar^)+count]>0 then
      Mem[seg(DT^):ofs(DT^)+
       +P*W*H+W*yyY+xxX]:=
       Mem[seg(pbar^):ofs(pbar^)+count];
       inc(Count); end;
   Runb;
   EnableArea(0,0,319,191);
   ShowMouse;
{  with Rec do begin
     rx1:= MouseX;
     ry1:= MouseY;
     rx2:= Len.X+MouseX-1;
     ry2:= Len.Y+MouseY-1; end;
   BarDef:=True;}
   end; end;



Procedure HelpHotKeys; {$I-}
 var
  f: text;
  s: string;
  i: byte;
 begin
  SavePal;
  SetMode( 3);
  Assign( f, CurDir+'HOTKEYS.TXT');
  Reset( f);
  if IOResult<>0 then begin
   Beep;
   WriteLn('HOTKEYS.TXT file not found error.');
   ReadKey;
   SetMode($13); LoadPal; Refresh.Display;
   Exit end;
  i:=0;
  repeat
   ReadLn( f,s);
   WriteLn( s);
   inc( i);
   until EoF( f) or (i>23);
   if i>23 then begin Beep; Write('THE FILE ''HOTKEYS.TXT'' IS TOO LONG (MAX 23 LINES)'); end;
  ReadKey;
  SetMode($13); LoadPal; Refresh.Display;
  end;



procedure SelectBar;

  var p: pointer; l: pointType; ESCPressed: boolean;

  procedure DelBar;
    var i,j: word;
    begin {if Not BarDef or (Zoom>1) then begin Beep; Exit; end;}
    with rec do
    for i:= ry1-16+Offset.Y to ry2-16+Offset.Y do
     for j:= rx1-1+Offset.X to rx2-1+Offset.X do with sp do
       Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*i+j]:=00;
    BarDef:=false;
    end;

  procedure CopyBar;
    var i,j,pbcount: word;
        len: PointType;
    begin
    PBCOUNT:=4;
    if PBar<>Nil then begin
      Move(Pbar^,len,4);
      FreeMem(Pbar,len.x*len.y+4);
      end;
    with Rec do begin
    len.x:= rx2-rx1+1;
    len.y:= ry2-ry1+1;
    GetMem( PBar,len.x*len.y+4){ then begin NoMemo; ShowMouse; exit end};
    Move(len,PBar^,4);
    for i:=ry1-16+Offset.Y to ry2-16+Offset.Y do
     for j:= rx1-1+Offset.X to rx2-1+Offset.X do with sp do begin
       Mem[seg(pbar^):ofs(pbar^)+PBCount]:=
       Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*i+j];
       inc(PBCount);
       end;
    end; end;

  procedure CutBar; begin CopyBar; DelBar; end;

  procedure DrawBar;
    var i,j: word;
    begin
    with rec do
    for i:= ry1-16+Offset.Y to ry2-16+Offset.Y do
     for j:= rx1-1+Offset.X to rx2-1+Offset.X do with sp do
       Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*i+j]:=DrawColor;
{    BarDef:= false;}
    end;

  procedure MirrorX;
    var xx,yy:word;
    begin
    with rec do
    for yy:=  ry1-16+Offset.Y to ry2-16+Offset.Y do
     for xx:= rx1-1+Offset.X to rx1+((rx2-rx1) div 2)-1+Offset.X do with sp do
       sw_byte(Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*yy+xx],
       Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*yy+rx2+Offset.X-3-(xx-(rx1+1+Offset.X))]);
    end;

  procedure MirrorY;
    var xx,yy:word;
    begin
    with rec do
    for yy:=  ry1-16+Offset.Y to ry1+((ry2-ry1) div 2)-16+Offset.Y do
     for xx:= rx1-1+Offset.X to rx2-1+Offset.X do with sp do
       sw_byte(Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*yy+xx],
       Mem[seg(DT^):ofs(DT^)+
        P*W*H+
        W*(ry2+Offset.Y-16-(yy-(ry1-16+Offset.Y)))+xx]);
    end;

  procedure Inverse;
    var i,j, c: word;
    begin {if Not BarDef or (Zoom>1) then begin Beep; Exit; end;}
    with rec do
    for i:= ry1-16+Offset.Y to ry2-16+Offset.Y do
     for j:= rx1-1+Offset.X to rx2-1+Offset.X do with sp do begin
       c:=Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*i+j];
       Mem[seg(DT^):ofs(DT^)+
        P*W*H+W*i+j]:= c-(c mod 16)+15-(c mod 16);
       end; end;

  procedure Rotate;
   var
    psh,i,j,ll,count: word;
    cl: byte;
    pp: pointer;
    len: PointType;
   begin with rec do begin
    with Coordinates[5] do
     if ry1+rx2-rx1>b.y then begin Beep; Exit end;
    CopyBar;
    Move(Pbar^,len,4);
    ll:=len.y*len.x+4;
    GetMem( pp, ll){ then begin NoMemo; ShowMouse; exit end};
    psh:=ry2;
    ry2:=ry1+rx2-rx1;
    rx2:=rx1+psh-ry1;
    with Coordinates[5] do
     if rx2>b.x then rx2:=b.x;
    len.x:= rx2-rx1+1;
    len.y:= ry2-ry1+1;
    count:=4;
    for j:=0 to len.x-1 do
     for i:=0 to len.y-1 do with sp do begin
      cl:=MEM[seg(pbar^):ofs(pbar^)+count{(len.x-1)*j+i}];
      MEM[seg(pp^  ):ofs(pp^)  +len.x*(ry2-ry1-i)+j+4]:=cl;
      inc(count);
      end;
    count:=4;
    for i:=ry1-16+offset.y to ry2-16+offset.y do
     for j:=rx1-1+offset.x to rx2- 1+offset.x do with sp do begin
      MEM[seg(dt^):ofs(dt^)+p*pl+w*i+j]:=MEM[seg(pp^):ofs(pp^)+count];
      inc(count);
      end;
    FreeMem(Pbar,ll);
    pbar:=nil;
    FreeMem(pp,ll);
    end; end;

  procedure RWH; begin with rec do begin
                SWC; Bar( 23*8, 21*8-1, 40*8-1, 22*8); SWC;
    OutTransparentText( 23*8, 21*8, 'W:'+_str( rx2-rx1+1));
    OutTransparentText( 29*8, 21*8, 'H:'+_str( ry2-ry1+1));
    end; end;


  begin
   if Zoom<> 1 then Exit;     with Rec do begin
   with Coordinates[5] do EnableArea(1,16, b.x, b.y);
   ESCPressed:= false;
   BarDef:= True;
   swc; Bar(23*8-1,21*8-1,319,23*8); swc;
   rx1:= MouseX;
   ry1:= MouseY;
   repeat
    rx2:= MouseX;
    ry2:= MouseY;
    if rx2<1  then rx2:=1 ;
    if ry2<16 then ry2:=16;
    if rx2<rx1 then rx1:=rx2;
    if ry2<ry1 then ry1:=ry2;
   with Coordinates[5] do begin
    if rx2>b.x then rx2:=b.x;
    if ry2>b.y then ry2:=b.y; end;
    HideMouse;
    Refresh.WorkArea;
    Refresh.XY;
    RWH;
    ShowMouse;
    repeat until MouseMoved or Not( RightButton);
    until Not( RightButton);
   EnableArea(0,0,319,191);
   Refresh.Workarea;
   repeat
    HideMouse;
    Refresh.Workarea;
    ShowMouse;
    repeat
     ShowMouse;
     repeat until MouseMoved or KeyPressed or ButtonPressed;
     with Refresh do if WhereMouse=AreaSprite then XY else XYC;
     RWH;
     ShowMouse;
     until ButtonPressed or KeyPressed;
    HideMouse;
    if LeftButton then Case WhereMouse of
     MenuEdit: case SM.MEdit of
                1: DelBar;
                2: CutBar;
                3: CopyBar;
                else Bardef:=false;
                end;
     MenuTools: case SM.MTools of
                2: Inverse;
                3: MirrorX;
                4: MirrorY;
                5: Rotate;
                6: DrawBar;
                else Bardef:=false;
                end;
     AreaSprite: if (MouseX>=rx1) and (MouseX<=rx2) and
                    (MouseY>=ry1) and (MouseY<=ry2) then begin
                 GotoMouse( rx1, ry1);
                 runb;
                 p:= PBar; PBar:= Nil;
                 CutBar; PasteBar;
                 Move(Pbar^,l,4);
                 FreeMem(Pbar,l.x*l.y+4);
                 PBar:= p; end;
     AreaPalette: DrawColor:= GetPixel( MouseX, MouseY);
     end;
    if keypressed then case UPCASE(ReadKey) of
     'X','H': MirrorX;
     'Y','V': MirrorY;
     'R': Rotate;
     'I': Inverse;
     #00: case ReadKey of
          #82: CopyBar;
          #83: DelBar;
          #59: HelpHotKeys;
          end;
     else ESCPressed:= true;
     end;
    ShowMouse;
    until ( LeftButton and not ( WhereMouse in
          [MenuEdit,MenuTools,AreaPalette])) or
          RightButton or ESCPressed or not BarDef;
    BarDef:= False;
    Refresh.Workarea;
    if LeftButton and (WhereMouse = AreaSprite) then runb;
    end;
    SWC; Bar( 23*8, 21*8-1, 40*8-1, 22*8); SWC;
   end;{ end;}


procedure ToolsTurn;
 var
  alfa: real;
  adeg,xr,yr,xint,yint: integer;
  astr: string;
  xi,yi,x0,y0: word;
  pold,pnt: pointer;
  clr: word;
 function RotX: integer;
  begin
   xint:= xi-x0;
   yint:= yi-y0;
   RotX:= round( x0+xint*cos(-alfa)-yint*sin(-alfa));
   end;
 function RotY: integer;
  begin
   xint:= xi-x0;
   yint:= yi-y0;
   RotY:= round( y0+xint*sin(-alfa)+yint*cos(-alfa));
   end;
 begin with sp do begin
  SavePal; SetMode( 3); HideMouse;
  WriteLn('This procedure can''t be undone!');
  Write('Type the angle (Enter=Cancel) : '); ReadLn( astr);
  if astr='' then begin SetMode($13); LoadPal; Refresh.Display; ShowMouse; Exit; end;
  adeg:= _val( astr);
  alfa:= (adeg*pi)/180;
  Mark( pold);
  GetMem( pnt, ln);
  Move( dt^, pnt^, ln);
  for clr:= 0 to pl-1 do mem[seg(dt^):ofs(dt^)+clr+p*pl]:=0;
  x0:= w shr 1;
  y0:= h shr 1;
  for xi:=0 to lx do
   for yi:=0 to ly do begin
    xr:= RotX;
    yr:= RotY;
    if (xr>=0) and (xr<w) and (yr>=0) and (yr<h) then
     mem[seg( dt^):ofs( dt^)+p*pl+yr*w+xr]:=
     mem[seg(pnt^):ofs(pnt^)+p*pl+yi*w+xi];
    end;
  for clr:= 1 to pl do if
   (mem[seg(dt^):ofs(dt^)+p*pl+clr  ]= 0) and
   (mem[seg(dt^):ofs(dt^)+p*pl+clr-1]<>0) and
   (mem[seg(dt^):ofs(dt^)+p*pl+clr+1]<>0) then
    mem[seg(dt^):ofs(dt^)+p*pl+clr  ]:=
    mem[seg(dt^):ofs(dt^)+p*pl+clr+1];
  Release( pold);
  SetMode($13); LoadPal; Refresh.Display; ShowMouse;
  end; end;









procedure FileNew;
  var i: word;lenx,leny:word; lex,ley:string; llx, lly, len: LongInt;
  label Vege;
  begin
  SavePal;
  SetMode( 3);
  TextBackGround(0); clrscr;
  Write('The shape''s width ? (Enter for cancel) '); ReadLn( lex);
  if (lex='') or (_val(lex)=0) then goto Vege;
  Write('The shape''s height ? (Enter for cancel) '); ReadLn( ley);
  if (ley='') or (_val(ley)=0) then goto Vege;
  lenx:= _val( lex); leny:= _val( ley);
  llx:= lenx; lly:= leny; len:= llx*lly;
  if MaxAvail<len then begin WriteLN('Not Enough Memory Error!');
     Beep; ReadKey; Goto Vege; end;
  if len>65534 then begin WriteLn('Max. size: 65534 bytes!'); Beep; ReadKey;
     goto vege end;
  with Sp do begin
    if DT<>Nil then Freemem(DT,LN);
    w:=lenx; h:=leny;
    LX:= lenx-1; LY:= leny-1; PN:= 0; P:= 0;
    PL:=W*H; LN:=PL;
    GetMem( DT, PL) {then begin NoMemo; ShowMouse; exit end};
    for i:=0 to PL-1 do
     Mem[Seg(DT^):Ofs(DT^)+i]:=0;
   end;
   SpriteFile:= '';
   UpDateBOB;
  Vege: SetMode( _320x200); LoadPal; Refresh.Display;
  end;


function _Reset( var f:file): Boolean;
  begin
  Reset( f, 1); if IOResult<>0 then begin
    WriteLn('File not found error. Press a key'); Beep; ReadKey; _Reset:=false;
    {Close( f);} end
    else _Reset:= true;
  end;

function _Rewrite( var f:file): Boolean;
  begin
  ReSet( f, 1); if IOResult=0 then begin
    Close( f);
    WriteLn('File already exists. Overwrite? (Y/N)');
    if not (ReadKey in ['y','Y']) then begin
     _ReWrite:= false; exit; end; end;
  ReWrite( f, 1);
  _Rewrite:= true; end;

function _BlockRead( var f:file; var Buffer; w: word): Boolean;
  begin
  BlockRead( f, buffer, w);
  If IOResult<>0 then begin WriteLn('File read error'); Beep; Close( f);
    ReadKey; _BlockRead:= false; end
  else _BlockRead:= True;
  end;

function _BlockWrite( var f:file; var Buffer; w: word): Boolean;
  begin
  BlockWrite( f, buffer, w);
  If IOResult<>0 then begin WriteLn('File write error'); Beep; Close( f);
    ReadKey; _BlockWrite:= false; end
  else _BlockWrite:= True;
  end;

function _Seek( var f:file; w: word): Boolean;
  begin
  Seek( f, w);
  If IOResult<>0 then begin WriteLn('File error'); Beep; Close( f);
    ReadKey; _Seek:= false; end
  else _Seek:= True;
  end;


procedure FileDIR;
 var c: char; s: string; i,j:word; Rek: SearchRec;
 begin
  SavePal; SetMode( 3);
{  Exec('c:\command.com','/C dir /P');}
  repeat
  ClrScr;
  j:= 0;
  GetDir( 0, s);
  FindFirst( s+'\*.*', AnyFile, Rek);
  while DosError=0 do begin
   Write(Rek.Name:20);
   inc( j);
   if j=80 then begin WriteLn;
     WriteLn('Press a key to continue'); ReadKey; ClrScr; end;
   FindNext( Rek);
   end;
   WriteLn; WriteLn; WriteLn('Change directory ? (y/n)');
   c:= ReadKey;
   if UpCase( c)='Y' then begin
    ClrScr; WriteLn( 'Enter the new directory.');
    for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
    TextColor( Yellow); TextBackground( Blue);
    Readln(s);
    TextColor( 7); TextBackground( 0);
    ChDir( s);
    if IOResult <> 0 then  begin
     WriteLn('ERROR! The directory '''+s+''' not found.');
     WriteLn('Press a key.');
     Beep; ReadKey; end;
    end;
   until UpCase(c)<>'Y';
   SetMode($13); LoadPal; Refresh.Display; end;




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
  WriteLn; WriteLN('A-Z:'); WriteLN(' change'); WriteLn(' drive'); WriteLn;
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
  {SetCursorSize( 1,0);}
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
   repeat until KeyPressed{or MouseMoved;{or ButtonPressed or
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
 } FindFirst('*.*',AnyFile,Rec);
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





procedure FileOpen;
 var f: file; i: word; s: string; mode: byte;
  a: word;
  fi: file;
  ok: boolean;
 label _exit;
 begin
{ repeat}
   SavePal;
   SetMode( 1);
{  Writeln( 'File open. The name of the file ? (Enter for cancel, *.* for DIR)');
   for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
   TextColor( Yellow); TextBackground( Blue);
   Readln(s);
   TextColor( 7); TextBackground( 0);
   if s='*.*' then begin LoadPal; FileDir; end;
   until s<>'*.*';
}
  ok:= false;
  repeat
   s:= FileList( 'BOB');{ 'auto.map';}
   assign( fi,s);
   GetFAttr( fi, a);
   if a=Directory then ChDir( s) else ok:= true;
   until ok or (s='');
{  s:= FileList('BOB');}
  if s='' then goto _exit;
  Assign( f,s);
  if not _Reset( f) then goto _exit; with Sp do begin
  if DT<>nil then freemem(DT,LN);
  if not _Blockread(f,MODE,1) then goto _exit;
 if mode=0 then begin
  P:=0; LX:=0; LY:=0; PN:=0;
  if not _BlockRead(f,LX,1) then goto _exit;
  if not _BlockRead(f,LY,1) then goto _exit;
  if not _BlockRead(f,PN,1) then goto _exit;
  end else begin
  if not _BlockRead(f,LX,2) then goto _exit;
  if not _BlockRead(f,LY,2) then goto _exit;
  if not _BlockRead(f,PN,2) then goto _exit;
   end;
    W:=LX+1;
    H:=LY+1;
    PL:= W*H;
    LN:= PL*(PN+1);
    P:=0;
  Getmem(DT,LN) {then begin NoMemo; ShowMouse; exit end};
  if not _BlockRead(f,DT^,LN) then goto _exit;
   Close(f);
   SpriteFile:= s;
   UpDateBOB;
  _exit:
   Setmode($13); LoadPal; Refresh.DisPlay;
  end;end;

procedure FileLoadPal;
         var
                f: file;
                i: byte;
    dat: record
      r,g,b:byte;
      end;
    s: string;
 label _exit;
 begin
  {swc; Bar(0,0,319,199); swc;
  Refresh.Palette;
  OutText(0,19*8,'    Are you sure to clear this palette ?');
  OutText(0,21*8,' Press Enter or left  button for  Yes,');
  OutText(0,22*8+5,' Press  ESC  or right button for Cancel.');
  repeat until KeyPressed or ButtonPressed;
  if KeyPressed then if not (ReadKey=#13) then goto _exit;
  if RightButton then goto _exit;}
  SavePal;
  SetMode( 3);
  TextColor( 7); TextBackground( 0);
  Writeln( 'The name of the palette-file ? (Enter for cancel)');
  Writeln( 'Type ''def pal'' to set default palette.');
  for i:= 0 to 79 do Mem[$b800:2*160+2*i+1]:=30;
  TextColor( Yellow); TextBackground( Blue);
  Readln(s);
  TextColor( 7); TextBackground( 0);
  SetMode($13);
  if s='' then begin LoadPal; goto _exit; end;
        if s='def pal' then begin
    for i:= 248 to 255 do begin
      Port[$3c8]:= i; Port[$3c9]:= 0; Port[$3c9]:= 0; Port[$3c9]:= 0; end;
    goto _exit; end;
    Assign( f, s);
    SetMode( 3);
    if not _Reset( f) then begin
     SetMode($13);
     LoadPal;
     goto _exit; end;
    SetMode($13);
    for i:=  0 to 255 do begin
     if not _BlockRead( f,dat,3) then goto _exit;
     Port[$3c8]:= i;
     Port[$3c9]:= dat.r;
     Port[$3c9]:= dat.g;
     Port[$3c9]:= dat.b;
     end;
    Close( f);
  _exit: Refresh.Display; end;

function SaveSprite( FileName: string): boolean;
 var
  f: file;
 const
  n1: byte = 1;
 begin
  with Sp do begin
  assign( f, FileName);
  SaveSprite:= false;
  if not _ReWrite( f) then Exit;
  if not _BlockWrite( f, n1, 1) then Exit;
  if not _BlockWrite( f, LX, 2) then Exit;
  if not _BlockWrite( f, LY, 2) then Exit;
  if not _BlockWrite( f, PN, 2) then Exit;
  if not _BlockWrite( f, DT^, LN) then Exit;
  SaveSprite:= true;
  close( f); end; end;

procedure FileSaveAs;
 var i: byte; s: string;
 begin
  if Sp.DT=Nil then begin Beep; Exit; end;
  SavePal;
  SetMode( 3);
  TextColor( 7); TextBackground( 0);
  Writeln( 'File save. The name of the file ? (Enter for cancel)');
  for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
  TextColor( Yellow); TextBackground( Blue);
  Readln(s);
  TextColor( 7); TextBackground( 0);
  if s<>'' then if SaveSprite( s) then SpriteFile:= s;
  ClrScr; Write('Don''t forget to save palette !'); ReadKey;
  SetMode( $13); LoadPal; Refresh.Display; end;

procedure FileSave;
 var fl: file;
 begin
  if SpriteFile='' then FileSaveAs else begin
  Assign( fl, SpriteFile);
  Erase( fl);
  SaveSprite( SpriteFile);
  end; end;


procedure FileSavePal;
  var f: file; s: string; i: byte;
  label _exit;
  begin
  SavePal;
  SetMode( 3);
  TextColor( 7); TextBackground( 0);
  Writeln( 'Palette save. The name of the file ? (Enter for cancel)');
  for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
  TextColor( Yellow); TextBackground( Blue);
  Readln(s);
  TextColor( 7); TextBackground( 0);
  if s='' then goto _exit;
   Assign( f, s);
   if not _ReWrite( f) then goto _exit;
   if not _BlockWrite( f, Pal^, 3*256) then goto _exit;
   close( f);
  _exit: SetMode($13); LoadPal; Refresh.Display; end;


procedure InsertEpi( CopyCurr: Boolean);
 var pp: pointer;
     i: word;
     len: longint;
 begin with Sp do begin
  len:= 0;
  inc(len,LN);
  inc(len,PL);
{ if (LN+PL)>10000 then begin beep; halt; end;}
  if (MaxAvail<(PN+2)*W*H) or (len>65534) then begin beep; exit; end;
  GetMem( pp, (PN+2)*W*H) {then  begin NoMemo; ShowMouse; exit; end};
  Inc( PN);
  Move( DT^, pp^, (P+1)*W*H);
  if CopyCurr then Move(PTR(Seg(DT^),Ofs(DT^)+    P*W*H)^,
              PTR(Seg(   pp^),Ofs(   PP^)+(P+1)*W*H)^,
              W*H)
   else for i:= 0 to pl-1 do mem[seg(pp^):ofs(pp^)+(p+1)*pl+i]:=0;
  Move(PTR(Seg(DT^),Ofs(DT^)+(P+1)*W*H)^,
       PTR(Seg(   pp^),Ofs(   PP^)+(P+2)*W*H)^,
      (PN-P-1)*W*H);
  Inc( P);
  FreeMem( DT, PN*W*H);
  DT:=pp;
  inc(LN,PL);
  end; end;



procedure FileImport;
  var f: file; s: string; i: byte;
      xx, yy, px, py: integer;
      pp, pnt: pointer;
  begin
  SavePal;
  SetMode( 3);
  TextColor( 7); TextBackground( 0);
  Writeln( 'Picture import. Enter the name of the LBM-file. (Enter=cancel)');
  for i:= 0 to 79 do Mem[$b800:160+2*i+1]:=30;
  TextColor( Yellow); TextBackground( Blue);
  Readln(s);
  TextColor( 7); TextBackground( 0);
  SetMode( $13);
  xx:=0; yy:=0;
  if (s<>'') then with Sp do begin
    LoadLBM(s,ptr($a000,0));
    if DT<>NIL then begin FreeMem(DT,LN); DT:= NIL; end;
    P:=0; PN:=0;
    EnableArea( 0,0,319,199);
    HideMouse;
    REPEAT
     GetMem( pp, (xx+1)*(yy+1)) {then begin NoMemo; ShowMouse; exit end};
     if not RightButton then begin
       px:=MouseX; py:=MouseY;
       end;
     SaveBar( pp, px, py, px+xx, py+yy);
     Rectangle( px, py, px+xx, py+yy);
     repeat until MouseMoved or ButtonPressed or KeyPressed;
     LoadBar( pp, px, py, px+xx, py+yy);
     FreeMem( pp, (xx+1)*(yy+1));
     if RightButton then begin
      EnableArea( 0,0,319,199);
      GotoMouse( px+xx, py+yy);
      while RightButton do begin
      xx:= MouseX-px; yy:= MouseY-py;
      if xx<0 then begin inc( px, xx); xx:=0; end;
      if yy<0 then begin inc( py, yy); yy:=0; end;
{     if xx>255 then xx:=255;
      if yy>255 then yy:=255;
}     GetMem( pp, (xx+1)*(yy+1)) {hen begin NoMemo; ShowMouse; exit end};
      SaveBar( pp, px, py, px+xx, py+yy);
      Rectangle( px, py, px+xx, py+yy);
      repeat until MouseMoved or not RightButton;
      LoadBar( pp, px, py, px+xx, py+yy);
      FreeMem( pp, (xx+1)*(yy+1));
      end;
      EnableArea(0,0,319-xx,199-yy);
      GotoMouse( px, py); end;
     UNTIL LeftButton or KeyPressed;
    if not Keypressed then begin
    lx:=xx; ly:= yy; w:= lx+1; h:= ly+1;
    pl:= w*h; ln:=0;
{   REPEAT
     _GetMem( pp, (xx+1)*(yy+1));
     SaveBar( pp, px, py, px+xx, py+yy);
     Rectangle( px, py, px+xx, py+yy);
     repeat until MouseMoved or ButtonPressed;
     if LeftButton then begin
      runb;
      GetMem( pnt, ln+pl);
      If DT<>NIL then begin
       Move( DT^, pnt^,ln);
       FreeMem( DT, LN); end;
      inc( ln, pl);
      Dt:=pnt;
      Move( pp^, Mem[seg(DT^):Ofs(DT^)+(PN-1)*PL], PL);
      end;
     LoadBar( pp, px, py, px+xx, py+yy);
     FreeMem( pp, (xx+1)*(yy+1));
     UNTIL RightButton;
}    runb;
     while KeyPressed do ReadKey;
     ln:= pl;
     GetMem( DT, pl) {then begin NoMemo; ShowMouse; exit end};
     SaveBar( DT, px, py, px+xx, py+yy);
     ShowMouse;
     UpDateBOB;
     SpriteFile:='';
     end else begin while KeyPressed do ReadKey; ShowMouse; end;
    end
   else begin while KeyPressed do ReadKey; SetMode( $13); LoadPal; end;
  Refresh.Display;
  end;


procedure ToolsColor;
 begin
  Cls;
  repeat
  Refresh.Palette;
  OutText(0,18*8+8,  'Select a color for the foreground');
  OutText(0,18*8+20,'and press the left button.');
  OutText(0,18*8+4*8,'Press right button for done.');
  EnableArea(24*8,16,319,18*8-1);
  ShowMouse;
  repeat until ButtonPressed or KeyPressed;
  HideMouse;
  if LeftButton then PointColor:= GetPixel( MouseX,MouseY);
  until RightButton or KeyPressed;
  runb; if KeyPressed then ReadKey;
  Refresh.Display;
  end;


procedure ToolsChange;
 var c, d: byte; i: word;
 begin
  if Sp.DT=Nil then begin Beep; exit; end;
  with refresh do begin
 repeat
  Cls;
  WorkArea;
  OutText(23*8,15,  'Select the color');
  OutText(23*8,4*8, 'what   will   be');
  OutText(23*8,6*8, 'changed.');
  OutText(23*8,8*8, 'Press  a key  or');
  OutText(23*8,10*8,'right for exit.');
  with Coordinates[5] do EnableArea(1,16, b.x, b.y);
  repeat
   ShowMouse;
   repeat until MouseMoved or ButtonPressed or KeyPressed;
   HideMouse;
   XYC;
   until ButtonPressed or KeyPressed;
  if not KeyPressed and not RightButton then begin
  runb;
  c:= GetPixel( MouseX, MouseY);
  if KeyPressed then ReadKey;
  Cls; Palette; WorkArea;
  EnableArea(24*8,16,319,18*8-1);
  OutText(23*8,19*8,'Now,  select  the');
  OutText(23*8,20*8,'new   color   and');
  OutText(23*8,21*8,'press  left.');
  OutText(23*8,22*8,'Press  right   or');
  OutText(23*8,23*8,'a key for cancel.');
  ShowMouse;
  repeat until KeyPressed or ButtonPressed;
  HideMouse;
  if not KeyPressed then if LeftButton then
  with sp do begin
   d:= GetPixel(MouseX,MouseY);
   for i:= 0 to LN do
    if Mem[seg(DT^):ofs(DT^)+i]=c then
       Mem[seg(DT^):ofs(DT^)+i]:=d;
   WorkArea;
   end;
  runb;
  end;
 until Keypressed or RightButton;
  runb; if KeyPressed then Readkey;
  DisPlay; end;
  end;


procedure ToolsAnimate;
 var   c: char; i,Speed:word; vertblink: boolean;
 const chspeed = 1;
 begin
 if (sp.dt=nil) or (MaxAvail<128000) then begin Beep; Exit end;
 Speed:=0;
 SavePal;
{InitAni;
{if not Memory then begin
  DoneAni; SetMode($13); LoadPal; Refresh.Display; Nomemo; ShowMouse; exit end;
}{LoadPal; SavePal;}
 asm mov ax,0; mov cx,32000; cld; mov es,sega000; xor di,di; rep stosw; end;
 FillBack( 0); MakeScr; ShowScr;
 VertBlink:=true;
 rectangle( 0,147,319,147);
 OutText( 0,150,'+/-      : speed   V:  Wait for Vertical');
 OutText( 0,160,#27#24#26#25+
                    '     : move        retrace        ON');
 OutText( 0,170,'Ctrl+X   : exit');
 with Sp do begin
  x:= 0; y:= 0; i:=0;
  InitKey;
  repeat
   OutText( 0,190,'DELAY    : '+_str(speed)+'     ');
   repeat inc(p); if p>pn then p:=0;
   MakeScr;
   if VertBlink then retrace;
   ShowScr; Delay( Speed);
    until _KeyPressed;
    if KEY[$4e] then if speed>0 then dec( speed, chspeed);
    if KEY[$4a] then inc (speed,chspeed);
    if KEY[$CB] then dec( x);
    if KEY[$CD] then inc( x);
    if KEY[$C8] then dec( y);
    if KEY[$D0] then inc( y);
    if KEY[$2f] then begin
     VertBlink:= not VertBlink;
     if VertBlink then OutText(37*8,160,' ON') else OutText(37*8,160,'OFF');
     Delay(500); end;
  until (KEY[$2d] or KEY[$9d]) and KEY[$1d];
  DoneKey;
  end;
{ DoneAni;}
  SetMode($13); LoadPal; Refresh.Display;
  end;



procedure LoadBOB( FileName: string);

  var
    f: file;
    mode: byte;

  begin with sp do begin
    Assign( f, FileName);
    Reset( f, 1);
    BlockRead( f, mode, 1);
   if mode=0 then begin
    LX:=0; LY:=0; PN:=0;
    BlockRead( f, LX, 1);
    BlockRead( f, LY, 1);
    BlockRead( f, PN, 1);
    end else begin
    BlockRead( f, LX, 2);
    BlockRead( f, LY, 2);
    BlockRead( f, PN, 2);
    end;
    P:=0;
    W:=LX+1;
    H:=LY+1;
    PL:= W*H;
    LN:= PL*(PN+1);
    if MaxAvail<LN then begin NoMemo; ShowMouse; exit end;
    GetMem( DT, LN);
    BlockRead( f, DT^, LN);
    Close( f);
   end; end;

procedure HelpAbout;
 begin
  SavePal; Cls;
  Refresh.CopyRight;
  repeat until KeyPressed or ButtonPressed;
  runb;
  if KeyPressed then ReadKey;
  LoadPal;
  Refresh.DisPlay;
  end;


var i:byte;
rrr: CoordType;
c:char;
const
 szoom: byte = 1;
 sofsx: word = 0;
 sofsy: word = 0;
begin
 if MaxAvail<5376 then begin Write('No memory',#7); Halt; end;
 GetMem( MenuBuffer,4608);
 New(Pal);
 InitGame;
 SetArea( 0,146);

 Sp.DT:=nil;
 Sp.Init;
 SetMode(_320x200);
    for i:= 248 to 255 do begin
      Port[$3c8]:= i; Port[$3c9]:= 0; Port[$3c9]:= 0; Port[$3c9]:= 0; end;
 Case ParamCount of
  1: loadbob(paramstr(1));
  2: begin game.loadpal(paramstr(2)); loadbob(paramstr(1)); end;
  end;
 GetDir(0,CurDir);
 CurDir:=Curdir+'\';
{ FileOpen;}
with Refresh do with sp do begin  Zoom:=1;
    DisPlay;
  repeat repeat
    ShowMouse;
    repeat until KeyPressed or MouseMoved or ButtonPressed;
    VerticalBlink;
    HideMouse;
    If ButtonPressed Then begin
     Up(( WhereMouse=ArrowUp));
     Left(( WhereMouse=ArrowLeft));
     Right(( WhereMouse=ArrowRight));
     Down(( WhereMouse=ArrowDown));
    Case WhereMouse of
      AreaSprite :  if leftbutton then
        Mem[seg(DT^):ofs(DT^)+
        +P*W*H+W*CPY+CPX]:=DrawColor
        else SelectBar;
      AreaPalette : DrawColor:=GetPixel(MouseX,MouseY);
      MenuFile: case SM.MFile of
                     9: ExitProgram:=true;
                     1: FileNew;
                     2: FileOpen;
                     6: FileLoadPal;
                     5: FileImport;
                     4: FileSaveAs;
                     3: FileSave;
                     7: FileSavePal;
                     8: FileDIR;
                     end;
      ArrowUp: if (dt<>nil) and (offset.y>0) then dec(Offset.y);
      ArrowDown: if (dt<>nil) and (offset.y<ly) then inc(Offset.y);
      ArrowLeft: if (dt<>nil) and (offset.x>0) then dec(Offset.x);
      ArrowRight: if (dt<>nil) and (offset.x<lx) then inc(Offset.x);
      MenuEdit: case SM.MEdit of
                4: PasteBar;
                1..3: Beep;
                end;
      MenuTools: case SM.MTools of
                      1: ToolsTurn;
                      7: ToolsChange;
                      8: ToolsAnimate;
                      2..6: Beep;
                      end;
      MenuHelp: case SM.MHelp of
                     1: HelpHotKeys;
                     2: HelpAbout;
                     end;
     end;
    if RightButton and (WhereMouse=AreaPalette) then
    SetColor( GetPixel( MouseX, MouseY));
    ShowMouse;  if Zoom=1 then Delay(10) else Delay(100); HideMouse;
    WorkArea;
    end;
    Up(false); Left(false); Right(false); Down(false);
    XYC; rzoom; Phase;
    ShowMouse;
    until KeyPressed or ExitProgram;
  if keypressed then begin
  HideMouse;
  c:=readkey;
  case upcase(c) of
   '+': if zoom<174 then inc(zoom);
   '-': dec(zoom);
   'I': if dt<>nil then InsertEpi(FALSE);
   '0'..'9': if dt<>nil then begin
             p:=_val(c);
             if p>pn then p:=pn;
             end;
   #00: begin
        c:= ReadKey;
        case c of
        #81: if P>0 then dec(P) else P:=PN;
        #73: if P<PN then inc(P) else P :=0;
        #71: begin
             SZoom:= Zoom;
             SOfsX:= Offset.x;
             SOfsY:= Offset.y;
             Zoom:= 1;
             Offset.x:= 0; Offset.y:= 0;
             end;
        #79: begin
             Zoom:= Szoom;
             Offset.x:= sofsx; Offset.y:= sofsy;
             end;
        #82: if DT<>nil then InsertEpi(TRUE);
        #45: ExitProgram:=true;
        #59: HelpHotKeys;
        #60: FileSave;
        #61: FileOpen;
        #85: FileSaveas;
        #62: FileSavePal;
        #63: FileLoadPal;
        #64: ToolsAnimate;
        #65: ToolsChange;
        #66: ToolsColor;
        #86: FileImport;
{       #72: if (dt<>nil) and (offset.y>0) then dec(Offset.y);
        #80: if (dt<>nil) and (offset.y<ly) then inc(Offset.y);
        #75: if (dt<>nil) and (offset.x>0) then dec(Offset.x);
        #77: if (dt<>nil) and (offset.x<lx) then inc(Offset.x);}
        #72 : if (dt<>nil) then
              if (Zoom<10) then if offset.y>=Step then
              dec(Offset.y,Step) else offset.y:=0
              else if offset.y>0 then dec(offset.y);
        #80 : if (dt<>nil) then
              if (Zoom<10) then begin if offset.y<ly-Step then
              inc(Offset.y,Step) end
              else if offset.y<ly then inc(offset.y);
        #75 : if (dt<>nil) then
              if (Zoom<10) then if offset.x>Step then
              dec(Offset.x,Step) else offset.x:=0
              else if offset.x>0 then dec(offset.x);
        #77 : if (dt<>nil) then
              if (Zoom<10) then begin if offset.x<lx-Step then
              inc(Offset.x,Step) end
              else if offset.x<lx then inc(offset.x);
        end; end;
   end;
   if zoom=0 then inc (zoom);
   XYC; rzoom; Phase;
   ShowMouse;
  end;
  HideMouse;
  WorkArea;
  XYC; rzoom; Phase;
  until ExitProgram;
  SavePal;
  DoneGame;
  WriteLn('Save the palette?');
  repeat until keypressed;
  if ReadKey in ['y','Y',#13] then begin
   SetMode( $13);
   LoadPal;
   FileSavePal;
   SetMode( 3);
   end;
{ Setmode( 3);}
  FreeMem( MenuBuffer,4608);
  DisPose( Pal);
end end.
