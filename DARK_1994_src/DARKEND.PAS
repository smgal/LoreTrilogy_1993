Unit DarkEnd;

INTERFACE

Uses
   Crt, Graph, AdLib, UHanX, DarkSub;

 Procedure End_Demo;


IMPLEMENTATION

Procedure FadeSub(adder : integer);
var
   color, r, g, b : byte;
begin
   for color := 0 to 14 do begin
      case color of
         0 : begin
                r := adder div 5; g := adder div 5; b := adder div 5;
             end;
         1 : begin
                r := adder div 5; g := adder div 5; b := 42 + adder div 15;
             end;
         2 : begin
                r := adder div 5; g := 42 + adder div 15; b := adder div 5;
             end;
         3 : begin
                r := adder div 5; g := 42 + adder div 15; b := 42 + adder div 15;
             end;
         4 : begin
                r := 42 + adder div 15; g := adder div 5; b := adder div 5;
             end;
         5 : begin
                r := 42 + adder div 15; g := adder div 5; b := 42 + adder div 15;
             end;
         6 : begin
                r := 42 + adder div 15; g := 21 + adder * 2 div 15; b := adder div 5;
             end;
         7 : begin
                r := adder div 15 + 42; g := adder div 15 + 42; b := adder div 15 + 42;
             end;
         8 : begin
                r := 21 + adder * 2 div 15;
                g := 21 + adder * 2 div 15;
                b := 21 + adder * 2 div 15;
             end;
         9 : begin
                r := adder div 5; g := adder div 5; b := 62;
             end;
        10 : begin
                r := adder div 5; g := 62; b := adder div 5;
             end;
        11 : begin
                r := adder div 5; g := 62; b := 62;
             end;
        12 : begin
                r := 62; g := adder div 5; b := adder div 5;
             end;
        13 : begin
                r := 62; g := adder div 5; b := 62;
             end;
        14 : begin
                r := 62; g := 62; b := adder div 5;
             end;
      end;
      SetPalette(color,color);
      RGB(color,r,g,b);
   end;
end;

Procedure FadeIn;
var
   adder : byte;
begin
   for adder := 0 to 31 do FadeSub(adder*10);
end;

Procedure FadeOut;
var
   adder : byte;
begin
   for adder := 31 downto 0 do FadeSub(adder*10);
end;

Procedure EndMessage;
var
   x_pos, y_pos : integer;

 Procedure out(s : string);
 begin
    cHPrint(x_pos,y_pos,s);
    y_pos := y_pos + 20;
 end;

