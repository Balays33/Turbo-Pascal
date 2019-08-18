program honap;
uses crt;
var h,n:integer;
    v:char;
    szov:string;
begin
  writeln('Add meg a d tumot');
  repeat
     v:='1';
      write('h¢nap: '); readln(h);
     if (h>12) or (h<1) then begin
                             v:='0';
                             writeln('rossz h¢nap');
                             end;

     write('nap: '); readln(n);
     if (n>31) or (n<1) then begin
                             v:='0';
                             writeln('rossz nap');
                             end
   until v='1';
   case h of
           1: szov:='janu r';
           2: szov:='febru r';
           3: szov:='m rcius';
           4: szov:=' prilis';
           5: szov:='m jus';
           6: szov:='j£nius';
           7: szov:='j£lius';
           8: szov:='augusztus';
           9: szov:='szeptember';
           10: szov:='okt¢ber';
           11: szov:='november';
           12: szov:='december';
           end;
   writeln('A d tum: ',szov,' ',n);
   readln;
   end.