Unit DarkSub;

INTERFACE

Uses
   Crt, Dos, Graph, AdLib, UHanX;
Type
   fonttype = array[0..55,1..294] of byte;
   maptype = array[1..200,1..125] of byte;
   returndatatype = array[1..6] of integer;
   scrolltypes = (normal,snow,rain,autumn,wilderness,strongrain);
   positiontype = (town,ground,den,keep);
   classes = (sword,magic,elemental,unknown,giant,golem,dragon);
   lore = record
             name : string[17];
             sex : (male,female,neutral);
             class : byte;
             strength : byte;
             mentality : byte;
             concentration : byte;
             endurance : byte;
             resistance : byte;
             agility : byte;
             accuracy : byte;
             luck : byte;
             poison : byte;
             unconscious : integer;
             dead : integer;
             hp : integer;
             sp : integer;
             ac : byte;
             level : byte;
             experience : longint;
             potential_experience : longint;
             weapon : byte;
             shield : byte;
             armor : byte;
             potential_ac : byte;
             wea_power : byte;
             shi_power : byte;
             arm_power : byte;
             case classtype : classes of
                sword : (sword_skill,axe_skill,spear_skill,bow_skill,shield_skill,fist_skill : byte);
                magic : (attack_magic,pheno_magic,cure_magic,special_magic,esp_magic,summon_magic : byte);
          end;
   loreplayer = record
                   year,day : integer;
                   hour,min,sec : byte;
                   map : byte;
                   xaxis : byte;
                   yaxis : byte;
                   food : byte;
                   gold : longint;
                   arrow : word;
                   checksum : array[1..2] of byte;
                   item : array[1..10] of byte;
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
   enemydatatype = array[1..75] of enemydata1;

const
   bit1 = 1; bit2 = 2; bit3 = 4; bit4 = 8;
   bit5 = 16; bit6 = 32; bit7 = 64; bit8 = 128;
var
   i,j,k : integer;
   b : byte;
   h : word;
   long : longint;
   c,LoadNo : char;
   Josa,Mokjuk : string[2];
   sexdata : string[4];
   s : string;
   m : array[0..10] of string[50];
   x,y,x1,y1 : integer;
   ok,Allright,AutoBattle,aux,LoadFont,Loading_SaveGame,AdLibOn,SoundOn : boolean;
   Cruel : boolean;
   scrolltype : scrolltypes;
   position : positiontype;
   encounter, maxenemy : ^byte;
   existfile : pathstr;

   filename : file of byte;
   fontname : file of fonttype;
   f, playerfile : file;
   enemyfile : file of enemydata1;

   xmax,ymax,scrollform,scrollcolor,putstyle,yline,face,Rest_Time : byte;
   person : integer;
   font, chara : ^fonttype;
   map : ^maptype;
   battle : array[1..6,1..3] of byte;

   party : loreplayer;
   player : array[1..7] of lore;
   enemydata : ^enemydatatype;
   enemynumber : byte;
   enemy : array[1..8] of enemydata2;

 Procedure RGB(Color, Red, Green, Blue : byte);
 Procedure Restore_Palette;
 Procedure Clear;
 Procedure PressAnyKey;
 Function Real_Map(x,y : byte) : byte;
 Procedure Putmap(x,y,value : byte);
 Procedure Scroll(character : boolean);
 Procedure Silent_Scroll;
 Procedure Delete_Scroll_Screen;
 Procedure Clear_View_Screen;
 Procedure setscrolltype(form : scrolltypes);
 Function exist(person : integer) : boolean;
 Procedure PlusTime(_hour, _min, _sec : integer);
 Procedure Print(color : integer; s1 : string);
 Procedure AuxPrint(color : integer; s1 : string; newline : boolean);
 Procedure cPrint(color1,color2 : integer; s1,s2,s3 : string);
 Procedure message(color : integer; s : string);
 Function SelectSub(yinit,select_init,maxsum,total : integer;clean,lastclean : boolean) : integer;
 Function Select(yinit,maxsum,total : integer;clean,lastclean : boolean) : integer;
 Function Restore_Game : boolean;
 Procedure GameOver;
 Procedure DetectGameOver;
 Function SelectEnemy : integer;
 Function ChooseWhomSub(yinit : integer; printing,clean : boolean) : integer;
 Function ChooseWhom(clean : boolean) : integer;
 Function ReturnSex(number : integer) : string;
 Function ReturnClass(number : integer) : string;
 Function ReturnClassEnable(number,classnumber : integer) : boolean;
 Function ReturnClassType(number : integer) : string;
 Function Verify_Weapon(player_no, weapon_no : byte) : boolean;
 Function Verify_Shield(player_no, shield_no : byte) : boolean;
 Function Verify_Armor(player_no, armor_no : byte) : boolean;
 Procedure Modify_Item(player_no : byte);
 Function ReturnWeapon(number : integer) : string;
 Function ReturnShield(number : integer) : string;
 Function ReturnArmor(number : integer) : string;
 Function ReturnCondition(number : integer) : string;
 Function ReturnMagic(class,magic : integer) : string;
 Function ReturnEXP(level : byte) : longint;
 Function ReturnSJosa(s : string) : string;
 Function ReturnBJosa(s : string) : string;
 Function ReturnOJosa(s : string) : string;
 Function ReturnMessage(who, how, what, whom : integer) : string;
 Function ReturnDefaultFont(font : integer) : integer;
 Procedure ReturnSexData;
 Procedure DisplayHP;
 Procedure DisplaySP;
 Procedure DisplayCondition;
 Procedure SimpleDisCond;
 Procedure Display_Condition;
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
 Procedure About_Class;
 Procedure Sell_EXP;
 Procedure Hospital;
 Procedure Medicine;
 Procedure Sell_Item;
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

Procedure Restore_Palette;
const
   RGB_data : array[0..15,1..3] of byte = (
                 ( 0, 0, 0),( 0, 0,42),( 0,42, 0),( 0,42,42),
                 (42,10,10),(42, 0,42),(42,21, 0),(42,42,42),
                 (21,21,21),(10,10,60),(10,60,10),(10,60,60),
                 (63,21,21),(60,10,60),(60,60,10),(60,60,60));
var
   i : byte;
begin
   for i := 0 to 15 do begin
      SetPalette(i,i);
      RGB(i,RGB_data[i,1],RGB_data[i,2],RGB_data[i,3]);
   end;
end;

Procedure Clear;
var
   i : integer;
begin
   Bar(241,21,242,22);
   Bar(241,21,626,288);
   yline := 30;
   hany := 32;
end;

Procedure PressAnyKey;
begin
   setcolor(14);
   HPrintXY4Select(260,272,'´a¢Ç¡a ’Ÿa¯³¯¡µ¡ ...');
   while keypressed do c := readkey;
   c := readkey;
   if c = #0 then c := readkey;
   Clear;
end;

procedure Image(X, Y: Integer; var BitMap; Darkness : boolean);
const
   Font_X_Size = 3;    { 8 * 3 = 24 }
   Font_Y_Size = 24;
   Initial_Font_Gap = 0;
var
   bm_seg, bm_off : word;
   xx : word;
   segm : word;
   green, red, intensity : byte;
   i,j : integer;
begin
   if Darkness then begin
      green := 0; red := 0; intensity := 0;
   end else begin
      green := 2; red := 4; intensity := 8;
   end;
   bm_seg := seg(bitmap);
   bm_off := ofs(bitmap)+4;
   xx := x * Font_X_Size + Initial_Font_Gap;
   segm := y * Font_Y_Size * 5 + $a000;
   asm
      push ax
      push bx
      push cx
      push dx
      push si
      push di
      mov dx, $3ce
      mov ax, $000
      out dx, ax
      mov ax, $001
      out dx, ax
      mov cx, Font_Y_Size
      mov ax, segm
      mov es, ax
      mov di, xx
      mov ax, bm_seg
      mov si, bm_off
      push ds
      mov ds, ax
      mov dx, $3c4
      mov ax, $102
@Ad_Loop:
      cmp intensity, 8
      je  @No_Darkness
      mov ah, 0eh;
      out dx, ax
      mov byte ptr es:[di], 0
      inc di
      mov word ptr es:[di], 0
      dec di
@No_Darkness:
      mov ah, intensity;
      out dx, ax
      movsw
      movsb
      sub di, 3
      mov ah, red
      out dx, ax
      movsw
      movsb
      sub di, 3
      mov ah, green
      out dx, ax
      movsw
      movsb
      sub di, 3
      mov ah, 1
      out dx, ax
      movsw
      movsb

      add di, 77
      dec cx
      jne @Ad_Loop
      pop ds
      pop di
      pop si
      pop dx
      pop cx
      pop bx
      pop ax
   end;
end;

Function Real_Map(x,y : byte) : byte;
begin
   Real_Map := map^[x,y] and $7F;
end;

Procedure Putmap(x,y,value : byte);
begin
   map^[x,y] := (map^[x,y] and $80) or value;
end;

Procedure Scroll(character : boolean);
const
   image_buf : array[1..4] of byte = (0,0,0,0);
var
   i, j : integer;
   AuxX, AuxY, x_wide, y_wide : shortint;
   Darkness, Dark : boolean;
   buf : array [1..294] of byte;
begin
   while KeyPressed do c:= readkey;
   if position = den then Dark := TRUE else Dark := FALSE;
   with party do
   if not (hour in [7..17]) then begin
      Dark := TRUE;
      if hour = 18 then begin
         case min of
            0..19 : begin
                       x_wide := 4; y_wide := 4;
                    end;
            20..39: begin
                       x_wide := 3; y_wide := 3;
                    end;
            40..59: begin
                       x_wide := 2; y_wide := 2;
                    end;
         end;
      end
      else if hour = 6 then begin
         case min of
            0..19 : begin
                       x_wide := 2; y_wide := 2;
                    end;
            20..39: begin
                       x_wide := 3; y_wide := 3;
                    end;
            40..59: begin
                       x_wide := 4; y_wide := 4;
                    end;
         end;
      end
      else begin
         x_wide := 1; y_wide := 1;
      end;
   end;
   if position = den then begin
      x_wide := 1; y_wide := 1;
   end;
   if Dark and (party.etc[1] > 0) then begin
      case party.etc[1] of
         1,2 : if (x_wide < 2) and (y_wide < 2) then begin
                  x_wide := 2; y_wide := 2;
               end;
         3,4 : if (x_wide < 3) and (y_wide < 3) then begin
                  x_wide := 3; y_wide := 3;
               end;
         5,6 : if (x_wide < 4) and (y_wide < 4) then begin
                  x_wide := 4; y_wide := 4;
               end;
         7..255 : begin
                     x_wide := 4; y_wide := 5;
                  end;
      end;
   end;
   move(Font^[real_map(x,y)],buf,294);
   for i := 5 to 294 do
      buf[i] := (buf[i] and chara^[face+28][i]) or (chara^[face][i]);
   AuxX := x - 5; AuxY := y - 6;
   if scrolltype <> normal then begin
      setfillstyle(scrollform,scrollcolor);
      bar(20,20,200,200);
   end;
   putimage(0,0,image_buf,copyput);
   for j := 1 to 11 do for i := 1 to 9 do begin
      if (i in [5-x_wide..5+x_wide]) and (j in [6-y_wide..6+y_wide]) then Darkness := FALSE
      else Darkness := TRUE;
      if not Dark then Darkness := FALSE;
      if (i = 5) and (j = 6) and character then
      Putimage(120,144,buf,copyput)
      else if (j+AuxY < 1) or (j+AuxY > ymax) then Image(i,j,font^[0],Darkness)
      else if map^[i+AuxX,j+AuxY] and $80 > 0 then Image(i,j,font^[real_map(i+AuxX,j+AuxY)],FALSE)
      else Image(i,j,font^[real_map(i+AuxX,j+AuxY)],Darkness);
   end;
   if soundon then begin
      Sound(20); Delay(5);
   end;
   NoSound;
   setfillstyle(solidfill,DarkGray);
