program prszerk;                                     
uses crt;		      {K‚peny“ unit h¡v sa}
var a,b,c:	Integer;      {V ltoz¢k deklar l sa}
begin			       {F“program kezdete}
    clrscr;		       {K‚perny“t”rl‚s}
      write('K‚rem az els“ sz mot : ');  {Ki¡rat s a k‚perny“re}
      readln(a);	       {Az a ‚rt‚k‚nek bek‚r‚se}
      write('K‚rem a m sodik sz mot : ');
      readln(b);	       {A b ‚rt‚k‚nek bek‚r‚se}
      write('K‚rem a harmadik sz mot : ');
      readln(c);	       {A c ‚rt‚k‚nek bek‚r‚se}
      writeln('Az a+b-c k‚pletbe behelyettes¡tve az eredm‚ny : ',a+b-c,' lett.');
      readln;			{ENTER-re v r}
end.				{Program v‚ge}
