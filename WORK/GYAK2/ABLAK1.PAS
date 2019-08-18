program ablak1;                                                   
uses crt;
begin
   {eredeti k‚perny“ szinez‚se}
   textbackground(green);
   clrscr;
   write('ez feh‚r');
   {ablak nyit s}
   window(6,4,78,19);
   textbackground(black);
   clrscr;                     {ez volt az  rny‚k}
   {hangad s}
       sound(450);
       delay(500);
       nosound;
    readln;
    {ablaknyit s, ez lesz a szines ablak}
    window(5,5,75,20);
    textbackground(yellow);
    clrscr;
        sound(500);
        delay(500);
        nosound;
    readln;
    gotoxy(10,10);
    {ir ssz‚less‚g  llit s}
      textmode(co40);
      textcolor(cyan);
      write('most sz‚lesen ¡rok');
    readln;
      textmode(co80);
      textcolor(blue);
      write('most m r nem');
         sound(550);
         delay(500);
         nosound;
    readln;
end.