end;

Procedure Silent_Scroll;
begin
   aux := soundon;
   soundon := FALSE;
   scroll(TRUE);
   soundon := aux;
end;

Procedure Delete_Scroll_Screen;
var
   i : integer;
begin
   SetColor(0);
   for i := 0 to 108 do begin
      line(i*2+24,24,i*2+24,23+24*11);
      line(239-i*2,24,239-i*2,23+24*11);
      delay(5);
   end;
end;

Procedure Clear_View_Screen;
begin
   SetFillStyle(SolidFill,8);
   Bar(30,305,31,306);
   Bar(30,305,240,479);
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

Procedure PlusTime(_hour, _min, _sec : integer);
begin
   with party do begin
      hour := hour + _hour;
      min := min + _min;
      sec := sec + _sec;
      while sec > 59 do begin
         sec := sec - 60;
         min := min + 1;
      end;
      while min > 59 do begin
         min := min - 60;
         hour := hour + 1;
      end;
      while hour > 23 do begin
         hour := hour - 24;
         day := day + 1;
      end;
      while day > 360 do begin
         day := day - 360;
         year := year + 1;
      end;
   end;
end;

Procedure Print(color : integer; s1 : string);
begin
   SetColor(color);
   hany := hany + 16;
   HGotoXY(260,hany);
   HPrint(s1);
end;

Procedure AuxPrint(color : integer; s1 : string; newline : boolean);
begin
   SetColor(color);
   if newline then begin
      hany := hany + 16;
      HGotoXY(260,hany);
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
   yline := 30; hany := 32;
   Print(color,s);
end;


Function SelectSub(yinit,select_init,maxsum,total : integer;clean,lastclean : boolean) : integer;
var
   i,j,k,y1 : integer;
   move : boolean;
