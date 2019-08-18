program poz_neg;
uses crt;
var a: array[1..15,1..15] of integer;
    i,j,poz,neg,nul: integer;
begin
  clrscr;
  randomize;
  for i:=1 to 15 do
    for j:=1 to 15 do a[i,j]:=random(41)-15;
  poz:=0; neg:=0; nul:=0;
  for i:=1 to 15 do
    begin
      for j:=1 to 15 do
         begin
           if a[i,j]>0 then
                         begin
                           textcolor(lightred);
                           inc(poz);
                         end
                       else if a[i,j]=0 then
                                          begin
                                            textcolor(yellow);
                                            inc(nul);
                                          end
                                        else
                                          begin
                                            textcolor(lightblue);
                                            inc(neg);
                                          end;
           write(a[i,j]:4);
         end;
      writeln;
    end;
  textcolor(lightred); writeln('A pozit¡v elemek sz ma: ',poz);
  textcolor(yellow); writeln('A z‚ro elemek sz ma: ',nul);
  textcolor(lightblue); writeln('A negat¡v elemek sz ma: ',neg);
  readln;
end.
