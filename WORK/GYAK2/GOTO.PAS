program goto;                                    
uses crt;
begin
     textbackground(black);                 {H†ttÇr fekete}
     textcolor(black);                      {Szîveg fekete}
     clrscr;                                {KÇpernyìtîrlÇs}
     textcolor(lightgray);                  {Szîveg szÅrke}
       gotoxy(29,5);
       write('5 Çs 3 szorzata = ',5*3);
       gotoxy(28,7);
       write('5 Çs 3 h†nyadosa = ',5/3:3:2);
     writeln;
       gotoxy(30,9);
       write('5 Çs 3 îsszege = ',5+3);
     writeln;
       gotoxy(27,11);
       write('5 Çs 3 kÅlînbsÇge = ',5-3);
     writeln;
       gotoxy(30,13);
       write('5 Çs 3 †tlaga = ',(5+3)/2:2:0);

     gotoxy(67,25);
     write('Nyomj ENTERt!');
     readln;
     clrscr;
     textcolor(lightgreen);
       gotoxy(26,5);
       write('5.3 Çs 3.01 szorzata = ',5.3*3.01:5:3);
     writeln;
       gotoxy(25,7);
       write('5.3 Çs 3.01 h†nyadosa = ',5.3/3.01:2:10);
     writeln;
       gotoxy(27,9);
       write('5.3 Çs 3.01 îsszege = ',5.3+3.01:2:2);
     writeln;
       gotoxy(24,11);
       write('5.3 Çs 3.01 kÅlînbsÇge = ',5.3-3.01:2:2);
     writeln;
       gotoxy(27,13);
       write('5.3 Çs 3.01 †tlaga = ',5.3+3.01/2:2:3);
     gotoxy(67,25);
     write('Nyomj ENTERt!');
     readln;
     gotoxy(1,1);                    {Mindent letîrîl}
     textcolor(black);
     clrscr;
     readln;
end.



















