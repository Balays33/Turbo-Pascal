
program pr1;
uses crt;
var
  i:integer;
  ch:char;

  const  menu : array[1..4] of string[25] =
	   (' 1     -  1. feladat  ',
	    ' 2     -  2. feladat  ',
	    ' 3     -  3. feladat  ',
	    'ESC    -  VGE        ') ;

procedure menukiir ;
  begin
    clrscr;
    for i := 1 to 4 do
	writeln(menu[i]:28);
  end ;

Procedure F1;
  begin
 { .....}
  end;

Procedure F2;
  begin
 { .....}
  end;

Procedure F3;
  begin
 { .....  }
  end;

begin
  clrscr;
  repeat
      menukiir ;
	  ch := readkey ;
	  case ch of
	    '1' : F1;
	    '2' : F2;
	    '3' : F3;
	  end ;
  until ch = #27 ;
end.
