Program Balazs;
   uses crt;
   var a,b:integer;
         c:real;
    Begin
      clrscr;
      randomize;
      sound(200);
      delay(100);
      sound(400);
      delay(100);
      sound(300);
      delay(200);
      sound(800);
      delay(500);
      nosound;
      textbackground(0);
      clrscr;
      window(15,2,60,5);
      textbackground(3);
      textcolor(4);
      clrscr;
      write('              Barcza Bal zs 10.b');
      window(15,7,60,12);
      textbackground(1);
      textcolor(4);
      clrscr;
      write('AZ  A ‚rt‚ke v‚letlen A: ');
      a:=random(366+10);
      write(a);
      writeln;
      write('K‚rem a B sz mot      B: ');
      readln(b);
      if (abs(a+b)<5) and ((a+b)>10)
      then c:=(sqr(a)+sqr(b))/(abs(a-b))
      else c:=sqrt(a)+sqr(b);
      window(15,15,60,20);
      textbackground(2);
      textcolor(1);
      clrscr;
      write('Az eredm‚ny a C ‚rt‚ke ',c:6:3);
      readln;
   End.