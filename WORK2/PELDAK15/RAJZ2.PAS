(* rajz2.pas *)
program rajz2;
uses graph;
var
   Gd,Gm : integer;

begin
   DetectGraph(gd, gm);
   if not (Gd in [VGA, EGA]) then halt;;
   InitGraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt;
   SetBkColor(Cyan);
   SetColor(Red);
   SetTextJustify(CenterText,CenterText);
   OutTextXY(300,20,'Bet–k‚szletek bemutat sa');
   SetTextJustify(LeftText,TopText);
   SetTextStyle(DefaultFont,HorizDir,1);
   OutTextXY(50,50,
   'Szoveg kiiratas: DefaultFont Vizszintes: HorizDir Meret: 1 ');
   SetTextStyle(TriplexFont,HorizDir,1);
   OutTextXY(50,70,'Szoveg kiiratas: TriplexFont Meret: 1');
   SetTextStyle(SansSerifFont,HorizDir,1);
   OutTextXY(50,90,'Szoveg kiiratas: SansSerifFont Meret: 1');
   SetTextStyle(SmallFont,HorizDir,4);
   OutTextXY(50,120,'Szoveg kiiratas: SmallFont Meret: 4');
   SetTextStyle(GothicFont,HorizDir,2);
   OutTextXY(50,140,'Szoveg kiiratas: GothicFont Meret: 2');
   SetTextStyle(GothicFont,HorizDir,4);
   OutTextXY(50,170,'Szoveg kiiratas: GothicFont Meret: 4');
   SetColor(Blue);
   SetTextStyle(DefaultFont,VertDir,1);
   OutTextXY(50,220,'Szoveg VertDir');
   SetColor(Blue);
   SetTextStyle(SmallFont,VertDir,4);
   OutTextXY(80,220,'Fuggoleges irany');
   readln;
   Closegraph;
end.
