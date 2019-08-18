{example.pas}
{$X+}

uses Crt, Game, MCGA, _System;

const
 MaxFalls       =   3;
 PalSpd         =  10;
 Skill          =  50;

 PDly:    byte  =   0;
 Lives:   byte  =   9;
 Height:  word  =   0;

var
 Hero:      BOB;
 Fall:      array [0..MaxFalls] of BOB;
 i:         word;
 f:         file;
 Killed:    boolean;
 Won:       boolean;
 GameOver:  boolean;
 POld:      word;


procedure ShowLives;
 begin
  CBar( 19, 220, 190, 300, 199);
  PointColor:=  7;
  OutTransparentText( 221, 192, _str( Lives));
  PointColor:= 15;
  OutTransparentText( 220, 191, _str( Lives));
  end;

procedure ShowHeight;
 begin
  CBar( 19, 80, 190, 120, 199);
  PointColor:= 7;
  OutTransparentText(  81, 192, _str( Height shr 3));
  PointColor:= 15;
  OutTransparentText(  80, 191, _str( Height shr 3));
  end;


begin

 InitGame;
 LoadLBM( 'example.lbm', ptr($a000,0));
 readkey;
 HidePal( PalSpd, 1, 255, 0, 0, 0);

 LoadMap( 'example.map');
 NewPos( 0, (MapLength div BPL) shl 3 - 190);

 with Hero do begin
  Load( 'hero.bob');
  X:= 160 - w shr 1;
  Y:= 180 - h;
  end;

 randomize;
 for i:= 0 to MaxFalls do with Fall[i] do begin
  Load( 'fall'+_str(i)+'.bob');
  X:= random( 320-w);
  Y:= -h-random( Skill*MaxFalls);
  end;

 SetArea( 0, 189);
 MakeScr;
 ShowScr;

 CBar( 19, 0, 190, 319, 199);
 TextBackColor:= 19;
 PointColor:=  3;
  OutText(   1, 192, 'Magass g:');
  OutText( 161, 192, 'letek:' );
 PointColor:= 14;
  OutTransparentText(   0, 191, 'Magass g:');
  OutTransparentText( 160, 191, 'letek:' );
 ShowLives;
 ShowHeight;

 assign( f, 'example.pal');
 reset( f, 1);
 blockread( f, Colors, 768);
 close( f);

 CFirst:= 64;
 CLast := 79;

 InitKey;

 repeat

  Killed:= false;
  ShowPal( PalSpd, 1, 255);

  repeat

   if Key[$C8] then with Hero do begin

    Scroll( Down, 1);
    if CollColors then Scroll( Up, 1) else begin

     inc( Height);
     Won:= PosY=4;
     ShowHeight;

     POld:= P;
     if P>1 then P:= 0;
     inc( PDly);
     if PDly=10 then begin
      PDly:= 0;
      inc( P);
      if P>1 then P:= 0;
      sound( 200);
      end;
     if CollColors then P:= POld;

     for i:= 0 to MaxFalls do inc( Fall[i].y);

     end;

    end

   else if Key[$CB] then with Hero do begin
    dec( x);
    if CollColors then inc( x) else begin
     POld:= P;
     if P<2 then P:= 2;
     inc( PDly);
     if PDly=10 then begin
      PDly:= 0;
      inc( P);
      if P>PN then P:= 2;
      sound( 100);
      end;
     if CollColors then P:= POld;
     end;
    end

   else if Key[$CD] then with Hero do begin
    inc( x);
    if CollColors then dec( x) else begin
     POld:= P;
     if P<2 then P:= 2;
     inc( PDly);
     if PDly=10 then begin
      PDly:= 0;
      inc( P);
      if P>PN then P:= 2;
      sound( 100);
      end;
      if CollColors then P:= POld;
     end;
    end;

   if not( Key[$C8] or Key[$CB] or Key[$CD])
    then PDLy:= 9;

   GameOver:= Key[1];

   for i:= 0 to MaxFalls do with Fall[i] do begin
    inc( y);
    Killed:= Killed or Collision( Hero);
    if y>190 then begin
     y:= -h-random( Skill*MaxFalls);
     if random( 3)>0 then x:= random( 320-w)
      else x:= Hero.X;
     end;
    end;

   MakeScr;
   RetRace;
   ShowScr;

   nosound;

   until Killed or Won or GameOver;

  if Killed then begin

   inc( Hero.y);
   repeat
    for i:= 0 to MaxFalls do with Fall[i] do inc( y);
    inc( Hero.y);
    MakeScr;
    RetRace;
    ShowScr;
    until Hero.y>220;

   HidePal( PalSpd, 1, 255, random( 64), 0, 0);
   dec( Lives);
   ShowLives;
   for i:= 0 to MaxFalls do with Fall[i] do begin
    y:= -h-random( Skill*MaxFalls);
    x:= random( 320-w);
    end;
   Hero.y:= 180-Hero.h;
   GameOver:= Lives=0;
   MakeScr;
   ShowScr;

   end;

  if Won then begin
   HidePal( PalSpd, 1, 255, 63, 63, 63);
   HidePal( PalSpd, 1, 255,  0,  0,  0);
   end;

  until GameOver or Won;

 DoneKey;
 DoneGame;
 end.
