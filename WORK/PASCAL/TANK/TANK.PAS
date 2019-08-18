{$A+,B-,D+,E-,F-,G+,I+,L+,N+,O-,P-,Q+,R+,S+,T-,V+,X+}
{$M 16384,0,655360}
program TANK_GAME;

uses Game, Crt, MCGA, _System;

type

 BOBex = object( BOB)
  d: shortint;
  procedure IncP;
  procedure DecP;
  procedure IncD;
  procedure DecD;
  end;

 TankType = object( BOBex)
  mx,my: word;
  x2,y2: word;
  end;

 FireType = object( BOB)
  d: shortint;
  x2,y2: word;
  end;

 EnMovType = record
  X, Y: word;
  F: word;
  C: word;
  S: integer;
  end;

 EnMovObjType = object( BOBex)
  F,C: word; S: integer;
  FC: word;
  PD: ShortInt;
  SC: word;
  PC: byte;
{ function OnScreen: boolean;}
  end;

 EnStdType = record
  T: byte;
  X, Y: word;
  F: word;
  C: word;
  D: shortint;
  end;

 EnStdObjType = object( BOBex)
  F, C: word;
  FC, SC: word;
  end;


 EnFirType = object( BOB)
  D: shortint;{ S: byte;} end;


 ExpType = object( BOB)
  C: byte; end;

 HiRecType = record
  nam: string[20];
  sco: word;
  tim: byte;
  tis: byte;
  end;


const

 inflives= false;
 MaxCountWait = 7{0};
 FireSpeed    =  6;
 EnFS         =  3;
 MaxCofi      = 40;
 MaxEnMov     = 52;
 MaxEnDef     = 02;
 MaxEnStd     = 12;
 MaxScore     = MaxEnMov+MaxEnStd+2;
 MaxEnemy     =  3;
{MaxMoCo      =  2;}
 MaxPC        =  7;
 MaxExp       =  1;
 MaxEC        =  4;
 MaxSn        = 30;
 XStart       = 14;
 YStart       = 68;
 DStart       =  2;
 TClo         = 167;
 MaxSec       =  70;
 MaxF         = 20;
 MaxC         = 50;
 MaxS         =  2;
 IntF         = 20;
 IntC         = 50;
 IntS         =  2;
 NoteX        = 233;
 PauX         = NoteX+12;

 Man = 0;

 Dir: array[0..7,0..1] of shortint =
  ((1,0),(1,-1),(0,-1),(-1,-1),(-1,0),(-1,1),(0,1),(1,1));
 RotL:     boolean  = false;
 RotR:     boolean  = false;
 Counter:  byte     = 0;
 MapX:     longint  = 0;
 MapY:     longint  = 0;
 MolX:     longint  = 0;
 MolY:     longint  = 0;
 Firing:   boolean  = false;
 Cofi:     word     = 0;
 Snd:      boolean  = true;
 DeCo:     byte     = 0;
{MoCo:     byte     = MaxMoCo;}
 Quit:     boolean  = false;
 StoCo:    word     = 0;
 Explor:   shortint = -2;
 EnDeath:  integer  = -1;
 SnCo:     word     = 0;
 Lives:    byte     = 3;
 Energy:   shortint = 39;
 DecEn:    shortint = 39;
 Score:    word     = 0;
 CentSec:  byte     = 0;
 Sec:      byte     = 0;
 Min:      byte     = 0;
 NoExp:    boolean  = true;




 EnMovRec: array[0..MaxEnDef] of EnMovType = (
           {
            ( X:   ___; Y:   ___; F: __; C: __; S: _),
            }
            ( X:  78*8; Y:  44*8; F: 32; C: 99; S: 2),
            ( X:  79*8; Y:  43*8; F: 44; C: 99; S: 2),
         {  ( X:   100; Y:    30; F: 34; C: 99; S: 3),
            ( X:   100; Y:    30; F: 33; C: 99; S: 3),
            ( X:   150; Y:   060; F: 32; C: 99; S: 3),
            ( X:   150; Y:   060; F: 32; C: 99; S: 3),
          } ( X:    90; Y:   110; F: 31; C: 99; S: 3));

 EnStdRec: array[0..MaxEnStd] of EnStdType = (
           {
            ( T: ___; X:   ___; Y:   ___; F: __; C: __; D: _),
            }
            ( T: 003; X:  3*8 ; Y:3+57*8; F: 00; C: 00; D: 0),
            ( T: 004; X:107*8 ; Y:88*8+2; F: 00; C: 00; D: 0),
         {  ( T: 002; X:  30*8; Y:1+13*8; F: 10; C: 00; D: 4),}
            ( T: 002; X:   0  ; Y:1+35*8; F: 01; C: 00; D: 0),
            ( T: 002; X:  25*8; Y:1+15*8; F: 01; C: 00; D: 4),
            ( T: 002; X:  89*8; Y:1+01*8; F: 01; C: 00; D: 4),
            ( T: 002; X:  00*8; Y:1+80*8; F: 01; C: 00; D: 0),
            ( T: 002; X:  72*8; Y:  59*8; F: 01; C: 00; D: 3),
            ( T: 002; X: 138*8; Y:  47*8; F: 01; C: 00; D: 7),
            ( T: 001; X: 21*8 ; Y:2+67*8; F: 00; C: 00; D: 0),
            ( T: 003; X: 129*8; Y:2+22*8; F: 00; C: 00; D: 0),
            ( T: 004; X: 113*8; Y:2+74*8; F: 00; C: 00; D: 0),
            ( T: 001; X: 79*8 ; Y:  16*8; F: 00; C: 00; D: 0),
            ( T: 001; X:   96 ; Y:   040; F: 00; C: 00; D: 0));


