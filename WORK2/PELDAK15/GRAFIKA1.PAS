(* grafika1.pas *)
program grafika1;
uses Graph;
var
  gvezerlo, gmod, hibakod: integer;
begin
  gvezerlo:=Detect;
  InitGraph(gvezerlo, gmod,'');
  hibakod:= GraphResult;
  if hibakod<>GrOk then
     begin
       writeln('Grafikus hiba: ', GraphErrorMsg(hibakod));
       writeln('Kil‚p‚s a programb¢l ...');
       Halt;
     end;
  { rajzol s }
  Rectangle(100,100,60,40);
  readln;
  CloseGraph;
end.

