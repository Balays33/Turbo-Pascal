Program masodfoku;
   uses crt;
   var a,b,c:integer;
           x:real;
    Begin
      clrscr;
      textbackground(4);
      clrscr;
      textcolor(1);
      textbackground(24);
      window(20,3,60,10);
      clrscr;
      write('  K‚rem a A sz mot A:');
      readln(a);
      write('  K‚rem a B sz mot B:');
      readln(b);
      write('  K‚rem a C sz mot C:');
      readln(c);
      If (((sqr(b)-(4*a*c))))<=0 then begin
                                   Write(' A sz maid nem j¢k add meg £jra. ');
                                   Writeln;
                                   Write(' K‚rem a A sz mot A: ');
                                   readln(a);
                                   Write(' K‚rem a B sz mot B: ');
                                   readln(b);
                                   write(' K‚rem a C sz mot C: ');
                                   readln(c);
                                   end;

      x:=b+(sqrt(sqr(b)-4*a*c))/(2*a);
      Write('  Az eredm‚ny ',x:12:40);
      readln;
    End.