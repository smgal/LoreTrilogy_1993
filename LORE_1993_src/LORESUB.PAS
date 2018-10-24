Unit LoreSub;

INTERFACE

Uses
   Crt, Dos, Graph, AdLib, UHanX;
Type
   fonttype = array[0..55,1..246] of byte;
   scrolltypes = (normal,snow,rain,autumn,wilderness,strongrain);
   positiontype = (town,ground,den,keep);
   lore = record
             name : string[17];
             sex : (male,female);
             class : byte;
             strength : byte;
             mentality : byte;
             concentration : byte;
             endurance : byte;
             resistance : byte;
             agility : byte;
             accuracy : array[1..3] of byte;
             luck : byte;
             poison : byte;
             unconscious : integer;
             dead : integer;
             hp : integer;
             sp : integer;
             esp : integer;
             level : array[1..3] of byte;
             ac : byte;
             experience : longint;
             weapon : byte;
             shield : byte;
             armor : byte;
             wea_power : byte;
             shi_power : byte;
             arm_power : byte;
          end;
   loreplayer = record
                   map : byte;
                   xaxis : byte;
                   yaxis : byte;
                   food : byte;
                   gold : longint;
                   etc : array[1..100] of byte;
                end;
   enemydata1 = record
                  name : string[16];
                  strength : byte;
                  mentality : byte;
                  endurance : byte;
                  resistance : byte;
                  agility : byte;
                  accuracy : array[1..2] of byte;
                  ac : byte;
                  special : byte;
                  castlevel : byte;
                  specialcastlevel : byte;
                  level : byte;
               end;
   enemydata2 = record
                   E_number : byte;
                   name : string[16];
                   strength : byte;
                   mentality : byte;
                   endurance : byte;
                   resistance : byte;
                   agility : byte;
                   accuracy : array[1..2] of byte;
                   ac : byte;
                   special : byte;
                   castlevel : byte;
                   specialcastlevel : byte;
                   level : byte;
                   hp : integer;
                   poison : boolean;
                   unconscious : boolean;
                   dead : boolean;
                end;
const
   bit1 = 1; bit2 = 2; bit3 = 4; bit4 = 8;
   bit5 = 16; bit6 = 32; bit7 = 64; bit8 = 128;
var
   i,j,k : integer;
   h : word;
   long : longint;
   c,LoadNo : char;
   Josa,Mokjuk : string[2];
   sexdata : string[4];
   s : string;
   m : array[0..10] of string[50];
   x,y,x1,y1 : integer;
   ok,Allright,AutoBattle,aux,LoadFont,AdLibOn,SoundOn : boolean;
   scrolltype : scrolltypes;
   position : positiontype;
   encounter, maxenemy : ^byte;
   existfile : pathstr;

   predictfile : text;
   filename : file of byte;
   fontname : file of fonttype;
   playerfile : file of lore;
   partyfile : file of loreplayer;
   enemyfile : file of enemydata1;

   xmax, ymax, scrollform, scrollcolor, putstyle, yline, face : byte;
   person : integer;
   font, chara : ^fonttype;
   map : array[1..100,1..100] of byte;
   battle : array[1..6,1..3] of byte;

   party : loreplayer;
   player : array[1..7] of lore;
   enemydata : array[1..75] of enemydata1;
   enemynumber : byte;
   enemy : array[1..7] of enemydata2;

 Procedure RGB(Color, Red, Green, Blue : byte);
 Procedure Clear;
 Procedure PressAnyKey;
 Procedure scroll(character : boolean);
 Procedure Silent_Scroll;
 Procedure AuxScroll(x_value,y_value : shortint; tilenumber : byte);
 Procedure setscrolltype(form : scrolltypes);
 Function exist(person : integer) : boolean;
 Procedure EPrint(color : integer; s1 : string);
 Procedure Print(color : integer; s1 : string);
 Procedure AuxPrint(color : integer; s1 : string; newline : boolean);
 Procedure cPrint(color1,color2 : integer; s1,s2,s3 : string);
 Procedure message(color : integer; s : string);
 Function Select(yinit,maxsum,total : integer;clean,lastclean : boolean) : integer;
 Procedure GameOver;
 Procedure DetectGameOver;
 Function SelectEnemy : integer;
 Function ChooseWhom(clean : boolean) : integer;
 Function ReturnSex(number : integer) : string;
 Function ReturnClass(number : integer) : string;
 Function ReturnWeapon(number : integer) : string;
 Function ReturnDefense(number : integer) : string;
 Function ReturnShield(number : integer) : string;
 Function ReturnArmor(number : integer) : string;
 Function ReturnCondition(number : integer) : string;
 Function ReturnMagic(magic : integer) : string;
 Function ReturnMessage(who, how, what, whom : integer) : string;
 Function ReturnDefaultFont(font : integer) : integer;
 Procedure ReturnSexData;
 Procedure DisplayHP;
 Procedure DisplaySP;
 Procedure DisplayESP;
 Procedure DisplayCondition;
 Procedure SimpleDisCond;
 Procedure Display_Condition;
 Procedure talk(s:string);
 Function at(xx,yy : integer) : boolean;
 Function on(xx,yy : integer) : boolean;
 Procedure originposition;
 Function wantenter(name : string) : boolean;
 Function wantexit : boolean;
 Procedure findgold(money : longint);
 Procedure asyouwish;
 Procedure notenoughmoney;
 Procedure thankyou;
 Procedure join(num,partynum : byte);
 Procedure joinenemy(num,j : byte);
 Procedure turn_mind(j,enemy_num : byte);
 Function ReturnJoinMember : byte;
 Procedure Grocery;
 Procedure Weapon_Shop;
 Procedure Train_Center;
 Procedure Hospital;
 Procedure Load;
 Procedure Save;
 Procedure Set_All;
 Procedure UnSound;


IMPLEMENTATION

Procedure RGB(Color, Red, Green, Blue : byte); assembler;
asm
   mov dx,$3c8;
   mov al,Color;
   out dx,al;
   inc dx;
   mov al,Red;
   out dx,al;
   mov al,Green;
   out dx,al;
   mov al,Blue;
   out dx,al;
end;

Procedure Clear;
var
   i : integer;
begin
   for i:= 0 to 1 do begin
      page := 1 - page;
      SetActivePage(page);
      Bar(231,21,616,198);
   end;
   yline := 30;
   hany := 32;
end;

Procedure PressAnyKey;
begin
   setcolor(14);
   HPrintXY4Select(250,180,'´a¢Ç¡a ’Ÿa¯³¯¡µ¡ ...');
   while keypressed do c := readkey;
   c := readkey;
   if c = #0 then c := readkey;
   Clear;
end;

Procedure Scroll(character : boolean);
var AuxX, AuxY : shortint;
begin
   while KeyPressed do c:= readkey;
   page := 1 - page;
   SetActivePage(page);
   if (position = den) and (party.etc[1] = 0) then begin
      setfillstyle(1,0);
      bar(20,20,200,200);
      setcolor(8);
      HPrintXY(94,96,'´á–‘');
   end
   else begin
      AuxX := x - 5; AuxY := y - 5;
      if scrolltype <> normal then begin
         setfillstyle(scrollform,scrollcolor);
         bar(20,20,200,200);
      end;
      for j := 1 to 9 do for i := 1 to 9 do PutImage(i*20,j*20,font^[map[i+AuxX,j+AuxY]],putstyle);
      if character then begin
         PutImage(100,100,chara^[face+28],andPut);
         PutImage(100,100,chara^[face],orPut);
      end;
   end;
   if soundon then begin
      Sound(20); Delay(5);
   end;
   SetVisualPage(page);
   NoSound;
   setfillstyle(solidfill,DarkGray);
end;

Procedure Silent_Scroll;
begin
   aux := soundon; soundon := FALSE;
   scroll(TRUE);
   soundon := aux;
end;

