Unit DarkTitl;

INTERFACE

Uses
   Crt, Graph, UHanX, DarkSub, DarkCret;

Const
   Back_Ground_Color = DarkGray;
   Fade_Top_Color = Cyan;
   Fade_Bottom_Color = Green;
   Main_Scroll_Color = LightCyan;
   Str_X_Pos = 71;
   Str_Y_Pos = 270;
   Max_Line = 8;
   Word_Y_Size = 16;
   Title_Str_Total = 35;
   Title_Str : array[1..Title_Str_Total] of string =
        (' ·¡ À‚·i ³e a“e ­A‰· º¯¡¸a·¡¡a  ‹q§¹‰Á ÎŸe§¹· ’…¦¯¥ ·¡º—',
         '¬÷· ·¡Ÿq·i ˆa»¥ Èa·± ¶¡Äá ´i§¡Aµ¡œa‰¡ Ðe”a.',
         '',
         ' ˆa ¯¡ˆe·i µaÐ—Ða”å º— ¶µeÓ¡ ¡—a ´e· ¯¡”Ÿi  ¯aÁaˆa‰A –A´ö',
         '”a.  ‹a ¯¡”“e ‹q§¹ ÀeœeÐe ¢…ÑÁµÁ µw¶¥Ði ˆõ e ˆ{·e ÍwÑÁˆa  ¡¡—e',
         '”ŸB·i ˆq°a‰¡ ·¶´ö‰¡,  ¶á”Ðe ¡—a ´e· ´bµA ”Ðe ‰i‰“e ¯¡Ÿ¡¶',
         '¯a· ¥i§¹Àáœñ ˆwÐa‰A ‹a—i·i ¥¡Ñ¡Ða‰¡ ·¶´ö”a.',
         ' ‹aœá”å ´á“ai, a“e ”a¬õˆ· ˆñ·e ÓW¬÷·¡ ¡´á ”ŸB· ˆwbÐe ‰i',
         '‰Ÿi š‰¡ —i´áµÁ ‹a—i· ¶…¡w­¢µA ¯a¡a—a“e ˆõ·i ¥¡´v”a. ‹aˆõ—i·e',
         '¸÷Ð»¥ ˜ˆa –A¡e Ðaa³¢ ‹a ­A‰· ¶…¡w·i ¤aŽ´á ‘½·iˆõ ˆ{´v”a.',
         ' ‹aœåÒµA ˆa ¥¥ˆõ·e ´aœ· ”a¬õˆa»¡µv”a.',
         '',
         'Àõ¤å¼ ÓW¬÷·¡ aÈaa“e i,  ÍwÑÁ“e ¡´á· ¯¥‰Á ÐqA ”»¡¡ Âœb',
         'Ði ˆõ·¡¡a ‰·ˆe·¡ ´á‹ua‰¡ ”ŸB·¡ »¥•·Ða¡a  ¬¡¶… ¹¥¸ˆa aÈae',
         '”a.',
         '',
         '–¤å¼ ÓW¬÷·¡ aÈaa“e i, ‹a“e ¶w´q· ”ŸB·a¡¦Èá ­A¬w·i –áÓe',
         '—i‰A –A¡a ‹a“e ‘AÇa¡ e¬áœa ¦‰Ÿ¡´á »¥”a.',
         '',
         '­A¤å¼ ÓW¬÷·¡ aÈaa“e i, ‘AÇa¡ e¬áŸi ·¡‹¡“e ¸a“e ´a¢•¡ ´ô‰A',
         '–E”a.',
         '',
         '‘A¤å¼ ÓW¬÷·¡ aÈaa“e i,  ¡Aá¯a· ”i·¡ ¦Š‰A ¢‰—i˜ ´á–‘· µw',
         'Ñ¥·¡ aÈaa ­A‰· ¹· i·i µ‰¡Ðe”a.',
         '',
         '”a¬õ¤å¼ ÓW¬÷·¡ aÈaa“e i,  ˆa ¥¥ ”a¬õ¤å· ÓW¬÷ º—µA Ðaaˆa',
         'aÈaa»¡ ´g´v·q·i ´i´a …”a.',
         '','','','','','','','');
Var
   add : integer;

 Procedure Title_Menu;


IMPLEMENTATION

procedure box(x1,y1,x2,y2 : integer;color : word;shadow,bold : boolean);
const
   tab = 4;
