Unit MystEnd;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, AdLib, UHanX, MystSub;
Const
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
        (' ¨Åù°∂Ö ù°óa¥e∑° ñE îwØ•µAâA.',
         '',
         ' µbØ° îwØ•∑e êa∑Å ã°îÅüi ∏·§·ü°ª° ¥g¥v≠°. êa ¥iß°ùAµ°ìe ãa∏· ù°',
         '¥·≠AâÅ∑Å µb¨aµA îÅ–Å  §wâ≈∏a∏‚∑• ∑≥∏w∑©™Ö∑°¥ˆª°†e  ß°öâ¥·πaàaìe',
         'ù°¥·≠AâÅ∑Å £°úÅüi ãaê∑ •°â°†e ∑∂∑i ÆÅìe ¥Ù¥·¨·  îwØ•∑i ¨Â»Ç–aâA',
         'ñA¥ˆâ° îwØ•∑i ∑°úÂ °°–ÒµA †iùa óiâA –ñîÂ àı∑°µ°.  ∑°πA ∂·¨Â∏aìe',
         '¨aúaπvâ°  ù°óa¥e∑Å √∑—°ï° îwØ•µAâA ï©¥aàv≠°.  –aª°†e îwØ•µAâAìe',
         '¥aª¢ 2àaª°∑Å â¡πAàa î· êq¥a∑∂≠°.  ¿ıºÅìe ëA«aù°†e¨·àa ñE ƒaë°ŒÅ',
         'Øaàa ∑°òwµA êÅùaµ©òÅ §È¥·ª°âA ñAâ°  ñâºÅìe °i†wîw–e ëAπ∑π¢∑Å ∂•',
         '—•∑° ¶Å—…–i òÅ §i¨ó–aâA ñIà·∂a.  ∑° ∑©ói∑e ¥¢ 100ëe “ÅµA §i¨ó–i',
         'àı∑°µ°. –aª°†e îwØ•∑°úa°e ¬ó¶Ö”° ∑°âaêâ ÆÅ ∑∂∑ià·úa £®≠°.',
         '',
         ' êaìe  ∑°πA ∑° ≠AâÅüi ò·êi òÅàa ñA¥ˆ≠°.  ¥aª¢ï° êÅàa àa•°¥a¥°–i',
         '¿a∂•∑° ÆÅ¥Ù∑° †g∑°∑∂ã° òÅ¢Ö∑°µ°.  ù°¥· ≠AâÅàa ∑∂ìe ∑°âµï°  ãa∏·',
         'êÅàa Øa¡aàvîÂ ÆÅ †g∑e ¿a∂•ói ∫ó∑Å –aêaù°  ã°¥‚ñIª°ï° °°üaâVª°†e',
         'ÆÛâA ∑∏¥· §·ü°ã°µAìe ê·¢Å ¥aåa∂Ö ã°¥‚∑° †g∑°∑∂≠°. ãa∫ó∑Å –aêaìe',
         'îwØ•∑Å π•∏Å òÅ¢Ö∑©à·úaµ°.  ∑°πA êaìe ∑°âµ µb¨aµA î· ∑°¨w Ø•âw∑i',
         '≥aª° ¥g∑aùaâ° –aµ°. ¥|∑aù° îaØ° µ© âÅ“Bï° ¥aª¢∑e ¥Ù≠°.  ãa∏· µw',
         '∂•∑Å ¿a∂•∑aù° êa∑Å µa–ó∑i âÅ≠¢ –i ™Ö∑°úaµ°.',
         '',
         '                                      »a∑±∂°ƒ· ¥iß°ùAµ°ù° ¶Å»·.',
         '','','','','','','','');



 Procedure End_Demo(no : byte);


IMPLEMENTATION

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

Procedure All_Fade_Out(plane : byte); assembler;
const
   dest_seg : word = $A000;
   dest_off : word = 0;
asm
   push es

   mov ax, dest_seg
   mov es, ax
   mov di, dest_off
   mov dx, $3C4
   mov al, 2
   mov ah, plane
   out dx, ax
   mov ax, $000
   mov cx, 40 * 480
   rep stosw

   pop es
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

Procedure End_Demo_Sub1;
begin
   for i := 0 to 3 do begin
      All_Fade_Out(1 shl i);
      delay(500);
   end;
end;

Procedure End_Demo_Sub2;
var
   add : integer;
