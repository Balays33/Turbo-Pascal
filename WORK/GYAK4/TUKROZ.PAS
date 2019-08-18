program tukroz;                    { 5*5 îs m†trix tÅkrîzÇse a fì†tl¢ra}
uses crt;
var
   m:array[1..5,1..5] of integer;
   uj:array[1..5,1..5] of integer;
   i,j,x: integer;
begin
clrscr;
     randomize;
     for i:=1 to 5 do
         begin
              writeln;
              for j:= 1 to 5 do
                  begin
                       m[i,j]:=random(101);
                       if i=j then textcolor(red+128)
                              else textcolor(cyan);
                       write(m[i,j]:5);
                  end;
         end;
      textcolor(white);
      writeln;
      for j:=1 to 5 do
          begin
               writeln;
               for i:=1 to 5 do
                   write(m[i,j]:5);
          end;
      readln;
end.