begin
   setfillstyle(SOLIDFILL,color);
   bar(x1,y1,x2,y2);
   moveto(x1,y2);
   setcolor(15);
   lineto(x1,y1); lineto(x2,y1);
   setcolor(8);
   lineto(x2,y2); lineto(x1,y2);
   if bold then begin
      moveto(x1+1,y2-1);
      setcolor(15);
      lineto(x1+1,y1+1); lineto(x2-1,y1+1);
      setcolor(8);
      lineto(x2-1,y2-1); lineto(x1+1,y2-1);
   end;

   if shadow then begin
      moveto(x1+pred(tab),y2-pred(tab));
      setcolor(8);
      lineto(x1+pred(tab),y1+pred(tab));
      lineto(x2-pred(tab),y1+pred(tab));
      setcolor(15);
      lineto(x2-pred(tab),y2-pred(tab));
      lineto(x1+pred(tab),y2-pred(tab));
      if bold then begin
	 moveto(x1+tab,y2-tab);
	 setcolor(8);
	 lineto(x1+tab,y1+tab); lineto(x2-tab,y1+tab);
	 setcolor(15);
	 lineto(x2-tab,y2-tab); lineto(x1+tab,y2-tab);
      end;
   end;
end;

procedure MessageBox(x1,y1,x2,y2 : integer;color : word;shadow : boolean);
const
   tab = 1;
begin
   if shadow then begin
      box(x1,y1,x2,y2,8,shadow,FALSE);
      box(x1+succ(tab),y1+succ(tab),x2-succ(tab),y2-succ(tab),color,FALSE,FALSE);
   end
   else box(x1,y1,x2,y2,color,shadow,FALSE);
   setfillstyle(SOLIDFILL,BLACK);
   bar(x1+pred(tab),y2+1,x2,y2+pred(tab));
   bar(x2+1,y1+pred(tab),x2+pred(tab),y2+pred(tab));

end;

procedure Text_Fading(s : string);
const
   co = Blue;
begin
   RGB(co,0,0,0);
   textcolor(co);
   write(s);
   for i := 0 to 42 do begin
      RGB(co,i,i,i);
      if not KeyPressed then delay(50);
   end;
   textcolor(7);
   gotoxy(1,WhereY); writeln(s);
   RGB(co,0,0,42);
end;

procedure Scroll_Sub(X_First,X_Length : word; Y_Start,Y_End : integer);
var
   i,k : word;
begin
   asm
      mov dx, $3CE
      mov al, 5
      mov ah, 1
      out dx, ax
   end;
   for i := Y_Start to Y_End do begin
      k := 80 * i + X_First;
      asm
         push ds
         push si
         push di
         mov si, k
         mov di, k
         sub di, 80
         mov cx, X_Length;
         mov ax, $0a000
         mov es, ax
         mov ds, ax
         rep movsb
         pop di
         pop si
         pop ds
      end;
   end;
end;

Procedure Print(x,y,str_number : integer);
begin
   if str_number in [1..Title_Str_Total] then
      OutHPrintXY(x,y,Title_Str[str_number],FALSE);
end;

Procedure Title_Menu;
Label
   Return_to_Menu, Jump_to_Create_Character;
begin

   if (s = '/?') or (s = '-?') or (s = '?') then begin
      closegraph;
      asm
         mov ah,1
         mov ch,$20
         int $10
      end;
      writeln;
      Text_Fading('Dark Mage ''Cyllian Cominus''  Volume #1');
      Text_Fading('                 made by Ahn Young-Kie');
      writeln;
      Text_Fading('USAGE : DARK [option]');
      writeln;
      writeln(' options - ''/g'' ==> start Game immediately');
      writeln('           ''/c'' ==> Create characters immediately');
      writeln('           ''/m'' ==> no Music required');
      writeln;
      asm
         mov ah,1
         mov ch,$13
         mov cl,$14
         int $10
      end;
      UnSound;
      Halt;
   end;

   if (s = '/c') or (s = '/C') then begin
      c := '1';
      goto Jump_to_Create_Character;
   end;

