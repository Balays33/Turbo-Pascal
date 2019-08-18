(* v_szines.pas *)
(* EGA ‚s VGA *)
program get_putimage_szines;
uses Graph;
var
   Gd,Gm : integer;
       P : pointer;
       m : word;
  x,y    : word;
begin
   DetectGraph(gd, gm);
   if not (Gd in [VGA, EGA]) then halt;;
   InitGraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt;
     SetBkColor(cyan);
     SetColor(Red);
     Bar(0,0,GetMaxX,GetMAxY);
     m:=ImageSize(10,20,40,60);
     GetMem(P,m);
     GetImage(10,20,40,60,P^);
     setcolor(red);
     OutTextxy(250,150,'Nyomjon <Enter>-t');
   readln;
   x:=50; y:=100;
   ClearDevice;

     setcolor(red);
     OutTextXY(220,20,'Getimage Putimage teszt ');
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,NormalPut);
     rectangle(x,y,x+30,y+40);
     outtextXY(x,y+70,'NormalPut');
     setcolor(blue);
     rectangle(x+10,y+10,x+40,y+50);
     outtextXY(x,y+80,'NormalPut');

   x:=150; y:=100;
     setcolor(red);
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,CopyPut);
     rectangle(x,y,x+30,y+40);
     outtextXY(x,y+70,'NormalPut');
     setcolor(blue);
     rectangle(x+10,y+10,x+40,y+50);
     outtextXY(x,y+80,'CopyPut');

   x:=250; y:=100;
     setcolor(red);
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,XOrPut);
     rectangle(x,y,x+30,y+40);
     outtextXY(x,y+70,'NormalPut');
     setcolor(blue);
     rectangle(x+10,y+10,x+40,y+50);
     outtextXY(x,y+80,'XORPut');

   x:=350; y:=100;
     Setcolor(red);
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,OrPut);
     rectangle(x,y,x+30,y+40);
     outtextXY(x,y+70,'NormalPut');
     SetColor(blue);
     rectangle(x+10,y+10,x+40,y+50);
     outtextXY(x,y+80,'OrPut');

   x:=450; y:=100;
     setcolor(red);
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,AndPut);
     rectangle(x,y,x+30,y+40);
     outtextXY(x,y+70,'NormalPut');
     setcolor(blue);
     rectangle(x+10,y+10,x+40,y+50);
     outtextXY(x,y+80,'AndPut');


   x:=550; y:=100;
     setcolor(red);
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,NotPut);
     rectangle(x,y,x+30,y+40);
     outtextXY(x,y+70,'NormalPut');
     setcolor(blue);
     rectangle(x+10,y+10,x+40,y+50);
     outtextXY(x,y+80,'NotPut');
   setcolor(red);
   OutTextXY(250,250,'Nyomjon <Enter>-t');
   readln;

   Closegraph;
end.
