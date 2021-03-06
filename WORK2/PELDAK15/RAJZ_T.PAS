(* rajz_t.pas *)
program rajz_t;
uses graph, crt;
var
  a,b      : integer;  { a t�glalap oldalai }
  gd,gm,gr : integer;
  x,y      : integer;  { a be�ltet�s koordin�t�i }

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
                           write('Hib�s adat!: Sz�k�z');
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
  { Sz�veges �zemm�d be�ll�t�sa }
  TextMode(C40);
  TextBackground(blue); { h�tt�rsz�n }
  clrscr;

  GotoXY(2,5);
  TextColor(Magenta);   { bet�sz�n }
  write('T�glalap adatai');
  olvas('a oldal: ',0,a);
  olvas('b oldal: ',2,b);
  GotoXY(2,14);
  TextColor(Magenta);
  write('A be�ltet�s helye');
  olvas('x koordin�ta: ',6,x);
  olvas('y koordin�ta: ',8,y);

  { grafikus �zemm�dra v�lt�s }
  gd:=VGA; gm:=VGAHi;
  InitGraph(gd,gm,'');
  gr := GraphResult;
  if gr = grOK then
    begin
      SetBkColor(Cyan);    { a h�tt�r sz�ne }
      SetColor(Red);       { a fejl�c sz�ne }
      { a sz�veg elhelyez�se a koordin�tapont k�r�l }
      SetTextJustify(CenterText,BottomText);
      { a sz�veg st�lusa, ir�nya �s nagys�ga }
      SetTextStyle(DefaultFont,HorizDir,1);
      OutTextXY(320,10,'T�glalap rajzol�sa');

      SetColor(White);         { az �bra sz�ne }
      Rectangle(x,y,a+x,b+y); { t�glalap rajzol�sa }

      SetColor(Red);          { az �zenet sz�ne }
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