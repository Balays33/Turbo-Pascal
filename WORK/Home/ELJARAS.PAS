Program Eljaras;
   uses crt;
   var a,k,t:integer;

  procedure kerulet;
   begin
     write('A ker�letet ');
     k:=2*a;
     writeln;
     writeln(k);
   end;

  procedure terulet;
   begin
     write('A ter�let');
     t:=a*a;
     writeln;
     writeln(t);
   end;

  procedure logo;
   begin
     textcolor(4);
     window(16,1,40,6);
     clrscr;
     write('K�sz�t�: Barcza Bal�zs');
   end;
 Begin
   textbackground(0);
   randomize;
   a:=random(20)+1;
   writeln(a);
   logo;
   window(1,1,15,7);
   kerulet;
   terulet;
   readln;
 end.
