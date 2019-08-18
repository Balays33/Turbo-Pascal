(* palettad.pas *)
program paletta_atdefinialas;
  uses Graph;

 var  Gd,Gm: integer;
      Palette: PaletteType;
     pal0   : palettetype;

Procedure grstart;
 begin
    Gd:=Detect;
    Initgraph(Gd,Gm,'');
    if GraphResult<>GrOk then Halt(1);
 end;

begin
  grstart;
  OutTextXY(240,20,'Paletta  tdefini l s ');

  SetFillStyle(SolidFill,blue); (* cyan lesz a t”lt“szin *)
  Bar(100,100,200,130);
  OutTextXY(100,150,'blue -> magenta');
  SetFillStyle(SolidFill,green); (* magenta lesz a t”lt“szin *)
  Bar(240,100,340,130);
  OutTextXY(240,150,'green -> blue');
  SetFillStyle(SolidFill,cyan);  (* green lesz a t”lt“szin *)
  Bar(380,100,480,130);
  OutTextXY(380,150,'cyan -> green');
  OutTextXY(240,170,'h tter: black -> cyan');
  OutTextXY(380,190,'Nyomj Enter-t!');

  getpalette(pal0);
  readln;

  with Palette do
  begin
     Size:= 4;
     Colors[0]:=3;   (* black -> cyan    *)
     Colors[1]:=5;   (* blue  -> magenta *)
     Colors[2]:=1;   (* green -> blue    *)
     Colors[3]:=2;   (* cyan  -> green   *)
     SetAllPalette(Palette);
  end;

  Readln;
  SetAllPalette(Pal0);

  readln;
  CloseGraph;
 end.
