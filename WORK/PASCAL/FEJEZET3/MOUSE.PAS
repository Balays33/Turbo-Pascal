unit MOUSE;

INTERFACE

	TYPE

		MouseType = record
      X, Y: word;
			Left, Middle, Right: boolean;
		 end;

		SensType = record
      X, Y, S: word;
		 end;

procedure ShowMouse;
procedure HideMouse;
procedure GetMouse( var M: MouseType);
procedure GotoMouse( X, Y: word);
procedure EnableArea( X1, Y1, X2, Y2: word);
procedure DisableArea( X1, Y1, X2, Y2: word);
procedure SetSensitivity( X, Y, S: word);
procedure GetSensitivity( var M: SensType);
procedure MouseSpeed( S: word);

function  InitMouse: boolean;
function  MouseX: word;
function  MouseY: word;
function  ButtonPressed: boolean;
function  MouseMoved: boolean;
function  LeftButton: boolean;
function  RightButton: boolean;
function  Sensitivity: word;

const
	ErrorNumber: word = 0;
	Normal = 64; Fast = 96; Slow = 32;


IMPLEMENTATION


uses DOS;

var
	REG: registers;

function INITMOUSE; begin
	reg.ax:=0; Intr($33,reg);
	InitMouse:= reg.ax=$ffff;
	end;

procedure SHOWMOUSE; begin reg.ax:=1; intr($33,reg); end;
procedure HIDEMOUSE; begin reg.ax:=2; intr($33,reg); end;

procedure GETMOUSE; begin with reg do with M do begin
	ax:= 3; intr($33,reg);
	Left:= bx and 1 = 1;
	Right:= bx and 2 = 2;
	Middle:= bx and 4 = 4;
	X:= cx;
	Y:= dx;
	end; end;

procedure GOTOMOUSE; begin
	reg.cx:= 2*X; reg.dx:= Y; reg.ax:= 4; intr($33,reg); end;

procedure ENableArea; begin with reg do begin
	ax:=7;cx:=X1*2;dx:=X2*2;intr($33,reg);
	ax:=8;cx:=Y1;dx:=Y2;intr($33,reg);
	end; end;

procedure DISableArea; begin with reg do begin
	ax:=16;cx:=X1*2;dx:=Y1;si:=X2*2;di:=Y2;intr($33,reg); end; end;


function MOUSEX;
	var Jerry: MouseType; begin
	GetMouse(Jerry); MouseX:= Jerry.X div 2; end;

function MOUSEY;
	var Jerry: MouseType; begin
	GetMouse(Jerry); MouseY:= Jerry.Y; end;

function BUTTONPRESSED;
	var Jerry: MouseType; begin with Jerry do with Reg do begin
  GetMouse(Jerry);
  ButtonPressed:=Left or Right;
  end; end;

function MOUSEMOVED; begin with reg do begin
	ax:= 11; intr($33,reg);
	MouseMoved:=(cx<>0)or(dx<>0); end; end;

function LEFTBUTTON;
	var Jerry: MouseType; begin
	GetMouse(Jerry); LeftButton:=Jerry.Left; end;

function RIGHTBUTTON;
	var Jerry: MouseType; begin
	GetMouse(Jerry); RightButton:=Jerry.Right; end;

procedure GETSensitivity; begin with reg do with M do begin
	ax:=27; intr($33,reg);
	X:= cx; Y:= bx; S:=dx; end; end;

procedure SETSensitivity; begin with reg do begin
	dx:=S; cx:=X; bx:=Y; ax:= 26; intr($33,reg); end; end;

function Sensitivity;
	var Jerry: SensType; begin
	GetSensitivity( Jerry); Sensitivity:= Jerry.S; end;

procedure MOUSESPEED; begin
	reg.ax:=19; reg.dx:=S; intr($33,reg); end;


begin
	reg.ax:= 28;
	reg.bx:= 1;
	intr($33,reg);
 end.
