(*  cursor.pas *)

UNIT cursor;

INTERFACE
uses crt,Graph;
var
      CursorP    : pointer;
      CurX, CurY : integer;

Procedure putcursor(var p:Pointer;h,v,h1,vonal,color:integer);
Procedure delcursor(p:Pointer;h,v,h1:integer);

IMPLEMENTATION

Procedure putcursor(var p:Pointer;h,v,h1,vonal,color:integer);
 { kiteszi a kurzort }
 Begin
 {  vonal = 1  a kurzor teljes vonal     }
 {  vonal = 0  a kurzor szaggatott vonal }

  GetMem(p,ImageSize(h-5,v-h1,h+5,v+h1));
  GetImage(h-5,v-h1,h+5,v+h1,p^);
  SetColor(color);
  if vonal=1 then
                 SetLineStyle(SolidLn,0,NormWidth)
             else
                 SetLineStyle(DashedLn,0,NormWidth);
  Line(h-5,v,h+5,v);
  Line(h,v-h1,h,v+h1)
 End;

Procedure delcursor(p:Pointer;h,v,h1:integer);
{ t”rli a kurzort }
 Begin
  PutImage(h-5,v-h1,p^,normalput);
  FreeMem(p,ImageSize(h-5,v-h1,h+5,v+h1));
 End;

END.
