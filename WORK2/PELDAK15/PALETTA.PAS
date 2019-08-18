  (* paletta.pas *)
  program paletta_pld;

  uses
    Crt, Graph;

  const max_i=300;

  var
    Gd, Gm  : Integer;
    Color   : Word;
    Paletta,oldpaletta : PaletteType;
    StartAng, EndAng : Word;
    i:integer;
    ch:char;

 procedure forgatas;
 var  d:shortint;
      i:integer;
 begin
  with paletta do
   begin
   d:=colors[1];
   for i:=2 to Paletta.Size-1 do
   begin
     colors[i-1]:=colors[i];
   end;
   colors[15]:=d;
 end;
 end;

  begin
    Gd := Detect; InitGraph(Gd, Gm, '');
    if (gd<>EGA) and (gd<>VGA) then halt(1);
    if GraphResult <> grOk then Halt(1);
    GetPalette(Paletta);
    oldpaletta:=paletta;

    randomize;
    for i:=1 to 15 do
     paletta.colors[i]:=random(64);

     circle(GetMaxX div 2, GetMaxY div 2, GetMaxY div 4);

     for Color := 1 to Pred(Paletta.Size) do
       begin
        StartAng:=round(360/(Paletta.Size-1))*color;
        EndAng  :=round(360/(Paletta.Size-1))*(color+1);
        setfillstyle(solidfill,color);
        SetColor(Color);
        Pieslice(GetMaxX div 2, GetMaxY div 2, StartAng,
                 EndAng, GetMaxY div 4);
      end;

    repeat until keypressed;
    ch:=readkey;

    setallpalette(paletta);

    i:=max_i;
    repeat
     forgatas;
     delay(i);
     setallpalette(paletta);
     dec(i,5)
    until i=0;

    i:=0;
    repeat
     forgatas;
     delay(i);
     setallpalette(paletta);
     inc(i,5)
    until i=max_i;

    setallpalette(oldpaletta);

    repeat until keypressed;
    ch:=readkey;

    CloseGraph;
  end.

