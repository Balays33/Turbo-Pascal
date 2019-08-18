program gyokvon;
uses crt;
var
   kezd,veg,lepeskoz,
   y,x               : real;
   j                 : integer;
   c                 : char;
const
 fejlec='    x      a n‚gyzetgy”ke ';
begin
   clrscr;
   j:=0;
   writeln('n‚gyzetgy”k - t bl zat');
   write('mett“l: ');
   read(kezd);
   write('meddig: ');
   read(veg);
   write('l‚p‚sk”z: ');
   read(lepeskoz);
   clrscr;
   writeln(fejlec);
   writeln;
   x:=kezd;
   repeat
         j:=j+1;
         if j=20 then
            begin
               j:=0;
               writeln;
               writeln('Tetsz“leges billenty–re tov bb');
               c:=readkey;
               clrscr;
               writeln(fejlec);
               writeln;
            end;
           y:=sqrt(x);
         writeln(x:6:2,y:15:4);
         x:=x+lepeskoz;
    until x>veg;
      writeln;
      writeln('Tetsz“leges billenty–re befejez“dik');
      c:=readkey;
end.
