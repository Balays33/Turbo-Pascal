program be_ell;
uses crt;
var i,j,n,m: integer;
    a:array[1..15,1..15] of integer;
begin
  clrscr;
  writeln('A m trix n*m-es (max. 15).');
  write('n='); readln(n);
  write('m='); readln(m);
    for i:=1 to n do
      for j:=1 to m do
          begin
            write('a[',i,',',j,']=');
            readln(a[i,j]);
            if (a[i,j]<=-20) or (a[i,j]>=20) then
               begin
                  writeln('Az ‚rt‚k nem -20 es +20 k”z‚ esik.');
                  j:=j-1;
               end;
          end;
    for i:=1 to n do
      begin
        for j:=1 to m do write(a[i,j]:4);
        writeln;
      end;
  readln;
end.