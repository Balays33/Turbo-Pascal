Program Hazi;                    {Barcza Bal�zs 2004 03 13}
   uses crt;                     {DJVMN2}
   var i:integer;                {M�szaki Informatika}
        ch:char;
   const menu:array[1..5] of string[25]=         {Men� k�sz�t�se}
              ('1   - M�trix Sz�m�t�sok',
               '2   - Rendez�sek       ',
               '3   - Le�r�s           ',
               '4   - Demo J�t�k       ',
               'ESC -  Quit          ');
Procedure bevezeto;                        {Intro K�perny� sz�nez�se}
  Begin
    textbackground(black);
    clrscr;
    randomize;
    sound(500);
    delay(200);
    sound(400);
    delay(200);
    sound(500);
    delay(300);
    nosound;
    textcolor(green);
    clrscr;
    writeln;
    writeln;
    writeln;
    writeln;
    writeln;
    writeln;
    writeln;
writeln('    �       �  ����  ����  �����   ����   ��     �     ��   �  �  ���   ���     ');
writeln('     �     �   �     �       �    �      �  �   � �   �  �  �  �   �   �        ');
writeln('     �  �  �   ���    ��     �    � ���  ���   �   �  ���   ����   �   �        ');
writeln('     � � � �   �        �    �    �   �  � �    ���   �     �  �   �   �        ');
writeln('      �   �    ����  ����    �     ���   �  �  �   �  �     �  �  ���   ���     ');
    gotoxy(1,22);
    textcolor(white);
    writeln('  Barcza Bal�zs');
    writeln('  DJVMN2');
    writeln('  M�szaki Informatika');
    gotoxy(65,23);
    textcolor(green);
    writeln('Please  <ENTER> ');
    readln;
  end;
Procedure Matr;                              {H�t�r k�sz�t�se for ciklus seg�ts�g�vel}
  var x,i:integer;
begin
clrscr;
  for i:=1 to 480 do
   begin
     x:=random(10);
     write(x:4);
   end;
end;
Procedure Loading;                           {Loading T�lt�s}
   var i,k:integer;
   sz:string;
Begin
randomize;
  k:=0;
  sz:='�۲';
  gotoxy(36,9);
  write(' Loading ');
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
until k=1;
clrscr;
end;
Procedure Keret;
  Begin
    window(1,1,80,25);
    clrscr;
    window(1,24,80,25);
    textcolor(white);
    textbackground(1);
    gotoxy(64,1);
    write('West Graphic 1.00');
    window(6,3,60,23);
  end;
Procedure F1;                              {F�program M�trix sz�m�t�sok}
   var a,db:integer;
           c,f,y:char;
       ossz:integer;                  {�sszeg dekral�l�sa}
       atlag:real;
       v:array[1..15] of integer;          {Vektor dekral�l�sa}
                         b:byte;
       m:array[1..15,1..15] of integer;    {Matrix dekral�l�sa}
                              i,s:byte;    {Sorindex}
                              j,o:byte;    {Oszlopindex}
  begin                              {Matrix L�trehoz�sa}
randomize;
clrscr;
ossz:=0;
textcolor(blue);
  writeln(' Mivel szeretn�d felt�lteni a M�trix-ot');
  write(' Billenty�zet vagy V�letlen m�dszerrel (b/v)? ');
  readln(c);
  if c='b' then Begin                      {Matrix B/V felt�lt�se oszlopfolytonosan}
                  repeat
                    write('K�rem a M�trix sorainak sz�m�t s: ');
                    readln(s);
                    write('K�rem a M�trix oszlopainak sz�m�t o: ');
                    readln(o);
                    db:=s*o;
                  until (s<6) and (o<6);
                  for j:=1 to o do
                                begin
                                  v[j]:=0;
                  for i:=1 to s do
                                begin
                                  write('m[',i,',',j,']=');
                                  readln(m[i,j]);
                                  ossz:=ossz+m[i,j];
                                  v[j]:=v[j]+m[i,j];
                                end;
                                end;
                end
           else Begin                      {Matrix v�letlen felt�lt�se}
                  write('Megadod a M�trix sorai �s oszlopait (y/n)? ');
                  readln(f);
                  if f='y' then begin
                                  repeat
                                    write('K�rem a M�trix sorainak sz�m�t (max 15) s: ');
                                    readln(s);
                                    write('K�rem a M�trix oszlopainak sz�m�t (max 15) o: ');
                                    readln(o);
                                    db:=s*o;
                                    until (s<=15) and (o<=15);
                                end
                           else begin
                                  s:=random(15)+1;
                                  o:=random(15)+1;
                                end;
                  clrscr;
                  db:=s*o;
                  for j:=1 to o do
                                begin
                                  v[j]:=0;
                  for i:=1 to s do
                                begin
                                  m[i,j]:=random(198)-99;
                                  ossz:=ossz+m[i,j];
                                  v[j]:=v[j]+m[i,j];
                                end;
                                end;
                end;
  for i:=1 to s do                         {Matrix ki�rat�sa}
                begin
                  writeln;
                  for j:=1 to o do begin if m[i,j]>0 then  textcolor(3)
                                else textcolor(blue);
                  write(m[i,j]:4); end;
                end;
