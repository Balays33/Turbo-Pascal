{P�ri J.}
Program negyzet;
   uses crt;
   var a :byte;
   var c,d:integer;
   var nev:string;
 procedure fejlec;
  begin
    gotoxy(33,2);
    write('***********');
    gotoxy(33,3);
    write('* N�GYZET *');
    gotoxy(33,4);
    write('***********');
  end;
  procedure lablec;
      begin
        textcolor(cyan);
        gotoxy(22,23);
        writeln('A vez�rl�s az ENTER billenty�vel m�k�dik');
        textcolor(white);
        readln;
      end;
  procedure beeker;
    begin
      gotoxy(16,5);
      write('Ez a program egy n�gyzet ker�let�t, terulet�t adja meg');
      gotoxy(01,7);
      write('Add meg a neved ');
      readln(nev);
      gotoxy(01,9);
      write('Add meg a n�gyzet oldal�t ',nev ,':');
      readln(a);
      gotoxy(30,11);
    end;
 procedure szamol;
   begin
     d:=a*a;
     gotoxy(22,13);
     write('A n�gyzet ter�lete ',nev ,' :',d);
     c:=(4*a);
     readln;
     gotoxy(22,15);
     write('A n�gyzet ker�lete ',nev ,':',c);
     readln;
     end;
 procedure bucsu;
  begin
    gotoxy(33,19);
    textcolor(white);
    write('SZIA ');textcolor(green);write( nev );textcolor(white);write(' .');
    readln;
    end;
 procedure vege;
   begin
    textcolor(white);
    gotoxy(35,12);
    write('********');
    gotoxy(35,13);
    write('* ');textcolor(31);write('v�ge');textcolor(white);write(' *');
    gotoxy(35,14);
    write('********');
    readln;
  end;
  begin
   clrscr;
   fejlec;
   lablec;
   beeker;
   szamol;
   clrscr;
   fejlec;
   lablec;
   bucsu;
   clrscr;
   fejlec;
   lablec;
   vege;
  end.








