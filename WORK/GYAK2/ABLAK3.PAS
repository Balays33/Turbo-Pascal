program ablak3;                                   
uses crt;
begin
     clrscr;                        {KÇpernyìtîrlÇs}
     textbackground(cyan);          {H†ttÇr cyan}
     clrscr;
     window(7,2,74,24);             {AblakmÇret be†ll°t†sa}
     textbackground(black);
     clrscr;
     window(15,4,65,22);
     textbackground(brown);
     clrscr;
     window(17,5,63,21);
     textbackground(blue);
     clrscr;
     textcolor(yellow);             {ElìtÇr sz°ne yellow}
     gotoxy(7,7);                   {Kurzor pozicion†l†sa}
     writeln('…Õª    …Õª  …ÕÕÕÕ  …ª   “  “ ¯¯ “');
     gotoxy(7,8);
     writeln('∫ »Õª…Õº ∫  ∫      ∫»ª  ∫  ∫    ∫');
     gotoxy(7,9);
     writeln('∫   »º   ∫  ÃÕÕÕ   ∫ »ª ∫  ∫    ∫');
     gotoxy(7,10);
     writeln('∫        ∫  ∫      ∫  »ª∫  »ª  …º');
     gotoxy(7,11);
     writeln('–        –  »ÕÕÕÕ  –   »º   »ÕÕº ');
     window(1,1,80,25);
     readln;
     textbackground(black);
     textcolor(white);
     clrscr;
end.





