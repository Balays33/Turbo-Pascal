Unit MENU;

INTERFACE

procedure MainMenu( s: string);
procedure SubMenu( count: word; s: string);
procedure GetMenu;
procedure Refresh( BarToEnd: boolean);

var
 MainRes, MenuRes: word;

const
 MaxLength = 8;
 MaxMains  = 8;
 MenuLen   = 12;
 MaxStr  = 7;
 MFColor: byte = 0;
 MBColor: byte = 15;
 SFColor: byte = 15;
 SBColor: byte = 0;

var
 MainStr: array [1..MaxMains] of string [MaxLength];
 SubStr:  array [1..MaxMains,1..MaxStr] of string [MenuLen];

IMPLEMENTATION


uses CRT, MCGA, MOUSE;

type

 MainSize = record
  First, Last: word;
  end;

 Strize = record
  X1, Y1,
  X2, Y2: word;
  end;

 PufType = array [0..Menulen*MaxStr*64-1] of byte;


var

 MainSizes: array [1..MaxMains] of MainSize;
 Strizes: array [1..MaxMains] of Strize;

 MainNumber: byte;
 CurrMain:   byte;
 MainString: string [40];
 NextNumber: array [1..MaxMains] of byte;
 Puffer: PufType;


procedure MainMenu;

 var
  CurrCh, First, Last: byte;

 begin
  First:=1;
  MainNumber:=0;
  MainString:= s;
  for CurrCh:= 1 to length(s) do
   if (copy( s, CurrCh, 1)=' ') or ( CurrCh=Length(s)) then begin
    if CurrCh=Length(s) then Last:= CurrCh else Last:= CurrCh-1;
    inc( MainNumber);
    MainStr [MainNumber]:= copy( s, First, Last-First+1);
    MainSizes[MainNumber].First:= (First-1)*8;
    MainSizes[MainNumber].Last := Last*8-1;
    First:= CurrCh+1;
    end;

{ for i:=1 to Mainnumber do
   outtext(0,i*8+5,MainStr[i]);
  for i:=1 to MainNumber do with MainSizes[i] do begin
   Point( first,8); point( last,8); end;
}

  end;


procedure SubMenu;

 var
  i, Fst, Lst: byte;
  MaxX: word;

 begin
  NextNumber[count]:=0;
  Fst:=1;
  MaxX:=0;
  for i:= 1 to length( s) do
   if ( copy( s, i, 1)=';') or ( i=length(s)) then begin
    if i=Length(s) then Lst:= i else Lst:= i-1;
    inc( NextNumber[count]);
    SubStr[Count,NextNumber[count]]:= copy( s, Fst, Lst-Fst+1);
    if Lst-Fst+1>MaxX then MaxX:=lst-fst+1;
    Fst:= i+1;
    end;
  with Strizes[count] do begin
   x1:= MainSizes[count].first;
   y1:= 8;
   x2:= x1+MaxX*8-1;
   y2:= (NextNumber[count]+1)*8-1;
   end;
  end;


procedure Refresh; begin
 if BarToEnd then begin
  PointColor:= MBColor;
  Bar(0,0,319,7);
  end;
 PointColor:= MFColor;
 TextBackColor:= MBColor;
 OutText( 0,0, MainString);
 end;


procedure GetMenu;

 var
  i, x, y: word;
  exittrue: boolean;

 begin
  MainRes:=0; MenuRes:=0;
  HideMouse;
  Refresh( false);
  ShowMouse;
  repeat
   if MouseY>7 then exit;
   until not ButtonPressed;
  HideMouse;
  x:= MouseX;
  for i:= 1 to MainNumber do
   if (x>=MainSizes[i].first) and (x<=MainSizes[i].last) then MainRes:= i;
  if MainRes=0 then begin ShowMouse; exit; end;
  PointColor:= SFColor;
  TextBackColor:= SBColor;
  OutText(MainSizes[MainRes].first,0,MainStr[MainRes]);

  PointColor:=MBColor;
  with Strizes[MainRes] do begin
   SaveBar( @Puffer, x1,y1,x2,y2);
   Bar(x1,y1,x2,y2);
   PointColor:= MFColor;
   TextBackColor:= MBColor;
   for i:= 1 to NextNumber[MainRes] do
    OutText({MainSizes[MainRes].first}x1,i*8,SubStr[MainRes,i]);
  ShowMouse;

  repeat until ButtonPressed or KeyPressed;
  x:= MouseX; y:= MouseY;
  if (x<x1) or (x>x2) or (y<y1) or (y>y2) or KeyPressed then begin
   HideMouse;
   LoadBar( @Puffer, x1,y1,x2,y2);
   Refresh( false);
   ShowMouse;
   end
  else begin
    HideMouse;
    PointColor:= SBColor;
    Bar(x1,(y div 8) * 8,x2,(y div 8) * 8+7);
    PointColor:= SFColor;
    TextBackColor:= SBColor;
    OutText(x1,(y div 8) * 8, SubStr[Mainres,y div 8]);
    ShowMouse;
    MenuRes:= y div 8;
    repeat x:= MouseX; y:= MouseY;
     exittrue:=(x<x1) or (x>x2) or (y<Menures*8) or (y>(Menures*8+7));
     until not ButtonPressed or ExitTrue;
    if ExitTrue then begin MenuRes:=0;
     HideMouse;
     LoadBar( @Puffer, x1,y1,x2,y2);
     Refresh( false);
     ShowMouse;
     repeat until not ButtonPressed;
     end else begin
      HideMouse;
      LoadBar( @Puffer, x1,y1,x2,y2);
      Refresh( false);
      ShowMouse;
      end;
  end; end; end;


end.