Procedure AuxScroll(x_value,y_value : shortint; tilenumber : byte);
var AuxX, AuxY : shortint;
begin
   while KeyPressed do c:= readkey;
   page := 1 - page;
   SetActivePage(page);
   if (position = den) and (party.etc[1] = 0) then begin
      setfillstyle(1,0);
      bar(20,20,200,200);
      setcolor(8);
      outtextxy(78,100,'Darkness');
   end
   else begin
      AuxX := x - 5; AuxY := y - 5;
      if scrolltype <> normal then begin
         setfillstyle(scrollform,scrollcolor);
         bar(20,20,200,200);
      end;
      for j := 1 to 9 do for i := 1 to 9 do PutImage(i*20,j*20,font^[map[i+AuxX,j+AuxY]],putstyle);
      PutImage(100,100,chara^[face+28],andPut);
      PutImage(100,100,chara^[face],orPut);
      if (x_value>-5) and (x_value<5) and (y_value>-5) and (y_value>5) then
         PutImage(x_value*20+100,y_value*20+100,font^[tilenumber],copyput);
   end;
   SetVisualPage(page);
   NoSound;
   setfillstyle(solidfill,DarkGray);
end;

Procedure setscrolltype(form : scrolltypes);
begin
   scrolltype := form;
   if form = normal then begin
      putstyle := copyput;
      party.etc[12] := 0;
   end
   else putstyle := orput;
   case form of
      snow : begin
                scrollform := SolidFill;
                scrollcolor := Blue;
                party.etc[12] := 1;
             end;
      rain : begin
                scrollform := LtSlashFill;
                scrollcolor := Blue;
                party.etc[12] := 2;
             end;
      autumn : begin
                  scrollform := SolidFill;
                  scrollcolor := Brown;
                  party.etc[12] := 3;
               end;
      wilderness : begin
                      scrollform := 9;
                      scrollcolor := Blue;
                      party.etc[12] := 4;
                   end;
      strongrain : begin
                      scrollform := 6;
                      scrollcolor := Blue;
                      party.etc[12] := 5;
                   end;
   end;
end;

Function exist(person : integer) : boolean;
begin
   exist := FALSE;
   if (player[person].name <> '') and (player[person].unconscious = 0) and
   (player[person].dead = 0) and (player[person].hp > 0) then exist := TRUE;
end;

Procedure EPrint(color : integer; s1 : string);
begin 
   SetColor(color);
   yline := yline + 14;
   if yline > 184 then begin
      yline := 184;
      c := ReadKey;
      if c = #0 then c := readkey;
      asm
         mov ah,6;
         mov al,1;
         mov bh,8;
         mov cl,29;
         mov ch,2;
         mov dl,75;
         mov dh,13;
         int $10;
      end;
   end;
   if length(s1) < 45 then OutTextXY(250,yline,s1)
   else begin
      s := copy(s1,45,length(s1)-44);
      delete(s1,45,length(s1)-44);
      OutTextXY(250,yline,s1);
      Print(color,s);
   end;
end;

Procedure Print(color : integer; s1 : string);
begin
   SetColor(color);
   hany := hany + 16;
   HGotoXY(250,hany);
   HPrint(s1);
end;

Procedure AuxPrint(color : integer; s1 : string; newline : boolean);
begin
   SetColor(color);
   if newline then begin
      hany := hany + 16;
      HGotoXY(250,hany);
   end;
   HPrint(s1);
end;

Procedure cPrint(color1,color2 : integer; s1,s2,s3 : string);
begin
   AuxPrint(color1,s1,TRUE);
   AuxPrint(color2,s2,FALSE);
   AuxPrint(color1,s3,FALSE);
end;

Procedure message(color : integer; s : string);
var
   i : byte;
begin
   Clear;
   for i := 0 to 1 do begin
      page := 1 - page;
      setactivepage(page);
      yline := 30; hany := 32;
      Print(color,s);
   end;
end;

Function Select(yinit,maxsum,total : integer;clean,lastclean : boolean) : integer;
{ Á¡‹¡ y ˆt, ¬åÈ‚ ˆa“wÐe ¢…¸a ˆ•®, Îa¯¡–I ¡¡—e ¢…¸a ˆ•®, Àá·q Clear µa¦,  a»¡ b Clear µa¦
  Ÿi º‰¡, ¤µi m µA ‹a •A·¡ÈaŸi ý´á¬á ¯©Ð— ¯¡Ç¡¡e µ¡Ÿe½¢ ¬w”e· ¶å•¡¶µA ¬åÈ‚ ÑÁ¡e·¡ aÈae”a }
var
   i, k ,y1 : integer;
   move : boolean;