atlag:=ossz/db;       {!!!!!!!! osszt�s !!!!!!!!}
writeln;
textcolor(green);
writeln('Matrix �sszege:=', ossz);
writeln('Matrix �tlaga:=', atlag);
writeln('Matrix oszlopainak �sszege: ');
  for j:=1 to o do write(v[j]:4);
gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
    readln;
clrscr;
writeln;
textcolor(green);
write('A H�rommal oszthat� sz�mok a M�trixban');
for i:=1 to s do                         {Matrix ki�rat�sa a 3-mal osszthat� sz�mok}
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
write('A p�ros sz�mok a M�trixban');
for i:=1 to s do                         {Matrix ki�rat�sa a p�ros sz�mok}
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
write('A negativ sz�mok a M�trixban');
for i:=1 to s do                         {Matrix ki�rat�sa a negativ sz�mok}
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
write('A p�ros �s negativ �s h�rommal oszthat�k sz�mok a M�trixban');
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
  end;
Procedure F3;
  begin
    clrscr;
    gotoxy(65,24);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
    window(15,1,65,20);
    textbackground(9);
    textcolor(4);
    clrscr;
    writeln;
    write('K�sz�n�m ,hogy West Graphic programcsomagot        v�lasztottad. ');
    write('1: M�trix Sz�m�t�sokkal foglalkozik: (p�ros,negat�v,3-mal oszthat� sz�mokat keresi meg a M�trix-ban  ');
    write('2: Rendez�s v�letlen sz�mokat rendezi cs�kken� �s n�vekv� sorendben ');
    writeln('3: Le�r�s 4: J�t�k   Egyszer� j�t�kprogram hogy a munka mellett legyen  egy kis szorak�z�s');
    writeln;
    writeln('Barcza Bal�zs');
    writeln('Djvmn2');
    writeln('M�szaki Informatika');
    writeln('2004 03 12');
    gotoxy(17,20);
    textcolor(green);
    write('West Graphic A J�v� m�r elkezd�d�tt');
    window(66,1,80,4);
    textbackground(7);
    textcolor(9);
    clrscr;
    write('     �� � ��');
    writeln;
    write('      � � � ');
    writeln;
    write('       ���  ');
    writeln;
    write('       {$} ');
    readln;
  end;
Procedure Menuki;           {Men� ki�r�sa}
  begin
    textcolor(green);
    gotoxy(32,10);
    write('1: M�trix Sz�m�t�sok');
    gotoxy(32,11);
    write('2: Rendez�s');
    gotoxy(32,12);
    write('3: Le�r�s');
    gotoxy(32,13);
    write('4: Demo J�t�k');
    gotoxy(30,14);
    write('Esc: Kil�p�s');
  end;
Procedure F2;                          {Rendez�s}
  var v:array[1..20] of integer;
                        i:byte;
                        j:byte;
      n,w:integer;
  begin
    clrscr;
    randomize;
    repeat
    write(' Mekkora sorozattal szeretn�l dolgozni ? n:= ');
    readln(n);
    until n<=20;
    for i:=1 to n do begin
                       v[i]:=random(198)-99;
                     end;
    writeln(' Sorrozat amit l�trehozt�l v�letlenszer�en .');
    for i:=1 to n do begin
                       write(v[i]:4);
                     end;
    writeln;
    writeln(' A vektor cs�kken� sorendben  ');  {Cs�kken� soredbe rendez�s}
    for j:=1 to n-1 do
    for i:=j+1 to n do if v[j]<v[i] then begin
                                         w:=v[i];
                                         v[i]:=v[j];
                                         v[j]:=w;
                                       end;
    for i:=1 to n do write(v[i]:4);
     writeln;
    writeln(' A vektor n�vekv� sorendben  ');   {N�vekv� sorendbe rendez�s}
    for j:=1 to n-1 do
    for i:=1+j to n do if v[j]>v[i] then begin
                                         w:=v[i];
                                         v[i]:=v[j];
                                         v[j]:=w;
                                       end;
    for i:=1 to n do write(v[i]:4);

    gotoxy(65,23);
    textcolor(green+128);
    writeln('Please  <ENTER> ');
    readln;
  end;
Procedure F4;
  var x,y,h:integer;
          v:char;
  begin
    clrscr;
    randomize;
    x:=random(1000);
    writeln('Gondolt a sz�m�t�g�p egy sz�mra (1-1000)');
    h:=0;
    repeat
    write('Mi ez a sz�m ? ');
    readln(y);
    h:=h+1;
    if y<=x then if y=x then writeln('Nyert�l meg van a kereset sz�m',' ',x)
                        else writeln('A gondolt sz�m nagyobb')
              else writeln('A gondolt sz�m kissebb');
    until (y=x);
    write('H�ny l�p�sb�l tal�ltad el', h:5);
    readln;
  end;
Begin                        {F�program procedur�k megh�v�sa}
 clrscr;
 bevezeto;
 matr;
 loading;
 Keret;
repeat
  window(1,1,80,24);
  textbackground(0);
  textcolor(4);
  clrscr;
  menuki;
  gotoxy(12,1);
  ch:=readkey;
  case ch of
       '1':F1;
       '2':F2;
       '3':F3;
       '4':F4;
       end;
until ch=#27;
end.
