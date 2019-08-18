unit _System;

interface

  function  _VAL( s: string): longint;
  function  _STR( x: longint): string;
  function  _COPY( s: string; sz: byte): char;
  procedure sw_byte( var f, g: byte);
  procedure sw_word( var f, g: word);
  function  IOERROR: word;

implementation

uses MCGA;

function _VAL;

	var i: longint;
      j: integer;

	begin
	val( s, i, j);
	_VAL:= i;
	end;

function _STR;

	var s: string;

	begin
	str( x, s);
	_STR:= s;
	end;

function _COPY;

	var Karakter: array[0..255] of char absolute s;

	begin
	_COPY:= Karakter[sz];
	end;


procedure sw_byte;

	var x: byte;

	begin
	x:= f;
	f:= g;
	g:= x;
	end;

procedure sw_word;

	var x: word;

	begin
	x:= f;
	f:= g;
	g:= x;
	end;


function  IOERROR: word;

 begin
  if iORESULT<>0 then begin
  asm mov ax,3; int 10h; end;
  writeln('I/O ERROR'); halt; end;
 END;


end.
