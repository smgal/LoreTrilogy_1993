Unit MystTitl;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystCret;

Const
   Image_Size = 14526;
   Back_Ground_Color = DarkGray;
   Fade_Top_Color = Cyan;
   Fade_Bottom_Color = Green;
   Main_Scroll_Color = LightCyan;
   Str_X_Pos = 71;
   Str_Y_Pos = 370;
   Max_Line = 8;
   Word_Y_Size = 16;
   Title_Str_Total = 29;
   Title_Str : array[1..Title_Str_Total] of string =
        (' µ¡œ ¸å¦Èá  ei ¶…¡w·¡´ö”å ”w¯¥µA‰A.',
         '',
         ' a“e ¯¡‰·· µaÐ—¸a·¥ Èa·±¶¡Äá ´i§¡Aµ¡œa‰¡ Ðaµ¡.  ˆa ¡´á ­A',
         '‰ˆa ·¶“e ‰·ˆe·a¡ ¸ó´á —i´ö·i ˜   aÃ± ·¡ ­A‰“e ¡—a´e· É·Ã¡',
         'µA ·¶´ö­¡.  ‹a ˜ ˆa ‹a”—iµA‰A ”bÁa µ© ¦‰ÑÂ¯©Ðe £¡œŸi  a·',
         '”a¬õ ˆa»¡ µ´å·a¡ ‰¯¡Ð º´ö”å ˆõ·i ‹¡´â Ðiˆá¶a. ‹aŸ¡‰¡ ‹a µ',
         '´å·¡ á¢a•¡ Çe Ó¬—·i ˆw¶aÐ–”å ˆõ•¡ ‹¡´âÐa‰¡ ·¶·i ˆáœa £¨­¡.',
         'a“e ­A¬w·i ŠÐa‹¡ ¶áÐ ¸a¯¥·i Ó¬— Ð´¡ e Ð–”å ‹aŸi ·¡ÐÐaµ¡.',
         '™¡Ðe ®‚¡w· ¸â·¡´ö”å ‘AÇa¡ e¬áµÁ ¦‰¡i· ”aÇa¡A·¡»¡ ¯©Ÿ¡´e Äa£¡',
         'á¯a µb¯¡ a“e ¶w¬á Ði ® ·¶´ö­¡.  Ða»¡ e ‹a—i·i ¶w¬áÐa“e•AµA“e',
         '””eÐe ¶w‹¡Ÿi ˆq®Ð´¡ e Ð–”aµ¡. ‹a—i· »¥¯±·i ·¡ÐÐa‹¡ ¶áÐ a',
         '“e ¬á–‰œá ¡´á ­A‰· ‰Áˆá¡ •¡´¢·i ¯¡¸bÐ–‰¡ ˆá‹¡¬á ˆa ¥¡´v”å',
         'ˆõ·e ‘AÇa¡ e¬áµÁ ”aÇa¡A·¡»¡· ‰ÒB–E Èe¬—·¡´ö­¡.  ˆa ‹a ‰‹¡',
         '¡ »¥¸÷Ðe ·¡ ­A‰· »¥¯©·i ´i‰A –A´ö·i ˜,  a ¯a¯a¡ˆa ·¡ ­A‰',
         'µA ”Ðe ‰w¡i¡  a·q·i ”h´a ¤áv­¡.  ‹aœ¬á aŸi ·¡Ð Ði ® ·¶·i',
         'ˆõˆ{·e ”w¯¥µA‰A ·¡œý‰A •¡¶‘·i À÷Ða“e ˆá¶a.  ”w¯¥·¡ ‘AÇa¡ e¬áµÁ',
         '”aÇa¡A·¡»¡Ÿi µÅ¸åÓ¡ ­¡¡i ¯¡Ç¡“e ‹a i, ·¡ ­A‰“e ”a¯¡ ¶¥œ· ¶…',
         '¡w· ŠÁ•¡¡ ¸ó´á—i‰A –A‰¡ a“e ‹a˜´¡ §¡¡­¡ ”aŸe ‰·ˆe·a¡· µa',
         'Ð—·i ”a¯¡ ¯¡¸bÐa‰A –Iˆá¶a.',
         '',
         '                                     Èa·±¶¡Äá ´i§¡Aµ¡¡ ¦Èá',
         '','','','','','','','');
   Select_Number = 5;
   Select_Str : array[1..Select_Number] of string =
        ('¬¡¶… ÄŸ¢Èá  e—i‹¡',
         '·¡¸å· ‰A·± ‰­¢Ða‹¡',
         '¸åÍe·  º‰ˆáŸ¡  ¶a´¢',
         '·¡ ‰A·± ¹A¸b·  ˆ¶a',
         '  •¡¯a¡  •©´aˆa‹¡  ');
