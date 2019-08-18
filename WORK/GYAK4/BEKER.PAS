program beker;
uses crt;
var a:array[1..10,1..10] of integer;
    i,j,n,m:integer;
begin
  clrscr;
  writeln('A m trix m‚rete: n*m');
  write('n=');readln(n);
  write('m=');readln(m);
  for i:=1 to n do
     begin
        for j:=1 to m do
           begin                {nem egym s al  ¡rja az elemeket, hanem
                                   ugyan arra a helyre }
              clrscr;
              gotoxy(3,3);
              write('a[',i:2,',',j:2,']=');readln(a[i,j]);
           end;
     end;
  writeln;
  for i:=1 to n do
     begin
        for j:=1 to m do
           begin
              write(a[i,j]:5);
           end;
           writeln;
     end;
  readln;
end.