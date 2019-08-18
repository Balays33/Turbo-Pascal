program ciklus2;       {p‚ld k ciklus gyakorl sra} 
uses crt;

var                             {100 sz m  tlaga}
    i,j,x,sz:integer;
    l,k,a,n: integer;
    s:real;
begin
     clrscr;
     s:=0;
     for x:=1 to 100 do
     s:=s+x;
     s:=s/100;
     writeln('az els“ 100 sz m  tlaga=',s:5:2);
     readln;
       {*************************************************}
  clrscr;                        {bek‚rt sz mok  tlaga}
  writeln('bek‚rt sz mok  tlaga');
  s:=0;
  writeln('h ny sz mot akar?');
  readln(n);
  for i:=1 to n do begin
     writeln('K‚rem az ',i,'  sz mot:');
     readln(x);
     s:= s+x;
     end;
  s:=s/n;
  writeln('az ',n,' db sz m  tlaga:',s:10:2);
  readln;
     {*************************************************}
     writeln('faktori lis sz mol s');
     writeln('k‚rem a sz mot');   {faktori lis sz mol s}
     readln(x);
     s:=1;
     for i:=1 to x do
     s:=s*i;
      writeln(' ',x,'!=',s,' azaz:',s:15:2);
     readln;
     {*************************************************}
     writeln('sz mok ki¡rat sa 5-‚vel');
     for j:=0 to 9 do              {5 t“l 5 ‚vel 500ig}
     begin                         { ki¡rat sa        }
        sz:=j*50+5; i:=1;
        repeat
           write(sz:5);
           sz:=sz+5;
           i:=i+1;
         until i>10;
         writeln;
      end;
         readln;
   {********************************************************}
          clrscr;
 writeln('sz mok ki¡r sa 5-‚vel 10 db egy sorba );
 for i:=5 to 500 do
  begin
  if ((i+10) mod 5=0) then write(i:4);
  if i mod 50 =0 then writeln;
  end;
 c:=readkey;
 {********************************************************}
   writeln('sz mok ki¡r sa 5-‚vel, 10 db egy sorban');
   write('Adja meg, hogy mennyi szamon vegezzem el a muveletet.');
   readln(a);
   for i:=1 to a do begin
   k:=k+1;
   l:=l+5;
   if k=10 then begin write(l:5,' ');
                   writeln;
                   k:=0;
                   end
            else write(l:5,' ');

   end;
   readln;
   {********************************************************}
end.