program atlag;   {T°z db bekÇrt sz†m †tlaga kÅlînbîzì ciklusokkal.}
uses crt;
var x,r,s :real;
    c: char;
    i: integer;

begin
     textcolor(yellow);
     clrscr;
     writeln('Melyik ciklussal akarsz sz†molni?');
     writeln(c,'A: For ciklus.');
     writeln(c,'B: While ciklus.');
     writeln(c,'C: Repeat ciklus.');
     readln(c);
     s:=0;
     x:=1;
     i:=1;
     case c of 'a': begin
                       for i:=1 to 10 do begin
                                         writeln('KÇrem az ',i,'-dik sz†mot : ');
                                         readln(x);
                                         s:=s+x;
                                         end;
                                         s:=s/10;
                       writeln('A beolvasott sz†mok †tlaga: ',s:5:3);
                       end;
               'b': begin
                       while i<=10 do begin
                                        writeln('KÇrem az ',i,'-dik sz†mot : ');
                                        readln(x);
                                        s:=s+x;
                                        i:=i+1;
                                        end;
                                        s:=s/10;
                       writeln('A beolvasott sz†mok †tlaga: ',s:5:3);
                       end;
               'c': begin
                       repeat writeln('KÇrem az ',i,'-dik sz†mot : ');
                              readln(x);
                              s:=s+x;
                              i:=i+1;
                       until i>10;
                       s:=s/10;
                       writeln('A beolvasott sz†mok †tlaga: ',s:5:3);
                    end;
        end;
readln;
end.
