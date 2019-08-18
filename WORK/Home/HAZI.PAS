Program Hazi;   {Barcza Bal†zs 2004 03 14}
   uses crt;       {DJVMN2 MÅszaki Informatika}
   var a,db:integer;
       c:char;
       ossz,atlag:integer;                       {îsszeg dekral†l†sa}
       v:array[1..15] of integer;          {Vektor dekral†l†sa}
                         b:byte;
       m:array[1..15,1..15] of integer;    {Matrix dekral†l†sa}
                              i,s:byte;    {Sorindex}
                              j,o:byte;    {Oszlopindex}
Begin                              {Matrix LÇtrehoz†sa}
randomize;
clrscr;
ossz:=0;
  writeln(' Mivel szeretnÇd feltîlteni a M†trix-ot');
  write(' Billenty˚zet vagy VÇletlen m¢dszerrel (b/v)? ');
  readln(c);
  if c='b' then Begin                      {Matrix B/V feltîltÇse oszlopfolytonosan}
                  repeat
                    write('KÇrem a M†trix sorainak sz†m†t s: ');
                    readln(s);
                    write('KÇrem a M†trix oszlopainak sz†m†t o: ');
                    readln(o);
                    db:=s*o;
                  until (s<6) and (o<6);
                  for j:=1 to o do
                  for i:=1 to s do
                                begin
                                  write('m[',i,',',j,']=');
                                  readln(m[i,j]);
                                  ossz:=ossz+m[i,j];
                                  v[j]:=v[j]+m[i,j];
                                end;
                end
           else Begin                      {Matrix vÇletlen feltîltÇse}
                  s:=random(15)+1;
                  o:=random(15)+1;
                  db:=s*o;
                  for j:=1 to o do
                  for i:=1 to s do
                                begin
                                  m[i,j]:=random(198)-99;
                                  ossz:=ossz+m[i,j];
                                  v[j]:=v[j]+m[i,j];
                                end;
                end;
  for i:=1 to s do                         {Matrix ki°rat†sa}
                begin
                  writeln;
                  for j:=1 to o do begin if m[i,j]>0 then  textcolor(3)
                                else textcolor(blue);
                  write(m[i,j]:4); end;
                end;
atlag:=ossz*db;       {!!!!!!!! osszt†s !!!!!!!!}
writeln;
textcolor(green);
writeln('Matrix îsszege:=', ossz);
writeln('Matrix †tlaga:=', atlag);
writeln('Matrix oszlopainak îsszege: ');
  for j:=1 to o do write(v[j]:4);
gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
    readln;
clrscr;
writeln;
textcolor(green);
write('A H†rommal oszthat¢ sz†mok a M†trixban');
for i:=1 to s do                         {Matrix ki°rat†sa a 3-mal osszthat¢ sz†mok}
                begin
                  writeln;
                  for j:=1 to o do begin if (m[i,j] mod 3)=0 then  textcolor(blue+128)
                                else textcolor(white);
                  write(m[i,j]:4); end;
                end;
gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
readln;
clrscr;
writeln;
textcolor(green);
write('A p†ros sz†mok a M†trixban');
for i:=1 to s do                         {Matrix ki°rat†sa a p†ros sz†mok}
                begin
                  writeln;
                  for j:=1 to o do begin if (m[i,j] mod 2)=0 then  textcolor(red+128)
                                else textcolor(white);
                  write(m[i,j]:4); end;
                end;
gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
readln;
clrscr;
writeln;
textcolor(green);
write('A negativ sz†mok a M†trixban');
for i:=1 to s do                         {Matrix ki°rat†sa a negativ sz†mok}
                begin
                  writeln;
                  for j:=1 to o do begin if m[i,j]<0 then  textcolor(yellow+128)
                                else textcolor(white);
                  write(m[i,j]:4); end;
                end;
gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
readln;
clrscr;
writeln;
textcolor(green);
write('A p†ros Çs negativ Çs h†rommal oszthat¢k sz†mok a M†trixban');
for i:=1 to s do
                begin
                  writeln;
                  for j:=1 to o do begin if ((m[i,j] mod 2)=0) and (m[i,j]<0) and ((m[i,j] mod 3)=0) then  textcolor(cyan+128)
                                else textcolor(white);
                  write(m[i,j]:4); end;
                end;
gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
readln;
end.