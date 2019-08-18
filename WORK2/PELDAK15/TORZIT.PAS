(* torzit.pas *)
program torzitas_csokkentes;
  uses Crt,Graph;
  { SetAspectRatio elj r s }
  const R=60;
  var         Gd,Gm: integer;
          Xasp,Yasp: word;
      Procedure grstart;
      begin
         DirectVideo:=false;
         Gd:=Detect;
         Initgraph(Gd,Gm,'');
         if GraphResult<>GrOk then Halt(1);
      end;
  begin
  grstart;
  GetAspectRatio(Xasp,Yasp); { adatok a torz¡t s sz m¡t s hoz }
  if Xasp=Yasp then Yasp:=3*Xasp;
  while (Xasp<Yasp) and not KeyPressed do
  begin
     SetAspectRatio(Xasp,Yasp);
     Circle(GetMaxX div 2,GetMaxY div 2,R);
     Inc(Xasp,10);
  end;
  SetTextJustify(CenterText,CenterText);
  OutTextXY(GetMaxX div 2,GetMAxY div 2,'Sikerlt!');
  Readln;
  CloseGraph;
  end.
