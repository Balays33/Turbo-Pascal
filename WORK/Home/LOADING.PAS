Program Loading;
   uses crt;
   var i,k:integer;
   sz:string;
Begin
clrscr;
randomize;
  k:=0;
  sz:='²Û²';
  gotoxy(37,9);
  write('loading');
  window(30,10,50,10);
  textbackground(0);
  textcolor(2);
repeat
  for i:=1 to (22-length(sz)) do
       begin
         clrscr;
         gotoxy(i,1);
         write(sz);
         delay(50);
       end;
  for i:=(22-length(sz)) downto 1 do
       begin
         clrscr;
         gotoxy(i,1);
         write(sz);
         delay(50);
       end;
  k:=k+1;
until k=3;
clrscr;
end.