begin
   if clean then Clear;
   SetColor(12);
   HPrintXY4Select(275,30,m[0]);
   if maxsum < 1 then select_init := 0;
   SetColor(7);
   for i := 1 to total do begin
      SetColor(7);
      if i = select_init then SetColor(15);
      if i > maxsum then SetColor(0);
      HPrintXY4Select(290,yinit+(i-1)*16,m[i]);
   end;
   if maxsum <= 0 then begin
      repeat
         c := readkey;
      until c in [#13,#27];
      if lastclean then Clear;
      SelectSub := 0;
      exit;
   end;
   SetColor(7);
   k := select_init; y1 := 0;
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
         HPrintXY4Select(290,yinit+(k-1)*16,m[k]);
         k := k + y1;
         if k<1 then k := maxsum;
         if k>maxsum then k := 1;
         SetColor(15);
         HPrintXY4Select(290,yinit+(k-1)*16,m[k]);
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
   SelectSub := k;
end;

Function Select(yinit,maxsum,total : integer;clean,lastclean : boolean) : integer;
{ Á¡‹¡ y ˆt, ¬åÈ‚ ˆa“wÐe ¢…¸a ˆ•®, Îa¯¡–I ¡¡—e ¢…¸a ˆ•®, Àá·q Clear µa¦,  a»¡ b Clear µa¦
  Ÿi º‰¡, ¤µi m µA ‹a •A·¡ÈaŸi ý´á¬á ¯©Ð— ¯¡Ç¡¡e µ¡Ÿe½¢ ¬w”e· ¶å•¡¶µA ¬åÈ‚ ÑÁ¡e·¡ aÈae”a }
begin
   Select := SelectSub(yinit,1,maxsum,total,clean,lastclean);
end;

Function Restore_Game : boolean;
begin
   m[0] := '¦‰œá ‰¡ ¯¼·e ‰A·±·i ¬åÈ‚Ða¯³¯¡µ¡.';
   m[1] := '´ô¯s“¡”a';
   m[2] := '¥¥ ‰A·± •A·¡Èa';
   m[3] := '‰A·± •A·¡Èa 1 (¦)';
   m[4] := '‰A·± •A·¡Èa 2 (¦)';
   m[5] := '‰A·± •A·¡Èa 3 (¦)';
   m[6] := '‰A·± •A·¡Èa 4 (¦)';
   m[7] := '‰A·± •A·¡Èa 5 (¦)';
   m[8] := '‰A·± •A·¡Èa 6 (¦)';
   m[9] := '‰A·± •A·¡Èa 7 (¦)';
   m[10] := '‰A·± •A·¡Èa 8 (¦)';
   k := select(65,10,10,TRUE,TRUE);
   if k > 1 then begin
      LoadNo := chr(k+47);
      aux := FALSE;
      ExistFile := FSearch('Player'+LoadNo+'.dat','');
      if ExistFile = '' then aux := TRUE;
      if aux then begin
         setcolor(12);
         HPrintXY(300,80,'¸á¸w–E •A·¡Èaˆa ´ô¯s“¡”a !');
         PressAnyKey;
         Restore_Game := FALSE;
         exit;
      end;
      setcolor(11);
      HPrintXY(280,80,'¸á¸wÐ–”å ‰A·±·i ”a¯¡ ¦‰œáµ³“¡”a');
      LoadFont := FALSE; Load; Scroll(TRUE); Display_Condition;
      LoadNo := '1';
      party.etc[6] := 254;
      Clear;
      Restore_Game := TRUE;
   end
   else Restore_Game := FALSE;
end;

Procedure GameOver;
Label
   Must_End;
begin
   if party.etc[6] = 255 then begin
      clear;
      while KeyPressed do c := readkey;
      setcolor(13);
      HPrintXY(280,50,'·©Ð—·e ¡¡Ðñº—µA ¡¡– ¡¢®‘·i ·°´ö”a.');
      PressAnyKey;
      if Restore_Game then exit
      else goto Must_End;
   end;
   if party.etc[6] <> 1 then begin
      setcolor(10);
      HPrintXY(300,50,'¸÷ i¡ {‰V¯s“¡Œa ?');
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
      if k <> 1 then goto Must_End;
      if Restore_Game then exit;
   end;
Must_End:
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
         1..199 : color := 12;
         200..499 : color := 4;
         500..999 : color := 6;
         1000..1999 : color := 14;
         2000..3999 : color := 2
         else color := 10;
      end;
      if unconscious then color := 8;
      if dead then color := 0;
      SetFillStyle(1,7);
      Bar(60,20*number+48,198,20*number+64);
      SetColor(color);
      if color = 0 then setcolor(7);
      HPrintXY4Select(70,20*number+50,name);
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
         Bar(60,20*number+48,198,20*number+64);
         SetColor(color);
         HPrintXY4Select(70,20*number+50,name);
         number := number + y1;
         if number<1 then number := enemynumber;
         if number>enemynumber then number := 1;
      end;
   end;
   until ok;
   SetFillStyle(1,8);
   SelectEnemy := number;
end;

Function ChooseWhomSub(yinit : integer; printing,clean : boolean) : integer;
var
   i,j,k : integer;
begin
   m[0] := '';
   j := 0;
   for i := 1 to 5 do
   if player[i].name <> '' then begin
      inc(j);
      m[j] := player[i].name;
   end;
   if j = 1 then begin
      k := 1;
   end
   else begin
      if printing then begin
         SetColor(10);
         HPrintXY(265,70,'Ðe¡w·i ‰¡Ÿa¯¡µ¡ ---');
      end;
      k := Select(yinit,j,j,clean,TRUE);
      if k = 0 then begin
        ChooseWhomSub := 0;
        exit;
      end;
   end;
   j := 0;
   for i := 1 to 5 do
   if player[i].name <> '' then begin
      inc(j);
      if j = k then ChooseWhomSub := i;
   end;
end;

Function ChooseWhom(clean : boolean) : integer;
begin
   ChooseWhom := ChooseWhomSub(106,TRUE,clean);
end;

Function ReturnSex(number : integer) : string;
begin
   case player[number].sex of
      male   : ReturnSex := 'q¬÷';
      female : ReturnSex := 'µa¬÷';
      neutral: ReturnSex := 'º—¬÷';
   end;
end;

Function ReturnClass(number : integer) : string;
const
   MaxData = 7;
   Class : array[sword..magic,1..MaxData] of string[10] = (
           ('Ê  ¬a','‹¡  ¬a','ˆñ  ¬a','¬a·Ž…','¸åÊ¯w','´q¬i¸a','¸å  ¬a'),
           ('¡A·¡»¡','Äå¹aœá','º®‰¬a','¶á¸á—a','ˆww®‰¬a','” a¤ó¬a','Èa·±¶¡Äá'));
begin
   if player[number].class in [1..MaxData] then
      ReturnClass := Class[player[number].classtype,player[number].class]
   else
      ReturnClass := '¦‰ÑÂ¯©Ðq';
end;

Function ReturnClassEnable(number,classnumber : integer) : boolean;
var
   enable : boolean;
begin
   enable := FALSE;
   if (number in [1..6]) and (classnumber in [1..7]) then begin
      with player[number] do
      if classtype = sword then begin
         case classnumber of
            1 : if (sword_skill>=10) and (axe_skill>=10) and (spear_skill>=10)
                and (bow_skill>=10) and (shield_skill>=10) then enable := TRUE;
            2 : if (sword_skill>=10) and (axe_skill>=10) and (spear_skill>=5)
                and (shield_skill>=20) then enable := TRUE;
            3 : if (sword_skill>=40) then enable := TRUE;
            4 : if (axe_skill>=5) and (spear_skill>=5) and (bow_skill>=40) then enable := TRUE;
            5 : if (fist_skill>=40) then enable := TRUE;
            6 : if (sword_skill>=10) and (bow_skill>=10) and (fist_skill>=20) then enable := TRUE;
            7 : if (sword_skill>=25) and (spear_skill>=5)
                and (shield_skill>=20) and (fist_skill>=10) then enable := TRUE;
         end;
      end else begin
         case classnumber of
            1 : if (attack_magic>=10) and (pheno_magic>=10) and (cure_magic>=10) then enable := TRUE;
            2 : if (summon_magic>=10) and (pheno_magic>=10) and (cure_magic>=10) then enable := TRUE;
            3 : if (summon_magic>=10) and (cure_magic>=10) then enable := TRUE;
            4 : if (attack_magic>=40) and (pheno_magic>=25) and (cure_magic>=25) then enable := TRUE;
            5 : if (attack_magic>=20) and (pheno_magic>=20) and (cure_magic>=40)
                and (summon_magic>=40) then enable := TRUE;
            6 : if (attack_magic>=10) and (pheno_magic>=40) and (cure_magic>=30)
                and (summon_magic>=20) then enable := TRUE;
            7 : if (attack_magic>=40) and (pheno_magic>=40) and (cure_magic>=40)
                and (special_magic>=20) and (esp_magic>=20) and (summon_magic>=20) then enable := TRUE;
         end;
      end;
      ReturnClassEnable := enable;
   end;
end;

Function ReturnClassType(number : integer) : string;
begin
   case player[number].classtype of
      sword : ReturnClassType := '¸åÊ¬a‰';
      magic : ReturnClassType := ' a¤ó¬a‰';
      elemental : ReturnClassType := '¸÷w‰';
      giant : ReturnClassType := 'ˆá·¥¹¢';
      golem : ReturnClassType := '‰¡Q¹¢';
      dragon : ReturnClassType := '—aœ‰¥¹¢'
      else ReturnClassType := '¦‰ÑÂ¯©Ðq';
   end;
end;

Function Verify_Weapon(player_no, weapon_no : byte) : boolean;
begin
   Verify_Weapon := FALSE;
   if player[player_no].ClassType = magic then exit;
   with player[player_no] do begin
      case weapon_no of
         1..7  : if class in [1,2,3,6,7] then Verify_Weapon := TRUE;
         8..14 : if class in [1,2,4] then Verify_Weapon := TRUE;
         15..21: if class in [1,2,4,6,7] then Verify_Weapon := TRUE;
         22..28: if class in [1,4,6,7] then Verify_Weapon := TRUE;
      end;
   end;
end;

Function Verify_Shield(player_no, shield_no : byte) : boolean;
var
   sort, order : integer;
begin
   Verify_Shield := FALSE;
   if player[player_no].ClassType <> sword then exit;
   if player[player_no].class in [1,2,3,7] then Verify_Shield := TRUE;
end;

Function Verify_Armor(player_no, armor_no : byte) : boolean;
begin
   Verify_Armor := FALSE;
   with player[player_no] do begin
      if (ClassType = magic) and (armor_no = 1) then
         Verify_Armor := TRUE;
      if (ClassType = sword) and (armor_no in [1..10,255]) then
         Verify_Armor := TRUE;
   end;
end;

Procedure Modify_Item(player_no : byte);
const
   weapon_data : array[1..4,1..7,1..7] of byte = (
          ((15,15,15,15,15,25,15),
           (30,30,25,25,25,25,30),
           (35,40,35,35,35,35,40),
           (45,48,50,40,40,40,40),
           (50,55,60,50,50,50,55),
           (60,70,70,60,60,60,65),
           (70,70,80,70,70,70,70)),
          ((15,15,15,15,15,15,15),
           (35,30,30,37,30,30,30),
           (35,40,35,35,35,35,35),
           (52,45,45,45,45,45,45),
           (60,60,55,55,55,55,55),
           (75,70,70,70,70,70,70),
           (80,85,80,80,80,80,80)),
          ((10,10,10,25,10,20,10),
           (35,40,35,35,35,35,40),
           (35,30,30,35,30,30,30),
           (40,40,40,45,40,40,40),
           (60,60,60,60,60,60,60),
           (80,80,80,80,80,80,80),
           (90,90,90,90,90,90,90)),
          ((10,10,10,15,10,15,10),
           (10,10,10,10,10,20,10),
           (20,20,20,27,20,20,20),
           (35,35,35,40,35,38,35),
           (45,45,45,55,45,45,45),
           (55,55,55,65,55,55,55),
           (70,70,70,85,70,70,70)));
var
   sort, order : integer;
begin
   with player[player_no] do begin
      if Verify_Weapon(player_no,weapon) then begin
         if weapon > 0 then begin
            sort := (weapon-1) div 7 + 1;
            order := weapon - (sort-1) * 7;
            wea_power := weapon_data[sort,order,class];
         end else wea_power := 5;
      end
      else wea_power := 5;
      if Verify_Shield(player_no,shield) then begin
         shi_power := shield;
      end
      else shi_power := 0;
      if Verify_Armor(player_no,armor) then begin
         arm_power := armor;
         if armor = 255 then arm_power := 20;
      end
      else arm_power := 0;
      ac := potential_ac + arm_power;
   end;
end;

Function ReturnWeapon(number : integer) : string;
const
   maxdata = 49;
   data : array[-1..maxdata] of string[15] = ('¦‰ÑÂ¯©Ðe ¢‹¡',' …­¥',
          '”eˆñ','‹aœa—¡¶¯a','¬¡¥I','¯¥¶©•¡','·¥¶©•¡','¸wˆñ','ÏaQ¤á‹a',
          '‰¥¥·','­¡Ñw •¡¡','ÏaA·©','¸åÊ¶w  wÃ¡','ÀéÊA','´·i ¸åÊ •¡¡','Ð‰¤á—a',
          '”e•¡','‹¡¥wÀw','”eÀw','A·¡Ï¡´á','¬q»¡Àw','œ…¬á','•¡¡Àw',
          '§i¡¶ Ìa·¡Ïa','ÎaÀw','Ê¬â‹¡','ÊÀw','ÑÉ','¬âŠ—','´aŸa¤iA¯aËa',
          'ÑÁµq','Ð·©','Í¢Î—','»¡»¥','·¡¨i','Á¢®','Àw',
          '¤iÉ³','¤a¶á','ÑÁµqˆñ','•·¢‰· ©a','¤åˆ  a¤ó',
          '¸ñÉ¡','ˆwÀé º â','¬e¬÷ ˆa¯a','¸å‰×','•¢ˆa¯a',
          '¦‰¹','µq­¡ ˆa¯a','Ðe‹¡','—•· ˆa¯a');
begin
   if number in [0..maxdata] then ReturnWeapon := data[number]
   else ReturnWeapon := data[-1];
   if number in [3,10,26,30,33] then begin
      Josa := '';
      Mokjuk := '·i';
   end
   else if number in [0,1,6,8,16,17,19,21,23,25,27,29,31,32,35,36,38,40,42,44,46] then begin
      Josa := '·a';
      Mokjuk := '·i';
   end
   else begin
      Josa := '';
      Mokjuk := 'Ÿi';
   end;
end;

Function ReturnShield(number : integer) : string;
const
   maxdata = 5;
   data : array[-1..maxdata] of string[15] = ('¦‰ÑÂ¯©Ðq','´ô·q',
          'ˆaº‚ ¤wÌ','­¡Ñw ˆwÀé ¤wÌ','”Ñw ˆwÀé ¤wÌ','Ça¡ Ë¢ ¤wÌ',
          'ÏiœË¡¶‘ ¤wÌ');
begin
   if number in [0..maxdata] then ReturnShield := data[number]
   else ReturnShield := data[-1];
   if number in [0] then begin
      Josa := '·a';
      Mokjuk := '·i';
   end
   else begin
      Josa := '';
      Mokjuk := 'Ÿi';
   end;
end;

Function ReturnArmor(number : integer) : string;
const
   maxdata = 10;
   data : array[-1..maxdata] of string[15] = ('¦‰ÑÂ¯©Ðq','´ô·q',
          'ˆaº‚ ˆsµµ','Ÿ· ¡A·©','ÁA·¥ ¡A·©','£¡“i ˆsµµ','§aŸ¡ˆe—¡',
          'ÇA·©¥¡·©','œa¡Iœa','ÀéÌe ˆsµµ','Ça¡ Ë¢ ˆsµµ','ÏiœË¡¶‘ ˆsµµ');
begin
   if number = 255 then begin
      ReturnArmor := 'Ób¶a¬â ˆsµµ';
      Josa := '·a';
      Mokjuk := '·i';
      exit;
   end;
   if number in [0..maxdata] then ReturnArmor := data[number]
   else ReturnArmor := data[-1];
   if number in [0..4,6,8..10] then begin
      Josa := '·a';
      Mokjuk := '·i';
   end
   else begin
      Josa := '';
      Mokjuk := 'Ÿi';
   end;
end;

Function ReturnCondition(number : integer) : string;
begin
   with player[number] do begin
      if (hp <= 0) and (unconscious = 0) then unconscious := 1;
      if (unconscious > endurance * level) and (dead = 0) then dead := 1;
      if dead > 0 then begin
         ReturnCondition := 'º‚·e ¬wÈ';
         exit;
      end;
      if unconscious > 0 then begin
         ReturnCondition := '·¯¢ ¦‰¡w';
         exit;
      end;
      if poison > 0 then begin
         ReturnCondition := '   º—•¢';
         exit;
      end;
      ReturnCondition := '   ¹½·q';
   end;
end;

Function ReturnMagic(class,magic : integer) : string;
const
   maxclass = 6;
   maxmagic = 10;
   data : array [0..maxclass,1..maxmagic] of string[20] = (
          (' a¤ó ÑÁ¬i',' a¤ó ÑÁŠ',' a¤ó ”eÀw','•¢ ¤a“i',' a¤ó ¤iÑÁ',
           '—•· ‰×¬å','Â‘Â“e ˆñ',' ‚•· ‰×¬å','»¢‰b ’A¸å','Ï©¡i º¢…'),
          ('‰·‹¡ Í¢Î—','µi¬å Ìa•·','Á¡·qÌa','·A•¢ ˆa¯a','Á¡—‹¡',
           'ÑÁµq »¡”','§aŸ¡¸a—a','µAá»¡ ¸w b','·¥‰· »¡»¥','Àa¶¥ ·¡Èi'),
          (' a¤ó· Ñõ¦‰','º¯¡¸a· ’…','‰·º— ¦¬w','¢‰¶áŸi ˆé·q','“|¶áŸi ˆé·q',
           '‹¡ÑÁ ·¡•·','»¡Ñw ¥eÑÁ','‰·ˆe ·¡•·','¯¢œ· ¹A¹¡','”»¡Ñw ¥eÑÁ'),
          ('Ðe¡w Ã¡ža','Ðe¡w •¢ ¹Aˆá','Ðe¡w ·¯¢ •©Ÿ±','Ðe¡w ¦ÑÉ','Ðe¡w ¥¢Ðs Ã¡ža',
           '¡¡– Ã¡ža','¡¡– •¢ ¹Aˆá','¡¡– ·¯¢ •©Ÿ±','¡¡– ¦ÑÉ','¡¡– ¥¢Ðs Ã¡ža'),
          ('Ðe¡w ‹¡®‰ ¢bÑÁ','Ðe¡w ¤w´á ¢bÑÁ','Ðe¡w “wb ¸áÐa','Ðe¡w  a¤ó ¦‰“w','Ðe¡w Èi Á¡·¥ÑÁ',
           '¡¡– ‹¡®‰ ¢bÑÁ','¡¡– ¤w´á ¢bÑÁ','¡¡– “wb ¸áÐa','¡¡–  a¤ó ¦‰“w','¡¡– Èi Á¡·¥ÑÁ'),
          ('Ê¯¡','µ´å','•¢¯±','ÀåŸ¡´e','µqb',
           '®­¡ Ð‚·WÐs','‰·Í¡ ¬—¬÷','ÑÅ¬w ¬—¬÷','¯¥»¥ ”¬a ¹¡¸é','·AÁA ·¡Èi'),
          ('¦‰· ¸÷w ­¡ÑÅ','¢‰· ¸÷w ­¡ÑÅ','‰·‹¡· ¸÷w ­¡ÑÅ','˜w· ¸÷w ­¡ÑÅ','º‚·e ¸a· ­¡¬—',
           '”aŸe Àa¶¥ ¬—¢‰ ­¡ÑÅ','ˆá·¥·i ¦Ÿq','‰¡Q·i ¦Ÿq','¶w·i ¦Ÿq','œa·¡Äe¯a¡Ïa ­¡ÑÅ'));
var
   code : byte;
begin
   if (class in [0..6]) and (magic in [1..10]) then begin
      ReturnMagic := data[class,magic];
      code := 1;
      case class of
         0 : if magic in [2,5] then code := 0;
         1 : if magic in [3..7] then code := 0;
         2 : if magic in [7,9,10] then code := 0;
         3 : if magic in [1,2,5..7,10] then code := 0;
         4 : if magic in [1..10] then code := 0;
         5 : if magic in [1] then code := 0;
      end;
   end
   else begin
      ReturnMagic := '´i® ´ô“e  a¤ó';
      code := 1;
   end;
   if code = 0 then begin
      Josa := '';
      Mokjuk := 'Ÿi';
   end
   else begin
      Josa := '·a';
      Mokjuk := '·i';
   end;
end;

Function ReturnEXP(level : byte) : longint;
const
   data : array[1..40] of longint = (
          0,1500,6000,20000,50000,150000,250000,500000,800000,1050000,
          1320000,1620000,1950000,2320000,2700000,3120000,3570000,4050000,4560000,5100000,
          6000000,7000000,8000000,9000000,10000000,12000000,14000000,16000000,18000000,20000000,
          25000000,30000000,35000000,40000000,45000000,50000000,55000000,60000000,65000000,70000000);

begin
   if level in [1..50] then ReturnEXP := data[level]
   else ReturnEXP := 0;
end;

Function ReturnSJosa(s : string) : string;
var
   temp : byte;
begin
   temp := ord(s[length(s)]);
   temp := temp and $1F;
   if temp = 1 then ReturnSJosa := '“e'
   else ReturnSJosa := '·e';
end;

Function ReturnBJosa(s : string) : string;
var
   temp : byte;
begin
   temp := ord(s[length(s)]);
   temp := temp and $1F;
   if temp = 1 then ReturnBJosa := 'ˆa'
   else ReturnBJosa := '·¡';
end;

Function ReturnOJosa(s : string) : string;
var
   temp : byte;
begin
   temp := ord(s[length(s)]);
   temp := temp and $1F;
   if temp = 1 then ReturnOJosa := 'Ÿi'
   else ReturnOJosa := '·i';
end;

Function ReturnMessage(who, how, what, whom : integer) : string;
var
   temp : byte;
begin
   s := player[who].name;
   s := s + ReturnSJosa(s) + ' ';
   case how of
      1 : begin
             if player[who].weapon-1 >= 0 then j := (player[who].weapon-1) div 7
             else j := 0;
             case j of
                1 : s := s+ReturnWeapon(player[who].weapon)+Josa+'¡ '
                          +enemy[whom].name+ReturnOJosa(enemy[whom].name)+' aÁv”a';
                2 : s := s+ReturnWeapon(player[who].weapon)+Josa+'¡ '
                          +enemy[whom].name+ReturnOJosa(enemy[whom].name)+' ¿©œö”a';
                3 : begin
                       if party.arrow > 0 then begin
                          s := s+ReturnWeapon(player[who].weapon)+Josa+'¡ '
                          +enemy[whom].name+ReturnOJosa(enemy[whom].name)+' ±¡´v”a';
                       end else begin
                          s := 'ÑÁ¬i·¡ ”a ˜é´á¹a ‰·‰bÐi ® ´ô´ö”a';
                       end;
                    end
                else s := s+ReturnWeapon(player[who].weapon)+Josa+'¡ '
                          +enemy[whom].name+ReturnOJosa(enemy[whom].name)+' ‰·‰bÐ–”a';
             end;
          end;
      2 : s := s+''''+ReturnMagic(0,what)+''''+Josa+'¡ '+enemy[whom].name+'µA‰A ‰·‰bÐ–”a';
      3 : s := s+''''+ReturnMagic(1,what)+''''+Josa+'¡ '+enemy[whom].name+'µA‰A ‰·‰bÐ–”a';
      4 : s := s+enemy[whom].name+'µA‰A '+ReturnMagic(4,what)+Josa+'¡ Ëb® ‰·‰b·i Ð–”a';
      5 : s := s+player[whom].name+'µA‰A '''+ReturnMagic(3,what)+''''+Mokjuk+' ¬a¶wÐ–”a';
      6 : if whom = 0 then s := s+'¡¡—e ¸âµA‰A '+ReturnMagic(5,what)+Mokjuk+' ¬a¶wÐ–”a'
          else s := s+enemy[whom].name+'µA‰A '+ReturnMagic(5,what)+Mokjuk+' ¬a¶wÐ–”a';
      7 : s := s+ReturnMagic(6,what)+Mokjuk+' ¯¡•¡ Ð–”a';
      9 : s := '·©Ð—·e •¡ w·i ¯¡•¡Ð–”a'
      else s := s+' ¸q¯¡ º¸áÐ–”a';
   end;
   ReturnMessage := s;
end;

Function ReturnDefaultFont(font : integer) : integer;
begin
   case font of
      1 : ReturnDefaultFont := 41;
      2 : ReturnDefaultFont := 44;
      3 : ReturnDefaultFont := 10;
      4 : ReturnDefaultFont := 10;
      5 : ReturnDefaultFont := 0;
      6 : ReturnDefaultFont := 44;
      7 : ReturnDefaultFont := 45;
      8 : ReturnDefaultFont := 47;
      9 : ReturnDefaultFont := 47;
      10 : ReturnDefaultFont := 0;
      11 : ReturnDefaultFont := 41;
      12 : ReturnDefaultFont := 0;
      13 : ReturnDefaultFont := 41;
      14 : ReturnDefaultFont := 43;
      15 : ReturnDefaultFont := 44;
      16 : ReturnDefaultFont := 42;
      17 : ReturnDefaultFont := 0;
      18 : ReturnDefaultFont := 41;
   end;
end;

Procedure ReturnSexData;
begin
   if player[person].sex = female then SexData := '‹a‘a'
   else SexData := '‹a';
end;

Procedure DisplayHP;
begin
   setcolor(15);
   Bar(400,20+330,401,20+331);
   for j:=1 to 6 do
   with player[j] do
   if name <> '' then begin
      str(hp:5,s);
      Bar(400,j*20+330,440,j*20+346); { HP }
      OutHPrintXY(400,330+20*j,s,FALSE);
   end;
end;

Procedure DisplaySP;
begin
   setcolor(15);
   Bar(479,20+330,480,20+331);
   for j:=1 to 6 do
   with player[j] do
   if name <> '' then begin
      str(sp:5,s);
      Bar(463,j*20+330,503,j*20+346); { SP }
      OutHPrintXY(463,330+20*j,s,FALSE);
   end;
end;

Procedure DisplayCondition;
begin
   Bar(540,20+330,541,20+331);
   for j:=1 to 6 do begin
      Bar(540,j*20+330,647,j*20+346); { Condition }
      if player[j].name <> '' then begin
         s := ReturnCondition(j);
         if s = '   ¹½·q' then Setcolor(15) else Setcolor(12);
         OutHPrintXY(540,330+20*j,s,FALSE);
      end;
   end;
   setcolor(15);
end;

Procedure SimpleDisCond;
var
   i,j : integer;
begin
   setcolor(15);
   Bar(400,20+330,401,20+331);
   for j:=1 to 6 do
   with player[j] do begin
      str(hp:5,s);
      Bar(400,j*20+330,440,j*20+346); { HP }
      if name <> '' then OutHPrintXY(400,330+20*j,s,FALSE);
      str(sp:5,s);
      Bar(463,j*20+330,503,j*20+346); { SP }
      if name <> '' then OutHPrintXY(463,330+20*j,s,FALSE);
   end;
   DisplayCondition;
end;

Procedure Display_Condition;
var
   i,j : integer;
begin
   SimpleDisCond;
   SetColor(15);
   for j := 1 to 6 do
   with player[j] do begin
      bar(260,j*20+330,388,j*20+346); { Name }
      if name <> '' then OutHPrintXY(260,330+20*j,name,FALSE);
   end;
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
   Print(7,'”w¯¥·e ‹qÑÁ '+account+'ˆŸi ¤i‰eÐ–”a.');
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
      name := enemydata^[num].name;
      sex := neutral;
      class := 0;
      strength := enemydata^[num].strength;
      mentality := enemydata^[num].mentality;
      concentration := 0;;
      endurance := enemydata^[num].endurance;
      resistance := enemydata^[num].resistance div 2;
      agility := enemydata^[num].agility;
      accuracy := enemydata^[num].accuracy[1];
      luck := 10;
      poison := 0;
      unconscious := 0;
      dead := 0;
      level := enemydata^[num].level;
      hp := endurance * level * 10;
      sp := mentality * level * 10;
      ac := enemydata^[num].ac;
      weapon := 50;
      shield := 6;
      armor := 11;
      wea_power := level * 2 + 10;
      shi_power := 0;
      arm_power := ac;
      experience := 0;
   end;
end;

Procedure joinenemy(num,j : byte);
begin
   with enemy[num] do begin
      E_number := j;
      name := enemydata^[j].name;
      strength := enemydata^[j].strength;
      mentality := enemydata^[j].mentality;
      endurance := enemydata^[j].endurance;
      resistance := enemydata^[j].resistance;
      agility := enemydata^[j].agility;
      accuracy[1] := enemydata^[j].accuracy[1];
      accuracy[2] := enemydata^[j].accuracy[2];
      ac := enemydata^[j].ac;
      special := enemydata^[j].special;
      castlevel := enemydata^[j].castlevel;
      specialcastlevel := enemydata^[j].specialcastlevel;
      level := enemydata^[j].level;
      hp := endurance * level * 10;
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
      resistance := player[j].resistance * 5;
      if resistance > 99 then resistance := 99;
      agility := player[j].agility;
      accuracy[1] := player[j].accuracy;
      accuracy[2] := player[j].accuracy;
      ac := player[j].ac;
      if player[j].class = 7 then special := 2 else special := 0;
      castlevel := player[j].level div 4;
      specialcastlevel := 0;
      level := player[j].level;
      hp := endurance * level * 10;
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
const
   weapon_price : array[1..4,1..7] of longint = (
          (500,3000,5000,7000,12000,40000,70000),
          (500,3000,5000,10000,30000,60000,100000),
          (100,1000,1500,4000,8000,35000,50000),
          (200,300,800,2000,5000,10000,30000));
   shield_price : array[1..5] of longint = (
           3000,15000,45000,80000,150000);
   armor_price : array[1..10] of longint = (
           2000,5000,22000,45000,75000,100000,140000,200000,350000,500000);
var
   i,j,k,h : integer;
label
   first, second, third, fourth;
begin
first:
   Print(15,'µa‹¡“e ¢‹¡¬w¸ñ·³“¡”a.');
   Print(15,'¶Ÿ¡—i·e ¢‹¡, ¤wÌ, ˆsµµ·i Ìi‰¡·¶¯s“¡”a.');
   Print(15,'´á˜å ¹·ŸAŸi ¶¥Ða¯³“¡Œa ?');
   m[0] := '';
   m[1] := '¥A“e ¢‹¡ŸA';
   m[2] := '¿¢“e ¢‹¡ŸA';
   m[3] := '¿¡Ÿa“e ¢‹¡ŸA';
   m[4] := '±¡“e ¢‹¡ŸA';
   m[5] := '¤wÌŸA';
   m[6] := 'ˆsµµŸA';
   h := select(120,6,6,FALSE,TRUE);
   case h of
      0 : begin
             Display_Condition;
             Clear;
             exit;
          end;
      1,2,3,4 : begin
second:
             hany := 15;
             Print(15,'´á˜å ¢‹¡Ÿi ¶¥Ða¯³“¡Œa ?');
             for i := 1 to 7 do m[i] := ReturnWeapon((h-1)*7+i);
             for i := 1 to 7 do begin
                str(weapon_price[h,i],s);
                HPrintXY4Select(420,70+(i-1)*16,'‹q '+s+' ˆ');
             end;
             k := select(70,7,7,FALSE,TRUE);
             if k = 0 then goto first;
             long := weapon_price[h,k];
             if party.gold < long then begin
                notenoughmoney;
                PressAnyKey;
                Clear;
                goto second;
             end;
             Print(15,'’ˆa ·¡ '+ReturnWeapon((h-1)*7+k)+Mokjuk+' ¬a¶wÐa¯¡‰V¯s“¡Œa ?');
             j := ChooseWhom(FALSE);
             if j > 0 then begin
                if Verify_Weapon(j,(h-1)*7 + k) then begin
                   with player[j] do begin
                      weapon := (h-1)*7 + k;
                      Modify_Item(j);
                   end;
                end
                else begin
                   Clear;
                   Print(7,' ·¡ ¢‹¡“e '+player[j].name+'µA‰A“e  x»¡ ´g¯s“¡”a.');
                   PressAnyKey;
                   goto second;
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
      5 : begin
third:
             Print(15,'´á˜å ¤wÌŸi ¶¥Ða¯³“¡Œa ?');
             for i := 1 to 5 do begin
                m[i] := ReturnShield(i);
                str(shield_price[i] : 6,s);
                HPrintXY4Select(420,90+(i-1)*16,'‹q '+s+' ˆ');
             end;
             k := select(90,5,5,FALSE,TRUE);
               if k = 0 then goto first;
               long := shield_price[k];
               if party.gold < long then begin
                  notenoughmoney;
                  PressAnyKey;
                  Clear;
                  goto third;
               end;
               Print(15,'’ˆa ·¡ '+ReturnShield(k)+Mokjuk+' ¬a¶wÐa¯¡‰V¯s“¡Œa ?');
               j := ChooseWhom(FALSE);
               if j > 0 then begin
                  if Verify_Shield(j,k) then begin
                     player[j].shield := k;
                     Modify_Item(j);
                     party.gold := party.gold - long;
                  end
                  else begin
                     s := player[j].name+ReturnSJosa(player[j].name);
                     Print(7,s+' ·¡ ¤wÌŸi ¬a¶w Ði ® ´ô¯s“¡”a.');
                     PressAnyKey;
                  end;
               end
               else begin
                  asyouwish;
                  PressAnyKey;
               end;
               Clear;
               goto third;
            end;
      6 : begin
fourth:
             Print(15,'´á˜å ˆsµµ·i ¶¥Ða¯³“¡Œa ?');
             for i := 1 to 10 do begin
                m[i] := ReturnArmor(i);
                str(armor_price[i] : 6,s);
                HPrintXY4Select(420,80+(i-1)*16,'‹q '+s+' ˆ');
             end;
             k := select(80,10,10,FALSE,TRUE);
               if k = 0 then goto first;
               long := armor_price[k];
               if party.gold < long then begin
                  notenoughmoney;
                  PressAnyKey;
                  Clear;
                  goto fourth;
               end;
               Print(15,'’ˆa ·¡ '+ReturnArmor(k)+Mokjuk+' ¬a¶wÐa¯¡‰V¯s“¡Œa ?');
               j := ChooseWhom(FALSE);
               if j > 0 then begin
                  if Verify_Armor(j,k) then begin
                     player[j].armor := k;
                     Modify_Item(j);
                     party.gold := party.gold - long;
                  end
                  else begin
                     s := player[j].name+ReturnSJosa(player[j].name);
                     Print(7,s+' ·¡ ˆsµµ·i ¬a¶w Ði ® ´ô¯s“¡”a.');
                     PressAnyKey;
                  end;
               end
               else begin
                  asyouwish;
                  PressAnyKey;
               end;
               Clear;
               goto fourth;
            end;
   end;
end;

Procedure Train_Center;
const
   enable_class : array[1..7,1..6] of byte = (
               (50,50,50,50,50,50),
               (60,60,50,0,60,50),
               (100,0,0,0,30,30),
               (0,50,50,100,0,60),
               (0,0,0,0,0,100),
               (80,0,60,80,0,70),
               (60,50,50,30,70,50));

 Procedure Display_Skill;
 const
    j = 280;
 begin
    Clear;
    with player[person] do begin
       SetColor(15);
       HPrintXY4Select(j-20,30,name+'· Ñe¸ “wbÃ¡');
       if enable_class[class,1] > 0 then SetColor(11) else SetColor(0);
       str(sword_skill,s);
       HPrintXY4Select(j,50,'¥A“e ¢‹¡  ‹¡®‰Ã¡  : '+s);
       if enable_class[class,2] > 0 then SetColor(11) else SetColor(0);
       str(axe_skill,s);
       if class <> 7 then
          HPrintXY4Select(j,66,'¿¢“e ¢‹¡  ‹¡®‰Ã¡  : '+s)
       else
          HPrintXY4Select(j,66,'Ã¡ža  a¤ó  “wbÃ¡  : '+s);
       if enable_class[class,3] > 0 then SetColor(11) else SetColor(0);
       str(spear_skill,s);
       HPrintXY4Select(j,82,'¿¡Ÿa“e ¢‹¡ ‹¡®‰Ã¡ : '+s);
       if enable_class[class,4] > 0 then SetColor(11) else SetColor(0);
       str(bow_skill,s);
       HPrintXY4Select(j,98,'±¡“e ¢‹¡  ‹¡®‰Ã¡  : '+s);
       if enable_class[class,5] > 0 then SetColor(11) else SetColor(0);
       str(shield_skill,s);
       HPrintXY4Select(j,114,'¤wÌ ¬a¶w  ‹¡®‰Ã¡  : '+s);
       if enable_class[class,6] > 0 then SetColor(11) else SetColor(0);
       str(fist_skill,s);
       HPrintXY4Select(j,130,' …­¥ ¬a¶w  ‹¡®‰Ã¡  : '+s);
       SetColor(10);
       str(experience,s);
       HPrintXY4Select(j-10,150,'µa¦…· ‰wÐñÃ¡ : '+s);
    end;
 end;

 Procedure Clear_Part;
 begin
    SetFillStyle(SolidFill,8);
    Bar(260,190,261,191);
    Bar(260,190,620,288);
 end;

var
   i,k : integer;
   j : longint;
label
   continue, _return, break;
begin
   Print(15,' µa‹¡“e Š…¬a Ò…e­¡ ·³“¡”a.');
   Print(15,'  e´¢ ”w¯¥·¡ Â—¦…Ðe ¸åÊ ‰wÐñ·i °}´v”a¡e, ”w¯¥·e ”á¶‚ “w®‚Ða‰A ¢‹¡Ÿi ”až‰ˆõ·³“¡”a.');
   PressAnyKey;
continue:
   Clear;
   setcolor(15);
   Print(15,'’ˆa Ò…e·i ¤h‰V¯s“¡Œa ?');
   person := ChooseWhom(FALSE);
   Clear;
   if person = 0 then begin
      Display_Condition;
      exit;
   end;
   if player[person].classtype <> sword then begin
      Print(7,' ”w¯¥·e ¸åÊ¬a ‰µi·¡ ´a“³“¡”a.');
      exit;
   end;
   with player[person] do begin
      ok := TRUE;
      for k := 1 to 6 do begin
         case k of
            1 : j := sword_skill;
            2 : j := axe_skill;
            3 : j := spear_skill;
            4 : j := bow_skill;
            5 : j := shield_skill;
            6 : j := fist_skill;
         end;
         if enable_class[class,k] > 0 then begin
            if j < enable_class[class,k] then ok := FALSE;
         end;
      end;
   end;
   if ok then begin
      Clear;
      Print(7,' ”w¯¥·e ¡¡—e ‰Á¸÷·i ®žaÐ–·a£a¡ ¡¡—e ‰wÐñ');
      Print(7,'Ã¡Ÿi A¥I¡ ¤aŽ‰V¯s“¡”a.');
      with player[person] do begin
         potential_experience := potential_experience + experience;
         experience := 0;
      end;
      exit;
   end;
   m[0] := '';
   m[1] := '¥A“e  ¢‹¡  ‹¡®‰Ã¡';
   m[2] := '¿¢“e  ¢‹¡  ‹¡®‰Ã¡';
   m[3] := '¿¡Ÿa“e ¢‹¡ ‹¡®‰Ã¡';
   m[4] := '±¡“e  ¢‹¡  ‹¡®‰Ã¡';
   m[5] := '¤wÌ  ¬a¶w  “wbÃ¡';
   m[6] := ' …­¥  ¬a¶w  ‹¡®‰Ã¡';
   if player[person].class = 7 then m[2] := 'Ã¡ža   a¤ó  “wbÃ¡';
   k := 1;
   with player[person] do
   repeat
      Display_Skill;
_return:
      Clear_Part;
      SetColor(12);
      HPrintXY4Select(260,170,'”w¯¥·¡ ®e Ða‰¡ ¯¼·e ¦¦…·i ‰¡Ÿa¯¡µ¡.');
      k := SelectSub(190,k,6,6,FALSE,FALSE);
      if k = 0 then begin
         ok := TRUE;
         goto break;
      end;
      Clear_Part;
      if enable_class[class,k] = 0 then begin
         Setcolor(7);
         HPrintXY4Select(260,190,'”w¯¥· ‰‹s‰Á  x»¡ ´g¯s“¡”a');
         c := readkey;
         if c = #0 then c := readkey;
         goto _return;
      end
      else begin
         case k of
            1 : j := sword_skill;
            2 : j := axe_skill;
            3 : j := spear_skill;
            4 : j := bow_skill;
            5 : j := shield_skill;
            6 : j := fist_skill;
         end;
         if j >= enable_class[class,k] then begin
            Setcolor(7);
            HPrintXY4Select(260,190,'·¡ ¦…´¡“e ”á ¤¶‰ ˆõ·¡ ´ô¯s“¡”a');
            c := readkey;
            if c = #0 then c := readkey;
            goto _return;
         end;
         long := 15 * j * j;
         if long > experience then begin
            Setcolor(7);
            HPrintXY4Select(260,190,'´a»¢ ‰wÐñÃ¡ˆa ¡¡¸aœs“¡”a');
            c := readkey;
            if c = #0 then c := readkey;
            goto _return;
         end;
         experience := experience - long;
         potential_experience := potential_experience + long;
         case k of
            1 : inc(sword_skill);
            2 : inc(axe_skill);
            3 : inc(spear_skill);
            4 : inc(bow_skill);
            5 : inc(shield_skill);
            6 : inc(fist_skill);
         end;
      end;
      ok := FALSE;
break:
   until ok;
   goto continue;
end;

Procedure Magic_School;
const
   enable_class : array[1..7,1..6] of byte = (
               (50,30,30,0,50,0),
               (20,50,30,10,50,30),
               (20,20,50,10,50,50),
               (100,60,60,50,100,0),
               (60,70,100,100,100,100),
               (60,100,70,100,100,50),
               (70,100,70,50,100,100));

 Procedure Display_Skill;
 const
    j = 280;
 begin
    Clear;
    with player[person] do begin
       SetColor(15);
       HPrintXY4Select(j-20,30,name+'· Ñe¸ “wbÃ¡');
       if enable_class[class,1] > 0 then SetColor(11) else SetColor(0);
       str(sword_skill,s);
       HPrintXY4Select(j,50,'‰·‰b  a¤ó “wbÃ¡ : '+s);
       if enable_class[class,2] > 0 then SetColor(11) else SetColor(0);
       str(axe_skill,s);
       HPrintXY4Select(j,66,'¥eÑÁ  a¤ó “wbÃ¡ : '+s);
       if enable_class[class,3] > 0 then SetColor(11) else SetColor(0);
       str(spear_skill,s);
       HPrintXY4Select(j,82,'Ã¡ža  a¤ó “wbÃ¡ : '+s);
       if enable_class[class,4] > 0 then SetColor(11) else SetColor(0);
       str(bow_skill,s);
       HPrintXY4Select(j,98,'Ëb®  a¤ó “wbÃ¡ : '+s);
       if enable_class[class,5] > 0 then SetColor(11) else SetColor(0);
       str(shield_skill,s);
       HPrintXY4Select(j,114,'Á¡ ¸aµeb “wbÃ¡ : '+s);
       if enable_class[class,6] > 0 then SetColor(11) else SetColor(0);
       str(fist_skill,s);
       HPrintXY4Select(j,130,'­¡ÑÅ  a¤ó “wbÃ¡ : '+s);
       SetColor(10);
       str(experience,s);
       HPrintXY4Select(j-10,150,'µa¦…· ‰wÐñÃ¡ : '+s);
    end;
 end;

 Procedure Clear_Part;
 begin
    SetFillStyle(SolidFill,8);
    Bar(260,190,261,191);
    Bar(260,190,620,288);
 end;

var
   i,k : integer;
   j : longint;
label
   continue, _return, break;
begin
   Print(15,' µa‹¡“e  a¤ó ÐbŠa ·³“¡”a.');
   Print(15,'  e´¢ ”w¯¥·¡ Â—¦…Ðe ¯©¸å ‰wÐñ·i °}´v”a¡e, ”w¯¥·e ”á¶‚ “w®‚Ða‰A  a¤ó·i ”až‰ˆõ·³“¡”a.');
   PressAnyKey;
continue:
   Clear;
   setcolor(15);
   Print(15,'’ˆa ˆaŸaÃ±·i ¤h‰V¯s“¡Œa ?');
   person := ChooseWhom(FALSE);
   Clear;
   if person = 0 then begin
      Display_Condition;
      exit;
   end;
   if player[person].classtype <> magic then begin
      Print(7,' ”w¯¥·e  a¤ó¬a ‰µi·¡ ´a“³“¡”a.');
      exit;
   end;
   with player[person] do begin
      ok := TRUE;
      for k := 1 to 6 do begin
         case k of
            1 : j := attack_magic;
            2 : j := pheno_magic;
            3 : j := cure_magic;
            4 : j := special_magic;
            5 : j := esp_magic;
            6 : j := summon_magic;
         end;
         if enable_class[class,k] > 0 then begin
            if j < enable_class[class,k] then ok := FALSE;
         end;
      end;
   end;
   if ok then begin
      Clear;
      Print(7,' ”w¯¥·e ¡¡—e ‰Á¸÷·i ®žaÐ–·a£a¡ ¡¡—e ‰wÐñ');
      Print(7,'Ã¡Ÿi A¥I¡ ¤aŽ‰V¯s“¡”a.');
      with player[person] do begin
         potential_experience := potential_experience + experience;
         experience := 0;
      end;
      exit;
   end;
   m[0] := '';
   m[1] := '‰·‰b  a¤ó “wbÃ¡';
   m[2] := '¥eÑÁ  a¤ó “wbÃ¡';
   m[3] := 'Ã¡ža  a¤ó “wbÃ¡';
   m[4] := 'Ëb®  a¤ó “wbÃ¡';
   m[5] := 'Á¡ ¸aµeb “wbÃ¡';
   m[6] := '­¡ÑÅ  a¤ó “wbÃ¡';
   k := 1;
   with player[person] do
   repeat
      Display_Skill;
_return:
      Clear_Part;
      SetColor(12);
      HPrintXY4Select(260,170,'”w¯¥·¡ ¤¶‰¡ ¯¼·e ¦¦…·i ‰¡Ÿa¯¡µ¡.');
      k := SelectSub(190,k,6,6,FALSE,FALSE);
      if k = 0 then begin
         ok := TRUE;
         goto break;
      end;
      Clear_Part;
      if enable_class[class,k] = 0 then begin
         Setcolor(7);
         HPrintXY4Select(260,190,'”w¯¥· ‰‹s‰Á  x»¡ ´g¯s“¡”a');
         c := readkey;
         if c = #0 then c := readkey;
         goto _return;
      end
      else begin
         case k of
            1 : j := attack_magic;
            2 : j := pheno_magic;
            3 : j := cure_magic;
            4 : j := special_magic;
            5 : j := esp_magic;
            6 : j := summon_magic;
         end;
         if j >= enable_class[class,k] then begin
            Setcolor(7);
            HPrintXY4Select(260,190,'·¡ ¦…´¡“e ”á ¤¶‰ ˆõ·¡ ´ô¯s“¡”a');
            c := readkey;
            if c = #0 then c := readkey;
            goto _return;
         end;
         long := 10 * j * j;
         if long > experience then begin
            Setcolor(7);
            HPrintXY4Select(260,190,'´a»¢ ‰wÐñÃ¡ˆa ¡¡¸aœs“¡”a');
            c := readkey;
            if c = #0 then c := readkey;
            goto _return;
         end;
         experience := experience - long;
         potential_experience := potential_experience + long;
         case k of
            1 : inc(attack_magic);
            2 : inc(pheno_magic);
            3 : inc(cure_magic);
            4 : inc(special_magic);
            5 : inc(esp_magic);
            6 : inc(summon_magic);
         end;
      end;
      ok := FALSE;
break:
   until ok;
   goto continue;
end;

Procedure Change_Job_for_Sword;
const
   classdata : array[1..7] of string[10] = (
                  'Ê¬a','‹¡¬a','ˆñ¬a','¬a·Ž…',
                  '¸åÊ¯w','´q¬i¸a','¸å¬a');
   enable_class : array[1..7,1..6] of byte = (
               (10,10,10,10,10,0),
               (10,10,5,0,20,0),
               (40,0,0,0,0,0),
               (0,5,5,40,0,0),
               (0,0,0,0,0,40),
               (10,0,0,10,0,20),
               (25,0,5,0,20,10));
var
   i,j,k : integer;
   enable : array[1..7] of boolean;
begin
   Print(15,' µa‹¡“e Š…¬a Ò…e­¡ ·³“¡”a.');
   Print(15,'  e´¢ ”w¯¥·¡ ¶¥Ðe”a¡e ¬¡¶… ‰‹s·a¡ ¤aŽ‰ ®ˆa ·¶¯s“¡”a.');
   PressAnyKey;
   Clear;
   if party.gold < 10000 then begin
      Print(7,' ‹aœáa ·©Ð—µA‰A“e  »¢´ó·i ¤aŽ‰˜ —a“e §¡¶w');
      Print(7,'·¥ ‹q 10000 ˆˆa ´ô¯s“¡”a.');
      PressAnyKey;
      exit;
   end;
   setcolor(15);
   Print(15,'’ˆa ¸åÊ¬a ‰µi· »¢´ó·i ¤aŽ‰V¯s“¡Œa ?');
   person := ChooseWhom(FALSE);
   Clear;
   if person = 0 then begin
      Display_Condition;
      exit;
   end;
   if player[person].classtype <> sword then begin
      Print(7,' ”w¯¥·e ¸åÊ¬a ‰µi·¡ ´a“³“¡”a.');
      exit;
   end;
   Clear;
   with player[person] do begin
      SetColor(15);
      HPrintXY4Select(260,30,name+'· ˆa“wÐe ‰‹s');
      j := 80;
      for i := 1 to 7 do begin
         ok := TRUE;
         if enable_class[i,1] > sword_skill then ok := FALSE;
         if enable_class[i,2] > axe_skill then ok := FALSE;
         if enable_class[i,3] > spear_skill then ok := FALSE;
         if enable_class[i,4] > bow_skill then ok := FALSE;
         if enable_class[i,5] > shield_skill then ok := FALSE;
         if enable_class[i,6] > fist_skill then ok := FALSE;
         if ok then begin
            SetColor(11);
            enable[i] := TRUE;
         end
         else begin
            SetColor(0);
            enable[i] := FALSE;
         end;
         HPrintXY4Select(280,j,classdata[i]);
         j := j + 16;
      end;
      m[0] := '';
      for i := 1 to 7 do m[i] := '                 '+classdata[i];
      SetColor(12);
      HPrintXY4Select(260,220,'”w¯¥·¡ ¤aŽá‰¡ ¯¼·e ‰‹s·i ‰¡Ÿa¯¡µ¡.');
      SetColor(15);
      HPrintXY4Select(260,236,'§¡¶w : ‹q 10000 ˆ');
      k := SelectSub(80,class,7,7,FALSE,TRUE);
      if k > 0 then begin
         if enable[k] then begin
            if class <> k then begin
               class := k;
               Print(10,name+ReturnSJosa(name)+' ·¡¹A '+classdata[k]+' ‰‹s·¡ –A´ö”a.');
               if class < 7 then sp := 0;
               Modify_Item(person);
               party.gold := party.gold - 10000;
               DisplaySP;
            end;
         end
         else
            Print(7,'·¡ ‰‹s·e ´a»¢ ¦‰ˆa“w Ðs“¡”a.');
      end;
   end;
end;

Procedure Change_Job_for_Magic;
const
   classdata : array[1..7] of string[10] = (
                  '¡A·¡»¡','Äå¹aœá','º®‰¬a','¶á¸á—a',
                  'ˆww®‰¬a','” a¤ó¬a','Èa·±¶¡Äá');
   enable_class : array[1..7,1..6] of byte = (
               (10,10,10,0,0,0),
               (0,10,10,0,0,10),
               (0,0,10,0,0,10),
               (40,25,25,0,0,0),
               (20,20,40,0,0,40),
               (10,40,30,0,0,20),
               (40,40,40,20,20,20));
var
   i,j,k : integer;
   enable : array[1..7] of boolean;
begin
   Print(15,' µa‹¡“e  a¤ó ÐbŠa ·³“¡”a.');
   Print(15,'  e´¢ ”w¯¥·¡ ¶¥Ðe”a¡e ¬¡¶… ‰‹s·a¡ ¤aŽ‰ ®ˆa ·¶¯s“¡”a.');
   PressAnyKey;
   Clear;
   if party.gold < 10000 then begin
      Print(7,' ‹aœáa ·©Ð—µA‰A“e  »¢´ó·i ¤aŽ‰˜ —a“e §¡¶w');
      Print(7,'·¥ ‹q 10000 ˆˆa ´ô¯s“¡”a.');
      PressAnyKey;
      exit;
   end;
   setcolor(15);
   Print(15,'’ˆa  a¤ó¬a ‰µi· »¢´ó·i ¤aŽ‰V¯s“¡Œa ?');
   person := ChooseWhom(FALSE);
   Clear;
   if person = 0 then begin
      Display_Condition;
      exit;
   end;
   if player[person].classtype <> magic then begin
      Print(7,' ”w¯¥·e  a¤ó¬a ‰µi·¡ ´a“³“¡”a.');
      exit;
   end;
   Clear;
   with player[person] do begin
      SetColor(15);
      HPrintXY4Select(260,30,name+'· ˆa“wÐe ‰‹s');
      j := 80;
      for i := 1 to 7 do begin
         ok := TRUE;
         if enable_class[i,1] > attack_magic then ok := FALSE;
         if enable_class[i,2] > pheno_magic then ok := FALSE;
         if enable_class[i,3] > cure_magic then ok := FALSE;
         if enable_class[i,4] > special_magic then ok := FALSE;
         if enable_class[i,5] > esp_magic then ok := FALSE;
         if enable_class[i,6] > summon_magic then ok := FALSE;
         if ok then begin
            SetColor(11);
            enable[i] := TRUE;
         end
         else begin
            SetColor(0);
            enable[i] := FALSE;
         end;
         HPrintXY4Select(280,j,classdata[i]);
         j := j + 16;
      end;
      m[0] := '';
      for i := 1 to 7 do m[i] := '                 '+classdata[i];
      SetColor(12);
      HPrintXY4Select(260,220,'”w¯¥·¡ ¤aŽá‰¡ ¯¼·e ‰‹s·i ‰¡Ÿa¯¡µ¡.');
      SetColor(15);
      HPrintXY4Select(260,236,'§¡¶w : ‹q 10000 ˆ');
      k := SelectSub(80,class,7,7,FALSE,TRUE);
      if k > 0 then begin
         if enable[k] then begin
            if class <> k then begin
               class := k;
               Print(10,name+ReturnSJosa(name)+' ·¡¹A '+classdata[k]+' ‰‹s·¡ –A´ö”a.');
               Modify_Item(person);
               party.gold := party.gold - 10000;
            end;
         end
         else
            Print(7,'·¡ ‰‹s·e ´a»¢ ¦‰ˆa“w Ðs“¡”a.');
      end;
   end;
end;

Procedure About_Class;
begin
   m[0] := '´á˜å ·©·i ¶¥Ða¯³“¡Œa ?';
   m[1] := '¸åÊ¬a ‰µi· ‹¡®‰·i ¯s—b';
   m[2] := ' a¤ó¬a ‰µi· “wb·i ¯s—b';
   m[3] := '¸åÊ¬a ‰µi· ‰‹s·i ¤aŽ‘';
   m[4] := ' a¤ó¬a ‰µi· ‰‹s·i ¤aŽ‘';
   k := Select(80,4,4,TRUE,TRUE);
   case k of
      1 : Train_Center;
      2 : Magic_School;
      3 : Change_Job_for_Sword;
      4 : Change_Job_for_Magic;
   end;
end;

Procedure Sell_EXP;
var
   i,k : longint;
label
   continue;
begin
   m[0] := '';
   for i := 1 to 10 do begin
      str(i*10000 : 6,s);
      m[i] := '‹q '+s+' ˆ; ­¡¶a¯¡ˆe : ';
      str(i : 2,s);
      m[i] := m[i] + s + ' ¯¡ˆe';
   end;
continue:
   Clear;
   Print(15,' µa‹¡µA¬á“e Ñ×‹q· ´· eÇq  Ò…e·i ¯¡Åa¬á ‰w');
   Print(15,'ÐñÃ¡Ÿi µ©a º“e ‰µ·³“¡”a.');
   Print(11,' ¶¥Ða¯¡“e ‹q´‚·i ‰¡Ÿa¯³¯¡µ¡.');
   k := Select(120,10,10,FALSE,TRUE);
   if k = 0 then exit;
   if party.gold < k*10000 then begin
      Print(7,' ·©Ð—·e Â—¦…Ðe ‹q·¡ ´ô´ö”a.');
      PressAnyKey;
      goto continue;
   end;
   str(k : 2,s);
   Print(15,' ·©Ð—·e '+s+' ¯¡ˆe•·´e Ò…e·i ¤h‰A –A´ö”a.');
   party.gold := party.gold - k*10000;
   for i := 1 to 5 do
   if exist(i) then player[i].experience := player[i].experience + k*10000;
   party.min := 0;
   ok := TRUE;
   with party do
   repeat
      min := min + 20;
      if min > 59 then begin
         hour := hour + 1;
         k := k - 1;
         min := 0;
      end;
      if hour > 23 then begin
         day := day + 1;
         hour := 0;
      end;
      if day > 359 then begin
         year := year + 1;
         day := 0;
      end;
      if KeyPressed then ok := FALSE;
      if ok then begin
         delay(500);
         if KeyPressed then ok := FALSE;
         Scroll(TRUE);
      end;
   until k <= 0;
   Scroll(TRUE);
   Print(7,'');
   Print(7,' ·©Ð—·e Ò…e·i {  aÁv”a.');
   while KeyPressed do c := readkey;
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
             if dead > 0 then
                Print(7,name+ReturnSJosa(name)+' ·¡£¡ º‚·e ¬wÈ·³“¡”a')
             else if unconscious > 0 then
                Print(7,name+ReturnSJosa(name)+' ·¡£¡ ·¯¢¦‰¡w·³“¡”a')
             else if poison > 0 then
                Print(7,name+ReturnSJosa(name)+' •¢·¡ Ìá»¥ ¬wÈ·³“¡”a')
             else if hp >= endurance*level*10 then
                Print(15,name+ReturnSJosa(name)+' Ã¡žaÐi Ï©¶aˆa ´ô¯s“¡”a');
             if (dead>0) or (unconscious>0) or (poison>0) or
                (hp>=endurance*level*10) then begin
                PressAnyKey;
                goto second;
             end;
             i := endurance * level * 10 - hp;
             i := round(i * (level / 10)) + 1;
             if party.gold < i then begin
                notenoughmoney;
                PressAnyKey;
                goto second;
             end;
             party.gold := party.gold - i;
             hp := endurance * level * 10;
             if sex = male then s := ' ‹a·' else s := ' ‹a‘a·';
             Print(15,name+ReturnSJosa(name)+s+' ¡¡—e ˆåˆw·¡ ÒA¥¢–A´ö”a');
             displayHP;
             PressAnyKey;
             goto first;
          end;
      2 : with player[k] do begin
             if dead > 0 then
                Print(7,name+ReturnSJosa(name)+' ·¡£¡ º‚·e ¬wÈ·³“¡”a')
             else if unconscious > 0 then
                Print(7,name+ReturnSJosa(name)+' ·¡£¡ ·¯¢¦‰¡w·³“¡”a')
             else if poison = 0 then
                Print(15,name+ReturnSJosa(name)+' •¢µA ˆéŸ¡»¡ ´g´v¯s“¡”a');
             if (dead>0) or (unconscious>0) or (poison=0) then begin
                PressAnyKey;
                goto second;
             end;
             i := level * 10;
             if party.gold < i then begin
                notenoughmoney;
                PressAnyKey;
                goto second;
             end;
             party.gold := party.gold - i;
             poison := 0;
             Print(15,name+ReturnSJosa(name)+' •¢·¡ ¹Aˆá –A´ö¯s“¡”a');
             displaycondition;
             PressAnyKey;
             goto first;
          end;
      3 : with player[k] do begin
             if dead > 0 then Print(7,name+ReturnSJosa(name)+' ·¡£¡ º‚·e ¬wÈ·³“¡”a')
             else if unconscious = 0 then Print(15,name+ReturnSJosa(name)+' ·¯¢¦‰¡w·¡ ´a“³“¡”a');
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
             Print(15,name+ReturnSJosa(name)+' ·¯¢·i Àav¯s“¡”a');
             displaycondition;
             displayHP;
             PressAnyKey;
             goto first;
          end;
      4 : with player[k] do begin
             if dead = 0 then begin
                Print(15,name+ReturnSJosa(name)+' º‚»¡ ´g´v¯s“¡”a');
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
             if unconscious > endurance * level then
                unconscious := endurance * level;
             Print(15,name+ReturnSJosa(name)+' ”a¯¡ ¬i´av¯s“¡”a');
             displaycondition;
             PressAnyKey;
             goto first;
          end;
   end;
end;

Procedure Medicine;
const
   data : array[1..5] of string[12] = (
          'ÁAb ÒA¥¢´¢',' a¤ó ÒA¥¢´¢','Ð•¢· ´¢Á¡',
          '·¯¢· ´¢Á¡','¦ÑÉ· ´¢Á¡');
   pricedata : array[1..5] of longint = (
               2000,3000,1000,5000,10000);
var
   i,j,k : integer;
label
   continue;
begin
   Clear;
continue:
   Print(15,' µa‹¡“e ´¢Á¡Ÿi Ìa“e ‰µ·³“¡”a.');
   Print(7,'');
   Print(15,' ”w¯¥·¡ ¬a‰¡ ¯¼·e ´¢·¡a ´¢Á¡Ÿi ‰¡Ÿa¯³¯¡µ¡.');
   m[0] := '';
   for i := 1 to 5 do m[i] := data[i];
   k := select(116,5,5,FALSE,TRUE);
   if k = 0 then exit;
   Print(15,' ˆ•®Ÿi »¡¸÷ Ða¯³¯¡µ¡.');
   for i := 1 to 10 do begin
      str(i : 2,s);
      m[i] := data[k] + '  '+s+'ˆ : ';
      str(pricedata[k]*i,s);
      m[i] := m[i]+'‹q '+s+' ˆ';
   end;
   j := select(100,10,10,FALSE,TRUE);
   if j = 0 then goto continue;
   long := pricedata[k] * j;
   if party.gold < long then begin
      Print(7,' ”w¯¥µA‰A“e ·¡ ˆõ·i ¬i •¥·¡ ´ô¯s“¡”a.');
      PressAnyKey;
      goto continue;
   end;
   party.gold := party.gold - long;
   if party.item[k] + j < 256 then party.item[k] := party.item[k] + j
   else party.item[k] := 255;
   goto continue;
end;

Procedure Sell_Item;
const
   data : array[1..6] of string[10] = (
          'ÑÁ¬i','­¡ÑÅ ¢…¬á','”Ñw Ñõ¦‰',
          '®¸÷ Š¯i','§¡Ð— ¦Ãa','·¡•· Š¯i');
   pricedata : array[1..6] of longint = (
               500,4000,300,500,1000,5000);
var
   i,j,k : integer;
label
   continue;
begin
   Clear;
continue:
   Print(15,' µa‹¡“e µaœáˆa»¡ ¢‰Î‘·i Ìa“e ‰µ·³“¡”a.');
   Print(7,'');
   Print(15,' ”w¯¥·¡ ¬a‰¡ ¯¼·e ¢‰ˆå·i ‰¡Ÿa¯³¯¡µ¡.');
   m[0] := '';
   for i := 1 to 6 do m[i] := data[i];
   k := select(116,6,6,FALSE,TRUE);
   if k = 0 then exit;
   Print(15,' ˆ•®Ÿi »¡¸÷ Ða¯³¯¡µ¡.');
   for i := 1 to 10 do begin
      if k = 1 then
         str(i*10 : 2,s)
      else
         str(i : 2,s);
      m[i] := data[k] + '  '+s+'ˆ : ';
      str(pricedata[k]*i,s);
      m[i] := m[i]+'‹q '+s+' ˆ';
   end;
   j := select(100,10,10,FALSE,TRUE);
   if j = 0 then goto continue;
   long := pricedata[k] * j;
   if party.gold < long then begin
      Print(7,' ”w¯¥µA‰A“e ·¡ ˆõ·i ¬i •¥·¡ ´ô¯s“¡”a.');
      PressAnyKey;
      goto continue;
   end;
   party.gold := party.gold - long;
   if k = 1 then begin
      if party.arrow + j*10 > 0 then party.arrow := party.arrow + j*10
      else party.arrow := 32767;
   end
   else begin
      if party.item[k+4] + j < 256 then party.item[k+4] := party.item[k+4] + j
      else party.item[k+4] := 255;
   end;
   goto continue;
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

 Procedure Edit_Error;
 begin
    if AdLibOn then PlayOff;
    UnSound;
    asm
       mov ah,0
       mov al,3
       int $10
    end;
    TextAttr := $07;
    ClrScr;
    TextColor(12);
    Writeln('Editing is not allowed !!');
    Halt;
 end;

 Procedure Verify_LoadGame;
 var
    temp : byte;
    i : integer;
 begin
    temp := 0;
    with party do begin
       temp := temp + year;
       temp := temp + map;
       temp := temp + xaxis;
       temp := temp + yaxis;
       temp := temp + food;
       temp := temp + gold;
       temp := temp + arrow;
       for i := 1 to 10 do temp := temp + item[i];
       for i := 1 to 100 do temp := temp + etc[i];
       if temp <> checksum[1] then Edit_Error;
    end;
    temp := 0;
    for i := 1 to 6 do
    with player[i] do begin
       temp := temp + class;
       temp := temp + strength;
       temp := temp + mentality;
       temp := temp + concentration;
       temp := temp + endurance;
       temp := temp + resistance;
       temp := temp + agility;
       temp := temp + accuracy;
       temp := temp + luck;
       temp := temp + poison;
       temp := temp + unconscious;
       temp := temp + dead;
       temp := temp + hp;
       temp := temp + sp;
       temp := temp + ac;
       temp := temp + level;
       temp := temp + experience;
       temp := temp + potential_experience;
       temp := temp + weapon;
       temp := temp + shield;
       temp := temp + armor;
       temp := temp + potential_ac;
       temp := temp + wea_power;
       temp := temp + shi_power;
       temp := temp + arm_power;
       temp := temp + sword_skill;
       temp := temp + axe_skill;
       temp := temp + spear_skill;
       temp := temp + bow_skill;
       temp := temp + shield_skill;
       temp := temp + fist_skill;
    end;
    if temp <> party.checksum[2] then Edit_Error;
 end;

var
   r,g,b : byte;
begin
   if not LoadFont then begin
      {$I-}
      if Loading_SaveGame then begin
         Assign(playerfile,'player'+LoadNo+'.dat');
         Reset(playerfile,1);
         blockread(playerfile,party,sizeof(party));
         blockread(playerfile,player,sizeof(player));
         Close(playerfile);
         if IOResult <> 0 then ErrorMessage('player'+LoadNo+'.dat',true);
         Verify_LoadGame;
      end;
      Assign(fontname,'chara.fnt');
      Reset(fontname);
      read(fontname,chara^);
      Close(fontname);
      if IOResult <> 0 then ErrorMessage('chara.fnt',false);
      {$I+}
   end;
   existfile := fsearch('save'+LoadNo+'.map','');
   if (existfile = '') or (LoadFont) or (not Loading_SaveGame) then begin
      s := '';
      case party.map of
         1 : s := 'Ground';
         2 : s := 'Pyramid';
         3 : s := 'U_World1';
         4 : s := 'U_World2';
         5 : s := 'Ahn Young-Kie is Genius !!';
         6 : s := 'Lore';
         7 : s := 'LastDitc';
         8 : s := 'Dome';
         9 : s := 'Regulus';
         10 : s := 'Menace';
         11 : s := 'Evidence';
         12 : s := 'Clue';
         13 : s := 'LTemple';
         14 : s := 'Mortal';
         15 : s := 'Belial';
         16 : s := 'Moloch';
         17 : s := 'Asmodeus';
         18 : s := 'Mephisto'
         else s := 'Unknown';
      end;
      {$I-}
      Assign(filename,s+'.map');
      Reset(filename);
      Read(filename,xmax); Read(filename,ymax);
      for j:=1 to ymax do for i:=1 to xmax do read(filename,map^[i,j]);
      Close(filename);
      if IOResult <> 0 then ErrorMessage(s+'.map',false);
      {$I+}
   end
   else begin
      Assign(f,'save'+LoadNo+'.map');
      Reset(f,1);
      blockRead(f,xmax,1); blockRead(f,ymax,1);
      blockread(f,map^,sizeof(map^));
      Close(f);
   end;
   Loading_SaveGame := TRUE;
   case party.map of
      1,3,4 : position := ground;
      6..9 : position := town;
      2,10..17 : position := den
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
   Assign(filename,s+'.pal');
   Reset(filename);
   for i := 0 to 15 do begin
      read(filename,r);
      read(filename,g);
      read(filename,b);
      setpalette(i,i);
      RGB(i,r,g,b);
   end;
   Close(filename);
   if IOResult <> 0 then ErrorMessage(s+'.pal',false);
   {$I+}

   if party.map = 2 then move(Font^[48],Font^[52],294);
   {  Special Event  }

   LoadFont := TRUE;
   j := ReturnDefaultFont(party.map);
   move(font^[j],font^[0],294);
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
   Clear_View_Screen;
end;

Procedure Save;

 Procedure Modify_SaveGame;
 var
    temp : byte;
    i : integer;
 begin
    temp := 0;
    with party do begin
       temp := temp + year;
       temp := temp + map;
       temp := temp + xaxis;
       temp := temp + yaxis;
       temp := temp + food;
       temp := temp + gold;
       temp := temp + arrow;
       for i := 1 to 10 do temp := temp + item[i];
       for i := 1 to 100 do temp := temp + etc[i];
       checksum[1] := temp;
    end;
    temp := 0;
    for i := 1 to 6 do
    with player[i] do begin
       temp := temp + class;
       temp := temp + strength;
       temp := temp + mentality;
       temp := temp + concentration;
       temp := temp + endurance;
       temp := temp + resistance;
       temp := temp + agility;
       temp := temp + accuracy;
       temp := temp + luck;
       temp := temp + poison;
       temp := temp + unconscious;
       temp := temp + dead;
       temp := temp + hp;
       temp := temp + sp;
       temp := temp + ac;
       temp := temp + level;
       temp := temp + experience;
       temp := temp + potential_experience;
       temp := temp + weapon;
       temp := temp + shield;
       temp := temp + armor;
       temp := temp + potential_ac;
       temp := temp + wea_power;
       temp := temp + shi_power;
       temp := temp + arm_power;
       temp := temp + sword_skill;
       temp := temp + axe_skill;
       temp := temp + spear_skill;
       temp := temp + bow_skill;
       temp := temp + shield_skill;
       temp := temp + fist_skill;
    end;
    party.checksum[2] := temp;
 end;

begin
   party.xaxis := x;
   party.yaxis := y;
   Modify_SaveGame;
   Assign(playerfile,'player'+LoadNo+'.dat');
   Rewrite(playerfile,1);
   blockwrite(playerfile,party,sizeof(party));
   blockwrite(playerfile,player,sizeof(player));
   Close(playerfile);
   Assign(f,'save'+LoadNo+'.map');
   Rewrite(f,1);
   blockwrite(f,xmax,1); blockwrite(f,ymax,1);
   blockwrite(f,map^,sizeof(map^));
   Close(f);
end;

Procedure Set_All;
begin
   Randomize;
   encounter := @party.etc[7];
   maxenemy := @party.etc[8];
   soundon := TRUE;
   Cruel := TRUE;
   LoadFont := FALSE;
   LoadNo := '1';
   Rest_Time := 6;
   Assign(enemyfile,'foedata.dat');
   Reset(enemyfile);
   for i := 1 to 75 do read(enemyfile,enemydata^[i]);
   Close(enemyfile);
   Load;
   SetFillStyle(1,8);
   Bar(0,0,639,479);
   SetColor(11);
   bHPrint(260,313,'  ·¡Ÿq           ¬—¡wb    ab       ¬w È');
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
      exec(getenv('COMSPEC'),'/cEnd.com');
      Rename(FileName,'End.cmd');
   end;
end;

end.