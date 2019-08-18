program elj_fv1;                                    
uses crt;
var x,y,z    :integer;
    a,b,c    :real;
    b1,b2    :byte;
    s1       :string;
    s2       :string[10];
begin
    x:=17;  y:=3;
    clrscr;
    writeln('x=',x,'  y=',y);
    writeln('a=',a,'  b=',b);
    writeln('x div y=',x div y);
    writeln('x mod y=',x mod y);
    b1:=14;
    b2:=8;
    writeln('b1=',b1,'  b2=',b2);
    writeln('b1 ‚s b2 =',b1 and b2);
    writeln('b1 vagy b2=',b1 or b2);
    readln;
    s1:='sz”veges v ltoz¢';
    writeln(4 shr 1);
    writeln(4 shl 1);
    readln;
end.
