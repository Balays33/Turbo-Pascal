(* rajz3.pas *)
program rajz3;
uses graph,crt;
var
   Gd,Gm : integer;
   x,y   : word;
begin
   DetectGraph(gd, gm);
   if not (Gd in [VGA, EGA]) then halt;;
   InitGraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt;
   SetBkColor(Black);
   x:=GetMaxX;
   y:=GetMaxY;
   repeat
    PutPixel(random(x),random(y),random(15));
   until KeyPressed;
   readln;
   Closegraph;
end.
