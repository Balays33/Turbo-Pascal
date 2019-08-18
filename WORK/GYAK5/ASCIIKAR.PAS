program asciikar;
uses crt;
var ch:char;
begin
  clrscr;
  write('K‚rek egy karaktert:');
  readln(ch);
  writeln('A(z) ',ch,' ASCII k¢dja:',ord(ch));
  writeln('Az el‹z‹ karakter: ',pred(ch));
  writeln('A k”vetkez‹ karakter: ',succ(ch));
  case ch of
      'A'..'Z': write('Nagybetû');
      'a'..'z': write('Kisbetû');
      '0'..'9': write('Sz m');
      ' '..'/',
      ':'..'@',
      '['..#96: write('Speci lis karakter');
      else Write('Egy‚b');
  end;
  readln;
end.