program mezo3;
uses crt;
var
   a,b,c,d,e: real;
begin
   clrscr;
   a:=12.56; b:=-12.56; c:=0.5; d:=1.e-3; e:=1.63e+3;
   writeln('Standard kiirat†s (form†tum nÇlkÅl)');
   writeln('  a:              b:               c:               d:               e:');
   textcolor(red);
   write(a); write(b); write(c,d,e);writeln;
   textcolor(lightgreen);
   writeln('Kiirat†s mezìszÇlessÇggel (v:10) -->norm†l alakban');
   writeln('a=',a:9,' b=',b:10);
   writeln('Helytelen mezìszÇlessÇg megad†sa esetÇn (v:4) -->norm†l alak ');
   writeln('a=',a:4,' b=',b:4);
   textcolor(4);
   writeln('êszrevetted, hogyan kerek°tett?');
   textcolor(lightgreen);
   writeln;
   writeln('Kiirat†s fixpontos alakban: v:10:3');
   writeln('a=',a:9:2,' b=',b:10:3);
   writeln('helytelen mezìszÇlessÇggel:   a=',a:2:1,'  b=',b:10:0);
   writeln;
   writeln('Konstansok kiirat†sa');
   writeln(123.456,123.456:10,' ',-123.456:10:3,' ',0.001:7:3);
   writeln('helytelen mezìszÇlessÇggel:   ',123.456:1:1);
   writeln;
   writeln('KifejezÇsek');
   writeln('a+c=',a+c:8:2);
   writeln;
   writeln('Ha nem adunk meg semmifÇle form†tumot:');
   writeln('sqr(2)=',sqr(2),'  de a  sqr(2.0)=',sqr(2.0));
   readln;
end.
