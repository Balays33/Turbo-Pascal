(* kivag.pas *)
program kivag;
uses Graph;

var
   p : pointer;
   i :  integer;
   meret : word;

procedure grstart;
 var
   gd, gm : integer;
 begin
   gd:= Detect;
   Initgraph(gd, gm,'');
   if GraphResult<>GrOk then Halt(1);
 end;

begin
  writeln('Az <Enter> let‚se szks‚ges a l‚p‚sekhez');
  readln;
  grstart;

  {a kifesti teljes k‚perny“t}
  SetFillStyle(XHatchfill, White);
  Bar(0,0,GetMaxX,GetMaxy);

  {lek‚rdezi a kiv gand¢ k‚p m‚ret‚t}
  meret:=ImageSize(10,20,30,40);
  {mem¢ri t foglal }
  GetMem(p, meret);
  {elteszi a k‚pet a mem¢ri ba}
  GetImage(10,20,30,40,p^);
  Readln;

  {t”rli a k‚perny“t}
  ClearDevice;

  {t”bbsz”r kiteszi az elt rolt k‚pet}
   i:=10;
   while i<GetMaxy-10 do
   begin
     PutImage(i, i, p^, Normalput);
     inc(i,20);
   end;
  Readln;
  CloseGraph;
end.
