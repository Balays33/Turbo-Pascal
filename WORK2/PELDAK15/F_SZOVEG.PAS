(* f_szoveg.pas *)
program felhasznaloi_szoveg;
uses Graph;

procedure grstart;
 var Gd, Gm : integer;
 begin
   Gd:=Detect;
   Initgraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt(1);
 end;

begin
  grstart;
  SetTextStyle(TriplexFont,Horizdir,4);
  OutTextXY(50,50,'Norm l');
  SetUserCharSize(1,2,1,1);
  OutTextXY(50,100,'Keskeny');
  SetUserCharSize(3,1,1,1);
  OutTextXY(50,150,'Sz‚les');
  readln;
  closeGraph;
end.
