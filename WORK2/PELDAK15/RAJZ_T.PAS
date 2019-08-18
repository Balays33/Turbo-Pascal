(* rajz_t.pas *)
program rajz_t;
uses graph, crt;
var
  a,b      : integer;  { a tÇglalap oldalai }
  gd,gm,gr : integer;
  x,y      : integer;  { a beÅltetÇs koordin†t†i }

procedure olvas(szoveg: string;sor: integer; var w: integer);
 var
   sz  : string;
   code: integer;
   ch  : char;
   x,y : byte;
 begin
   repeat
     repeat
        TextColor(White);
        GotoXY(2,10+sor);
        write(szoveg); ClrEol;
        x:=WhereX; y:=WhereY;
        TextColor(Yellow);
        readln(sz);
        val(sz,w,code);
        if code <>0 then begin
                           gotoXY(x+4,y);
                           TextColor(Red+Blink);
                           write('Hib†s adat!: Sz¢kîz');
                           sound(100); Delay(150);
                           NoSound;
                           repeat until Keypressed;
                           gotoXY(2,10+sor);
                           DelLine;
                         end;
     until code=0;

     repeat
       gotoxy(2,12+sor);
       TextColor(Green);
       write('Akarja javitani (i/n): '); ch:=ReadKey;
     until (ch='i') or (ch='n');
     gotoXY(2,12+sor); delline;
   until ch='n';
 end;

begin
  { Szîveges Åzemm¢d be†ll°t†sa }
  TextMode(C40);
  TextBackground(blue); { h†ttÇrsz°n }
  clrscr;

  GotoXY(2,5);
  TextColor(Magenta);   { betñsz°n }
  write('TÇglalap adatai');
  olvas('a oldal: ',0,a);
  olvas('b oldal: ',2,b);
  GotoXY(2,14);
  TextColor(Magenta);
  write('A beÅltetÇs helye');
  olvas('x koordin†ta: ',6,x);
  olvas('y koordin†ta: ',8,y);

  { grafikus Åzemm¢dra v†lt†s }
  gd:=VGA; gm:=VGAHi;
  InitGraph(gd,gm,'');
  gr := GraphResult;
  if gr = grOK then
    begin
      SetBkColor(Cyan);    { a h†ttÇr sz°ne }
      SetColor(Red);       { a fejlÇc sz°ne }
      { a szîveg elhelyezÇse a koordin†tapont kîrÅl }
      SetTextJustify(CenterText,BottomText);
      { a szîveg st°lusa, ir†nya Çs nagys†ga }
      SetTextStyle(DefaultFont,HorizDir,1);
      OutTextXY(320,10,'TÇglalap rajzol†sa');

      SetColor(White);         { az †bra sz°ne }
      Rectangle(x,y,a+x,b+y); { tÇglalap rajzol†sa }

      SetColor(Red);          { az Åzenet sz°ne }
      SetTextStyle(DefaultFont,HorizDir,1);
      OutTextXY(320,190,'Nyomjon <Enter>-t');
      readln;
      Closegraph;
    end
  else
    begin
      writeln('Grafikus hiba: ',GraphErrorMsg(gr));
      readln;
      halt(1);
    end;
end.