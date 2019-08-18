{loadbob.pas}
{$X+}

uses Crt, Game;

var
 Nap: BOB;              { A BOB azonost¢ja 'nap' lesz             }

begin
 InitGame;              { GAME egys‚g inicializ l sa              }
 with Nap do begin      { A BOB-bal kapcsolatos mûveletek         }
  Load('napocska.bob'); { BOB inicializ l sa, Shape bet”lt‚se     }
  X:= 10;               { Koordin t k be llt sa                   }
  Y:= 10;
  end;
 MakeScr;               { Megjelen¡t‚s el‹k‚szt‚se                }
 ShowScr;               { Megjelen¡t‚s                            }
 readkey;               { V rakoz s egy billentyûre               }
 DoneGame;              { Egys‚g lez r sa                         }
 end.
