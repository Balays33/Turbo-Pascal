program informat;
uses crt;
const sz:string='INFORMATIKA';
begin
  clrscr;
  writeln(sz);
  sz:=copy(sz,2,length(sz)-2);
  writeln(' ',sz);
  sz:=copy(sz,2,length(sz)-2);
  writeln('  ',sz);
  sz:=copy(sz,2,length(sz)-2);
  writeln('   ',sz);
  sz:=copy(sz,2,length(sz)-2);
  writeln('    ',sz);
  sz:=copy(sz,2,length(sz)-2);
  writeln('     ',sz);
  readln;
end.