type

 EnDatType = array[0..MaxEnemy] of BOB;


var

 Tank: TankType;
 Fire: FireType;
 mpx, mpy: word;
 areay: word;
 d2: byte;
 Away, AwayR, AwayL, OkGo: boolean;
 i,j: word;
 EnMov: array[0..MaxEnMov] of EnMovObjType;
 EnStd: array[0..MaxEnStd] of EnStdObjType;
 EnFir: array[0..MaxEnMov] of EnFirType;
 EnFis: array[0..MaxEnStd] of EnFirType;
 EnDat: EnDatType;
 MaskW: array[0..15] of word absolute Mask;
 Exp: array[0..MaxExp] of ExpType;
 Qu: boolean;
 MiniTank: bob;
 MiniMan:  bob;
 Clock:    bob;
 Note:     bob;
 PLetter:  bob;
 HiRec: array[1..10] of HiRecType;
 Hig:   file of HiRecType;
 NewHig:byte;
 Smi, Sse: string[3];
 ch: char;



label JumpHereIfNoEnergy;


procedure BOBex.IncP; begin if p=15 then p:=0 else inc( p); end;
procedure BOBex.DecP; begin if p=0 then p:=15 else dec( p); end;
procedure BOBex.IncD; begin if d=8 then d:=0 else inc( d); end;
procedure BOBex.DecD; begin if d=0 then p:=8 else dec( d); end;


procedure ShowLives; begin
 RetRace;
 PointColor:= 36; Rectangle( 0, 192, 40, 199);
 PointColor:= 76; Rectangle( 0, 192, 39, 198);
 PointColor:= 16; Bar( 1, 193, 39, 198);
 with MiniTank do begin
  if Lives in [2,3] then Put( 2, 193, 0, true );
  if Lives =     3  then Put(22, 193, 0, true );
  end;
 end;

procedure ShowEnergy;
 const x = 281;
 begin
  PointColor:= 77; Rectangle(x,192,319,199);
  PointColor:= 70; Rectangle(x,192,318,198);
  PointColor:= 71; Bar(x+1,193,318,198);
  end;

procedure DecEnergy;
 var k: byte;
 begin
  if DecEn<=0 then exit;
  PointColor:= 45;
  dec( DecEn);
  if DeCen>0 then for i:= 0 to 3 do Point( 280+DecEn, 192+random(8));
  Bar( 281+DecEn,192,281+DecEn,199);
  if snd then Sound( 100+random( 200));
  end;

procedure ShowScore; begin
 OutText(99,192,' ');
 PointColor:= 54; OutText     ( 102,192,_str( Score));
 PointColor:= 20; OutTransparentText( 100,192,_str( Score));
 end;


procedure ShowTime;
 var s,sm,ss:string;
 begin
  PointColor:= 54;
  OutText( TClo-1,192,' ');
  sm:=_str( min); if length(sm)=1 then sm:= '0'+sm;
  ss:=_str( sec); if length(ss)=1 then ss:= '0'+ss;
  s:= sm+'.'+ss;
  OutText( TClo+3,192,s);
  PointColor:= 20;
  OutTransparentText( TClo+2,192,s);
  end;






