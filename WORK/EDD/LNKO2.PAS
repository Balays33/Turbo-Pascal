Program LNKO;
Uses CRT;
Var x,y:Real;
    v:Char;

    Begin
    ClrScr;
     Repeat
    TextBackground(Black);
    ClrScr;
    TextColor(White);
    ClrScr;
    Window(20,3,60,6);
    TextBackground(Red);
    ClrScr;
    TextColor(Black);
    ClrScr;
    GotoXY(9,2);
    WriteLn('Legnagyobb kozos oszto');
    Window(3,9,40,19);
    TextBackground(Blue);
    ClrScr;
    TextColor(Yellow);
    ClrScr;
    GotoXY(2,2);
      WriteLn('KÇrem az egyik sz†mot! ');
    GotoXY(2,3);
      Read(x);
    Window(43,9,77,19);
    TextBackground(Green);
    ClrScr;
    TextColor(Red);
    ClrScr;
    GotoXY(2,2);
      WriteLn('KÇrem a m†sik sz†mot! ');
    GotoXY(2,3);
      Read(y);
    Window(3,20,77,25);
    TextBackground(Black);
    ClrScr;
    TextColor(Red);
    ClrScr;
      While x<>y do
            If x>y Then x:=x-y
                   Else y:=y-x;
      GotoXY(34,2);
      WriteLn(x:3:1);
      GotoXY(19,3);
      WriteLn('Ha folytatjuk, nyomj egy billenty˚t!');
      GotoXY(18,4);
      WriteLn('Ha befejeztÅk, akkor nyomj "N" bet˚t!');
      ReadLn(v);
     Until v='N';
    End.

