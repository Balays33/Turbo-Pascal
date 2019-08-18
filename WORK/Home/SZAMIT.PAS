Program Bal;
   uses crt;
   var a,b,c:integer;
           e:real;
           x:char;
  Begin
    clrscr;
    randomize;
    textbackground(0);
    clrscr;
    a:=random(20);
    window(12,5,40,9);
    textcolor(4);
    textbackground(2);
    clrscr;
    write('K‚rem a B ‚rt‚k‚t B ');
    readln(b);
    write('K‚rem a C ‚rt‚k‚t C ');
    readln(c);
    write('V lasz mveletet');
    readln(x);
    case x of
     '+':begin
           e:=sqr(a)+b+c;
         end;
     '-':begin
           e:=sqr(a)+b-c;
         end;
     '*':begin
           e:=a*b*c;
         end;
     '/':begin
           if  c=0 then begin
                          write('Nem jo a C ‚rt‚ked te B....');
                        end;
           e:=(a+b)/c
         end;
    end;
    writeln;
    textcolor(1);
    write('Az eredm‚ny ',e:6:3);
    readln;
  End.