program eredmenyek;
uses crt;
type ered=record
            Nevek:   string[15];
            Eredmeny: integer;
           end;
var a:ered;
    f:file of ered;
    v:char;
Begin
  clrscr;
   assign(f,'ered.dat');
   {$I-}
   reset(f);
   {$I+}
   if ioresult <> 0 then rewrite(f);
   seek(f,filesize(f));
   write('adatot bevinni?(i/n)');
   readln(v);
   while (v='i') or (v='I') do
         begin
           write('nevek:');
           readln(a.nevek);
           write('eredmeny');
           readln(a.eredmeny);
           write(f,a);
           write('éj adatot bevinni?(i/n)');
           readln(v);
         end;
         clrscr;
   seek(f,0);
   window(1,1,80,25);
   textbackground(0);
   clrscr;
   window(20,3,60,20);
   textbackground(3);
   clrscr;
    writeln;
    writeln('          Nevek      Eredmeny           ');
    writeln('========================================');
   while not eof(f) do
         begin
         read(f,a);
         writeln(a.Nevek:15,a.eredmeny:15);
         end;
   close(f);
  readln;
end.