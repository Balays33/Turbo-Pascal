program ablak5;             {A fì†tl¢ mentÇn ablakok kÇsz°tÇse, kÅl.sz°nnel)}
uses crt;
var a,i,x,y:integer;
begin
  window(1,1,80,25);
  textbackground(0);
  textcolor(15);
  clrscr;
  write('Mennyi ablak legyen? ');
  readln(a);
  window(1,1,80,25);
  textbackground(0);
  textcolor(15);
  clrscr;
  for i:=1 to a do
  begin
    x:=80 div a;
    y:=25 div a;
    window(i*x-x+1,i*y-y+1,i*x,i*y);
    textbackground(i);
    textcolor(i+1);
    clrscr;
    writeln(i,'-dik');
  end;
  readln;
end.