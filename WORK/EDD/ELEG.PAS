Program Eleg;
   uses crt;
   var i:integer;
       a:real;
      ch:char;
   const menu:array[1..4] of string[25]=
              ('1   -diagonal         ',      { tl¢}
               '2   -area             ',      {terlet}     {n‚gyzet}
               '3   -circumference    ',      {kerlet}
               'ESC -v‚ge             ');

   Procedure menukiir;
      begin
        clrscr;
        for i:=1 to 4 do
            writeln(menu [i]:28);
      end;

   Procedure F1;
      begin
        clrscr;
        write('diagonal:',(sqrt(2)*a):8:2);
        readln;
      end;

   Procedure F2;
      begin
        clrscr;
        writeln('area:',sqr(a):8:2);
        readln;
      end;

   Procedure F3;
      begin
        clrscr;
        writeln('circ:',(4*a):8:2);
        readln;
      end;

   Begin
     clrscr;
     writeln('a oldal:');
     readln(a);
     repeat
         menukiir;
         ch:=readkey;                         {gombnyom sra}
         case ch of                           {ezekre az odalakra l‚p}
           '1':F1;
           '2':F2;
           '3':F3;
         end;
     until ch=#27;                            {ESC}
   End.