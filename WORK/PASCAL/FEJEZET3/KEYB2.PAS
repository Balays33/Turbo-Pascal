{keyb2.pas}

uses Crt;               { Most a CRT egys‚get, vagyis a BIOS      }
                        { billentyû-megszakt s t haszn ljuk       }
var C: char;            { A lenyomott billentyû ASCII k¢dja lesz  }

begin
 repeat
  C:= readkey;
  writeln( ord( C));    { A C karakter ASCII k¢dj t kirjuk        }
  until C=#27;          { ESC-re kil‚p‚s a programb¢l             }
 end.
