program vektorpelda;
uses crt;
const n=10;
var v:array[1..n] of byte;
{Adatbekeres n elemu vektorba}
procedure adatbekeres;
  var i:integer;
  begin
    for i:=1 to n do
      begin
        write('Kerem a(z) ',i,'. elemet:');
        readln(v[i]);
      end;
  end;
{Vektor elemeinek kiiratasa}
procedure adatkiiras;
  var i: integer;
  begin
    for i:=1 to n do
      write(v[i]:4);
  end;
{Buborek rendezes}
procedure buborek;
  var i: integer;
      seged: byte;
      nemcsere: boolean;
  begin
    repeat
      nemcsere:=true;
      for i:=1 to n do
        if v[i-1]>v[i] then
          begin
            seged:=v[i-1];
            v[i-1]:=v[i];
            v[i]:=seged;
            nemcsere:=false;
          end;
    until nemcsere;
  end;
{Szelekcios rendezes}
procedure szelekcio;
  var kuszob,i,minpos:integer;
      min,seged:byte;
  begin
    for kuszob:=1 to n-1 do
      begin
        min:=v[kuszob];
        minpos:=kuszob;
        for i:=kuszob+1 to n do
          if v[i]<min then
            begin
              min:=v[i];
              minpos:=i;
            end;
        seged:=v[kuszob];
        v[kuszob]:=v[minpos];
        v[minpos]:=seged;
      end;
   end;
{Foprogram}
begin
  clrscr;
  adatbekeres;
  adatkiiras;
  writeln;
  buborek;
  szelekcio;
  adatkiiras;
  readln;
end;
  end;