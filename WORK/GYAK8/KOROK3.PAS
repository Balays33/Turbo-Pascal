program korok3;
uses
  crt,Graph;
var
  Gd, Gm: Integer;
  Radius: Integer;
  i,delta,x1,x2,y1,y2:integer;
  j:word;

begin
  {Grafikus munka el“k‚sz¡t‚se}
  filemode:=0;
  Gd := Detect; InitGraph(Gd, Gm, 'e:\tp\bgi');
  filemode:=0;
  if GraphResult <> grOk then Halt(1);
  delay(1200);

  {K”r rajzol sa a sarokba}
  For radius:=1 to 200 do
      begin
           setcolor(radius mod 15);
           Circle(radius,     radius,     radius);
           Circle(640-radius, radius,     radius);
           circle(320       ,    225,     radius);
           Circle(radius,     450-radius, radius);
           Circle(640-radius, 450-radius, radius);
      end;

  {Grafikus munka befejez‚se}
  readln;
  CloseGraph;
end.
