
Program ShellSort;
uses crt;
Var
  A      : Array [1..100] of Word;
  I, J, N,
  K, Tmp : Integer;

Begin
clrscr;
  N := 100;
  For I := 1 to N Do
  Begin
    A[I] := Random(5000) + 1;
    Write(A[I] : 6);
  End;

  For K := 3 DownTo 1 Do
    For I := 1 to N - 1 Do
      For J := I + 1 to N Do
        If A[J] < A[I]
          then
          Begin
            Tmp  := A[J];
            A[J] := A[I];
            A[I] := Tmp;
          End;

  Writeln;

  For I := 1 To N Do
    Write(A[I] : 6);
End.