begin
   x_pos := 50; y_pos := 50;
   SetColor(14);
   out(' a“e ‹a¸å¦Èá ·¡œå ¶…¡w·¡ ”w¯¥µA‰A Àx´a µ© ˆáœa“e ˆõ·i ´i‰¡ ·¶');
   out('·¶´ö‘A. ¤é°á ·¡µÁ ˆ{·e ·©·i a“e ­I ® ´ô·¡ ‰c´ö”a‘A. ¸a‘A“e ·¡');
   out('ÐÐa‰Va ? ¸a‘Aˆa ¸a‘A· Àa¶¥µA¬á aŸi ·¡‹¡‹¡ ¸åµA, ˆa ½¸‰ae');
   out('‹a ¸å· Àa¶¥µA¬á· ¸a‘Aˆa aµA‰A ·¡œå ¯¢·a¡ ”a¯¡ µÁ¬á  a· ­¥');
   out('µA º‚´ö”a‘A. ˆa ¸a‘A· Àa¶¥µA¬á ÌÐ¬á §iœ‚Ñ©·i É·Ð¬á µa‹¡·');
   out('Àa¶¥·a¡ µ¡¡e¬á•¡ Ì¤ˆq·e ¸åÑa ´ô´ö”a‘A. ‹aˆå ¸a‘Aˆa ”a¯¡ ·¡œå');
   out('¡¡¯s·a¡   ´|µA aÈae”a“e ˆõ·i ´i‰¡ ·¶´ö‹¡ ˜¢…·¡»¡.  ¸a‘A“e');
   out('‰iŠ‚ ´i‰A –I ˆé­A.  a“e ·¡ ¡¡—e Àa¶¥·i É·Ðaµa ”e 1 ¡w·¡»¡ e ¸a');
   out('‘A“e ¸a‘AµÁ ˆ{·e ¶…¡w·i »¡“¡‰¡ ‹a Àa¶¥·i ¬i´aˆa“e ­I ® ´ô·¡  g');
   out('·e ¸a‘A—iº—µA Ðe¡w·¡œa‘A. ˆa »¡‹q µa‹¡¬á ”w¯¥·i º‚·¡”áœa•¡ ·¡');
   out('Àa¶¥µA ¬i‰¡ ·¶“e ¸a‘AµA ·Ð ”a¯¡ ”aŸe Àa¶¥·a¡ ½¸‰a i ˆõ·¡‘A.');
   out('Ða»¡ e ‹a•¡ ‰¨ aµA‰A º‚·aœá µ© ˆõ·¡œa“e ˆõ·i ´i® ·¶‰V»¡.');
   out(' a ‘AÇa¡ e¬á“e ´á“a Àa¶¥µA¬á•¡ Š—‹b¸â·a¡“e Ì¤Ÿi Ði ®ˆa ´ô');
   out('”a‘A. »b, aŸi ·¡‹¡“e ¸a“e ´a¢•¡ ´ô»¡.');
   y_pos := y_pos + 10;
   SetColor(15);
   out(' ·¥ ¬eÇaËa ‹aœa§a ..  ·¥ ¤a¯a Ïaœq ..');
   y_pos := y_pos + 10;
   SetColor(7);
   out(' ‘AÇa¡ e¬á“e µAá»¡ ¸w b·a¡ ”w¯¥·i ˆa–…À ÑÁµq Í¢Î—·a¡ ”á ·¡');
   out('¬w ¸áÐwÐa»¡ ¡µÐa“e ”w¯¥·i ‰·‰b Ð–”a. ”w¯¥·e Ó£¡Ðe ·¯¢­¢µA¬á•¡');
   out('¡±·¡ ¿¸‰aaˆa“e ˆõ·i “av”a. ·¡ˆõ·a¡¬á ¡´á· ­A‰“e ¯©Ÿ¡´e Äa');
   out('£¡á¯aˆa ´¯¡”wÁ¡ ¹¥¸Ða»¡ ´g´v”å Àa¶¥·a¡ ¤aŽá´ö”a.');
end;

Procedure ThunderEffect;
begin
   SetPalette(6,6);
   RGB(6,40,20,0);
   repeat
      if random(1000) = 0 then
      if random(100) = 0 then begin
         RGB(6,10,20,63);
         delay(random(100)+20);
         RGB(6,40,20,0);
      end;
   until keypressed;
   c := readkey;
end;

Procedure PutSprite(x,y,number : integer);
begin
   PutImage(x,y,Chara^[number+28],AndPut);
   PutImage(x,y,Chara^[number],OrPut);
end;

Procedure End_Demo;
var
   i, j : integer;
