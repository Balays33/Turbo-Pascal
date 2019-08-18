program max_ind;
uses crt;
var a: array[1..10,1..10] of integer;
    i,j,min,max,mini,maxi: integer;
begin
  clrscr;
  randomize;
  for i:=1 to 10 do
    for j:=1 to 10 do a[i,j]:=random(50)+1;
  max:=a[1,1]; min:=a[1,1];
  maxi:=1; mini:=1;
  for i:=1 to 10 do
    for j:=1 to 10 do
       if a[i,j]>max then max:=a[i,j]
                     else if a[i,j]<min then min:=a[i,j];
  for i:=1 to 10 do
    begin
      for j:=1 to 10 do
        begin
          if a[i,j]=max then textcolor(red)
                        else if a[i,j]=min then textcolor(blue)
                                           else textcolor(white);
          write(a[i,j]:5);
        end;
      writeln;
    end;
  writeln;
  writeln('A maxim lis ‚rt‚k:',max:3);
  write('az index(ek):');
  writeln;
  for i:=1 to 10 do
      for j:=1 to 10 do
          if a[i,j]=max then write('a[',i:2,',',j:2,']  ');
  writeln;
  writeln;
  writeln('A minim lis ‚rt‚k:',min:3);
  write('az index(ek):');
  writeln;
  for i:=1 to 10 do
      for j:=1 to 10 do
          if a[i,j]=min then write('a[',i:2,',',j:2,']  ');
  readln;
end.