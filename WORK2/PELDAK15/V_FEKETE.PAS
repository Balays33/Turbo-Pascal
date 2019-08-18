(* v_fekete.pas *)
program get_putimage_fekete_feher;
uses Graph;
var
   Gd,Gm    : integer;
       P    : pointer;
       m    : word;
  x,y,xm,ym : word;
begin
   Gd:=detect;
   InitGraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt;
   xm:=GetMaxX;
   ym:=GetMaxY;
     Bar(0,0,GetMaxX,GetMAxY);
     m:=ImageSize(10,20,40,60);
     GetMem(P,m);
     GetImage(10,20,40,60,P^);
     SetColor(black);
     OutTextXY(xm div 2 -50,ym-50,'Nyomjon <Enter>-t');
   readln;
   y:=ym div 2;
   SetColor(white);
   x:=50; y:=y-50;
   ClearDevice;

     OutTextXY(220,20,'Getimage Putimage teszt ');
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,NormalPut);
     Rectangle(x,y,x+30,y+40);
     OutTextXY(x,y+70,'NormalPut');
     Rectangle(x+10,y+10,x+40,y+50);
     OutTextXY(x,y+80,'NormalPut');

   x:=150;
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,CopyPut);
     Rectangle(x,y,x+30,y+40);
     OutTextXY(x,y+70,'NormalPut');
     Rectangle(x+10,y+10,x+40,y+50);
     OutTextXY(x,y+80,'CopyPut');

   x:=250;
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,XOrPut);
     Rectangle(x,y,x+30,y+40);
     OuttextXY(x,y+70,'NormalPut');
     Rectangle(x+10,y+10,x+40,y+50);
     OutTextXY(x,y+80,'XORPut');

   x:=350;
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,OrPut);
     Rectangle(x,y,x+30,y+40);
     OutTextXY(x,y+70,'NormalPut');
     Rectangle(x+10,y+10,x+40,y+50);
     OutTextXY(x,y+80,'OrPut');

   x:=450;
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,AndPut);
     Rectangle(x,y,x+30,y+40);
     OutTextXY(x,y+70,'NormalPut');
     Rectangle(x+10,y+10,x+40,y+50);
     OutTextXY(x,y+80,'AndPut');

   x:=550;
     PutImage(x,y,P^,NormalPut);
     Putimage(x+10,y+10,P^,NotPut);
     Rectangle(x,y,x+30,y+40);
     OutTextXY(x,y+70,'NormalPut');
     Rectangle(x+10,y+10,x+40,y+50);
     OutTextXY(x,y+80,'NotPut');
     OutTextXY(xm div 2-50,ym-50,'Nyomjon <Enter>-t');
   readln;

   Closegraph;
end.
