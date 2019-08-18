(* grafika2.pas *)
program grafika2;
uses Graph;
var
   gvezerlo, gmod, hibakod : integer;
   BGIutvonal : string;
begin
  BGIutvonal:='C:\TP\BGI';
  gvezerlo:=Detect;
  InitGraph(gvezerlo, gmod, BGIutvonal);
  hibakod:= GraphResult;
  if hibakod<>GrOk then
     begin
       writeln('Grafikus hiba: ', GraphErrorMsg(hibakod));
       if (hibakod = grFileNotFound) then
         begin
           write('Adja meg a .BGI teljes el‚r‚si £tvonal t: ');
           readln(BGIutvonal);
           if BGIutvonal='' then halt;
           gvezerlo:=Detect;
           InitGraph(gvezerlo, gmod, BGIutvonal);
           if (GraphResult<>GrOk) then Halt(1);
         end;
     end;
  (* rajzol s *)
  Rectangle(100,100,60,40);
  readln;
  CloseGraph;
end.

