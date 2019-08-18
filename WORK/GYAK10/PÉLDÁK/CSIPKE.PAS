

Program csipke;      {Czimmer Kati}

Uses Crt,Graph;

Const max=27; {primszam legyen}
      r=200;

Var pontok : Array [1..27,1..2] Of Integer;
    i,j,step,Gd,Gm : Integer;
    ox,oy : Integer;

BEGIN
     randomize;
     Gd:=Detect;
     filemode:=0;
     InitGraph(Gd,Gm,'e:\tp\bgi');
     ox:=GetMaxX Div 2;
     oy:=GetMaxY Div 2;
     SetLineStyle(0,0,1);
     Circle(ox,oy,r);
     For i:=1 To max Do
       Begin
         pontok[i,1]:=ox+Round(r*cos((360/max*i)*pi/180));
         pontok[i,2]:=oy+Round(r*sin((360/max*i)*pi/180));
       End;
{       setbkcolor(blue);}
  for step:=1 to 15 do begin
    { setcolor(16-step);     }
     setcolor(step);
    { setcolor(random(16)-1);}
     i:=1-Step;
     j:=1;
     Repeat
        Inc(i,Step);
        Inc(j,Step);
        If i>max Then i:=i-max;
        If j>max Then j:=j-max;
        Line (pontok[i,1],pontok[i,2],pontok[j,1],pontok[j,2]);
        delay(20);
     Until j=1;
  end;
     outtextxy(10,10,'Kil‚p‚s - ENTER');
     ReadLn;
     CloseGraph;
END.