begin

   InitGame;
   LoadLBM('tank.pic',BackGround);
   MakeScr; ShowScr;
   ReadKey;
   HidePal(50,1,255,0,0,0);
   SetMode($13);
   SetArea( 0, 190);
   LoadMap('tank.map');
   areay:= last-first+1;

   with MiniTank do begin Load('minitank.bob'); a:= false; end;

   for i:= 0 to MaxExp do with Exp[i] do begin
    Load('exp'+_str(i)+'.bob'); a:= false; end;

   with Tank do begin
    Load('tank.bob');
    d:= DStart;  p:= d*2;
    x:= XStart;  mx:= 160  -w shr 1;
    y:= YStart;  my:= (last-first+1 -h) shr 1;
    x2:= w shr 1;
    y2:= h shr 1;
    end;

   with Fire do begin
    Load('fire.bob');
    a:= false;
    x2:= w shr 1;
    y2:= h shr 1;
    end;


   EnFir[0].Load('enfire.bob');
   for i:= 0 to MaxEnMov do with EnFir[i] do begin
    Copy( EnFir[0]);
    a:= false;
    end;
   for i:= 0 to MaxEnStd do with EnFis[i] do begin
    Copy( EnFir[0]);
    a:= false;
    end;


   for i:= 0 to MaxEnemy do with EnDat[i] do{if i<>2 then}begin
    Load( 'enemy'+_str(i)+'.bob');
    a:= false;
    end;

   for i:= 0 to MaxEnDef do with EnMov[i] do begin
    Copy( EnDat[0]);
    X:= EnMovRec[i].X;
    Y:= EnMovRec[i].Y;
    F:= EnMovRec[i].F;
    C:= EnMovRec[i].C;
    S:= EnMovRec[i].S;
    D:= random( 8);
    P:= D*3+1;
    A:= true;
    FC:= F;
    SC:= C;
    PD:= 1;
    PC:= MaxPC;
    end;


   for i:= 0 to MaxEnStd do with EnStd[i] do begin
    if EnStdRec[i].T=2 then begin
     Copy( Tank);
     D:= EnStdRec[i].D;
     P:= D*2;
     {P:= 0;
     DT:= ptr( seg( dt), ofs( dt)+EnStdRec[i].D*2*PL);}
     end else if EnStdRec[i].T>2 then Copy( EnDat[EnStdRec[i].T-1]) else
      Copy( EnDat[EnStdRec[i].T]);
    X:= EnStdRec[i].X;
    Y:= EnStdRec[i].Y;
    F:= EnStdRec[i].F;
    C:= EnStdRec[i].C;
    if EnStdRec[i].T<>2 then begin
     D:= EnStdRec[i].D; if D=9 then D:= random( 8);
     P:= D; if P>PN then P:= 0;
     end;
    A:= true;
    FC:= F;
    SC:= C;
    end;



   Snd:= not ((ParamCount>0) and (Paramstr(1)='nosound'));


   mpx:= BPL shl 3;
   mpy:= MapLength div BPL shl 3;
   CFirst:= 16; CLast:= 31;
   NewPos( 0,0);

   randomize;
   if MaxEnMov>MaxEnDef then for i:= MaxEnDef+1 to MaxenMov do with EnMov[i] do begin
    Copy( EnDat[0]);
    PD:= 1;
    PC:= MaxPC;
    A:= true;
    repeat
     X:= random( mpx shr 3-8)*8;
     Y:= random( mpy shr 3-8)*8;
     F:= random(  MaxF)+IntF;
     C:= random(  MaxC)+IntC;
     S:= random(  MaxS)+IntS;
     D:= random( 8);
     P:= D*3+1;
     FC:= F;
     SC:= C;
     while CollBox and (x>=0) and (y>=0) and (x<mpx-w) and (y<mpy-h)  do begin
      inc( x, 8*dir[d,0]);
      inc( y, 8*dir[d,1]);
      end;
     until (not CollBox) and (x>=0) and (y>=0) and (x<mpx-w) and (y<mpy-h);
    end;

