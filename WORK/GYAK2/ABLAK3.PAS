program ablak3;                                   
uses crt;
begin
     clrscr;                        {K�perny�t�rl�s}
     textbackground(cyan);          {H�tt�r cyan}
     clrscr;
     window(7,2,74,24);             {Ablakm�ret be�ll�t�sa}
     textbackground(black);
     clrscr;
     window(15,4,65,22);
     textbackground(brown);
     clrscr;
     window(17,5,63,21);
     textbackground(blue);
     clrscr;
     textcolor(yellow);             {El�t�r sz�ne yellow}
     gotoxy(7,7);                   {Kurzor pozicion�l�sa}
     writeln('�ͻ    �ͻ  �����  ɻ   �  � �� �');
     gotoxy(7,8);
     writeln('� �ͻ�ͼ �  �      �Ȼ  �  �    �');
     gotoxy(7,9);
     writeln('�   ȼ   �  ����   � Ȼ �  �    �');
     gotoxy(7,10);
     writeln('�        �  �      �  Ȼ�  Ȼ  ɼ');
     gotoxy(7,11);
     writeln('�        �  �����  �   ȼ   ��ͼ ');
     window(1,1,80,25);
     readln;
     textbackground(black);
     textcolor(white);
     clrscr;
end.





