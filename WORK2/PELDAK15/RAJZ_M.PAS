(* rajz_m.pas *)
program rajz_m;
uses graph,crt;
var
    a,b        : integer;  { a t�glalap oldalai }
    gd,gm,gr   : integer;
    x,y        : integer;  { a be�ltet�s koordin�t�i }
    szin1,szin2: word;
    Xasp,Yasp  : word;
    maxX,MaxY  : integer;

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
   TextBackground(blue); { h�tt�r sz�ne }
   clrscr;
   GotoXY(2,5);
   TextColor(Magenta); { �r�s sz�ne }
   write('T�glalap adatai');
   olvas('a oldal: ',0,a);
   olvas('b oldal: ',2,b);
   GotoXY(2,14);
   TextColor(Magenta);
   write('Bal fels� (x,y) sarokpontja: ');
   olvas('x : ',6,x);
   olvas('y : ',8,y);

   { grafikus �zemm�dra v�lt�s }
   DetectGraph(gd,gm);

   case gd of
   CGA:      begin { CGA }
               gm:=CGAC1;
               szin1:=1;
               szin2:=2;
             end;
   EGA:      begin { EGA }
               gm:=EGALo;
               szin1:=Red;
               szin2:=Blue;
             end;
   EGA64:    begin { EGA64 }
               gm:=EGA64Lo;
               szin1:=Red;
               szin2:=Blue;
             end;
   HercMono: begin { Hercules }
               gm:=HercMonoHi;
               szin1:=1;
               szin2:=1;
             end;
   VGA:      begin  { VGA }
               gm:=VGAHi;
               szin1:=Red;
               szin2:=Blue;
             end;
   end;
   InitGraph(gd,gm,'');     { grafikus m�dba v�lt�s }
   gr := GraphResult;
   if gr = grOK then
     begin
       if gd <> HercMono then SetBkColor(Cyan);    { a h�tt�r sz�ne }

       SetColor(szin1);       { a fejl�c sz�ne }
       { a sz�veg elhelyez�se a koordin�tapont k�r�l }
       SetTextJustify(CenterText,BottomText);
       { a sz�veg st�lusa, ir�nya �s nagys�ga }
       SetTextStyle(DefaultFont,HorizDir,1);
       maxX:=GetMaxX;
       maxY:=GetMaxY;
       if a=b then  OutTextXY(MaxX div 2,15,'N�gyzet rajzol�sa')
              else  OutTextXY(MaxX div 2,15,'T�glalap rajzol�sa');

       SetColor(szin2);         { az �bra sz�ne }
       if a=b then begin        { n�gyzet rajzol�sa }
                    GetAspectRatio(Xasp,Yasp);
                    b:=Round((Xasp/Yasp)*a); { torzit�s sz�m�t�sa}
                   end;
       Rectangle(x,y,a+x,b+y); { ha a<> b : t�glalap rajzol�sa }

       SetColor(szin1);          { az �zenet sz�ne }
       SetTextStyle(DefaultFont,HorizDir,1);
       OutTextXY(maxX div 2,maxY-10,'Nyomjon <Enter>-t');
       readln;
       RestoreCrtMode;
       TextBackground(blue); { h�tt�r sz�ne }
       clrscr;
       GotoXY(2,5);
       TextColor(Magenta); { ir�s sz�ne }
       write('A k�r adatai: ');
       olvas('sug�r: ',0,a);
       GotoXY(2,14);
       TextColor(Magenta);
       write('A k�r k�z�ppontja (x,y): ');
       olvas('x : ',4,x);
       olvas('y : ',6,y);
       SetGraphMode(GetGraphMode);
       if gd <> HercMono then SetBkColor(Cyan);    { a h�tt�r sz�ne }
       SetColor(szin1);       { a fejl�c sz�ne }
       { a sz�veg elhelyez�se a koordinat�pont k�r�l }
       SetTextJustify(CenterText,BottomText);
       { a sz�veg stilusa, ir�nya �s nagys�ga }
       SetTextStyle(DefaultFont,HorizDir,1);
       maxX:=GetMaxX;
       maxY:=GetMaxY;
       OutTextXY(MaxX div 2,15,'K�r rajzol�sa');

       SetColor(szin2);         { az �bra sz�ne   }
       circle(x,y,a);           { a k�r rajzol�sa }
       SetColor(szin1);         { az �zenet sz�ne }
       SetTextStyle(DefaultFont,HorizDir,1);
       OutTextXY(maxX div 2,maxY-10,'Nyomjon <Enter>-t');
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