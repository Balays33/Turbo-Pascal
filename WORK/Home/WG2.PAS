Program WestG;
   uses crt;
   var i,x:integer;
Begin
clrscr;
randomize;
textcolor(green);
clrscr;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln('    �       �  ����  ����  �����   ����   ��     �     ��   �  �  ���   ���     ');
writeln('     �     �   �     �       �    �      �  �   � �   �  �  �  �   �   �        ');
writeln('     �  �  �   ���    ��     �    � ���  ���   �   �  ���   ����   �   �        ');
writeln('     � � � �   �        �    �    �   �  � �    ���   �     �  �   �   �        ');
writeln('      �   �    ����  ����    �     ���   �  �  �   �  �     �  �  ���   ���     ');
gotoxy(1,3);
textcolor(red);
writeln(' Barcza Bal�zs');
writeln(' DJVMN2');
writeln(' M�szaki Informatika');
gotoxy(65,23);
textcolor(green);
writeln('Please  <ENTER> ');
readln;
  repeat
    x:=random(10);
    write(x:4);
    i:=i+1;
  until i > 460;
readln;
end.