begin
   Delete_Scroll_Screen;
   Clear;
   Print(7,' ·©Ð—·e ¸a¯¥—i·¡ ˆa»¡‰¡ ·¶“e ¡¡—e Ó±·i ”aÐ');
   Print(7,'¬á  ”w¯¥·i ‘AÇa¡ e¬áˆa ·¶“e ‰·ˆe·a¡  Àa¶¥');
   Print(7,'·¡Èi·i ¯¡Åv”a. Àa¶¥ ·¡Èiº— ”w¯¥· ˆsµµ·e Ìa');
   Print(7,'ŠA–A‰¡ ÁAb·e ˜é´á¹v”a.  ‹aŸ¡‰¡ ”w¯¥· ·¯¢');
   Print(7,'·¡ •©´a µÖ·i˜  ·¡£¡ ‘AÇa¡ e¬á“e ”w¯¥ ´|µA');
   Print(7,'¬á ·¶´ö”a. ‹a“e  i·i ¯¡¸bÐ–”a.');
   c := readkey;
   SetFont(0);
   FadeIn;
   SetBkColor(0);
   ClearDevice;
   EndMessage;
   FadeOut;
   while KeyPressed do c := readkey;
   RGB(6,10,20,63);
   delay(40);
   RGB(6,40,20,0);
   delay(100);
   RGB(6,10,20,63);
   delay(100);
   RGB(6,40,20,0);
   SetFont(2);
   with party do begin
      map := 6; xaxis := 91; yaxis := 80;
   end;
   Load;
   ThunderEffect;
   FadeIn;
   SetFillStyle(SolidFill,8);
   Bar(0,0,640,480);
   SoundOn := FALSE;
   party.etc[1] := 255;
   Scroll(FALSE);
   FadeOut;
   PressAnyKey;
   PutImage(98,11*24,Font^[50],CopyPut);
   for i := 10 downto 6 do begin
      delay(1000);
      PutImage(98,(i+1)*24,Font^[47],CopyPut);
      PutImage(98,i*24,Font^[50],CopyPut);
   end;
   Print(7,' '+player[1].name+'“±·e »¡Ða ­A‰¡ ˆe –á ­¡¯¢·¡ ´ô”a»¡ ?');
   Print(7,'‹aa ¸áa ´i§¡Aµ¡· µ´å·e Ëiv”a‰¡—i Ða”å');
   Print(7,'•A.  ”aÇa ¡A·¡»¡“e ‰iŠ‚ aÈaa»¡ ´g´v¸g´a.');
   Print(7,'‹aœá¡e ­A¤å¼, ‘A¤å¼, ”a¬õ¤å¼ µ´å·e ¡¡–');
   Print(7,'ËivŠ….');
   Print(7,' ­A¤å¼ µ´å·e ‘AÇa¡ e¬áˆa '+player[1].name+'“±µA‰A Ì¤ Ð–·a“¡Œa Ëiv»¡.');
   Print(7,' ‘A¤å¼ µ´å·e  ”aÇa ¡A·¡»¡ˆa aÈaa»¡ ´g´v');
   Print(7,'‹¡ ˜¢…µA Ëiv»¡.');
   Print(7,' ‹aŸ¡‰¡ ”a¬õ¤å¼ µ´å·e  ËiŸ¥ µ´å·¡ Ðeˆa»¡');
   Print(7,'ˆa ´a“¡œa ­Aˆa»¡œa¬á Ëiv»¡.');
   Print(7,' ´á˜ ?   i·¡  x»¡ ?');
   PressAnyKey;
   FadeIn;

   if AdLibOn then PlayOff;
   UnSound;
   asm
      mov ah,0
      mov al,3
      int $10
      mov ah,1
      mov ch,$20
      int $10
   end;
   dispose(font); dispose(chara);
   dispose(map); dispose(enemydata);
   TextColor(7);
   TextBackGround(0);
   ClrScr;
   TextColor(7);
   Writeln(#13);
   RGB(7,0,0,0);
   SetPalette(15,15);
   RGB(15,0,0,0);
   TextColor(15);
   Writeln(#13);
   Writeln('                              << The End >>');
   Writeln('    " Dark Mage Cyllian Cominus  vol. #2 " is made by Ahn Young-Kie.');
   TextColor(7);
   Writeln('                        You must be a genius !!!');
   for i := 1 to 63 do begin
      RGB(7,i,i,i);
      SetPalette(15,15);
      RGB(15,i,i,i);
      delay(10);
   end;
   delay(500);
   for i := 62 downto 42 do begin
      RGB(7,i,i,i);
      delay(15);
   end;
   asm
      mov ah,1
      mov ch,$13
      mov cl,$14
      int $10
   end;
   Halt;
end;

end.