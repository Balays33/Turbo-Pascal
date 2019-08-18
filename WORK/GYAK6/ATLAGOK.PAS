
program atlagok;
uses crt;
var
  i,n:integer;
  a,x,atl,szum,prod:real;
  ch:char;

  const  menu : array[1..4] of string[35] =
	   (' 1     -  Sz†mtani †tlag sz†m°t†sa ',
	    ' 2     -  NÇgyzetes †tlag sz†m°t†sa',
            ' 3     -  MÇrtani †tlag sz†m°t†sa  ',
	    'ESC    -  VêGE        ') ;

procedure menukiir ;
  begin
    clrscr;
    for i := 1 to 4 do
	writeln(menu[i]:38);
  end ;

function ngyok(n:integer;a:real):real;
  begin
     ngyok:=exp((1/n)*ln(a));
  end;

{fãprogram}

begin
  clrscr;
  repeat
      menukiir ;
	   ch := readkey ;
           clrscr;
           case ch of
                '1' : writeln('Sz†mtani †tlag sz†m°t†sa');
                '2' : writeln('NÇgyzetes †tlag sz†m°t†sa');
                '3' : writeln('MÇrtani †tlag sz†m°t†sa');
                end;
           writeln('KÇrem az n ÇrtÇkÇt:');
           readln(n);
           writeln('KÇrem az x ÇrtÇkeket:');

           szum:=0;  prod:=1;
           for i:= 1 to n do begin
                             readln(x);
                             case ch of
                                     '1' : szum:=szum+x;
                                     '2' : szum:=szum+x*x;
                                     '3' : prod:=prod*x;
                                      end ;
                             end;
            case ch of
                    '1' : atl:=szum/n;
                    '2' : atl:=sqrt(szum/n);
                    '3' : atl:=ngyok(n,prod);
                     end;
            writeln('Az †tlag ÇrtÇke:',atl);
            readln;
            menukiir ;
	    ch := readkey ;
  until ch = #27 ;
end.
