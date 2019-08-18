(* g_szoveg.pas *)
program grafikus_szoveg;
uses Graph;

procedure grstart;
 var  Gd, Gm: integer;
 begin
   Gd:=Detect;
   Initgraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt(1);
 end;

begin
  grstart;
  { a sz”veg a k‚perny“ k”zep‚n lesz }
  SetTextJustify(CenterText,CenterText);
  {  SetTextStyle(DefaultFont,HorizDir,4); }
  SetTextStyle(TriplexFont,HorizDir,4);
  {  SetTextStyle(SmallFont,HorzDir,4);    }
  { SetTextStyle(SansSerifFont,HorizDir,4);}
  {  SetTextStyle(GothicFont,HorizDir,4);  }
  OutTextXY(Succ(GetMaxX) div 2,Succ(GetMaxY) div 2,'Sz”veg k”z‚pen');
  readln;
  CloseGraph;
end.
