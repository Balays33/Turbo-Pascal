program string1;     {ki¡rat s ‚rdekes form tumban}
uses crt;
var
 szov      : string[21];
 i,hossz   : integer;
 v         : char;
begin
 clrscr;
 szov:='Sz m¡t stechnika';
 hossz:=length(szov);

 for i:=1 to hossz do
  begin
   gotoxy(3,i);                write(copy(szov,i,i));
   gotoxy(5+round(hossz/2),i); write(copy(szov,i,1));
   gotoxy(8+round(hossz/2),i); write(copy(szov,hossz-i+1,i));
   gotoxy(17+hossz,i);         write(copy(szov,hossz-i+1,1));
  end;

 v:=readkey;
end.

