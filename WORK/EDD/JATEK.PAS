Program Jatek;{Barcza Bal�zs 2000 3 18}
   Uses crt;
   var a,b:integer;
       m:char;
 Begin
   clrscr;
   randomize;
   textbackground(0);
   clrscr;
   window(20,7,60,10);
   textbackground(1);
   textcolor(4);
   clrscr;
   write('DEMO verzi� A j�t�k megjelen�s�nek ideje 2000 nyara. Keresd a szak�zletekben.');
   writeln;
   write('G�pig�ny Pentium 400/64 MB RAM/10 MB HDD 3Dfx');
   window(1,23,50,25);
   textbackground(2);
   textcolor(15);
   Writeln(' A folytat�shoz nyomd meg az ENTER billenty�t!');
   readln;
   sound(200);
   delay(300);
   sound(300);
   delay(300);
   sound(400);
   delay(100);
   sound(100);
   delay(200);
   sound(300);
   delay(200);
   sound(200);
   delay(300);
   sound(300);
   delay(300);
   nosound;
   window(20,1,60,5);
   textbackground(3);
   textcolor(0);
   clrscr;
   write('      A FOX Laboratorium bemutatja');
   window(20,7,60,14);
   textbackground(4);
   textcolor(14);
   clrscr;
   writeln;
   write('   �    �  �    �  �     �       ���  ');
   writeln;
   write('   �    �  �    �  �     �      �   � ');
   writeln;
   write('   ������  �    �  �     �      ����� ');
   writeln;
   write('   �    �   �  �   �     �     �     �');
   writeln;
   write('   �    �    ��    ����  ����  �     �');
   window(50,22,80,25);
   textbackground(2);
   textcolor(1);
   clrscr;
   write('K�sz�tette:');
   writeln;
   write('Programoz�:Barcza Bal�zs');
   writeln;
   write('Sound:Barcza Bal�zs');
   window(1,23,50,25);
   textbackground(2);
   textcolor(15);
   Writeln(' A folytat�shoz nyomd meg az ENTER billenty�t!');
   readln;
   clrscr;
   window(1,1,80,25);
   textbackground(0);
   clrscr;
   window(1,1,80,3);
   textbackground(1);
   clrscr;
   write('                         A FOX Laboratorium K�sztete HULLA  ');
   writeln;
   write('1.02 Verzi� DEMO');
   window(1,24,80,25);
   textbackground(12);
   textcolor(0+128);
   clrscr;
   write(' BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB');
   window(75,3,80,24);
   textbackground(10);
   clrscr;
   window(1,3,6,24);
   textbackground(10);
   clrscr;
   window(19,4,63,4);
   textbackground(4);
   clrscr;
   window(19,5,63,15);
   textbackground(7);
   textcolor(1);
   clrscr;
   write('Fel�bredsz egy s�t�t csatorn�ban. A d�gl�tt patk�nyok szaga terjed a m�lys�gb�l. ');
   write('V�laszthatsz, a m�lys�gbe vagy felsz�n fel� m�szol.');
   writeln;
   write('A m�lys�g akkor 1 nyomj ');
   writeln;
   write('A felsz�n akkor 2 nyomj ');
   writeln;
   write('K�rem az ir�nyt ');
   readln(m);
   clrscr;
   case m of
     '1':begin
           write('A m�lys�gben a ki�hezett patk�nyok v�rtak.Csak egy cafat h�s maradt�l. HULLA J� VAGY.');
           sound(1000);
           delay(100);
           sound(500);
           delay(600);
           nosound;
           readln;
           window(13,5,68,16);
           textbackground(4);
           textcolor(14);
           clrscr;
           writeln;
           write('                                       ��              ');
           write;
           write('   �    �        ��       �            ��       �       ');
           write('   �    �       �  �      �           �  �      �       ');
           write('   ������      ������     �          ������     �       ');            writeln;
           write('  �    �     �      �    �         �      �    �       ');
           write('   �    �    �        �   ������   �        �   ������  ');
           readln;
           halt;
         end;
     '2':begin
           write('Ki�rve a csatorn�b�l egy szerencsej�t�kossal tal�lkozol.');
           write(' Megfenyeget, ha nem j�tszol vele meg�l.');
           write(' K�rdezi melyik sz�mra gondol 1 vagy 2; a d�nt�s a te kezedben van.');
           write(' K�rem a sz�mot.');
           write('  Titokban ellopsz egy kardot.');
           write(' A felh�k k�z�l el�t�nik egy titokzatos �l�l�ny.');
           write(' �s hirtelen elragad �s a s�t�t kast�lyba cipel.');
         end;
   end;
   readln;
   clrscr;
   writeln;
   write('A kast�lyban egy oroszl�n fej� sz�rnnyel tal�lkozol.');
   writeln;
   write('Megint v�laszthatsz. El�r�ntod a kardod �s asz�v�be m�rtod az �les peng�t vagy menek�lsz mint egy gy�va kutya.');
   writeln;
   write('A kardot v�lasztod + nyomj');
   writeln;
   write('A menek�l�st akkor - nyomj');
   writeln;
   write('K�rem a jelet ');
   readln(m);
   case m of
     '-':begin
           write('Menek�lsz de a v�gzet utol�r a sz�rny meg�l v�resen hull a fejed a porba.');
           sound(1000);
           delay(100);
           sound(500);
           delay(600);
           nosound;
           readln;
           window(13,5,68,16);
           textbackground(4);
           textcolor(14);
           clrscr;
           writeln;
           write('                                       ��              ');
           write;
           write('   �    �        ��       �            ��       �       ');
           write('   �    �       �  �      �           �  �      �       ');
           write('   ������      ������     �          ������     �       ');            writeln;
           write('  �    �     �      �    �         �      �    �       ');
           write('   �    �    �        �   ������   �        �   ������  ');
           readln;
           halt;
         end;
     '+':begin
           write('Hossz� ideig ny�lt el a harc a sz�rnnyel de a v�g�n te ker�lt�l ki gy�ztesen.');
           readln;
         end;
   end;
   clrscr;
   write('M�sz kifele a kast�lyb�l bem�sz egy kocsm�ba az asztaln�l j�tszanak, odam�sz le�lsz.');
   write('T�tnek felrakod a kardodat.');
   writeln;
   write('Dobj dobokock�val, az ellenf�l is dob �s a  nagyobb sz�m nyer.');
   a:=random(6)+1;
   writeln;
   write('K�rem a dobot sz�mot(ne csalj�l) ');
   readln(b);
   if a>=b then begin
                 writeln;
                 writeln(  a);
                 write('A veres�ged�rt �sszevertek az utc�n MONDHATOD hogy HULLA VAGY !!!!');
                 sound(1000);
                 delay(100);
                 sound(500);
                 delay(600);
                 nosound;
                 readln;
                 window(13,5,68,16);
                 textbackground(4);
                 textcolor(14);
                 clrscr;
                 writeln;
                 write('                                       ��              ');
                 write;
                 write('   �    �        ��       �            ��       �       ');
                 write('   �    �       �  �      �           �  �      �       ');
                 write('   ������      ������     �          ������     �       ');            writeln;
                 write('  �    �     �      �    �         �      �    �       ');
                 write('   �    �    �        �   ������   �        �   ������  ');
               end
          else begin
                 if b>a then begin
                               writeln;
                               writeln(  a);
                               write('Te nyert�t GY�ZT�l A J�T�KBAN');
                               sound(100);
                               delay(100);
                               sound(200);
                               delay(600);
                               nosound;
                               readln;
                             end;
               end;
   readln;
 End.

