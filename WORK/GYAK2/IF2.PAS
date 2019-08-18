program if2;      { a sz mnak 20 ‚s 60 k”z”ttinek ‚s p rosnak kell lennie}
uses crt;                
var s:integer;
begin
 writeln('K‚rek egy p ros sz mot:  ');
 readln(s);
 if (s>20) and (60>s) then if odd(s) then  writeln('A sz m p ratlan, nem j¢!')
                                     else  writeln('J¢')
                      else writeln('nincs az intervallumban');
 readln;
end.
