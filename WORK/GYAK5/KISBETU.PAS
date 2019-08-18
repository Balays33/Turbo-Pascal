program kisbeture;
uses crt;         {Minden nagybet–t  tir kisbet–re a sz”vegben}
var
   q : string[80];
   c : char;

function kisbetu(s: string): string;
var
  i: integer;
begin
  for i := 1 to length(s) do
  if (s[i] >= 'A') and (s[i] <= 'Z') then
  inc(s[i], 32);
  kisbetu := s;
end;

begin
   clrscr;
   write('G‚peljen be egy max. 80 karakter hossz£ stringet:');
   read(q);
   write(kisbetu(q));
   c:=readkey;
end.