begin
   if clean then Clear;
   SetColor(12);
   HPrintXY4Select(255,30,m[0]);
   SetColor(15);
   HPrintXY4Select(280,yinit,m[1]);
   SetColor(7);
   for i := 2 to total do begin
      if i > maxsum then SetColor(0);
      HPrintXY4Select(280,yinit+(i-1)*16,m[i]);
   end;
   SetColor(7);
   k := 1; y1 := 0;
   ok := FALSE;
   repeat begin
      c := ReadKey;
      if c = #0 then begin
         c := ReadKey;
         move := TRUE;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1
            else move := FALSE;
         end;
      end;
      if move then begin
         HPrintXY4Select(280,yinit+(k-1)*16,m[k]);
         k := k + y1;
         if k<1 then k := maxsum;
         if k>maxsum then k := 1;
         SetColor(15);
         HPrintXY4Select(280,yinit+(k-1)*16,m[k]);
         SetColor(7);
      end;
      if ((c=#13) or (c=#32)) then ok := TRUE;
      if c = #27 then begin
         ok := TRUE;
         k := 0;
      end;
      y1 := 0;
   end;
   until ok;
   if lastclean then Clear;
   SetColor(15);
   Select := k;
end;

Procedure GameOver;
begin
   if party.etc[6] = 255 then begin
      clear;
      while KeyPressed do c := readkey;
      setcolor(13);
      HPrintXY(280,50,'·©Ð—·e ¡¡Ðñº—µA ¡¡– ¡¢®‘·i ·°´ö”a.');
      PressAnyKey;
      m[0] := '¦‰œá ‰¡ ¯¼·e ‰A·±·i ¬åÈ‚Ða¯³¯¡µ¡.';
      m[1] := '´ô¯s“¡”a';
      m[2] := '¥¥ ‰A·± •A·¡Èa';
      m[3] := '‰A·± •A·¡Èa 1 (¦)';
      m[4] := '‰A·± •A·¡Èa 2 (¦)';
      m[5] := '‰A·± •A·¡Èa 3 (¦)';
      k := select(65,5,5,TRUE,TRUE);
      if k > 1 then begin
         LoadNo := chr(k+47);
         setcolor(11);
         HPrintXY(280,80,'¸á¸wÐ–”å ‰A·±·i ”a¯¡ ¦‰œáµ³“¡”a');
         LoadFont := FALSE; Load; Scroll(TRUE); Display_Condition;
         LoadNo := '1';
         Clear;
         exit;
      end;
   end;
   if party.etc[6] <> 1 then begin
      setcolor(10);
      HPrintXY(290,50,'¸÷ i¡ {‰V¯s“¡Œa ?');
      m[0] := '';
      m[1] := '       << ´a“¡µ¡ >>';
      m[2] := '       <<   µ   >>';
      k := select(110,2,2,FALSE,TRUE);
      if k < 2 then exit;
   end
   else begin
      while KeyPressed do c := readkey;
      clear;
      setcolor(13);
      HPrintXY(280,50,'·©Ð—·e ¡¡– ¸åÊµA¬á ÌÐ–”a !!');
      setcolor(10);
      HPrintXY(280,70,'    ´á˜ý‰A Ða¯¡‰V¯s“¡Œa ?');
      m[0] := '';
      m[1] := '   ·¡¸å· ‰A·±·i ¸ˆÐe”a';
      m[2] := '       ‰A·±·i {…”a';
      k := select(120,2,2,FALSE,TRUE);
      if k = 1 then begin
         m[0] := '¦‰œá ‰¡ ¯¼·e ‰A·±·i ¬åÈ‚Ða¯³¯¡µ¡.';
         m[1] := '´ô¯s“¡”a';
         m[2] := '¥¥ ‰A·± •A·¡Èa';
         m[3] := '‰A·± •A·¡Èa 1 (¦)';
         m[4] := '‰A·± •A·¡Èa 2 (¦)';
         m[5] := '‰A·± •A·¡Èa 3 (¦)';
         k := select(65,5,5,TRUE,TRUE);
         if k > 1 then begin
            LoadNo := chr(k+47);
            setcolor(11);
            HPrintXY(280,80,'¸á¸wÐ–”å ‰A·±·i ”a¯¡ ¦‰œáµ³“¡”a');
            LoadFont := FALSE; Load; Scroll(TRUE); Display_Condition;
            LoadNo := '1'; party.etc[6] := 255;
            Clear;
            exit;
         end;
      end;
   end;
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
   Writeln('Feel your RPG imagination !!');
   for i := 1 to 63 do begin
      RGB(7,i,i,i);
      delay(15);
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

Procedure DetectGameOver;
var
   i,j : integer;
begin
   j := 0;
   for i := 1 to 6 do if exist(i) then inc(j);
   if j = 0 then begin
      party.etc[6] := 255; { Poisoned to death }
      gameover;
   end;
end;

Function SelectEnemy : integer;
var
   number,color,y1 : integer;
   move : boolean;
begin
   ok := FALSE;
   number := 1;
   repeat
   with enemy[number] do begin
      case hp of
         0 : color := 8;
         1..19 : color := 12;
         20..49 : color := 4;
         50..99 : color := 6;
         100..199 : color := 14;
         200..299 : color := 2
         else color := 10;
      end;
      if dead = TRUE then color := 0;
      SetFillStyle(1,7);
      Bar(40,20*number+18,178,20*number+30);
      SetColor(color);
      if color = 0 then setcolor(7);
      OutTextXY(50,20*number+20,name);
      y1 := 0; move := FALSE; c := ReadKey;
      if c = #0 then begin
         c := ReadKey;
         move := TRUE;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1
            else move := FALSE;
         end;
      end;
      if c = #13 then ok := TRUE;
      if move or ok then begin
         SetFillstyle(1,0);
         Bar(40,20*number+18,178,20*number+30);
         SetColor(color);
         OutTextXY(50,20*number+20,name);
         number := number + y1;
         if number<1 then number := enemynumber;
         if number>enemynumber then number := 1;
      end;
   end;
   until ok;
   SetFillStyle(1,8);
   SelectEnemy := number;
end;

Function ChooseWhom(clean : boolean) : integer;
var
   i,j,k : integer;
begin
   m[0] := '';
   j := 0;
   for i := 1 to 6 do
   if player[i].name <> '' then begin
      inc(j);
      m[j] := player[i].name;
   end;
   SetColor(10);
   HPrintXY(265,70,'Ðe¡w·i ‰¡Ÿa¯¡µ¡ ---');
   k := Select(90,j,j,clean,TRUE);
   if k = 0 then begin
      ChooseWhom := 0;
      exit;
   end;
   j := 0;
   for i := 1 to 6 do
   if player[i].name <> '' then begin
      inc(j);
      if j = k then ChooseWhom := i;
   end;
end;

Function ReturnSex(number : integer) : string;
begin
   if player[number].sex = male then ReturnSex := 'q¬÷'
   else ReturnSex := 'µa¬÷';
end;

Function ReturnClass(number : integer) : string;
begin
   case player[number].class of
      1 : ReturnClass := '‹¡¬a';
      2 : ReturnClass := ' a¤ó¬a';
      3 : ReturnClass := 'µA¯aÌá';
      4 : ReturnClass := '¸å¬a';
      5 : ReturnClass := '¸åÊ¯w';
      6 : ReturnClass := '“¥¸a';
      7 : ReturnClass := '¬a·Ž…';
      8 : ReturnClass := '˜á•©·¡';
      9 : ReturnClass := 'Ñ¥w';
      10 : ReturnClass := '¤e¯¥¤e·¥'
      else ReturnClass := '¦‰ÑÂ¯©Ðq';
   end;
end;

Function ReturnWeapon(number : integer) : string;
begin
   case number of
      0 : ReturnWeapon := ' …­¥';
      1 : ReturnWeapon := '”e•¡';
      2 : ReturnWeapon := '‰¥¥·';
      3 : ReturnWeapon := '£¡“iÀw';
      4 : ReturnWeapon := '¸wˆñ';
      5 : ReturnWeapon := 'ÀéÊA';
      6 : ReturnWeapon := '‹¡¥wÀw';
      7 : ReturnWeapon := '•¡¡Àw';
      8 : ReturnWeapon := '¬q»¡Àw';
      9 : ReturnWeapon := 'ÑÁµqˆñ'
      else ReturnWeapon := '¦‰ÑÂ¯©Ðe ¢‹¡';
   end;
   if number in [0,2..4,6..9] then begin
      Josa := '·a';
      Mokjuk := '·i';
   end
   else begin
      Josa := '';
      Mokjuk := 'Ÿi';
   end;
end;

Function ReturnDefense(number : integer) : string;
begin
   case number of
      0 : ReturnDefense := '´ô·q';
      1 : ReturnDefense := 'ˆaº‚';
      2 : ReturnDefense := 'À÷•·';
      3 : ReturnDefense := 'ˆwÀé';
      4 : ReturnDefense := '·e¹A';
      5 : ReturnDefense := '‹q¹A'
      else ReturnDefense := '¦‰ÑÂ¯©Ðe';
   end;
end;

Function ReturnShield(number : integer) : string;
begin
   ReturnShield := ReturnDefense(player[number].shield);
end;

Function ReturnArmor(number : integer) : string;
begin
   ReturnArmor := ReturnDefense(player[number].armor);
end;

Function ReturnCondition(number : integer) : string;
begin
   with player[number] do begin
      if (hp <= 0) and (unconscious = 0) then unconscious := 1;
      if (unconscious > endurance * level[1]) and (dead = 0) then dead := 1;
      if dead > 0 then begin
         ReturnCondition := 'dead';
         exit;
      end;
      if unconscious > 0 then begin
         ReturnCondition := 'unconscious';
         exit;
      end;
      if poison > 0 then begin
         ReturnCondition := 'poisoned';
         exit;
      end;
      ReturnCondition := 'good';
   end;
end;

Function ReturnMagic(magic : integer) : string;
begin
   case magic of
      1 : ReturnMagic := ' a¤ó ÑÁ¬i';
      2 : ReturnMagic := ' a¤ó ÑÁŠ';
      3 : ReturnMagic := ' a¤ó ”eÀw';
      4 : ReturnMagic := '•¢ ¤a“i';
      5 : ReturnMagic := ' ‚•· ‰×¬å';
      6 : ReturnMagic := '»¢‰b ’A¸å';
      7 : ReturnMagic := '‰·‹¡ Í¢Î—';
      8 : ReturnMagic := 'µi¬å Ìa•·';
      9 : ReturnMagic := 'Á¡·qÌa';
      10 : ReturnMagic := 'Á¡—‹¡';
      11 : ReturnMagic := '·¥‰· »¡»¥';
      12 : ReturnMagic := 'Àa¶¥ ·¡Èi';
      13 : ReturnMagic := '•¢';
      14 : ReturnMagic := '‹¡®‰ ¢bÑÁ';
      15 : ReturnMagic := '¤w´á ¢bÑÁ';
      16 : ReturnMagic := '“wb ¸áÐa';
      17 : ReturnMagic := ' a¤ó ¦‰“w';
      18 : ReturnMagic := 'Èi Á¡·¥ÑÁ';
      19 : ReturnMagic := 'Ðe¡w Ã¡ža';
      20 : ReturnMagic := 'Ðe¡w •¢ ¹Aˆá';
      21 : ReturnMagic := 'Ðe¡w Ã¡žaµÁ •¢¹Aˆá';
      22 : ReturnMagic := 'Ðe¡w ·¯¢ •©Ÿ±';
      23 : ReturnMagic := 'Ðe¡w ¦ÑÉ';
      24 : ReturnMagic := 'Ðe¡w Ã¡žaµÁ •¢¹AˆáµÁ ·¯¢•©Ÿ±';
      25 : ReturnMagic := 'Ðe¡w ¥¢Ðs Ã¡ža';
      26 : ReturnMagic := '¡¡– Ã¡ža';
      27 : ReturnMagic := '¡¡– •¢ ¹Aˆá';
      28 : ReturnMagic := '¡¡– Ã¡žaµÁ •¢¹Aˆá';
      29 : ReturnMagic := '¡¡– ·¯¢ •©Ÿ±';
      30 : ReturnMagic := '¡¡– Ã¡žaµÁ •¢¹AˆáµÁ ·¯¢•©Ÿ±';
      31 : ReturnMagic := '¡¡– ¦ÑÉ';
      32 : ReturnMagic := '¡¡– ¥¢Ðs Ã¡ža';
      33 : ReturnMagic := ' a¤ó· Ð•¦‰';
      34 : ReturnMagic := '‰·º— ¦¬w';
      35 : ReturnMagic := '¢‰¶áŸi ˆé·q';
      36 : ReturnMagic := '“|¶áŸi ˆé·q';
      37 : ReturnMagic := '‹¡ÑÁ ·¡•·';
      38 : ReturnMagic := '»¡Ñw ¥eÑÁ';
      39 : ReturnMagic := '‰·ˆe ·¡•·';
      40 : ReturnMagic := '¯¢œ· ¹A¹¡';
      41 : ReturnMagic := 'Ê¯¡';
      42 : ReturnMagic := 'µ´å';
      43 : ReturnMagic := '•¢¯±';
      44 : ReturnMagic := 'ÀåŸ¡´e';
      45 : ReturnMagic := 'µqb';
   end;
   if magic in [2,9,10,14..16,18..21,25..28,32,38,40,41] then begin
      Josa := '';
      Mokjuk := 'Ÿi';
   end
   else begin
      Josa := '·a';
      Mokjuk := '·i';
   end;
end;

Function ReturnMessage(who, how, what, whom : integer) : string;
begin
   s := player[who].name;
   case how of
      1 : s := s+'“e '+ReturnWeapon(player[who].weapon)+Josa+'¡ '+enemy[whom].name+'Ÿi ‰·‰bÐ–”a';
      2 : s := s+'“e '''+ReturnMagic(what)+''''+Josa+'¡ '+enemy[whom].name+'µA‰A ‰·‰bÐ–”a';
      3 : s := s+'“e '''+ReturnMagic(what+6)+''''+Josa+'¡ '+enemy[whom].name+'µA‰A ‰·‰bÐ–”a';
      4 : s := s+'“e '+enemy[whom].name+'µA‰A '+ReturnMagic(what+12)+Josa+'¡ Ëb® ‰·‰b·i Ð–”a';
      5 : s := s+'“e '+player[whom].name+'µA‰A '''+ReturnMagic(what+18)+''''+Mokjuk+' ¬a¶wÐ–”a';
      6 : s := s+'“e '+enemy[whom].name+'µA‰A '+ReturnMagic(what+40)+Mokjuk+' ¬a¶wÐ–”a';
      7 : s := '·©Ð—·e •¡ w·i ¯¡•¡Ð–”a'
      else s := s+'“e ¸q¯¡ º¸áÐ–”a';
   end;
   ReturnMessage := s;
end;

Function ReturnDefaultFont(font : integer) : integer;
begin
   case font of
      1 : ReturnDefaultFont := 2;
      2 : ReturnDefaultFont := 0;
      3 : ReturnDefaultFont := 0;
      4 : ReturnDefaultFont := 41;
      5 : ReturnDefaultFont := 0;
      6 : ReturnDefaultFont := 44;
      7 : ReturnDefaultFont := 45;
      8 : ReturnDefaultFont := 47;
      9 : ReturnDefaultFont := 44;
      10 : ReturnDefaultFont := 27;
      11 : ReturnDefaultFont := 44;
      12 : ReturnDefaultFont := 0;
      13 : ReturnDefaultFont := 42;
      14 : ReturnDefaultFont := 44;
      15 : ReturnDefaultFont := 39;
      16 : ReturnDefaultFont := 41;
      17 : ReturnDefaultFont := 41;
      18 : ReturnDefaultFont := 43;
      19 : ReturnDefaultFont := 49;
      20 : ReturnDefaultFont := 44;
      21 : ReturnDefaultFont := 40;
      22 : ReturnDefaultFont := 40;
      23 : ReturnDefaultFont := 46;
      24 : ReturnDefaultFont := 47;
      25 : ReturnDefaultFont := 41;
      26 : ReturnDefaultFont := 44;
      27 : ReturnDefaultFont := 44;
   end;
end;

Procedure ReturnSexData;
begin
   if player[person].sex = male then SexData := '‹a'
   else SexData := '‹a‘a';
end;

Procedure DisplayHP;
begin
   setcolor(15);
   for i:=0 to 1 do begin
      page := 1 - page;
      SetActivePage(page);
      for j:=1 to 6 do
      with player[j] do
      if name <> '' then begin
         str(hp:5,s);
         Bar(180,j*15+230,220,j*15+238); { HP }
         OutTextXY(180,230+15*j,s);
      end;
   end;
end;

Procedure DisplaySP;
begin
   setcolor(15);
   for i:=0 to 1 do begin
      page := 1 - page;
      SetActivePage(page);
      for j:=1 to 6 do
      with player[j] do
      if name <> '' then begin
         str(sp:3,s);
         Bar(248,j*15+230,272,j*15+238); { SP }
         OutTextXY(248,230+15*j,s);
      end;
   end;
end;

Procedure DisplayESP;
begin
   setcolor(15);
   for i:=0 to 1 do begin
      page := 1 - page;
      SetActivePage(page);
      for j:=1 to 6 do
      with player[j] do
      if name <> '' then begin
         str(esp:3,s);
         Bar(312,j*15+230,336,j*15+238); { ESP }
         OutTextXY(312,230+15*j,s);
      end;
   end;
end;

Procedure DisplayCondition;
begin
   setcolor(15);
   for j:=1 to 6 do
   if player[j].name <> '' then begin
      s := ReturnCondition(j);
      for i:=0 to 1 do begin
         page := 1 - page;
         SetActivePage(page);
         Bar(520,j*15+230,607,j*15+238); { Condition }
         outtextxy(520,230+15*j,s);
      end;
   end;
end;

Procedure SimpleDisCond;
var
   i,j : integer;
begin
   setcolor(15);
   for i:=0 to 1 do begin
      page := 1 - page;
      SetActivePage(page);
      for j:=1 to 6 do
      with player[j] do begin
         str(hp:5,s);
         Bar(180,j*15+230,220,j*15+238); { HP }
         if name <> '' then OutTextXY(180,230+15*j,s);
         str(sp:3,s);
         Bar(248,j*15+230,272,j*15+238); { SP }
         if name <> '' then OutTextXY(248,230+15*j,s);
         str(esp:3,s);
         Bar(312,j*15+230,336,j*15+238); { ESP }
         if name <> '' then OutTextXY(312,230+15*j,s);
      end;
   end;
   for j:=1 to 6 do begin
      s := ReturnCondition(j);
      for i:=0 to 1 do begin
         page := 1 - page;
         SetActivePage(page);
         Bar(520,j*15+230,607,j*15+238); { Condition }
         if player[j].name <> '' then outtextxy(520,230+15*j,s);
      end;
   end;
end;

Procedure Display_Condition;
var
   i,j : integer;
begin
   SimpleDisCond;
   for i := 0 to 1 do begin
      page := 1 - page;
      SetActivePage(page);
      SetColor(15);
      for j := 1 to 6 do
      with player[j] do begin
         bar(40,j*15+230,168,j*15+238); { Name }
         if name <> '' then OutTextXY(40,230+15*j,name)
         else begin
            SetColor(12);
            OutTextXY(40,230+15*j,'Reserved');
            SetColor(15);
         end;
         str(ac:2,s);
         bar(392,j*15+230,408,j*15+238); { AC }
         if name <> '' then OutTextXY(392,230+15*j,s);
         str(level[1]:2,s);
         bar(424,j*15+230,440,j*15+238); { Level }
         if name <> '' then OutTextXY(424,230+15*j,s);
      end;
   end;
end;

Procedure talk(s:string);
begin
   Print(7,s);
   PressAnyKey;
end;

Function at(xx,yy : integer) : boolean;
begin
   if (x+x1=xx) and (y+y1=yy) then at := TRUE else at := FALSE;
end;

Function on(xx,yy : integer) : boolean;
begin
   if (x=xx) and (y=yy) then on := TRUE else on := FALSE;
end;

Procedure originposition;
begin
   x := x - x1;
   y := y - y1;
end;

Function wantenter(name : string) : boolean;
var
   k : integer;
begin
   Clear;
   Print(11,name+' µA —i´áˆa‹¡Ÿi ¶¥Ðs“¡Œa ?');
   m[0] := '';
   m[1] := 'µ, ‹aœý¯s“¡”a.';
   m[2] := '´a“¡µ¡, ¶¥Ða»¡ ´g¯s“¡”a.';
   k := Select(100,2,2,FALSE,TRUE);
   if k = 1 then wantenter := TRUE else wantenter := FALSE;
end;

Function wantexit : boolean;
var
   k : integer;
begin
   Clear;
   Print(11,'µa‹¡¬á aˆa‹¡Ÿi ¶¥Ðs“¡Œa ?');
   m[0] := '';
   m[1] := 'µ, ‹aœý¯s“¡”a.';
   m[2] := '´a“¡µ¡, ¶¥Ða»¡ ´g¯s“¡”a.';
   k := Select(100,2,2,FALSE,TRUE);
   if k = 1 then wantexit := TRUE else wantexit := FALSE;
end;

Procedure findgold(money : longint);
var
   account : string[9];
begin
   Clear;
   str(money,account);
   for i := 0 to 1 do begin
      hany := 32;
      page := 1 - page;
      setactivepage(page);
      Print(7,'”w¯¥·e ‹qÑÁ '+account+'ˆŸi ¤i‰eÐ–”a.');
   end;
   party.gold := party.gold + money;
end;

Procedure asyouwish;
begin
   message(7,'”w¯¥·¡ ¤aœe”a¡e ...');
end;

Procedure notenoughmoney;
begin
   message(7,'”w¯¥·e Â—¦…Ðe •¥·¡ ´ô¯s“¡”a.');
end;

Procedure thankyou;
begin
   message(7,' ¶ ‰¡ s¯s“¡”a.');
end;

Procedure join(num,partynum : byte);
begin
   with player[partynum] do begin
      name := enemydata[num].name;
      sex := male;
      class := 0;
      strength := enemydata[num].strength;
      mentality := enemydata[num].mentality;
      concentration := 0;;
      endurance := enemydata[num].endurance;
      resistance := enemydata[num].resistance div 2;
      agility := enemydata[num].agility;
      accuracy[1] := enemydata[num].accuracy[1];
      accuracy[2] := enemydata[num].accuracy[2];
      accuracy[3] := 0;
      luck := 10;
      poison := 0;
      unconscious := 0;
      dead := 0;
      level[1] := enemydata[num].level;
      level[2] := enemydata[num].castlevel * 3;
      if level[2] = 0 then level[2] := 1;
      level[3] := 1;
      hp := endurance * level[1];
      sp := mentality * level[2];
      esp := 0;
      ac := enemydata[num].ac;
      weapon := 10;
      shield := 6;
      armor := 6;
      wea_power := level[1] * 2 + 10;
      shi_power := 0;
      arm_power := ac;
      case level[1] of
         1 : experience := 0;
         2 : experience := 1500;
         3 : experience := 6000;
         4 : experience := 20000;
         5 : experience := 50000;
         6 : experience := 150000;
         7 : experience := 250000;
         8 : experience := 500000;
         9 : experience := 800000;
         10 : experience := 1050000;
         11 : experience := 1320000;
         12 : experience := 1620000;
         13 : experience := 1950000;
         14 : experience := 2310000;
         15 : experience := 2700000;
         16 : experience := 3120000;
         17 : experience := 3570000;
         18 : experience := 4050000;
         19 : experience := 4560000;
         20..30 : experience := 510000;
      end;
   end;
end;

Procedure joinenemy(num,j : byte);
begin
   with enemy[num] do begin
      E_number := j;
      name := enemydata[j].name;
      strength := enemydata[j].strength;
      mentality := enemydata[j].mentality;
      endurance := enemydata[j].endurance;
      resistance := enemydata[j].resistance;
      agility := enemydata[j].agility;
      accuracy[1] := enemydata[j].accuracy[1];
      accuracy[2] := enemydata[j].accuracy[2];
      ac := enemydata[j].ac;
      special := enemydata[j].special;
      castlevel := enemydata[j].castlevel;
      specialcastlevel := enemydata[j].specialcastlevel;
      level := enemydata[j].level;
      hp := endurance * level;
      poison := FALSE; unconscious := FALSE; dead := FALSE;
   end;
end;

Procedure turn_mind(j,enemy_num : byte);
begin
   with enemy[enemy_num] do begin
      E_number := 1;
      name := player[j].name;
      strength := player[j].strength;
      mentality := player[j].mentality;
      endurance := player[j].endurance;
      resistance := player[j].resistance;
      agility := player[j].agility;
      accuracy[1] := player[j].accuracy[1];
      accuracy[2] := player[j].accuracy[2];
      ac := player[j].ac;
      if player[j].class = 7 then special := 2 else special := 0;
      castlevel := player[j].level[2] div 4;
      specialcastlevel := 0;
      level := player[j].level[1];
      hp := endurance * level;
      poison := FALSE; unconscious := FALSE; dead := FALSE;
   end;
end;

Function ReturnJoinMember : byte;
var
   i : byte;
begin
   Clear;
   m[0] := 'ŠaÁA ¯¡Ç© ·¥¢‰·e ’Š·³“¡Œa ?';
   for i := 2 to 6 do m[i-1] := player[i].name;
   if m[5] = '' then m[5] := '¥¡¹¡ ·©¶¥·a¡ –‘';
   ReturnJoinMember := select(80,5,5,FALSE,TRUE) + 1;
end;

Procedure Grocery;
begin
   Print(15,'µa‹¡“e ¯¢žaÎ‘¸ñ ·³“¡”a.');
   Print(15,'¡yˆŸi ¶¥Ða¯³“¡Œa ?');
   m[1] := 'Ï©¶a ´ô¯s“¡”a';
   for i := 1 to 5 do begin
      str(i*10,s);
      str(i*100,m[0]);
      m[i+1] := s+' ·¥¦… : ‹q '+m[0]+' ˆ';
   end;
   m[0] := '';
   k := select(95,6,6,FALSE,TRUE);
   if k < 2 then begin
      asyouwish;
      exit;
   end;
   dec(k);
   if party.gold < k * 100 then begin
      notenoughmoney;
      exit;
   end;
   party.gold := party.gold - k * 100;
   k := k * 10;
   if party.food+k > 255 then party.food := 255
   else party.food := party.food + k;
   thankyou;
end;

Procedure Weapon_Shop;
var
   i,j,k,h : integer;
label
   first, second, third;
begin
first:
   Print(15,'µa‹¡“e ¢‹¡¬w¸ñ·³“¡”a.');
   Print(15,'¶Ÿ¡—i·e ¢‹¡, ¤wÌ, ˆsµµ·i Ìi‰¡·¶¯s“¡”a.');
   Print(15,'´á˜å ¹·ŸAŸi ¶¥Ða¯³“¡Œa ?');
   m[0] := '';
   m[1] := '¢‹¡ŸA';
   m[2] := '¤wÌŸA';
   m[3] := 'ˆsµµŸA';
   h := select(110,3,3,FALSE,TRUE);
   case h of
      0 : begin
             Display_Condition;
             Clear;
             exit;
          end;
      1 : begin
second:
             hany := 15;
             Print(15,'´á˜å ¢‹¡Ÿi ¶¥Ða¯³“¡Œa ?');
             for i := 1 to 9 do m[i] := ReturnWeapon(i) + ' : ';
             m[1] := m[1] + '‹q 500';
             m[2] := m[2] + '‹q 1500';
             m[3] := m[3] + '‹q 3000';
             m[4] := m[4] + '‹q 5000';
             m[5] := m[5] + '‹q 10000';
             m[6] := m[6] + '‹q 30000';
             m[7] := m[7] + '‹q 60000';
             m[8] := m[8] + '‹q 80000';
             m[9] := m[9] + '‹q 100000';
             for i := 1 to 9 do m[i] := m[i] + ' ˆ';
             k := select(50,9,9,FALSE,TRUE);
             if k = 0 then goto first;
             case k of
                1 : long := 500;
                2 : long := 1500;
                3 : long := 3000;
                4 : long := 5000;
                5 : long := 10000;
                6 : long := 30000;
                7 : long := 60000;
                8 : long := 80000;
                9 : long := 100000;
             end;
             if party.gold < long then begin
                notenoughmoney;
                PressAnyKey;
                Clear;
                goto second;
             end;
             Print(15,'’ˆa ·¡ '+ReturnWeapon(k)+'Ÿi ¬a¶wÐa¯¡‰V¯s“¡Œa ?');
             j := ChooseWhom(FALSE);
             if j > 0 then begin
                if player[j].class = 5 then begin
                   Print(13,'¸åÊ¯w·e ·¡ ¢‹¡ˆa Ï©¶a´ô¯s“¡”a.');
                   PressAnyKey;
                   goto second;
                end;
                case k of
                   1 : i := 5;
                   2 : i := 7;
                   3 : i := 9;
                   4 : i := 10;
                   5 : i := 15;
                   6 : i := 20;
                   7 : i := 30;
                   8 : i := 40;
                   9 : i := 50;
                end;
                with player[j] do begin
                   weapon := k;
                   wea_power := i;
                   if class = 1 then wea_power := wea_power + round(wea_power * 0.5);
                end;
                party.gold := party.gold - long;
             end
             else begin
                asyouwish;
                PressAnyKey;
             end;
             Clear;
             goto second;
          end;
      2,3 : begin
third:
               if h = 2 then s := '¤wÌŸi' else s := 'ˆsµµ·i';
               Print(15,'´á˜å '+s+' ¶¥Ða¯³“¡Œa ?');
               if h = 2 then s := '¤wÌ' else s := 'ˆsµµ';
               for i := 1 to 5 do m[i] := ReturnDefense(i) + ' '+s+' : ';
               j := 3 - h;
               m[1+j] := m[1+j] + '‹q 5000';
               m[2+j] := m[2+j] + '‹q 25000';
               m[3+j] := m[3+j] + '‹q 80000';
               m[4+j] := m[4+j] + '‹q 100000';
               if h = 2 then m[1] := m[1] + '‹q 1000';
               if h = 3 then m[5] := m[5] + '‹q 200000';
               for i := 1 to 5 do m[i] := m[i] + ' ˆ';
               k := select(80,5,5,FALSE,TRUE);
               if k = 0 then goto first;
               j := k + h - 2;
               case j of
                  1 : long := 1000;
                  2 : long := 5000;
                  3 : long := 25000;
                  4 : long := 80000;
                  5 : long := 100000;
                  6 : long := 200000;
               end;
               if party.gold < long then begin
                  notenoughmoney;
                  PressAnyKey;
                  Clear;
                  goto third;
               end;
               if h = 2 then s := '¤wÌŸi' else s := 'ˆsµµ·i';
               Print(15,'’ˆa ·¡ '+ReturnDefense(k)+' '+s+' ¬a¶wÐa¯¡‰V¯s“¡Œa ?');
               j := ChooseWhom(FALSE);
               if j > 0 then begin
                  i := k;
                  if h = 3 then inc(i);
                  with player[j] do begin
                     if h = 2 then begin
                        shield := k;
                        shi_power := i;
                     end else begin
                        armor := k;
                        arm_power := i;
                     end;
                     ac := shi_power + arm_power;
                     if class = 1 then inc(ac);
                     if ac > 10 then ac := 10;
                  end;
                  party.gold := party.gold - long;
               end
               else begin
                  asyouwish;
                  PressAnyKey;
               end;
               Clear;
               goto third;
            end;
   end;
end;
 
Procedure Train_Center;
const
   Expdata : array[2..20] of string[7] = (
             '1500','6000','20000','50000',
             '150000','250000','500000','800000','1050000',
             '1320000','1620000','1950000','2310000','270000',
             '3120000','3570000','4050000','4560000','510000');
var
   i,j,k : integer;
label
   first;
begin
   Print(15,' µa‹¡“e Š…¬a Ò…e­¡ ·³“¡”a.');
   Print(15,'  e´¢ ”w¯¥·¡ Â—¦…Ðe ¸åÊ ‰wÐñ·i °}´v”a¡e, ”w¯¥·e ”á¶‚ “w®‚Ða‰A ¢‹¡Ÿi ”až‰ˆõ·³“¡”a.');
   PressAnyKey;
   Clear;
first:
   setcolor(15);
   Print(15,'’ˆa Ò…e·i ¤h‰V¯s“¡Œa ?');
   k := ChooseWhom(FALSE);
   if k = 0 then begin
      Display_Condition;
      Clear;
      exit;
   end
   else begin
      long := player[k].experience;
      if long < 20000 then
      case long of
         0..1499 : j := 1;
         1500..5999 : j := 2;
         6000..19999 : j := 3;
      end
      else begin
         long := long div 10000;
         case long of
            2..4 : j := 4;
            5..14 : j := 5;
            15..24 : j := 6;
            25..49 : j := 7;
            50..79 : j := 8;
            80..104 : j := 9;
            105..131 : j := 10;
            132..161 : j := 11;
            162..194 : j := 12;
            195..230 : j := 13;
            231..269 : j := 14;
            270..311 : j := 15;
            312..356 : j := 16;
            357..404 : j := 17;
            405..455 : j := 18;
            456..509 : j := 19
            else j := 20;
         end;
      end;
      if player[k].level[1] < j then begin
         case j of
            1 : long := 2;
            2 : long := 3;
            3 : long := 5;
            4 : long := 8;
            5 : long := 15;
            6 : long := 25;
            7 : long := 40;
            8 : long := 70;
            9 : long := 120;
            10 : long := 200;
            11 : long := 350;
            12 : long := 600;
            13 : long := 1000;
            14 : long := 1700;
            15 : long := 3000;
            16 : long := 5000;
            17 : long := 8300;
            18 : long := 14000;
            19 : long := 24000;
            20 : long := 40000;
         end;
         if j = 20 then begin
            player[k].level[1] := 20;
            Print(7,'”w¯¥·e ÂA‰¡ A¥IµA •¡”iÐ–¯s“¡”a.');
            talk('”á ·¡¬w ¸áÓ—i·e ˆaŸaÃ© Ï©¶aˆa ´ô¯s“¡”a.');
            goto first;
         end;
         if party.gold < long then begin
            str(party.gold-long,s);
            talk('”w¯¥·e ‹q '+s+'ˆˆa ”á Ï©¶aÐs“¡”a.');
            goto first;
         end
         else begin
            party.gold := party.gold - long;
            str(j,s);
            Print(15,player[k].name+'· A¥I·e '+s+'·³“¡”a.');
            with player[k] do begin
               level[1] := j;
               case class of
                  1 : if luck > random(30) then begin
                         if strength < 20 then inc(strength)
                         else if endurance < 20 then inc(endurance)
                         else if accuracy[1] < 20 then inc(accuracy[1])
                         else inc(agility);
                      end;
                  2,9 : begin
                           level[2] := j;
                           level[3] := round(j/2);
                           if luck > random(30) then begin
                              if mentality < 20 then inc(mentality)
                              else if concentration < 20 then inc(concentration)
                              else if accuracy[2] < 20 then inc(accuracy[2]);
                           end;
                        end;
                  3 : begin
                         level[3] := j;
                         level[2] := round(j/2);
                         if luck > random(30) then begin
                            if concentration < 20 then inc(concentration)
                            else if accuracy[3] < 20 then inc(accuracy[3])
                            else if mentality < 20 then inc(mentality);
                         end;
                      end;
                  4 : begin
                         if j < 16 then level[2] := j else level[2] := 15;
                         if luck > random(30) then begin
                            if strength < 20 then inc(strength)
                            else if mentality < 20 then inc(mentality)
                            else if accuracy[1] < 20 then inc(accuracy[1])
                            else if accuracy[2] < 20 then inc(accuracy[2]);
                         end;
                      end;
                  5 : begin
                         wea_power := level[1] * 2 + 10;
                         if luck > random(30) then begin
                            if strength < 20 then inc(strength)
                            else if accuracy[1] < 20 then inc(accuracy[1])
                            else if endurance < 20 then inc(endurance);
                         end;
                      end;
                  6 : begin
                         level[2] := round(j/2);
                         level[3] := level[2];
                         if luck > random(30) then begin
                            if resistance < 18 then inc(resistance)
                            else if resistance < 20 then begin
                               if luck < random(21) then inc(resistance);
                            end
                            else inc(agility);
                         end;
                      end;
                  7,8 : if luck > random(30) then begin
                           if endurance < 20 then inc(endurance)
                           else if strength < 20 then inc(strength)
                           else inc(agility);
                        end;
                  10 : begin
                          level[2] := j;
                          level[3] := j;
                          if strength < 20 then inc(strength);
                          if mentality < 20 then inc(mentality);
                          if concentration < 20 then inc(concentration);
                          if endurance < 20 then inc(endurance);
                          if agility < 20 then inc(agility);
                          for i := 1 to 3 do
                          if accuracy[i] < 20 then inc(accuracy[i]);
                       end;
               end;
            end;
            PressAnyKey;
            goto first;
         end;
      end
      else begin
         Print(7,' ”w¯¥·e ´a»¢ ¸åÊ ‰wÐñ·¡ ¦¹¢Ðs“¡”a.');
         if player[k].level[1] in [1..19] then begin
            j := player[k].level[1] + 1;
            Print(7,''); Print(7,'');
            cPrint(7,11,' ”w¯¥·¡ ”a·q A¥I·¡ –Aa¡e ‰wÐñÃ¡ˆa ',ExpData[j],'');
            Print(7,' ·¡¬w ·¡´á´¡ Ðs“¡”a.');
         end;
         PressAnyKey;
         goto first;
      end;
   end;
end;

Procedure Hospital;
var
   i,j,k : integer;
label
   first,second;
begin
   Print(15,'µa‹¡“e ¥w¶¥·³“¡”a.');
   PressAnyKey;
first:
   Print(15,'’ˆa Ã¡žaŸi ¤h‰V¯s“¡Œa ?');
   k := choosewhom(FALSE);
   if k = 0 then begin
      Display_Condition;
      Clear;
      exit;
   end;
second:
   m[0] := '´á˜å Ã¡ža·³“¡Œa ?';
   m[1] := '¬wÀáŸi Ã¡ža';
   m[2] := '•¢·i ¹Aˆá';
   m[3] := '·¯¢· ÒA¥¢';
   m[4] := '¦ÑÉ';
   j := select(70,4,4,FALSE,TRUE);
   if j = 0 then begin
      Clear;
      goto first;
   end;
   case j of
      1 : with player[k] do begin
             if dead > 0 then Print(7,name+'“e ·¡£¡ º‚·e ¬wÈ·³“¡”a')
             else if unconscious > 0 then Print(7,name+'“e ·¡£¡ ·¯¢¦‰¡w·³“¡”a')
             else if poison > 0 then Print(7,name+'“e •¢·¡ Ìá»¥ ¬wÈ·³“¡”a')
             else if hp >= endurance*level[1] then Print(15,name+'“e Ã¡žaÐi Ï©¶aˆa ´ô¯s“¡”a');
             if (dead>0) or (unconscious>0) or (poison>0) or
                (hp>=endurance*level[1]) then begin
                PressAnyKey;
                goto second;
             end;
             i := endurance * level[1] - hp;
             i := i * level[1] div 2 + 1;
             if party.gold < i then begin
                notenoughmoney;
                PressAnyKey;
                goto second;
             end;
             party.gold := party.gold - i;
             hp := endurance * level[1];
             if sex = male then s := '‹a·' else s := '‹a‘a·';
             Print(15,name+'“e '+s+' ¡¡—e ˆåˆw·¡ ÒA¥¢–A´ö”a');
             displayHP;
             PressAnyKey;
             goto first;
          end;
      2 : with player[k] do begin
             if dead > 0 then Print(7,name+'“e ·¡£¡ º‚·e ¬wÈ·³“¡”a')
             else if unconscious > 0 then Print(7,name+'“e ·¡£¡ ·¯¢¦‰¡w·³“¡”a')
             else if poison = 0 then Print(15,name+'“e •¢µA ˆéŸ¡»¡ ´g´v¯s“¡”a');
             if (dead>0) or (unconscious>0) or (poison=0) then begin
                PressAnyKey;
                goto second;
             end;
             i := level[1] * 10;
             if party.gold < i then begin
                notenoughmoney;
                PressAnyKey;
                goto second;
             end;
             party.gold := party.gold - i;
             poison := 0;
             Print(15,name+'“e •¢·¡ ¹Aˆá –A´ö¯s“¡”a');
             displaycondition;
             PressAnyKey;
             goto first;
          end;
      3 : with player[k] do begin
             if dead > 0 then Print(7,name+'“e ·¡£¡ º‚·e ¬wÈ·³“¡”a')
             else if unconscious = 0 then Print(15,name+'“e ·¯¢¦‰¡w·¡ ´a“³“¡”a');
             if (dead>0) or (unconscious=0) then begin
                PressAnyKey;
                goto second;
             end;
             i := unconscious * 2;
             if party.gold < i then begin
                notenoughmoney;
                PressAnyKey;
                goto second;
             end;
             party.gold := party.gold - i;
             unconscious := 0;
             hp := 1;
             Print(15,name+'“e ·¯¢·i Àav¯s“¡”a');
             displaycondition;
             displayHP;
             PressAnyKey;
             goto first;
          end;
      4 : with player[k] do begin
             if dead = 0 then begin
                Print(15,name+'“e º‚»¡ ´g´v¯s“¡”a');
                PressAnyKey;
                goto second;
             end;
             i := dead * 100 + 400;
             if party.gold < i then begin
                notenoughmoney;
                PressAnyKey;
                goto second;
             end;
             party.gold := party.gold - i;
             dead := 0;
             if unconscious > endurance * level[1] then
                unconscious := endurance * level[1];
             Print(15,name+'“e ”a¯¡ ¬i´av¯s“¡”a');
             displaycondition;
             PressAnyKey;
             goto first;
          end;
   end;
end;

Procedure Load;

 Procedure ErrorMessage(s : string; need : boolean);
 begin
    asm
       mov ah,0
       mov al,3
       int $10
    end;
    TextAttr := $07;
    ClrScr;
    TextColor(12);
    Writeln('"'+s+'" not found.');
    TextColor(7);
    if need then Writeln('You need to CREATE CHARACTER.');
    Halt;
 end;

begin
   if not LoadFont then begin
      {$I-}
      Assign(partyfile,'party'+LoadNo+'.dat');
      Reset(partyfile);
      read(partyfile,party);
      Close(partyfile);
      if IOResult <> 0 then ErrorMessage('party'+LoadNo+'.dat',true);
      Assign(playerfile,'player'+LoadNo+'.dat');
      Reset(playerfile);
      for i:= 1 to 6 do read(playerfile,player[i]);
      Close(playerfile);
      if IOResult <> 0 then ErrorMessage('player'+LoadNo+'.dat',true);
      Assign(fontname,'chara.fnt');
      Reset(fontname);
      read(fontname,chara^);
      Close(fontname);
      if IOResult <> 0 then ErrorMessage('chara.fnt',false);
      {$I+}
   end;
   existfile := fsearch('save'+LoadNo+'.map','');
   if (existfile = '') or LoadFont then begin
      s := '';
      case party.map of
         1 : s := 'ground1';
         2 : s := 'ground2';
         3 : s := 'water';
         4 : s := 'swamp';
         5 : s := 'lava';
         6 : s := 'town1';
         7 : s := 'town2';
         8 : s := 'town3';
         9 : s := 'town4';
         10 : s := 'town5';
         11 : s := 't_den1';
         12 : s := 't_den2';
         13 : s := 'den4';
         14 : s := 'den1';
         15 : s := 'den2';
         16 : s := 'den3';
         17 : s := 'den4';
         18 : s := 'den5';
         19 : s := 'den6';
         20 : s := 'den7';
         21 : s := 'keep1';
         22 : s := 'keep2';
         23 : s := 'keep3';
         24 : s := 'k_den1';
         25 : s := 'k_den2';
         26 : s := 'k_den2';
         27 : s := 'pyramid1';
      end;
      {$I-}
      Assign(filename,s+'.map');
      Reset(filename);
      Read(filename,xmax); Read(filename,ymax);
      for j:=1 to ymax do for i:=1 to xmax do read(filename,map[i,j]);
      Close(filename);
      if IOResult <> 0 then ErrorMessage(s+'.map',false);
      {$I+}
   end
   else begin
      Assign(filename,'save'+LoadNo+'.map');
      Reset(filename);
      Read(filename,xmax); Read(filename,ymax);
      for j:=1 to ymax do for i:=1 to xmax do read(filename,map[i,j]);
      Close(filename);
   end;
   case party.map of
      1..5 : position := ground;
      6..10,24,26..27 : position := town;
      11..20,25 : position := den
      else position := keep;
   end;
   QuitPlay := TRUE;
   case position of
      town : begin
                s := 'town';
                ExistFile := 'Music2.Bgm';
             end;
      ground : begin
                  s := 'ground';
                  ExistFile := 'Music3.Bgm';
               end;
      den : begin
               s := 'den';
               ExistFile := 'Music4.Bgm';
            end;
      keep : begin
                s := 'keep';
                ExistFile := 'Music5.Bgm';
             end;
   end;
   {$I-}
   Assign(fontname,s+'.fnt');
   Reset(fontname);
   read(fontname,font^);
   Close(fontname);
   if IOResult <> 0 then ErrorMessage(s+'.fnt',false);
   {$I+}
   LoadFont := TRUE;
   j := ReturnDefaultFont(party.map);
   move(font^[j],font^[0],246);
   x := party.xaxis; y := party.yaxis;
   if ymax div 2 > y then face := 0 else face := 1;
   if (position <> town) or (party.map = 26) then face := face + 4;
   if not (encounter^ in [1..3]) then encounter^ := 2;
   if not (maxenemy^ in [3..7]) then maxenemy^ := 5;
   case party.etc[12] of
      1 : setscrolltype(snow);
      2 : setscrolltype(rain);
      3 : setscrolltype(autumn);
      4 : setscrolltype(wilderness);
      5 : setscrolltype(strongrain)
      else setscrolltype(normal);
   end;
end;

Procedure Save;
begin
   party.xaxis := x;
   party.yaxis := y;
   Assign(partyfile,'party'+LoadNo+'.dat');
   ReWrite(partyfile);
   write(partyfile,party);
   Close(partyfile);
   Assign(playerfile,'player'+LoadNo+'.dat');
   Rewrite(playerfile);
   for i:= 1 to 6 do write(playerfile,player[i]);
   Close(playerfile);
   Assign(filename,'save'+LoadNo+'.map');
   Rewrite(filename);
   write(filename,xmax); write(filename,ymax);
   for j:=1 to ymax do for i:=1 to xmax do write(filename,map[i,j]);
   Close(filename);
end;

Procedure Set_All;
begin
   Randomize;
   encounter := @party.etc[7];
   maxenemy := @party.etc[8];
   soundon := TRUE;
   LoadFont := FALSE;
   LoadNo := '1';
   Assign(enemyfile,'foedata.dat');
   Reset(enemyfile);
   for i := 1 to 75 do read(enemyfile,enemydata[i]);
   Close(enemyfile);
   Load;
   for i:=0 to 1 do begin
      SetActivePage(i);
      SetVisualPage(1-i);
      SetFillStyle(1,1);
      Bar(0,0,639,349);
      SetLineStyle(0,0,3);
      SetColor(9);
      RectAngle(4,4,635,346);
      SetLineStyle(0,0,1);
      RectAngle(1,1,639,349);
      RectAngle(7,7,631,343);
      SetColor(8);
      for j:=0 to 5 do begin
         Line(19-j,200+j,200+j,200+j);
         Line(200+j,19-j,200+j,200+j);
      end;
      SetColor(7);
      for j:=0 to 5 do begin
         Line(14+j,14+j,14+j,205-j);
         Line(14+j,14+j,205-j,14+j);
      end;
      Line(200,200,205,205);
      SetColor(15);
      Line(14,14,19,19);
      RectAngle(12,12,207,207);
      RectAngle(10,10,209,209);
      SetColor(8);
      for j:=0 to 5 do begin
         Line(19-j,332+j,618+j,332+j);
         Line(618+j,239-j,618+j,332+j);
      end;
      SetColor(7);
      for j:=0 to 5 do begin
         Line(14+j,234+j,14+j,337-j);
         Line(14+j,234+j,622-j,234+j);
      end;
      Line(618,332,623,337);
      SetColor(10);
      Line(14,234,19,239);
      RectAngle(10,230,627,341);
      SetColor(2);
      RectAngle(12,232,625,339);
      SetFillStyle(1,8);
      Bar(21,241,616,330);
      SetColor(11);
      bHPrint(78,213,'·¡Ÿq          ÁAb    ab   Á¡“wb   ¤w´á  A¥I        ¬w È');
      SetColor(8);
      for j:=0 to 5 do begin
         Line(229-j,200+j,618+j,200+j);
         Line(618+j,19-j,618+j,200+j);
      end;
      SetColor(7);
      for j:=0 to 5 do begin
         Line(224+j,14+j,224+j,205-j);
         Line(224+j,14+j,622-j,14+j);
      end;
      Line(618,200,623,205);
      SetColor(15);
      Line(224,14,229,19);
      RectAngle(220,10,627,209);
      RectAngle(222,12,625,207);
      Bar(231,21,616,198);
   end;
   page := 0;
   Display_Condition;
   SetScrollType(normal);
   SetTextStyle(0,0,1);
   Scroll(TRUE);
end;

Procedure UnSound;
begin
   ExistFile := FSearch('End.cmd','');
   if ExistFile <> '' then begin
      Assign(FileName,'End.cmd');
      Rename(FileName,'End.com');
      exec(getenv('COMSPEC'),'/cEnd.com > nul');
      Rename(FileName,'End.cmd');
   end;
end;

begin
end.