Var
   add : integer;
   select : 1..Select_Number;

 Procedure Title_Menu;

IMPLEMENTATION

procedure Box(x1,y1,x2,y2 : integer;color : word;shadow,bold : boolean);
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
   i,j,k : word;
begin
   i := Y_End - Y_Start + 1;
   k := 80 * Y_Start + X_First;
   j := 80 - X_Length;
   asm
      push ds
      push si
      push di

      mov dx, $3CE
      mov al, 5
      mov ah, 1
      out dx, ax
      mov dx, $3C4
      mov ax, $0F02
      out dx, ax

      mov ax, $0a000
      mov es, ax
      mov ds, ax
      mov si, k
      mov di, k
      sub di, 80
      mov cx, i

@JUMP1:
      push cx
      mov cx, X_Length;
      rep movsb
      add si,j;
      add di,j;
      pop cx
      loop @JUMP1;

      pop di
      pop si
      pop ds
   end;
end;

Procedure Print(x,y,str_number : integer);
begin
   if str_number in [1..Title_Str_Total] then
      OutHPrintXY(x,y,Title_Str[str_number],FALSE);
end;

Procedure Introduce_preGame;
begin
end;

Procedure Introduce_Staff;

 procedure p(x,y : integer;s : string);
 begin
    x := x * 16;
    y := y * 32;
    eHPrint(x,y,s);
 end;

 procedure w(x,y : integer;s : string);
 begin
    x := x * 8;
    y := y * 16;
    cHPrint(x,y,s);
 end;

begin
   ClearDevice;
   Restore_Palette;
   SetColor(White);
   RGB(Blue,10,20,40);
   SetFillStyle(SolidFill,Blue);
   Bar(0,0,640,480);
   setcolor(15);
   p(2,1,'¯¡aŸ¡µ¡ & Ïa¡‹aœ£· & ‹aœÏ¢');
   setcolor(14);
   p(3,2,': ´e µw‹¡');
   setcolor(15);
   p(2,4,'¤‰w ·q´b & ·qÐ· Òa‰Á');
   setcolor(14);
   p(3,5,': Š‚¶A· ¯©b·¶“e Íe‰¢¸a“±—i');
   p(3,6,'       ( ·¡Ÿq·e ¸i ¡¡Ÿq )');
   setcolor(15);
   p(2,8,'•¡¶‘·i º¯¥¦…');
   setcolor(14);
   p(3,9,': ´e µwÒ…');
   w(5,25,'¹A¸b‹¡ˆe : 1995 ‘e 2 ¶© 1 ·© ¸á‘b¦Èá     2 ¶© 12 ·© ¬¥bŒa»¡');
   c := readkey;
end;

Procedure Title_Menu;
Label
   Return_to_Menu, Jump_to_Create_Character;
Var
   data : ^byte;
