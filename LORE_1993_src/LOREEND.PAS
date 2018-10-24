Unit LoreEnd;

INTERFACE

Uses
   Crt, Graph, AdLib, UHanX, LoreSub;

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
begin
   SetColor(14);
   cHPrint(50,50,'¤c·e §¡¤aœq·¡ Ã¡‹¡ ¯¡¸bÐe”a. ·¡¤å ‰¸éµA —i´á Àá·q µ¡“e §¡µv”a.');
   cHPrint(50,70,' aÃ¡ Necromancer· ‹¡ŠÐe ¶…¡w·i ´•¡Ða“e —u·¡ ...');
   cHPrint(50,90,'Ða»¡ e ‹a“e ™¡”aŸe ¶…¡w· ´a·¡œá“¡ ˜¢…µA ¬¡¶… ‹©·i ˜áv”a.');
   cHPrint(50,110,'‹aˆa ·¡œå µb¬aŸi ¡y¤å·¡a ¤e¥¢Ð–“e»¡ ‹a ¸a¯¥•¡ ¡¡Ÿe”a.');
   cHPrint(50,130,'‹aˆa ÂAÒ¡ ¸÷ÀbÐi ‰µ  a¸á ´i®ˆa ´ô´ö”a');
   cHPrint(50,150,'´a“¡, ‹aˆa ¸÷ÀbÐi ‰µ·¡ ·¶“e»¡ ¹¡Àa•¡ ´i®ˆa ´ô´ö”a.');
   cHPrint(50,180,'”w¯¥•¡ ·¡¹A Ði·©·i ¡¡– {–”a. ·¡¹A Íe´eÐa‰A ®é ‹¡ÒAŸi ˆa»¡‰A –Eˆõ·¡”a.');
   cHPrint(50,200,'·¡¹A“e ”a¯¡ ·¡œå ·©·¡ ·©´áa»¡ ´g·i ˆõ·¡”a.');
   cHPrint(50,220,'Ò­A· ¬aœq—i·e  iÐa‰V»¡, ®Àå´â‘eµA Ðe¤å iŒa  iŒaÐe ·©·¡œa‰¡.');
   cHPrint(50,240,'´a a ·¡ ·©•¡ ¥i¡ µ¡œ ‹¡´â–A»¡ ´g·i ˆõˆ{”a.');
   cHPrint(50,260,'¡y Àå‘e e »¡a¡e ¸å¬é¡¬á, ´a“¡ ·¹Ña»¥ ´‹¡¡ e q·iÉA“¡Œa ...');
end;

Procedure ThunderEffect;
var
   ok : boolean;
begin
   ok := FALSE;
   SetPalette(6,6);
   RGB(6,40,20,0);
   repeat
      if random(1000) = 0 then
      if random(100) = 0 then begin
         RGB(6,10,20,63);
         delay(random(100)+20);
         RGB(6,40,20,0);
      end;
      if keypressed then c := readkey;
      if c = #27 then ok := true;
   until ok;
end;

Procedure PutSprite(x,y,number : integer);
begin
   PutImage(x,y,Chara^[number+28],AndPut);
   PutImage(x,y,Chara^[number],OrPut);
end;

Procedure StaffMessage;
begin
   page := 1 - page;
   SetActivePage(page);
   for j := 0 to 18 do
   for i := 0 to 32 do PutImage(i*20,j*20,Font^[47],CopyPut);
   SetColor(11);
   bHPrint(170,10,'·¡ ‰A·±· { a¢Ÿ¡µA ‰·ÐåÐe ·¥¢‰');
   SetColor(10);
   PutSprite(40,40,4);
   cHPrint(120,42,'·¡Ÿq·e '+player[1].name+'. ¤a¡ ”w¯¥·¡”a.');
   PutSprite(20,70,8); PutSprite(40,70,8); PutSprite(60,70,12);
   cHPrint(120,72,'Hydra, NOTICE •·Š‰· ¥¡¯aµv”a.');
   PutSprite(20,100,10); PutSprite(40,100,14); PutSprite(60,100,18);
   PutSprite(20,120,11); PutSprite(40,120,15); PutSprite(60,120,19);
   cHPrint(120,112,'Huge Dragon, LOCKUP •·Š‰· ¥¡¯aµv”a.');
   PutSprite(40,150,9);
   cHPrint(120,152,'Minotaur, µa‹¡¬á –¤å —w¸wÐa“e ¬—¢‰·¡”a.');
   PutSprite(40,180,23);
   cHPrint(120,182,'Panzer Viper, DUNGEON OF EVIL ·i »¡Ç¡”å ‹¡‰ ¬—¢‰.');
   PutSprite(40,210,22);
   cHPrint(120,212,'Black Knight, Necromancer ½¢· ¹A 2 ·¥¸a ·¡”a.');
   PutSprite(40,240,26);
   cHPrint(120,242,'ArchiMonk, Necromancer· ¶EÌi µbÐi· ¯©b¸a.');
   PutSprite(40,270,25);
   cHPrint(120,272,'ArchiMage, Necromancer· µ¡ŸeÌi·¥  a¤ó¬a.');
   PutSprite(40,300,16); PutSprite(40,320,17);
   cHPrint(120,312,'Neo-Necromancer, ¤a¡ ”w¯¥· ¡¢Îaµv”å ‹a¸a.');
   SetActivePage(1 - page);
end;

Procedure End_Demo;
var
   i, j : integer;
begin
   SetFont(0);
   FadeIn;
   SetBkColor(0);
   ClearDevice;
   EndMessage;
   FadeOut;
   setFont(1);
   StaffMessage;
   RGB(6,10,20,63);
   delay(40);
   RGB(6,40,20,0);
   delay(100);
   RGB(6,10,20,63);
   delay(100);
   RGB(6,40,20,0);
   ThunderEffect;
   ClearDevice;
   SetActivePage(page);
   SetVisualPage(page);
   while KeyPressed do c := ReadKey;
   y := 0; c := #255;
   j := 24; i := 1;
   ok := FALSE;
   repeat
      PutImage(600,(y div 20)*20,Font^[47],CopyPut);
      PutImage(600,(y div 20 + 1)*20,Font^[47],CopyPut);
      if y > 350 then y := 0;
      y := y + 2;
      PutSprite(600,y,j);
      if i = 1 then begin
         case j of
            20 : j := 24;
            24 : j := 21;
            21 : begin
                    j := 24;
                    i := 0;
                 end;
         end;
      end
      else begin
         case j of
            20 : begin
                    j := 24;
                    i := 1;
                 end;
            24 : j := 20;
            21 : j := 24;
         end;
      end;
      if KeyPressed then c := ReadKey;
      if c = #27 then ok := TRUE;
      delay(200);
   until ok;
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
   FreeMem(font,13776); FreeMem(chara,13776);
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
   Writeln('    " The Codex of Another Lore  vol. #1 " is made by Ahn Young-Kie.');
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
   
begin;
end.