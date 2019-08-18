program mezo2;
uses crt;
var
   i,j,k: integer;
begin
   clrscr;
   i:=120; j:=-12; k:=+100;
   writeln('Standard kiirat s');
   writeln(i,j,k);                  {Egym s nyak ra ¡rta ki az adatokat!}
   writeln('Eredm‚ny sz”veges kiirat sa');
   writeln('i=',i,' j=',j,' k=',k);                      {Igy m r szebb!}
   writeln('Kiirat s mez“sz‚less‚ggel');
   writeln(i:4,j:5,k:6);
   writeln('i=',i:3,' j=',j:4,' k=',k:4);
   writeln('Helytelen mez“sz‚less‚g megad sa');
   writeln(i:1,j:2,k:3);
   writeln('Kifejez‚s kiirat sa');
   writeln('k+i=',k+i);
   writeln('Konstansok kiirat sa');
   writeln(12,-100);
   writeln(12:4,-100:5);
   readln;
end.
