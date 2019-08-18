program elj_fv2;                                
var
  i,j,k    : integer;
  a,x,y,eps: real;
  b:byte;
  b1,b2,b3:boolean;
  s1,s,z:string;
begin

   i:=145 mod 12 + 4 div 5;     writeln('145 mod 12:',i);
   i:=31 shl 2;                 writeln('31 shl 2:',i);
   i:=succ(succ(34)-pred(34));  writeln('succ(succ(34)-pred(34)):',i);
   i:=ord(1995)-ord(true);      writeln('ord(1995)-ord(true):',i);
   x:=sqrt(sqr(9));             writeln('sqrt(sqr(9)):',x:2:0);
   x:=frac(-345.678);           writeln('frac(-345.678:',x:5:3);
   b:=35 and 17 or 11;          writeln('35 and 17 or 11:',b:5);
   writeln;
   s:='abcdefgh';z:='def';      writeln('s=abcdefgh   z=def');
   writeln;
   i:=pos('abcdefgh','def');    writeln('pos(s,z):',i);
   insert(s,z,3);               writeln('insert(s,z,3):',z);
   writeln;
   b1:=true<>TRUE;              writeln('b1:=true<>TRUE:',b1);
   b1:=true<(false<succ(false));writeln('true<(false<succ(false)):',b1);
   writeln;
   b1:=('max' < 'min');         writeln('b1:max<min = ',b1);
   b2:=(+5 = 5);                writeln('b2: +5=5 = ',b2);
   writeln;
   b3:=not b1 and b2;           writeln('not b1 and b2:',b3);
   readln;
   writeln;writeln;
   writeln('V A G Y ');
   writeln;
   writeln('145 mod 12:',145 mod 12 + 4 div 5);
   writeln('31 shl 2:',31 shl 2);
   writeln('succ(succ(34)-pred(34)):',succ(succ(34)-pred(34)));
   writeln('ord(1995)-ord(true):',ord(1995)-ord(true));
   writeln('sqrt(sqr(9)):',sqrt(sqr(9)):2:0);
   writeln('frac(-345.678:',frac(-345.678):5:3);
   writeln('35 and 17 or 11:',35 and 17 or 11:5);
   writeln;
   s:='abcdefgh';z:='def';      writeln('s=abcdefgh   z=def');
   writeln;
   writeln('pos(s,z):',pos('abcdsfgh','def'));
   insert(s,z,3);
   writeln('insert(s,z,3):',z);                  {ezt nem lehet be¡rni}
   writeln('b1:=true<>TRUE:',true<>TRUE);
   b1:=true<(false<succ(false));writeln('true<(false<succ(false)):',b1);
   writeln;
   writeln('b1:max<min = ','max' < 'min');
   writeln('b2: +5=5 = ',(+5 = 5));
   writeln;
   writeln('not b1 and b2:',not b1 and b2);
   readln;
 end.
