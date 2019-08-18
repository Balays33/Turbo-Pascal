program if1;
uses crt;
var a,b,c,max,d:integer;
    atl:real;
begin
  clrscr;
  write('K‚rem a 3 sz mot sz¢k”zzel elv lasztva:');
  readln(a,b,c);
  atl:=(a+b+c)/3;
  writeln('Az  tlaguk: ',atl:6:2);
  if a>b then if a>c then max:=a
                     else max:=c
         else if b>c then max:=b
                     else max:=c;
  writeln('A legnagyobb:',max);
  write('N”vekv“ sorrendben:');
  if a>b then if a>c then if b>c then write(c:5,b:5,a:5)
                                 else write(b:5,c:5,a:5)
                     else write(b:5,a:5,c:5)
         else if b>c then if a>c then write(c:5,a:5,b:5)
                                 else write(a:5,c:5,b:5)
                     else write(a:5,b:5,c:5);
  writeln;
  if a>b then begin
                d:=a; a:=b; b:=d;
              end;
  if b>c then begin
                d:=c; c:=b; b:=d;
              end;
  if a>b then begin
                d:=a; a:=b; b:=d;
              end;
  writeln('N”vekv“ sorrendben cser‚vel:', a:6,b:6,c:6);
  readln;
end.