begin

   ok := FALSE;
   for i := 1 to paramcount do
      if (paramstr(i) = '/?') or (paramstr(i) = '-?') or (paramstr(i) = '?') then ok := TRUE;
   if ok then begin
      closegraph;
      asm
         mov ah,1
         mov ch,$20
         int $10
      end;
      writeln;
      Text_Fading('<<  Into the Mystic  >>       Ver. 1.0');
      Text_Fading('                 made by Ahn Young-Kie');
      writeln;
      Text_Fading('USAGE : MYSTIC [option]');
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

   ok := FALSE;
   for i := 1 to paramcount do
      if (paramstr(i) = '/c') or (paramstr(i) = '/C') then ok := TRUE;
   if ok then begin
      c := '1';
      goto Jump_to_Create_Character;
   end;

Return_to_Menu:
   SetFont(0);
   RGB(Blue,15,5,25);
   for i := 0 to 10 do
      Box(200-i*20,200-i*20,438+i*20,278+i*20,DarkGray,TRUE,TRUE);

   RGB(Black,0,0,0);
   SetPalette(Back_Ground_Color,Back_Ground_Color);
   RGB(Back_Ground_Color,15,15,15);
   RGB(Red,10,10,10);
   SetPalette(Magenta,Magenta);
   RGB(Magenta,15,15,15);
   SetPalette(LightMagenta,LightMagenta);
   RGB(LightMagenta,15,15,15);

   GetMem(data,Image_Size);
   Assign(f,'Title.Dat');
   Reset(f,1);
   BlockRead(f,data^,Image_Size);
   Close(f);
   PutImage(85,100,data^,copyput);
   FreeMem(data,Image_Size);

   for i := 100 downto 40 do begin
      Scroll_Sub(9,63,40,180);
      SetPalette(Magenta,Magenta);
      RGB(Magenta,(100-i) div 4 + 15,15,(100-i) div 4 + 15);
      SetPalette(LightMagenta,LightMagenta);
      RGB(LightMagenta,(100-i)*3 div 4 +15,(100-i) div 4 + 15,(100-i)*3 div 4 + 15);
   end;

   j := 0;
   repeat
      inc(j);
      RGB(Fade_Bottom_Color,15,15,15);
      RGB(Fade_Top_Color,0,63,63);
      for add := 1 to Word_Y_Size do begin
         Scroll_Sub(Str_X_Pos div 8,64,Str_Y_Pos - Word_Y_Size*(Max_Line+1),Str_Y_Pos+20);
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

   MessageBox(40,210,600,400,Red,TRUE);
   RGB(Fade_Bottom_Color,0,42,0);
   RGB(Fade_Top_Color,0,42,42);
   SetPalette(Back_Ground_Color,Back_Ground_Color);
{   RGB(Back_Ground_Color,21,21,21);}

   select := 2;
   SetColor(Black);
   for i := 1 to Select_Number do OutHPrintXY(230,pred(i)*20 + 260,Select_Str[i],FALSE);
   for i := 1 to Select_Number do begin
      if i <> select then SetColor(LightBlue) else SetColor(Yellow);
      cHPrint(225,pred(i)*20 + 253,Select_Str[i]);
   end;

   ok := false;
   repeat
      while KeyPressed do c := ReadKey;
      c := ReadKey;
      SetColor(LightBlue);
      cHPrint(225,pred(select)*20 + 253,Select_Str[select]);
      if c = #0 then begin
         c := ReadKey;
         case c of
            #72 : if select > 1 then dec(select) else select := Select_Number;
            #80 : if select < Select_Number then inc(select) else select := 1;
         end;
      end;
      SetColor(Yellow);
      cHPrint(225,pred(select)*20 + 253,Select_Str[select]);
      ok := (c = #13);
   until ok;
   case select of
      3 : begin
             Introduce_preGame;
             goto Return_To_Menu;
          end;
      4 : begin
             Introduce_Staff;
             goto Return_To_Menu;
          end;
      5 : begin
             CloseGraph;
             Unsound;
             Halt;
          end;
   end;

Jump_to_Create_Character:
   if select = 1 then begin
      if not CreateCharacter then goto Return_to_Menu;
      Loading_SaveGame := FALSE;
   end;
   ClearDevice;
   Restore_Palette;
end;

end.