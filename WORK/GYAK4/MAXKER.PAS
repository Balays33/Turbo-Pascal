program maxker;
uses crt;
var n,i,mind,max:integer;
             a:array[1..1000] of integer;
begin
   clrscr;
   writeln('k‚rem az n ‚rt‚k‚t, n=   ');
   readln(n);
   for i:=1 to n do
   begin
      write('a[',i,']=');
      readln(a[i]);
   end;
   max:=a[1];   mind:=1;
   for i:=2 to n do
     if a[i]>max then
     begin
       max:=a[i];
       mind:=i;
     end;
   writeln('maxim lis ‚rt‚k: ',max:5);
   writeln('max.elem indexe: ',mind:5);
   readln;
end.