Return_to_Menu:
   SetFont(0);
   RGB(Blue,15,5,25);
   SetFillStyle(SolidFill,Blue);
   Bar(0,0,639,479);
   for i := 0 to 10 do
      Box(200-i*20,200-i*20,438+i*20,278+i*20,1,TRUE,TRUE);

   RGB(Black,0,0,0);
   SetPalette(Back_Ground_Color,Back_Ground_Color);
   RGB(Back_Ground_Color,15,15,15);
   RGB(Red,15,15,15);
   SetPalette(Magenta,Magenta);
   RGB(Magenta,0,0,0);
   SetPalette(LightMagenta,LightMagenta);
   RGB(LightMagenta,0,0,0);
                     
   s := '”aÇa ¡A·¡»¡ ¯©Ÿ¡´e Äa£¡á¯a';
   SetColor(Magenta);
   eHPrint(120,100,s);
   SetColor(LightMagenta);
   eHPrint(118,98,s);
   for i := 100 downto 40 do begin
      Scroll_Sub(9,63,40,180);
      SetPalette(Magenta,Magenta);
      RGB(Magenta,(100-i) div 2,(100-i) div 4,(100-i) div 2);
      SetPalette(LightMagenta,LightMagenta);
      RGB(LightMagenta,100-i,(100-i) div 2,100-i);
      delay(10);
   end;

   SetColor(14);
   cHPrint(80,330,'ˆáÃ¥ Ñ×´¡· ”ŸB‰Á ‘¼·e ¬e·a¡ –‰œá °a·¥ ”ŸB‰Á ¢‰­¢µA ¸q‹¡‰¡');
   cHPrint(80,350,'“|·a¡ ”üÓ¡‰¡ ¶w´q·¡ ÓaŸa“e ”ŸB•¡  ”w¯¥·¡ ´á¼é® ´ô·¡ ˆáÁa´¡');
   cHPrint(80,370,'–I ¶…¡w· ‹©·³“¡”a. ¶…¡w·i Ï¡Ðaa Ða»¡  a¯³¯¡µ¡.  ”w¯¥ ´|µA“e');
   cHPrint(80,390,'´å¹Aa ”w¯¥·i »¡Åa¥¡¡a •¡µÁº“e ˆa ·¶‰¡ ”w¯¥· ¯¥·¡ ·¶‰¡ ”w');
   cHPrint(80,410,'¯¥· •·ža—i·¡ ·¶¯s“¡”a. ”w¯¥·¡ ·¡ ­A‰µA —i´á µ¡“e ‹a i·¡ ¤a');
   cHPrint(80,430,'¡ ‹a ¡¡—e ¶…¡w·i »¡‰A –A“e ¯¡¸b·±·i ·¸»¡  i‹¡Ÿi §³“¡”a.');

   for i := 0 to 10 do
      MessageBox(140-i*10,160-i*5,500+i*10,250+i*5,Red,TRUE);

   j := 0;
   repeat
      inc(j);
      RGB(Fade_Bottom_Color,15,15,15);
      RGB(Fade_Top_Color,0,63,63);
      for add := 1 to Word_Y_Size do begin
         Scroll_Sub(Str_X_Pos div 8,64,126,290);
         if add = 1 then begin
            SetColor(Fade_Bottom_Color);
            Print(Str_X_Pos,Str_Y_Pos-add,j);
            SetColor(Fade_Top_Color);
            Print(Str_X_Pos,Str_Y_Pos-Word_Y_Size*(Max_Line+1)+(Word_Y_Size-add),j-Max_Line);
         end;
         RGB(Fade_Bottom_Color,16-add,15+add*3,15+add*3);
         RGB(Fade_Top_Color,add,63-add*3,63-add*3);
         if KeyPressed then begin
            add := Word_Y_Size;
            j := Title_Str_Total;
         end
         else delay(150);
      end;
      SetColor(Main_Scroll_Color);
      Print(Str_X_Pos,Str_Y_Pos-add,j);
      SetColor(Back_Ground_Color);
      Print(Str_X_Pos,Str_Y_Pos-Word_Y_Size*(Max_Line+1)+(Word_Y_Size-add),j-Max_Line);
   until j >= Title_Str_Total;

   MessageBox(40,110,600,300,Red,TRUE);
   RGB(Fade_Bottom_Color,0,42,0);
   RGB(Fade_Top_Color,0,42,42);
   SetPalette(Back_Ground_Color,Back_Ground_Color);
   RGB(Back_Ground_Color,21,21,21);

   SetColor(Black);
   OutHPrintXY(205,175,'1] ¬¡¶… º·¥‰··i ¬—¬÷ ¯¡Ç±',FALSE);
   OutHPrintXY(205,205,'2] ·¡¸å· ‰A·±·i ¸ˆ ¯¡Ç±',FALSE);
   OutHPrintXY(205,235,'3] •¡¯a¡ •©´aˆq',FALSE);
   SetColor(LightBlue);
   cHPrint(200,170,'1] ¬¡¶… º·¥‰··i ¬—¬÷ ¯¡Ç±');
   cHPrint(200,200,'2] ·¡¸å· ‰A·±·i ¸ˆ ¯¡Ç±');
   cHPrint(200,230,'3] •¡¯a¡ •©´aˆq');

   ok := false;
   repeat
      c := readkey;
      if c in ['1'..'3'] then ok := true;
   until ok;
   if c = '3' then begin
      CloseGraph;
      Unsound;
      Halt;
   end;

Jump_to_Create_Character:
   if c = '1' then begin
      if not CreateCharacter then goto Return_to_Menu;
      Loading_SaveGame := FALSE;
   end;
   ClearDevice;
   Restore_Palette;
end;

end.