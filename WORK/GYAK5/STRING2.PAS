program string1;                                        {string.pas}
uses crt;

var
   a: string[40];
   b: string[4];
   c: string[4];
   i: integer;
begin
    clrscr;
    writeln('k�rem a sz�veget');
    readln(a);
    writeln('a sz�veg hossza:',length(a));
    writeln;
    b:=copy(a,1,4);
    c:=copy(a,length(a)-3,4);
    writeln('az els� �s az utols� 4 karakter egy�tt:',b+c);
    readln;
    writeln;
    for i:=1 to length(a) do
    insert('e',a,i*2);
    writeln('a sz�veg "e"-kel b�v�tve:',a);
    readln;


end.