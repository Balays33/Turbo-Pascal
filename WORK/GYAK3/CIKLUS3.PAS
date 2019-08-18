program ciklus3;                                        
uses crt;
var
 i,s,n,k : integer;
 x,v:real;
 c     : char;
begin
 clrscr;
 writeln('sz mok n‚gyzet”sszeg‚nek sz mol sa');
 write('H ny sz m n‚gyzet”sszeg‚re k¡v ncsi?(max 45) ');
 readln(n);
 s:=0;
 for i:=1 to n do
  s:=s+sqr(i);
 writeln('Az els“ ',n,' term‚szetes sz m n‚gyzet”sszege: ',s);
 c:=readkey;
 {********************************************************}
  clrscr;         {bek‚rt sz m i-dik hatv nya }
  writeln('bek‚rt sz m i-ik hatv nya');
  write('K‚rem az eg‚sz sz mot! ');
  readln(i);
  writeln(' 0-ik hatv nya=           1');
  x:=1;
  for k:=1 to 10 do
    begin
    x:=x*i;
    writeln(k:2,'-ik hatv nya',x:13:0);
    end;
  c:=readkey;
 {********************************************************}
     { n.ik hatv ny sz mol sa}
    clrscr;
    x:=2;
    writeln('2-nek a hatv nyai:');
    writeln('   n    2 n-ik hatv.');
    writeln('------------------');
    for i:= 0 to 10 do
    begin
       write(i:5);
       v:=exp(i*ln(x));
       writeln(v:9:0);
    end;
    readln;

 {********************************************************}
    { sz mok ki¡rat sa oszlopokba 5-‚vel)}
    k:=0;
    repeat
       for i:=k*10 to (k+1)*10 do write(i*5:4);
       writeln;
       k:=k+1
    until k>10;
    readln;
   {********************************************************}

end.
