program ciklus1;                                              
{*********************   P‚ld k ciklusokra  ************************}
uses crt;
var   a,i      :integer;
      szum,n   :integer;
      sor      :integer;
      x,y,s      :real;
      c          :char;
      f,r,k      :real;

begin
    {****************  1.)  els“ 100 sz m ”sszege ******************}
    writeln('Az els“ 100 termeszetes sz m ”sszege:');
    i:=1;
    szum:=0;
    while i<101 do begin
                   szum:=szum+i;
                   i:=i+1;
                   end;
    write('az ”sszeg=',szum);
    readln;
    {****************  2.) az els“ n db sz m n‚gyzet”sszege *********}
    writeln('Az els“ N db term‚szetes sz m n‚gyzet”sszege:');
    writeln('K‚rem az N ‚rt‚k‚t!');
    readln(n);
    {i:=1;                               itt nem kell!}
    szum:=0;
    for i:=1 to n do begin
                     szum:=szum+i*i;
                     {i:=i+1;            itt nem kell!}
                     end;
    write('az ”sszeg=',szum);
    readln;
    {****************  3.) az x sz m els“ 10 sz m£ hatv nya  *************}
    WRITELN('Bek‚rt sz m hatv nyai:');
    writeln('Az x els“ 10 sz m£ hatv nya:');
    writeln('K‚rem az x ‚rt‚k‚t!');
    readln(x);
    i:=0;
    repeat                                      {repeat ciklussal!}
          y:=exp(i*ln(x));
          writeln('x a ',i,'-ediken= ',y:12:0);
          i:=i+1;
    until i=11;
    readln;
    writeln('Ujra k‚rem az x ‚rt‚k‚t!');
    readln(x);
    s:=1;
    for i:= 1 to 10 do begin                     { for ciklussal }
                    s:=s*x;
                    writeln(s);
                    end;
    readln;

    {****************  5.) Sz mok ki¡r sa adott form tumban  *************}

    writeln('Sz mok ki¡rat sa adott form tumban:');
    i:=15;
    repeat
          write(i:4);
          i:=i+15;
    until i > 200;
    readln;

    {****************  6.) Sorhossznyi csillag ki¡rat sa *****************}

    writeln('Sorhossznyi csillag ki¡rat sa:');
    for i:=1 to 80 do write('*');
    readln;
    clrscr;
    writeln('Csillag ki¡rat sa  tl¢san:');
    for i:=1 to 25 do                 { itt el‚g 25 sor }
       begin
       gotoxy(i*3,i);
       write('*');
       end;
       readln;

    {****************  7.) Megadott karakterrel x rajzol sa  *************}

    writeln('Megadott karakterrel x rajzol sa:');
    writeln('K‚rem a karaktert:');
    readln(c);
    clrscr;
    for i:=1 to 25 do begin
                      gotoxy(i,i);
                      write(c);
                      end;
    for i:=1 to 25 do begin
                      gotoxy(26-i,i);
                      write(c);
                      end;
    readln;
    {****************  8.) Fokok k”zti  tsz mol s  *************}
     Writeln('Fokok k”zti  tsz mol s');
     Writeln(' Celsius fok   Fahrenheit fok  Reumour fok   Kelvin fok');
     sor:=1;
     For i:=-30 to 30 do begin
                         sor:=sor+1;
                         f:=i*1.8 + 32;
                         r:= i*0.8;
                         k:=i-273.16;
                         writeln(i:1,f:15:2,r:15:2,k:15:2);
                         if sor=24 then begin
                                        readln;
                                        clrscr;
                                        sor:=1;
                                        end;
                         end;
     readln;

end.