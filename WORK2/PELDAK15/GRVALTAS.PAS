(* GRValtas.pas *)
(* Grafika Çs szîveges m¢d v†lt†sa *)
program GValtas;
uses Graph,Crt;

Procedure grstart;
 var gd, gm :integer;
 begin
   gd:= Detect;
   Initgraph(gd, gm, '');
   if GraphResult<>GrOk then Halt(1);
 end;

begin
  grstart;
  Rectangle(20, 20, 340, 100);
  OutTextxy(25, 30, '<Enter>-rel kilÇpÅnk a grafikus m¢db¢l.');
  readln;
  RestoreCRTMode;
  GotoXY(10,10);
  Write('Szîveges m¢dban vagyunk!');
  GotoXY(10,12);
  write('<Enter> hat†s†ra visszatÇrÅnk grafikus m¢dba.');
  readln;
  SetGraphMode(GetGraphMode);
  Rectangle(20,20,340,100);
  OutTextXY(25,30,'Grafikus m¢dban vagyunk');
  OutTextXY(25,30 + 2*TextHeight('H'),
            '<Enter>-rel lez†rjuk a grafikus m¢dot.');
  readln;
  CloseGraph;
end.