begin
   End_Demo_Sub1;
   j := 0;
   SetPalette(Back_Ground_Color,Back_Ground_Color);
   RGB(Back_Ground_Color,0,0,0);
   SetPalette(Main_Scroll_Color,Main_Scroll_Color);
   RGB(Main_Scroll_Color,63,0,0);
   repeat
      inc(j);
      RGB(Fade_Bottom_Color,0,0,0);
      RGB(Fade_Top_Color,63,0,0);
      for add := 1 to Word_Y_Size do begin
         Scroll_Sub(Str_X_Pos div 8,64,Str_Y_Pos - Word_Y_Size*(Max_Line+1),Str_Y_Pos+20);
         if add = 1 then begin
            SetColor(Fade_Bottom_Color);
            Print(Str_X_Pos,Str_Y_Pos-add,j);
            SetColor(Fade_Top_Color);
            Print(Str_X_Pos,Str_Y_Pos-Word_Y_Size*(Max_Line+1)+(Word_Y_Size-add),j-Max_Line);
         end;
         RGB(Fade_Bottom_Color,round(add*3.9),0,0);
         RGB(Fade_Top_Color,64-round(add*3.9),0,0);
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
end;

Procedure End_Demo_Sub3;
var
   x_pos, y_pos : integer;
begin
   End_Demo_Sub1;
   x_pos := 40;
   y_pos := 60;
   setcolor(14);
   cHPrint(x_pos,y_pos,' êaìe ù°óa¥eµAâA †aª°†b ∑©âb∑i àa–aùa àÒ∑i ¡a ói¥ˆîa. –aª°†e ÆÛâA'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'êÅü°√© ÆÅ ∑∂∑iàı à{¥vª°†e  †a∑q ≠¢µA¨·ìe Ø±–e ï∑∂aàa ∑©â° ∑∂¥ˆîa.'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'ù°óa¥e ãaìe  êaµAâA ï©∑°«© ÆÅ ¥Ùìe Ø©ÆÅüi ∏·ª°üaâA –ñª°†e  ∑°πAìe'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'îa è{êe ∑©∑°¥ˆîa.  ëA«aù°†e¨·êa îa«a °A∑°ª°ï° ∑°πAìe îa ª°êaàe ã°'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'¥‚ ≠¢∑aù° ¨aúaπa àaâ° ∑∂∑aì°åa ... ...'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' êaìe àÒ∑i à·ñÅâ°ìe ñ·ï©¥a¨ˆîa. ù°óa¥e∑e ê·¢Åêa ∑•àe∑i ¨aúw–ñã°µA'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'∑•àe∑i ∑°ù≥âA –aâ°∏a–e ∫A §cµAìe ¥Ùîa.  êa µbØ° •°∏iàı¥Ùìe –e°w∑Å'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'∑•àeù°∞· â¡µe ãaüi Ø±Ãe–i ∏aâb∑° ∑∂∑iåa?'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,''); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,''); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' êaìe ù°¥·¨˜∑i ñ·ù°–e¿Å —•∏a†e∑Å µa–ó∑i ò·êaâ°∑∂îa.'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' µa»Ååı ∑∏â° ª°êñîÂ ∏aØ•†e∑Å Ø°àe∑i àaª°â° Øº¥ˆã° òÅ¢Ö∑°îa.  êÅàa'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'¥·ü©∏‚µA –aêa∑Å éë∑° ∑∂¥ˆîa.  ãaàı∑e ∏· –aìi∑Å ¨Å¿·úÒ ∏a∑Aù≥âA †Â'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'âµ∑aù° µa–ó∑i ò·êaìe àı∑°¥ˆîa.'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,' êÅ ∑°üq∑° ∏·óiµAâA ∑∏—aª©òÅ øq∑°°e  êaìe µaª°åı íÅäÅï° àe∏‚∑° ¥Ù'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'ìe ≠A¨w∑Å è{µA ï°îi–Å ∑∂∑iàı∑°îa. ãaü°â° à·ã°¨· êaìe ¨Åù°∂Ö êa ∏a'); y_pos := y_pos + 20;
   cHPrint(x_pos,y_pos,'Ø•∑i ¿xâ° ô° îaüe ¨k∑i ¨i¥aàaìe êaüi §iâe–i àı∑°îa.'); y_pos := y_pos + 20;
   ThunderEffect;
end;

Procedure End_Message;
var
   i, j : integer;
begin

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
   dispose(map);
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
   Writeln('                             << The End >>');
   Writeln('            " Into the MYSTIC  vol. #3 " is made by O√ Oµø≥');
   Writeln('                                                    ¿   O |');
   TextColor(7);
   Writeln('                       You must be a genius !!!');
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

Procedure End_Demo(no : byte);
begin
   case no of
      1 : End_Demo_Sub1;
      2 : End_Demo_Sub2;
      3 : End_Demo_Sub3;
   end;
   End_Message;
end;
{
begin
   i := DETECT;
   initgraph(i,j,'');
   end_demo(3);
   closegraph;}
end.