{  for i:= 0 to MaxEnemy do EnDat[i].HalfDone;}

   with MiniMan do begin
    Load('miniman.bob');
    a:= false;
    Put( 80,192,0,true);
    PointColor:=54; OutText(91,192,':');
    PointColor:=20; OutTransparentText(90,192,':');
    end;
   with Clock do begin
    randomize;
    Load('clock'+_str( random(2))+'.bob');
    a:= false;
    Put( TClo-19,192,0,true);
    PointColor:=54; OutText(TClo-7,192,':');
    PointColor:=20; OutTransparentText(TClo-8,192,':');
    end;
   with Note do begin
    Load('sound.bob');
    a:= false;
    if Snd then Put( NoteX, 192, 0, true);
    end;
   with PLetter do begin
    Load('pause.bob');
    a:= false;
    end;

   InitKey;

 repeat
  ShowLives; ShowEnergy; ShowScore; ShowTime;
  LoadPal('tank.pal');
  repeat
   repeat
    with Tank do begin
     if MapX<MolX then begin
      dec( x, MolX-MapX);
      if not CollColors then begin
       Scroll( Right, MolX-MapX);
       for i:= 0 to MaxEnMov do begin
        inc( EnMov[i].X, MolX-MapX);
        inc( EnFir[i].X, MolX-MapX);
        end;
       for i:= 0 to MaxEnStd do begin
        inc( EnStd[i].X, MolX-MapX);
        inc( EnFis[i].X, MolX-MapX);
        end;
       for i:= 0 to MaxExp do inc( Exp[i].x, MolX-MapX);
       inc( x, MolX-MapX);
       MolX:= MapX end else begin inc( x, MolX-MapX); MapX:= MolX; end;
      end;
     if MapY<MolY then begin
      dec( y, MolY-MapY);
      if not CollColors then begin
       Scroll( Down , MolY-MapY);
       for i:= 0 to MaxEnMov do begin
        inc( EnMov[i].Y, MolY-MapY);
        inc( EnFir[i].Y, MolY-MapY);
        end;
       for i:= 0 to MaxEnStd do begin
        inc( EnStd[i].Y, MolY-MapY);
        inc( EnFis[i].Y, MolY-MapY);
        end;
       for i:= 0 to MaxExp do inc( Exp[i].y, MolY-MapY);
       inc( y, MolY-MapY);
       MolY:= MapY end else begin inc( y, MolY-MapY); MapY:= MolY; end;
      end;
     if MapX>MolX then begin
      inc( x, MapX-MolX);
      if not CollColors then begin
       Scroll( Left , MapX-MolX);
       for i:= 0 to MaxEnMov do begin
        dec( EnMov[i].X, MapX-MolX);
        dec( EnFir[i].X, MapX-MolX);
        end;
       for i:= 0 to MaxEnStd do begin
        dec( EnStd[i].X, MapX-MolX);
        dec( EnFis[i].X, MapX-MolX);
        end;
       for i:= 0 to MaxExp do dec( Exp[i].x, MapX-MolX);
       dec( x, MapX-MolX);
       MolX:= MapX end else begin dec( x, MapX-MolX); MapX:= MolX; end;
      end;
     if MapY>MolY then begin
      inc( y, MapY-MolY);
      if not CollColors then begin
       Scroll( Up   , MapY-MolY);
       for i:= 0 to MaxEnMov do begin
        dec( EnMov[i].Y, MapY-MolY);
        dec( EnFir[i].Y, MapY-MolY);
        end;
       for i:= 0 to MaxEnStd do begin
        dec( EnStd[i].Y, MapY-MolY);
        dec( EnFis[i].Y, MapY-MolY);
        end;
       for i:= 0 to MaxExp do dec( Exp[i].y, MapY-MolY);
       dec( y, MapY-MolY);
       MolY:= MapY end else begin dec( y, MapY-MolY); MapY:= MolY; end;
      end;
 (*  if Quit then begin
      port[$3c8]:=0;
      port[$3c9]:={40;}random(63);
      port[$3c9]:={0;} random(63);
      port[$3c9]:={0;} random(63);
      Quit:= false;
      end;
*)   MakeScr; RetRace;
     ShowScr;
{    if Quit then begin
      port[$3c8]:=0;
      port[$3c9]:=0;
      port[$3c9]:=0;
      port[$3c9]:=0;
    { Quit:= false;
      end;         }
     if Snd then NoSound;
     if Energy=0 then goto JumpHereIfNoEnergy;
     if Key[$Cb] and not (RotL or RotR) and (Counter=0) then
      begin
       inc( d); incp; RotL:= true;
       if CollColors then begin  AwayL:= true;
        RotL:= false; dec( d); decp; end else begin
        incp; if CollColors then begin
         decp; decp; dec( d); AwayL:= true; RotL:= false; end else decp;
        end;
       end;
     if Key[$Cd] and not (RotL or RotR) and (Counter=0) then
      begin
       dec( d); decp; RotR:= true;
       if CollColors then begin AwayR:= true;
        RotR:= false; inc( d); incp; end else begin
        decp; if CollColors then begin
         incp; incp; inc( d); AwayR:= true; RotR:= false; end else incp;
        end;
       end;
     if d<0 then d:= 7; if d>7 then d:=0;
     if Key[$C8] and not (RotL or RotR) and (Counter=0) then begin
{      if Snd then Sound( 20);}
       if x=mx then begin
        inc( MapX, dir[d,0]);
        if CollColors then dec ( MapX, dir[d,0]);
        end else begin
         inc( x, dir[d,0]);
         if CollColors or (x<0) or (x>mpx-w-MapX) then dec( x, dir[d,0]);
         end;
{      NoSound;}
       if y=my then begin
        inc( MapY, dir[d,1]);
        if CollColors then dec ( MapY, dir[d,1]);
        end else begin
         inc( y, dir[d,1]);
         if CollColors or (y<0) or (y>mpy-h-MapY) then dec( y, dir[d,1]);
         end;
       end;
     if Key[$D0] and not (RotL or RotR) and (Counter=0){and OkGo} then begin
{      if Snd then Sound( 100);}
       if AwayL or AwayR then begin
        Away:= AwayL; AwayL:= AwayR; AwayR:= Away;
        end;
       if x=mx then begin
        dec( MapX, dir[d,0]);
        if CollColors then inc ( MapX, dir[d,0]);
        end else begin
         dec( x, dir[d,0]);
         if CollColors or (x<0) or (x>mpx-w-MapX) then inc( x, dir[d,0]);
         end;
{      NoSound;}
       if y=my then begin
        dec( MapY, dir[d,1]);
        if CollColors then inc ( MapY, dir[d,1]);
        end else begin
         dec( y, dir[d,1]);
         if CollColors or (y<0) or (y>mpy-h-MapY) then inc( y, dir[d,1]);
         end;
       end;

     if AwayR then begin
       AwayR:= false;
       if d<=1 then d2:=6+d else d2:=d-2;
       if x=mx then begin
        inc( MapX, dir[d2,0]);
        if CollColors then dec ( MapX, dir[d2,0]);
        end else begin
         inc( x, dir[d2,0]);
         if CollColors or (x<0) or (x>mpx-w-MapX) then dec( x, dir[d2,0]);
         end;
       if y=my then begin
        inc( MapY, dir[d2,1]);
        if CollColors then dec ( MapY, dir[d2,1]);
        end else begin
         inc( y, dir[d2,1]);
         if CollColors or (y<0) or (y>mpy-h-MapY) then dec( y, dir[d2,1]);
         end;
       end;

     if AwayL then begin
       AwayL:= false;
       if d>=6 then d2:=d-6 else d2:=d+2;
       if x=mx then begin
        inc( MapX, dir[d2,0]);
        if CollColors then dec ( MapX, dir[d2,0]);
        end else begin
         inc( x, dir[d2,0]);
         if CollColors or (x<0) or (x>mpx-w-MapX) then dec( x, dir[d2,0]);
         end;
       if y=my then begin
        inc( MapY, dir[d2,1]);
        if CollColors then dec ( MapY, dir[d2,1]);
        end else begin
         inc( y, dir[d2,1]);
         if CollColors or (y<0) or (y>mpy-h-MapY) then dec( y, dir[d2,1]);
         end;
       end;


     if MapX<0 then begin inc( x, MapX); MapX:= 0; end;
     if MapY<0 then begin inc( y, MapY); MapY:= 0; end;
     if MapX>mpx-320 then begin inc( x{, MapX-mpx-320}); MapX:= mpx-320; end;
     if MapY>mpy-areay then begin inc( y{, MapY-mpy-areay});
      MapY:= mpy-areay; end;

     if RotL then begin
      inc( Counter);
      if Counter=MaxCountWait then begin
       incp; RotL:= false;
       end;
      end;
     if RotR then begin
      inc( Counter);
      if Counter=MaxCountWait then begin
       decp; RotR:= false;
       end;
      end;
     if d<0 then d:= 7; if d>7 then d:=0;
     if not (RotL or RotR) and (Counter>0) then dec( Counter);
     end;


    with Fire do begin
     if Key[$1d] and not Firing and not ( RotL or RotR) and
        (Cofi=0) then begin
      Cofi:= MaxCofi;
      d:= Tank.d;
      x:= Tank.X+Tank.X2+6*dir[d,0]-abs(x2*dir[d,1]);
      y:= Tank.Y+Tank.Y2+6*dir[d,1]-abs(y2*dir[d,0]);
      p:= d;
      a:= true; Firing:= true;
      if Snd then Sound( 50);
      end;

     if Firing then begin
      CLast:= 35;
      inc( x, FireSpeed*dir[d,0]);
      inc( y, FireSpeed*dir[d,1]);
      if ((x>320) or (x<-w) or (y<-h) or (y>AreaY)) and
         (Cofi=0) or CollColors then begin
       a:= false;
       firing:= false;
        if NoExp then begin Explor:= -1;
        with Exp[0] do begin
         x:= Fire.X; y:= Fire.Y; P:= 0; C:= MaxEC; a:= true; end;
        end;
       end;
      for i:= 0 to MaxEnMov do if Collision( EnMov[i]) and EnMov[i].OnScreen
       then begin
        a:= false;
       firing:= false;
       {EnMov[i].a:= false;}
       Explor:= 0;
       EnDeath:= i;
       inc( Score); ShowScore;
       NoExp:= false;
       with exp[0] do begin
        a:= true; c:= MaxEC;
        x:= EnMov[i].x+1;
        y:= EnMov[i].y+1;
        p:= 0;
        end;
       i:= MaxEnMov;
       inc( DeCo);
       end;
      for i:= 0 to MaxEnStd do if Collision( EnStd[i]) and EnStd[i].OnScreen
       then begin
       a:= false;
       firing:= false;
       {EnStd[i].a:= false;}
       Explor:= 1;
       EnDeath:= i;
       inc( Score); ShowScore;
       NoExp:= false;
       with EnStd[i] do begin
        exp[1].a:= true; exp[1].c:= MaxEC;
        exp[1].x:= x+w shr 1-10;
        exp[1].y:= y+h shr 1-10;
        exp[1].p:= 0;
        end;
       i:= MaxEnStd;
       inc( DeCo);
       end;
      CLast:= 31;
      end;
     if Cofi>0 then dec( Cofi);


     {inc( StoCo);{if StoCo=65535 then StoCo:=0;}
     asm inc StoCo end;
     for i:= 0 to MaxEnMov do with EnMov[i] do{if OnScreen
      then begin}if a and (Stoco mod S>0) and (EnDeath<>i) then begin
      inc( x, dir[d,0]);
      if CollBox or (x>mpx-w-PosX) or (x<=-PosX) or Collision( Tank) then begin
       dec( x, dir[d,0]);
       d:= random( 8);
       p:= d*3+1;
       end;
      inc( y, dir[d,1]);
      if CollBox or (y>mpy-h-PosY) or (y<=-PosY) or Collision( Tank) then begin
       dec( y, dir[d,1]);
       d:= random( 8);
       p:= d*3+1;
       end;
      dec( sc); if (sc=0) and (c>0) then begin
       sc:= c;
       d:= random( 8);
{      if c=1 then begin
        if Tank.X       }
       p:= d*3+1;
       end;
     if OnScreen then begin
      dec( pc); if pc=0 then begin
       pc:= MaxPC;
       inc( p, pd); if p mod 3 in [0,2] then pd:= -pd;
       end;
      if FC>0{and not EnFir[i].a}then dec( FC);
      if (FC=0) and not EnFir[i].a then {with EnFir[i] do} begin
       {EnFir[S]:= S;}
       EnFir[i].D:= D;
       EnFir[i].A:= true;
       EnFir[i].X:= X+4;
       EnFir[i].Y:= Y+4;
       end;
      end; end; {end else begin
       d:= random( 8);
       p:= d*3+1;
       end;}

     for i:= 0 to MaxEnStd do with EnStd[i] do if OnScreen then begin
      if{(Explor=-2) and}Collision( Tank) then begin
       inc( Score); ShowScore;
       {Quit:= true;}
       Energy:= 0;
       Explor:= 1;
       EnDeath:= i;
       NoExp:= false;
       with EnStd[i] do begin
        exp[1].a:= true; exp[1].c:= MaxEC;
        exp[1].x:= x+w shr 1-10;
        exp[1].y:= y+h shr 1-10;
        exp[1].p:= 0;
        end;
       end;
      dec( sc); if (sc=0) and (c>0) then begin
       sc:= c;
       d:= random( 8);
{      if c=1 then begin
        if Tank.X       }
       p:= d; if p>pn then p:=0;
       end;
      if F>0 then begin
       if FC>0{and not EnFir[i].a}then dec( FC);
       if (FC=0) and not EnFis[i].a then {with EnFir[i] do} begin
        {EnFir[S]:= S;}
        EnFis[i].D:= D;
        EnFis[i].A:= true;
        EnFis[i].X:= X+EnStd[i].w shr 1-1;
        EnFis[i].Y:= Y+EnStd[i].h shr 1-1;
        end;
       end;
      end;


      for i:= 0 to MaxEnMov do with EnFir[i] do if a then begin
       CLast:= 35;
       inc( x, EnFS*dir[d,0]);
       inc( y, EnFS*dir[d,1]);
       asm mov qu,0 end;
       {Qu:= Collision( Tank);
       Quit:= Quit or Qu;}
       if Collision( Tank) and not inflives then begin
        dec( Energy, 13);
        a:= false;
        EnMov[i].FC:= EnMov[i].F;
       if{ (Energy>13) and} (Explor<0) then begin
         NoExp:= false;
         Explor:= -1;
         with Exp[0] do begin
          x:= EnFir[i].X-4; y:= EnFir[i].Y-4; P:= 0; C:= MaxEC; a:= true; end;
         end;
        end;
       if ((x>320) or (x<-w) or (y<-h) or (y>AreaY)) or CollColors or Qu then begin
        a:= false;
        EnMov[i].FC:= EnMov[i].F;
        end;
       CLast:= 31;
       end;

JumpHereIfNoEnergy:

      if Energy<Decen then DecEnergy;
      Quit:= Quit or (DecEn=0);

      for i:= 0 to MaxEnStd do with EnFis[i] do if a then begin
       CLast:= 35;
       inc( x, EnFS*dir[d,0]);
       inc( y, EnFS*dir[d,1]);
       asm mov qu,0 end;
       {Qu:= Collision( Tank);
       Quit:= Quit or Qu;}
       if Collision( Tank) then begin Energy:= 0; a:= false; end;
       if ((x>320) or (x<-w) or (y<-h) or (y>AreaY)) or CollColors or Qu then begin
        a:= false;
        EnStd[i].FC:= EnStd[i].F;
        end;
       CLast:= 31;
       end;

      if Explor>=-1 then begin
       if Explor=-1 then begin Explor:= 0; EnDeath:= -1; end;
       with Exp[Explor] do begin
       if Snd and (P<4) and (EnDeath>=0) then Sound(random(200));
       dec( C);
       if C=0 then begin
        C:= MaxEc;
        inc( P);
        case P of
         4: if EnDeath>=0 then case Explor of
            0: EnMov[EnDeath].a:= false;
            1: EnStd[EnDeath].a:= false;
            end;
         8: begin a:= false; Explor:=-2; NoExp:= true; EnDeath:=-1; end;
         end;
        end;
       end; end else for i:= 1 to MaxExp do Exp[i].a:= false;
      if Explor=0 then Exp[1].a:= false else Exp[0].a:= false;

      if SnCo>0 then dec(SnCo);
      if Key[$1f] and (SnCo=0) then begin
       snd:= not snd;
       if Snd then Note.Put( NoteX, 192, 0, true) else begin
        PointColor:= 0; Bar( NoteX,192, NoteX+7,199); end;
       SnCo:= MaxSn;
       NoSound;
       end;
      if not Key[$1f] then SnCo:= 1;

      if Key[$19] then with PLetter do begin NoSound;
       Put( PauX,192,0,true);
       repeat until not Key[$19];
       repeat until Key[$19];
       PointColor:= 0; Bar( PauX,192, PauX+7,199);
       repeat until not Key[$19];
       end;

      inc( CentSec); if CentSec= MaxSec then begin
       CentSec:= 0;
       inc( Sec); if Sec=60 then begin
        Sec:= 0; inc( Min); end;
       ShowTime;
       end;


     end;
    until Key[1] or ((Quit or (Score=MaxScore)) and (Explor=-2));




   if Key[1] or (Score=MaxScore) then Lives:=1;
   for i:=0 to MaxExp do Exp[i].a:= false;
   with exp[1] do if (Score<MaxScore) then begin
    a:= true; p:= 0;
    x:= Tank.x+Tank.w shr 1-10;
    y:= Tank.y+Tank.h shr 1-10;
    for i:= 0 to 7 do begin
     for j:= 0 to 8 do begin if snd then Sound( 200+ random(200)); delay(15); end;
     MakeScr; RetRace; ShowScr;
     inc( p);
     Tank.a:= p<4;
     end;
    a:= false;
    NoSound;
    MakeScr; RetRace; ShowScr;
    delay( 800);
    end else begin MakeScr; ShowScr end;
   with Tank do begin
    x:= XStart; y:= YStart; d:= DStart; p:= d*2;
    a:= true;
    end;
   NewPos(0,0);
   HidePal(20,1,255,0,0,0);
   delay( 500);
   Quit:= false;
   for i:= 0 to MaxEnMov do EnFir[i].a:= false;
   for i:= 0 to MaxEnStd do EnFis[i].a:= false;
   Fire.a:= false;
   for i:= 0 to MaxEnDef do with EnMov[i] do begin
    if Lives=1 then a:= true;
    X:= EnMovRec[i].X;
    Y:= EnMovRec[i].Y;
    F:= EnMovRec[i].F;
    C:= EnMovRec[i].C;
    S:= EnMovRec[i].S;
    D:= random( 8);
    P:= D*3+1;
    FC:= F;
    SC:= C;
    PD:= 1;
    PC:= MaxPC;
    end;
   if MaxEnMov>MaxEnDef then for i:= MaxEnDef+1 to MaxenMov do with EnMov[i] do begin
    PD:= 1;
    PC:= MaxPC;
    repeat
     if Lives=1 then a:= true;
     X:= random( mpx shr 3-8)*8;
     Y:= random( mpy shr 3-8)*8;
     F:= random(  MaxF)+IntF;
     C:= random(  MaxC)+IntC;
     S:= random(  MaxS)+IntS;
     D:= random( 8);
     P:= D*3+1;
     FC:= F;
     SC:= C;
     while CollBox and (x>=0) and (y>=0) and (x<mpx-w) and (y<mpy-h)  do begin
      inc( x, 8*dir[d,0]);
      inc( y, 8*dir[d,1]);
      end;
     until (not CollBox) and (x>=0) and (y>=0) and (x<mpx-w) and (y<mpy-h);
    end;
   for i:= 0 to MaxEnStd do with EnStd[i] do begin
    if Lives=1 then a:= true;
{   if EnStdRec[i].T=2 then begin
     Copy( Tank);
     D:= EnStdRec[i].D;
     P:= D*2;
     {P:= 0;
     DT:= ptr( seg( dt), ofs( dt)+EnStdRec[i].D*2*PL);
     end else Copy( EnDat[EnStdRec[i].T]);            }
    X:= EnStdRec[i].X;
    Y:= EnStdRec[i].Y;
    F:= EnStdRec[i].F;
    C:= EnStdRec[i].C;
{   if EnStdRec[i].T<>2 then begin
     D:= EnStdRec[i].D; if D=9 then D:= random( 8);
     P:= D; if P>PN then P:= 0;
     end;}
    FC:= F;
    SC:= C;
    end;
   RotL:= false;
   RotR:= false;
   Counter:= 0;
   MapX:= 0;
   MapY:= 0;
   MolX:= 0;
   MolY:= 0;
   Cofi:= 0;
   DeCo:= 0;
   StoCo:= 0;
   SnCo:= 0;


   dec( Lives); ShowLives; Energy:= 39; DecEn:= 39; ShowEnergy;
   if Lives>0 then begin MakeScr; ShowScr; ShowPal(20,1,255); end;
   until Lives=0;



  repeat until not _KeyPressed;
  for i:= 1 to 10 do with HiRec[i] do begin
   nam:=''; sco:=0; tim:=0; tis:=0; end;
  {$I-}
  assign( hig, 'tank.hig');
  reset( hig);
  NewHig:= 0;
  if IOResult=0 then begin
   for i:= 1 to 10 do with hirec[i] do begin
    read( hig, hirec[i]);
    if ((sco<Score) or ((sco=Score) and (tim*60+tis>=Min*60+Sec))) and
     (NewHig=0) and (Score>0) then begin NewHig:=i; Seek( Hig, i-1); end;
    end;
   close( hig);
   end else if Score>0 then NewHig:= 1;
  {$I+}
  if NewHig>0 then with hirec[NewHig] do begin
   SetMode( 1);
   TextColor(15); TextBackGround(0);
   Window(1,1,40,13);
   WriteLn( 'Congratulations!');
   WriteLn( 'You have a high score.');
   DoneKey;
   Write( 'Enter Your name! ');
   while KeyPressed do ReadKey;
{  ReadLn( nam);}
   nam:='';
   repeat
    ch:= ReadKey;
    if (Ord( ch)>31) and (length(nam)<20) then begin nam:= nam+ch; Write( ch); end{;
     if ch=#0 then  else begin
     WriteLn; Write( 'If it does''nt work, push both CTRL!');
     GotoXY( 18, wherey-1);
     end};
    if ch=#0 then ReadKey;
    until ch=#13;
  {while KeyPressed do ReadKey;}
   InitKey;
   sco:= Score;
   tim:= Min;
   tis:= Sec;
   rewrite( hig);
   for i:= 1 to 10 do write( hig, hirec[i]);
   close( hig);
   end;
  SetMode( 3);
  Asm
   mov  ah,1
   mov  ch,1
   mov  cl,0
   and  cx,$1f1f
   int  $10
  End;
  Window( 20,5,60,18);
  TextBackGround( Black);
  ClrScr;
  TextColor( 14);
  WriteLn;
  WriteLn( '       Name:           Score:    Time:');
  TextColor( White);
{ DrawBorder( 19,4,59,17,1,15+16*Blue);
  DrawBorder( 19,6,59,17,2,15+16*Blue);
} WriteLn;
  for i:= 1 to 10 do with hirec[i] do begin
  if i=NewHig then TextColor( Yellow) else TextColor( White);
  GotoXY( 3,WhereY);
  Write( Nam);
  GotoXY( 26,WhereY);
  Write( _str( Sco));
  GotoXY( 34,WhereY);
  Smi:= _str( Tim);
  Sse:= _str( Tis);
  if length( Smi)=1 then Smi:='0'+Smi;
  if length( Sse)=1 then Sse:='0'+Sse;
  WriteLn( Smi,':',Sse);
  end;
  repeat until _KeyPressed;

  SetMode($13); Lives:= 3; ShowLives;
  Score:= 0; Min:= 0; Sec:= 0; CentSec:= 0;
  if Snd then Note.Put( NoteX, 192, 0, true);
  with Clock do begin
   Put( TClo-19,192,0,true);
   PointColor:=54; OutText(TClo-7,192,':');
   PointColor:=20; OutTransparentText(TClo-8,192,':');
   end;
  with MiniMan do begin
   Put( 80,192,0,true);
   PointColor:=54; OutText(91,192,':');
   PointColor:=20; OutTransparentText(90,192,':');
   end;


  until Key[1];





  DoneKey;
  DoneGame;
  NoSound;

 end.

