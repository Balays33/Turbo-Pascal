(* rajz1.pas *)
program rajz1;
uses Graph;
const
 Hsz   : array[1..4] of PointType=( (x: 80; y:240),
                                    (x:240; y:240),
                                    (x:270; y:270),
                                    (x: 80; y:240));
 Hsz1  : array[1..4] of PointType=( (x:300; y:240),
                                    (x:360; y:240),
                                    (x:360; y:310),
                                    (x:300; y:240));
var
   Gd,Gm  : integer;
   IvKoord: ArcCoordsType;
begin
   DetectGraph(gd, gm);
   if not (Gd in [VGA, EGA]) then halt;;

   InitGraph(Gd,Gm,'');
   if GraphResult<>GrOk then Halt;
   SetBkColor(Cyan);
   SetColor(Red);

   Arc(50,100,0,120,50);
   Bar(120,20,150,100);
   Bar3d(160,30,180,100,10,TopOff);
   SetFillStyle(BkSlashFill,1);
   Bar3d(160,30,200,100,10,TopOn);
   Circle(250,50,30);
   Rectangle(300,40,320,100);
   Ellipse(400,60,0,360,50,30);
   FillEllipse(520,60,20,40);
   Circle(600,50,30);

   MoveTo(50,120);
   SetColor(white);
   LineTo(100,120);
   LineRel(0,20); LineRel(30,0);
   MoveRel(30,0); Lineto(160,120);LineRel(30,20);
   SetColor(Blue);
   Line(220,140,270,140);
   SetLineStyle(CenterLn,0,1);
   Line(220,130,270,130);
   SetLineStyle(DottedLn,0,1);
   Line(290,140,340,140);
   SetLineStyle(DashedLn,0,1);
   Line(290,130,340,130);
   SetLineStyle(SolidLn,0,3);
   Line(360,140,410,140);

   SetLineStyle(SolidLn,0,1);
   SetColor(Red);
   SetFillStyle(SlashFill,14);
   PieSlice(80,200,90,360,30);
   SetFillStyle(XHatchFill,5);
   PieSlice(80,200,20,75,30);

   Sector(150,200,0,120,50,30);

   DrawPoly(4,Hsz);
   SetFillStyle(WideDotFill,4);
   FillPoly(4,Hsz1);

   Arc(250, 200, 0,120,30);
   GetArcCoords(IvKoord);
   with IvKoord do
        Line(Xstart,Ystart,Xend,Yend);

   readln;
   CloseGraph;
end.
