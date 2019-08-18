(*  gvezerlo.pas *)
program gvezerlo;
uses Graph;

procedure grstart;
 var gd, gm, hibakod : integer;
 begin
   gd:=Detect;
   Initgraph(gd, gm, '');
   hibakod := GraphResult;
   if hibakod<>GrOk then
      begin
        writeln('Grafikus hiba: ',GraphErrorMsg(hibakod));
        writeln('A program befejezi a fut s t. ');
        halt(1);
      end;
 end;

begin
  grstart;
  Outtext('A vez‚rl“ neve: '+ GetDriverName);
  readln;
  CloseGraph;
end.