program string1;                                        {string.pas}
uses crt;

var
   a: string[40];
   b: string[4];
   c: string[4];
   i: integer;
begin
    clrscr;
    writeln('kÇrem a szîveget');
    readln(a);
    writeln('a szîveg hossza:',length(a));
    writeln;
    b:=copy(a,1,4);
    c:=copy(a,length(a)-3,4);
    writeln('az elsì Çs az utols¢ 4 karakter egyÅtt:',b+c);
    readln;
    writeln;
    for i:=1 to length(a) do
    insert('e',a,i*2);
    writeln('a szîveg "e"-kel bìv°tve:',a);
    readln;


end.