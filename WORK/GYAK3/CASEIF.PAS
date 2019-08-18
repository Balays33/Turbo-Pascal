program caseif;                                
uses crt;
var x,y  :byte;
    c    :char;
begin
   clrscr;
   textcolor(white);
   x:=1; y:=1;
   repeat  write(#219);
           c:=readkey;
           if c = #0 then c:=readkey;
           case c of #72: if y > 1 then y:=y-1                {fel}
                                   else begin sound(500);
                                              textcolor(10);
                                              delay(200);
                                              nosound;
                                        end;
                     #80: if y <25 then y:=y+1                {le}
                                   else begin sound(550);
                                              textcolor(12);
                                              delay(200);
                                              nosound;
                                        end;
                     #75: if x > 1 then x:=x-1                {balra}
                                   else begin sound(600);
                                              textcolor(14);
                                              delay(200);
                                              nosound;
                                        end;
                     #77: if x <80 then x:=x+1                {jobbra}
                                   else begin sound(650);
                                              textcolor(9);
                                              delay(200);
                                              nosound;
                                        end;
           end;
           gotoxy(x,y);
           until (c='v');
   end.