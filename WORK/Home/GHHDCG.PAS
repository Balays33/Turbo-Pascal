{PÇri J.}
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
    write('* NêGYZET *');
    gotoxy(33,4);
    write('***********');
  end;
  procedure lablec;
      begin
        textcolor(cyan);
        gotoxy(22,23);
        writeln('A vezÇrlÇs az ENTER billentyÅvel mÅkîdik');
        textcolor(white);
        readln;
      end;
  procedure beeker;
    begin
      gotoxy(16,5);
      write('Ez a program egy nÇgyzet kerÅletÇt, teruletÇt adja meg');
      gotoxy(01,7);
      write('Add meg a neved ');
      readln(nev);
      gotoxy(01,9);
      write('Add meg a nÇgyzet oldal†t ',nev ,':');
      readln(a);
      gotoxy(30,11);
    end;
 procedure szamol;
   begin
     d:=a*a;
     gotoxy(22,13);
     write('A nÇgyzet terÅlete ',nev ,' :',d);
     c:=(4*a);
     readln;
     gotoxy(22,15);
     write('A nÇgyzet kerÅlete ',nev ,':',c);
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
    write('* ');textcolor(31);write('vÇge');textcolor(white);write(' *');
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








