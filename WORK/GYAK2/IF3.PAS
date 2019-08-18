program if3;                                            
uses crt;
var egesz:integer;
    evsz   :integer;
    a,b,c:integer;
    datum:string[10];
    cev   :string[4];
    cho,cnap:string[2];
    ev,ho,nap:integer;
    kod      :integer;
    maxnap   :integer;
    x,y,z,w,max:real;

begin
    {*********** p ros - p ratlan ellen“rz‚s ************************}
    clrscr;
    writeln('k‚rek egy eg‚sz sz mot');
    read(egesz);
    if egesz=0 then writeln(' nulla')
                else case odd(egesz) of true :writeln(' p ratlan');
                                        false:writeln(' p ros');
                     end;
    readln;
    {*********** sz”k“‚v vizsg lat ************************}
    writeln('k‚rek egy ‚vsz mot ');
    read(evsz);
    if ((evsz mod 4)=0) and ((evsz mod 100)<>0) or ((evsz mod 400)=0)
       then writeln('sz”k“‚v')
       else writeln('nem sz”k“‚v');
    readln;
    {*********** h romsz”g ellen“rz‚s ************************}
     writeln('k‚rek 3 ‚rt‚ket a h romsz”g oldalainak ');
     write(' a='); readln(a);
     write(' b='); readln(b);
     write(' c='); readln(c);
     if (a+b < c) or (a+c < b) or (b+c < a)
             then writeln('nem alkotnak h romsz”get')
             else writeln('a kerlet =',a+b+c);
     readln;
     {*********** d tum ellen“rz‚s ************************}
     writeln('k‚rem a d tumot eeee.hh.nn. form ban');
     readln(datum);
     cev:=copy(datum,1,4);
     cho:=copy(datum,6,4);
     cnap:=copy(datum,9,2);
     val(cev,ev,kod);
     val(cho,ho,kod);
     val(cnap,nap,kod);
     writeln('‚v=',ev);
     if (ho>12) or (ho<1) then writeln('‚rv‚nytelen h¢nap',ho)
                          else writeln('h¢nap=',ho);
     case ho of 2       : maxnap:=28;
                4,6,9,11: maxnap:=30;
                else      maxnap:=31;
     end;
     if (nap>maxnap) or (nap<0) then writeln('‚rv‚nytelen nap',nap)
                                else writeln('nap= ',nap);
     readln;

     {*********** 3 sz m maximuma ************************}
     writeln('k‚rem a h rom sz mot');
     readln(x,y,z);
     if x > y then if x > z then max:=x
                            else max:=z
              else if y > z then max:=y
                            else max:=z;
     writeln('a lagnagyobb sz m:',max:10:2);
     readln;
end.

