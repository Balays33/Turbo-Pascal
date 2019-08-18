program muvvegz;
{Mûveletv‚gz‚sek, fggv‚nyek ‚s elj r sok haszn lata}
uses crt;
var a,b,c    :integer;
    x,y      :real;
    b1,b2    :byte;
    s1       :string;
    s2       :string[10];
begin

    ClrScr;
    writeln('Mûveletv‚gz‚sek, fggv‚nyek ‚s elj r sok haszn lata');
    writeln('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    writeln;
    write('k‚rek k‚t eg‚sz sz mot a=  ');
    readln(a);
    write('                       b=  ');
    readln(b);

    writeln('              a+b= ',a+b:10);
    x:=a*b;
    writeln('              a*b= ',x:10:0);
    x:=a/b;
    writeln('              a/b= ',x:10:4);
    c:=a div b;
    writeln('          a div b= ',c:10);
    writeln(' a/b eg‚sz oszt s: ',c:10);
    y:=frac(x);
    writeln(' a/b  t”rtr‚sze  : ',y:10:4);
    Writeln(' a/b eg‚sz r‚sze : ',trunc(a/b):10,'    (t”rtr‚sz lev g ssal)');
    Writeln(' a/b kerek¡t‚se  : ',x:10:0,'    (legk”zelbbi eg‚sz fel‚)');
    writeln;

    y:=abs(a);
    Writeln('az a sz m abszulot ‚rt‚ke :     ',y:8:2);
    y:=ln(a);
    Writeln('az a sz m e alap£ logaritmusa : ',y:8:2);
    c:=a mod 5;
    Writeln('az a marad‚kos oszt sa 5-el: ',c:8);

    writeln;
    y:=a/b;
    writeln('Figyelj a programban az eg‚sz ‚s val¢s ‚rt‚kek haszn lat ra!');


    Repeat Until Keypressed;
end.
