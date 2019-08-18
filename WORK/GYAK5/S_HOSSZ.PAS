program p5rekur2;   {sz”veg hossz nak megad sa}
uses crt;
type szo=string[80];
function hossz(s:szo):integer;
begin
   if s='' then hossz:=0
           else begin
              delete(s,1,1);
              hossz:=1+hossz(s);
           end;
end;
var s,sf:szo;
    i,n:integer;
   begin
      clrscr;
      write('k‚rem a sz”veget: ');
      readln(s);
      writeln('a hossza: ',hossz(s));
      readln;
      n:=hossz(s);
      for i:= 1 to n do
                    sf:=sf+copy(s,n-i+1,1);
      writeln('a forditott sz”veg: ',sf);
      readln;
   end.
