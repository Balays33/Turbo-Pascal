(* urhajo.pas *)
program urhajo_animacio;

uses Graph, Crt;

var
  GraphDriver, GraphMode : integer;
  Active : byte;

procedure Page;
  begin
    setvisualpage(Active);
    Active := 1 - Active;
    setactivepage(Active);
    cleardevice;
  end;

procedure Move(X0, Y0, X1, Y1, V0 : integer);
  var
    VX, VY, T, X, Y : integer;
    DX, DY, S0 : real;
  begin
    DX := X1 - X0; DY := Y1 - Y0;
    S0 := sqrt(sqr(DX) + sqr(DY));
    VX := round(V0 * DX / S0);
    VY := round(V0 * DY / S0);
    T := 0;
    X := X0; Y := Y0;
    repeat
      setcolor(Red);
      circle(X+2,Y+3,12);
      Fillellipse(X, Y, 30,5);
      Line(X-10,Y-10,X+2,Y+3);
      Line(X+10,Y-10,X+2,Y+3);
      Page;
      X := X0 + T * VX;
      Y := Y0 + T * VY;
      delay(50);
      inc(T);
    until (abs(T * VX) > abs(DX)) or (abs(T * VY) > abs(DY));
  end;

begin
  DetectGraph(GraphDriver, GraphMode );
  if not (GraphDriver in [VGA, EGA]) then halt;;
  GraphMode := VGAMED;
  initgraph(GraphDriver, GraphMode, '');

  cleardevice;
  setvisualpage(0);
  setactivepage(1);
  cleardevice;
  Active := 1;
  SetBkColor(Cyan);
  Move(100, 100, 500, 300, 30);
  Move(500, 300, 100, 100, 10);
  Move(500, 100, 100, 300, 10);
  Move(100, 300, 500, 100, 10);
  Move(100, 100, 100, 300, 10);
  Move(100, 300, 100, 100, 10);
  Move(100, 100, 500, 100, 10);
  Move(500, 100, 100, 100, 10);

  closegraph;
end.
