Unit MystMenu;
{$X+}
INTERFACE

Uses
   Crt, Dos, Graph, UHanX, MystSub;

 Procedure CureSpell;
 Procedure PhenominaSpell;
 Procedure ViewParty;
 Procedure ViewCharacter;
 Procedure Inventory;
 Procedure QuickView;
 Procedure CastSpell;
 Function ReturnPredict : integer;
 Procedure Extrasense;
 Procedure SetBackPack;
 Procedure Rest;
 Procedure Use_Item(select_num : byte);
 Procedure Use_Crystal;
 Procedure GameOption;
 Procedure SelectMode;


IMPLEMENTATION

Procedure SPnotEnough;
begin
   Print(7,'‹aœáa,  a¤ó »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
   PressAnyKey;
end;

Procedure HealOne(whom : byte);
begin
   with player[whom] do begin
      if (dead > 0) or (unconscious > 0) or (poison > 0) then begin
         if party.etc[6] = 0 then Print(7,name+'“e Ã¡ža–I ¬wÈˆa ´a“³“¡”a.');
         exit;
      end;
      if hp >= endurance * level * 10 then begin
         if party.etc[6] = 0 then Print(7,name+'“e Ã¡žaÐi Ï©¶aˆa ´ô¯s“¡”a.');
         exit;
      end;
   end;
   i := 2 * player[person].level;
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   player[whom].hp := player[whom].hp + i * 10;
   with player[whom] do
   if hp > (level * endurance * 10) then hp := level * endurance * 10;
   Print(15,player[whom].name+'“e Ã¡ža–A´á ¹v¯s“¡”a.');
end;

Procedure CureOne(whom : byte);
begin
   with player[whom] do begin
      if (dead > 0) or (unconscious > 0) then begin
         if party.etc[6] = 0 then Print(7,name+'“e •¢·¡ Ã¡ža–I ¬wÈˆa ´a“³“¡”a.');
         exit;
      end;
      if poison = 0 then begin
         if party.etc[6] = 0 then Print(7,player[whom].name+'“e •¢µA ˆéŸ¡»¡ ´g´v¯s“¡”a.');
         exit;
      end;
   end;
   if player[person].sp < 15 then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - 15;
   player[whom].poison := 0;
   Print(15,player[whom].name+'· •¢·e ¹Aˆá –A´ö¯s“¡”a.');
end;

Procedure ConsciousOne(whom : byte);
begin
   with player[whom] do begin
      if dead > 0 then begin
         if party.etc[6] = 0 then Print(7,name+'“e ·¯¢·¡ •©´aµ© ¬wÈˆa ´a“³“¡”a.');
         exit;
      end;
      if unconscious = 0 then begin
         if party.etc[6] = 0 then Print(7,player[whom].name+'“e ·¯¢¦‰¡w·¡ ´a“³“¡”a.');
         exit;
      end;
   end;
   i := 10 * player[whom].unconscious;
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   player[whom].unconscious := 0;
   if player[whom].hp <= 0 then player[whom].hp := 1;
   Print(15,player[whom].name+'“e ·¯¢·i –AÀx´v¯s“¡”a.');
end;

Procedure RevitalizeOne(whom : byte);
begin
   if player[whom].dead = 0 then begin
      if party.etc[6] = 0 then Print(7,player[whom].name+'“e ´a»¢ ¬i´a ·¶¯s“¡”a.');
      exit;
   end;
   i := 30 * player[whom].dead;
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   with player[whom] do begin
      dead := 0;
      if unconscious > endurance * level then
         unconscious := endurance * level;
      if unconscious = 0 then unconscious := 1;
      Print(15,name+'“e ”a¯¡ ¬—¡w·i ´è´ö¯s“¡”a.');
   end;
end;

Procedure HealAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then HealOne(i);
end;

Procedure CureAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then CureOne(i);
end;

Procedure ConsciousAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then ConsciousOne(i);
end;

Procedure RevitalizeAll;
var i : byte;
begin
   for i:= 1 to 6 do if player[i].name <> '' then RevitalizeOne(i);
end;

Procedure CureSpell;
var
   i,j,whom : integer;
begin
   if player[person].classtype = magic then
      i := player[person].cure_magic div 10
   else
      i := player[person].axe_skill div 10;
   if i <= 0 then begin
      Print(7,'”w¯¥·e Ã¡ža  a¤ó·i ¬a¶wÐi “wb·¡ ´ô¯s“¡”a.');
      PressAnyKey;
      exit;
   end;
   m[0] := '’ŠµA‰A';
   for i:= 1 to 6 do
   if player[i].name <> '' then
      m[i] := player[i].name
   else
      m[i] := '´ô¯s“¡”a';
   j := 6;
   if player[6].name <> '' then j := 7;
   m[j] := '¡¡—e ¬aœq—iµA‰A';
   if player[person].classtype = magic then
      i := player[person].cure_magic div 10
   else
      i := player[person].axe_skill div 10;
   if i < 6 then
      whom := Select(60,j-1,j-1,TRUE,TRUE)
   else
      whom := Select(60,j,j,TRUE,TRUE);
   if whom = 0 then exit;
   m[0] := '¬åÈ‚';
   if whom <> j then begin
      for i := 1 to 5 do m[i] := ReturnMagic(3,i);
      if player[person].classtype = magic then
         i := player[person].cure_magic div 10
      else
         i := player[person].axe_skill div 10;
      if i > 5 then i := 5;
      j := Select(60,i,5,FALSE,TRUE);
      if j = 0 then exit;
      case j of
         1 : HealOne(whom);
         2 : CureOne(whom);
         3 : ConsciousOne(whom);
         4 : RevitalizeOne(whom);
         5 : begin
                RevitalizeOne(whom);
                ConsciousOne(whom);
                CureOne(whom);
                HealOne(whom);
             end;
      end;
   end
   else begin
      for i := 6 to 10 do m[i-5] := ReturnMagic(3,i);
      if player[person].classtype = magic then
         i := player[person].cure_magic div 10 - 5
      else
         i := player[person].axe_skill div 10 - 5;
      if i < 1 then begin
         print(7,'ˆwÐe Ã¡ža  a¤ó·e ´a»¢ ¦‰ˆa“w Ðs“¡”a.');
         PressAnyKey;
         exit;
      end;
      j := Select(60,i,5,TRUE,TRUE);
      case j of
         1 : HealAll;
         2 : CureAll;
         3 : ConsciousAll;
         4 : RevitalizeAll;
         5 : begin
                RevitalizeAll;
                ConsciousAll;
                CureAll;
                HealAll;
             end;
      end;
   end;
   Print(7,''); Print(7,'');
   SimpleDisCond;
   PressAnyKey;
end;

Procedure Wizard_Eye;
var
   x_init,y_init,x_end,y_end : integer;
begin
   if Map_Header.handicap then
   if (Map_Header.handicap_bit and BIT6) > 0 then begin
      Print(13,' ”w¯¥·  áŸ¡­¢µA“e ´a¢œå Ñw¬w•¡ ˜áµ¡Ÿa»¡ ´g´v”a.');
      exit;
   end;
   Clear_View_Screen;
   if (Map_Header.xmax <= 100) and (Map_Header.ymax <= 80) then begin
      x_init := 1; y_init := 1;
      x_end := Map_Header.xmax; y_end := Map_Header.ymax;
   end
   else begin
      x_init := x-50; y_init := y-40;
      x_end := x+50; y_end := y+40;
      if x_init < 1 then begin
         x_init := 1;
         if Map_Header.xmax > 100 then x_end := 100 else x_end := Map_Header.xmax;
      end;
      if y_init < 1 then begin
         y_init := 1;
         if Map_Header.ymax > 80 then y_end := 80 else y_end := Map_Header.ymax;
      end;
      if x_end > Map_Header.xmax then begin
         x_end := Map_Header.xmax;
         if Map_Header.xmax > 100 then x_init := Map_Header.xmax - 100 else x_init := 1;
      end;
      if y_end > Map_Header.ymax then begin
         y_end := Map_Header.ymax;
         if Map_Header.ymax > 80 then y_init := Map_Header.ymax - 80 else y_init := 1;
      end;
   end;
   for j := y_init to y_end do
   for i := x_init to x_end do begin
      case position of
         town : case Real_map(i,j) of
                   1..18,20,21 : k := White; { Wall }
                         22    : k := LightGreen;  { Enterance }
                         23    : k := LightCyan;   { Sign }
                         24    : k := LightBlue;   { Water }
                         25    : k := Cyan;        { Swamp }
                         26    : k := LightRed;    { Lava }
                   0,19,27..47 : k := Black  { Pass }
                            else k := LightMagenta;   { Person }
                end;
         ground:case Real_map(i,j) of
                   2..20 : k := White;
                   22    : k := LightCyan;
                   1,48    : k := LightBlue;
                   23,49 : k := Cyan;
                   50    : k := LightRed;
                   0     : k := Black;
                   24..47: k := Black
                         else k := LightGreen;
                end;
         den  : case Real_map(i,j) of
                   1..40,51 : k := White;
                      54    : k := LightGreen;
                      53    : k := LightCyan;
                      48    : k := LightBlue;
                      49    : k := Cyan;
                      50    : k := LightRed;
                      52    : k := Black;
                   0,41..47 : k := Black
                         else k := LightMagenta;
                end;
         keep : case Real_map(i,j) of
                   1..39,51 : k := White;
                      54    : k := LightGreen;
                      53    : k := LightCyan;
                      48    : k := LightBlue;
                      49    : k := Cyan;
                      50    : k := LightRed;
                0,52,40..47 : k := Black
                         else k := LightMagenta;
                end;
      end;
      PutPixel((i-x_init)*2+32,(j-y_init)*2+305,k);
   end;
   while keypressed do c := readkey;
   repeat
      if k = DarkGray then k := Yellow else k := DarkGray;
      PutPixel((x-x_init)*2+32,(y-y_init)*2+305,k);
   until keypressed and (k = DarkGray);
   while keypressed do c := readkey;
end;

Function Teleport : boolean;
begin
   if Map_Header.handicap then
   if (Map_Header.handicap_bit and BIT4) > 0 then begin
      Print(13,'´i ® ´ô“e Ó±·¡ ‰·ˆe ·¡•··i ¤wÐ Ðs“¡”a.');
      Teleport := FALSE;
      exit;
   end;
   Teleport := FALSE;
   x1 := 0; y1 := 0;
   case face mod 4 of
      0 : y1 := 1;
      1 : y1 := -1;
      2 : x1 := 1;
      3 : x1 := -1;
   end;
   Clear;
   Print(11,'”w¯¥· ‰·ˆe ·¡•·b·i »¡¸÷');
   setcolor(15);
   HGotoXY(266,70);
   HPrint('## ');
   setcolor(10);
   HPrint('5000');
   setcolor(15);
   HPrint(' ‰·ˆe ·¡•·b');
   setcolor(10);
   k := 5;
   ok := FALSE;
   repeat
      j := 0;
      c := readkey;
      if c in [#13,#27] then ok := TRUE;
      if c = #0 then begin
         c := readkey;
         case c of
            #75,#80 : j := -1;
            #72,#77 : j := 1;
         end;
         if j <> 0 then begin
            k := k + j;
            if (k<1) or (k>9) then k := k - j
            else begin
               str(k,s);
               setfillstyle(1,8);
               bar(290,70,297,86);
               HPrintXY(290,70,s);
            end;
         end;
      end;
   until ok;
   if c = #27 then begin
      Clear;
      exit;
   end;
   x := x + k*x1; y := y + k*y1;
   if (x<5) or (x>=Map_Header.xmax-3) or (y<5) or (y>=Map_Header.ymax-3) then begin
      x := x - k*x1; y := y - k*y1;
      Message(7,'‰·ˆe ·¡•··¡ É·Ða»¡ ´g¯s“¡”a.');
      exit;
   end;
   ok := FALSE;
   case position of
      town : if Real_map(x,y) in [27..47] then ok := TRUE;
      ground : if Real_map(x,y) in [24..47] then ok := TRUE;
      den : if Real_map(x,y) in [41..47] then ok := TRUE;
      keep : if Real_map(x,y) in [27..47] then ok := TRUE;
   end;
   if not ok then begin
      if (Real_map(x,y) = 0) or
         ((position in [den,keep]) and (Real_map(x,y) = 52)) then begin
         Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·i ¤ÀâÐs“¡”a.');
         Teleport := TRUE;
      end
      else Message(7,'‰·ˆe ·¡•· ¸w­¡¡ ¦¸âÐs Ðs“¡”a.');
      x := x - k*x1; y := y - k*y1;
      exit;
   end;
   x := x - k*x1; y := y - k*y1;
   for i := 1 to k-1 do begin
      x := x + x1; y := y + y1;
      Scroll(FALSE);
   end;
   x := x + x1; y := y + y1;
   Message(15,'‰·ˆe ·¡•·  a¤ó·¡ ¬÷‰·Ð–¯s“¡”a.');
   Scroll(TRUE);
   Teleport := TRUE;
end;

Procedure PhenominaSpell;

 Procedure SPnotEnough;
 begin
    Message(7,' a¤ó »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
 end;

var
   x_init,y_init,x_end,y_end : integer;
   ok : boolean;
begin
   if player[person].classtype = sword then begin
      s := player[person].name+ReturnSJosa(player[person].name);
      Message(7,s+' ¥eÑÁ  a¤ó·i ¬a¶wÐa“e ‰µi·¡ ´a“³“¡”a.');
      exit;
   end;
   m[0] := '¬åÈ‚';
   for i := 1 to 10 do m[i] := ReturnMagic(2,i);
   j := player[person].pheno_magic div 10;
   if j > 10 then j := 10;
   k := Select(60,j,10,TRUE,TRUE);
   if k = 0 then exit;
   case k of
      1 : begin
             if player[person].sp < 1 then begin
                SPnotEnough;
                exit;
             end;
             if party.etc[1] + (player[person].pheno_magic div 10) < 256 then
                party.etc[1] := party.etc[1] + (player[person].pheno_magic div 10)
             else
                party.etc[1] := 255;
             Message(15,'·©Ð—·e  a¤ó· Ñõ¦‰·i ¤jÑv¯s“¡”a.');
             dec(player[person].sp);
             Scroll(TRUE);
          end;
      2 : begin
             if (not Map_Header.handicap) or
                ((Map_Header.handicap_bit and BIT6) = 0) then begin
                if player[person].sp < 5 then begin
                   SPnotEnough;
                   exit;
                end;
                player[person].sp := player[person].sp - 5;
             end;
             Wizard_Eye;
          end;
      3 : begin
             if player[person].sp < 5 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'·©Ð—·e ‰·º—¦¬wº— ·³“¡”a.');
             party.etc[4] := 255;
             player[person].sp := player[person].sp - 5;
          end;
      4 : begin
             if player[person].sp < 10 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'·©Ð—·e ¢‰¶áŸi ˆé·i® ·¶¯s“¡”a.');
             party.etc[2] := 255;
             player[person].sp := player[person].sp - 10;
          end;
      5 : begin
             if player[person].sp < 20 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'·©Ð—·e “|¶áŸi ˆé·i® ·¶¯s“¡”a.');
             party.etc[3] := 255;
             player[person].sp := player[person].sp - 20;
          end;
      6 : begin
             if Map_Header.handicap then
             if (Map_Header.handicap_bit and BIT3) > 0 then begin
                Print(13,'´i ® ´ô“e Ó±·¡ ‹¡ÑÁ ·¡•··i ¤wÐ Ðs“¡”a.');
                exit;
             end;
             if player[person].sp < 25 then begin
                SPnotEnough;
                exit;
             end;
             x1 := 0; y1 := 0;
             case face mod 4 of
                0 : y1 := 1;
                1 : y1 := -1;
                2 : x1 := 1;
                3 : x1 := -1;
             end;
             x := x + 2*x1; y := y + 2*y1;
             if (x<5) or (x>=Map_Header.xmax-3) or (y<5) or (y>=Map_Header.ymax-3) then begin
                x := x - 2*x1; y := y - 2*y1;
                exit;
             end;
             ok := FALSE;
             case position of
                town : if Real_map(x,y) in [0,27..47] then ok := TRUE;
                ground : if Real_map(x,y) in[0,24..47] then ok := TRUE;
                den : if Real_map(x,y) in[0,41..47] then ok := TRUE;
                keep : if Real_map(x,y) in[0,40..47] then ok := TRUE;
             end;
             if not ok then begin
                x := x - 2*x1; y := y - 2*y1;
                Message(7,'‹¡ÑÁ ·¡•··¡ É·Ða»¡ ´g¯s“¡”a.');
                exit;
             end;
             player[person].sp := player[person].sp - 25;
             if (Real_Map(x-x1,y-y1) = 0) or
             ((position in [den,keep]) and (Real_map(x+x1,y+y1) = 52)) then begin
                x := x - 2*x1; y := y - 2*y1;
                Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·  a¤ó·i ¤ÀâÐs“¡”a.');
             end
             else begin
                x := x - x1; y := y - y1;
                Scroll(FALSE);
                x := x + x1; y := y + y1;
                Message(15,'‹¡ÑÁ ·¡•··i  aÁv¯s“¡”a.');
                Scroll(TRUE);
             end;
          end;
      7 : begin
             if Map_Header.handicap then
             if (Map_Header.handicap_bit and BIT1) > 0 then begin
                Print(13,'·¡ »¡µb· ´b· Ó±·¡ »¡Ñw¥eÑÁŸi ¤wÐ Ðs“¡”a.');
                exit;
             end;
             if player[person].sp < 30 then begin
                SPnotEnough;
                exit;
             end;
             x1 := 0; y1 := 0;
             case face mod 4 of
                0 : y1 := 1;
                1 : y1 := -1;
                2 : x1 := 1;
                3 : x1 := -1;
             end;
             case position of
                town : k := 47;
                ground : k := 41;
                den : k := 43;
                keep : k := 43;
             end;
             player[person].sp := player[person].sp - 30;
             if (Real_map(x+x1,y+y1) = 0) or
             ((position in [den,keep]) and (Real_map(x+x1,y+y1) = 52)) then begin
                x1 := 0; y1 := 0;
                Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·  a¤ó·i ¤ÀâÐs“¡”a.');
             end
             else if (position = keep) and (Real_Map(x+x1,y+y1) >= 42) then begin
                x1 := 0; y1 := 0;
             end
             else if (position = town) and (Real_Map(x+x1,y+y1) >= 48) then begin
                x1 := 0; y1 := 0;
             end
             else begin
                Putmap(x+x1,y+y1,k);
                Message(15,'»¡Ñw¥eÑÁµA ¬÷‰·Ð–¯s“¡”a.');
                Scroll(TRUE);
             end;
          end;
      8 : begin
             if (not Map_Header.handicap) or
                ((Map_Header.handicap_bit and BIT4) = 0) then begin
                if player[person].sp < 50 then begin
                   SPnotEnough;
                   exit;
                end;
             end;
             if Teleport then player[person].sp := player[person].sp - 50;
          end;
      9 : begin
             if player[person].sp < 30 then begin
                SPnotEnough;
                exit;
             end;
             j := 0;
             for i := 1 to 6 do if player[i].name <> '' then inc(j);
             if party.food + j > 255 then party.food := 255
             else party.food := party.food + j;
             player[person].sp := player[person].sp - 30;
             str(j,s);
             hany := 30;
             Print(15,' ¯¢œ· ¹A¹¡  a¤ó·e ¬÷‰·¸â·a¡ ®Ð—–A´ö¯s“¡”a');
             hany := hany + 20;
             str(j,s);
             Print(15,'            '+s+' ˆ· ¯¢œ··¡ »wˆa–Q');
             hany := hany + 30;
             str(party.food,s);
             Print(11,'      ·©Ð—· Ñe¸ ¯¢œ··e '+s+' ˆ ·³“¡”a');
          end;
      10: begin
             if Map_Header.handicap then
             if (Map_Header.handicap_bit and BIT2) > 1 then begin
                Print(13,'·¡ »¡µb· ´b· Ó±·¡ »¡Ñw¥eÑÁŸi ¤wÐ Ðs“¡”a.');
                exit;
             end;
             if player[person].sp < 60 then begin
                SPnotEnough;
                exit;
             end;
             x1 := 0; y1 := 0;
             case face mod 4 of
                0 : y1 := 1;
                1 : y1 := -1;
                2 : x1 := 1;
                3 : x1 := -1;
             end;
             case position of
                town : k := 47;
                ground : k := 41;
                den : k := 43;
                keep : k := 43;
             end;
             player[person].sp := player[person].sp - 60;
             j := 0;
             if x1 = 0 then h := 5 else h := 4;
             repeat
                inc(j);
                if (Real_map(x+x1*j,y+y1*j) = 0) or
                ((position in [den,keep]) and (Real_map(x+x1*j,y+y1*j) = 52)) then begin
                   x1 := 0; y1 := 0;
                   Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·  a¤ó·i ¤ÀâÐs“¡”a.');
                   j := h+1;
                end
                else if (position = keep) and (Real_Map(x+x1,y+y1) >= 42) then begin
                   x1 := 0; y1 := 0;
                   j := h+1;
                end
                else if (position = town) and (Real_map(x+x1*j,y+y1*j) >= 48) then begin
                   x1 := 0; y1 := 0;
                   j := h+1;
                end
                else begin
                   Putmap(x+x1*j,y+y1*j,k);
                end;
             until j >= h;
             if j = h then Message(15,'»¡Ñw¥eÑÁµA ¬÷‰·Ð–¯s“¡”a.');
             Silent_Scroll;
          end;
   end;
   displaySP;
end;

Procedure Inventory;
var
   X_Pos, Y_Pos : integer;
begin
   SetColor(7);
   with party do begin
      Y_Pos := 30;
      X_Pos := 270;
      str(item[1],s);
      HPrintXY4Select(X_Pos,Y_Pos+0*15,'ÁAb ÒA¥¢´¢ : '+s);
      str(item[2],s);
      HPrintXY4Select(X_Pos,Y_Pos+1*15,' a¤ó ÒA¥¢´¢ : '+s);
      str(item[3],s);
      HPrintXY4Select(X_Pos,Y_Pos+2*15,'Ð•¢· ´¢Á¡ : '+s);
      str(item[4],s);
      HPrintXY4Select(X_Pos,Y_Pos+3*15,'·¯¢· ´¢Á¡ : '+s);
      str(item[5],s);
      HPrintXY4Select(X_Pos,Y_Pos+4*15,'¦ÑÉ· ´¢Á¡ : '+s);
      X_Pos := 430;
      str(item[6],s);
      HPrintXY4Select(X_Pos,Y_Pos+0*15,'­¡ÑÅ ¢…¬á : '+s);
      str(item[7],s);
      HPrintXY4Select(X_Pos,Y_Pos+1*15,'”Ñw Ñõ¦‰ : '+s);
      str(item[8],s);
      HPrintXY4Select(X_Pos,Y_Pos+2*15,'®¸÷ Š¯i : '+s);
      str(item[9],s);
      HPrintXY4Select(X_Pos,Y_Pos+3*15,'§¡Ð— ¦Ãa : '+s);
      str(item[10],s);
      HPrintXY4Select(X_Pos,Y_Pos+4*15,'·¡•· Š¯i : '+s);

      Y_Pos := 120;
      X_Pos := 270;
      str(crystal[1],s);
      HPrintXY4Select(X_Pos,Y_Pos+0*15,'ÑÁµq·ÇaŸ¡¯aÈi : '+s);
      str(crystal[2],s);
      HPrintXY4Select(X_Pos,Y_Pos+1*15,'ÐeÌa·ÇaŸ¡¯aÈi : '+s);
      str(crystal[3],s);
      HPrintXY4Select(X_Pos,Y_Pos+2*15,'”aÇa  ÇaŸ¡¯aÈi : '+s);
      str(crystal[4],s);
      HPrintXY4Select(X_Pos,Y_Pos+3*15,'µA¥¡“¡ÇaŸ¡¯aÈi : '+s);
      str(crystal[5],s);
      HPrintXY4Select(X_Pos,Y_Pos+4*15,'µwÑ¥·ÇaŸ¡¯aÈi : '+s);
      X_Pos := 430;
      str(crystal[6],s);
      HPrintXY4Select(X_Pos,Y_Pos+0*15,'­¡ÑÅ·ÇaŸ¡¯aÈi : '+s);
      str(crystal[7],s);
      HPrintXY4Select(X_Pos,Y_Pos+1*15,'µAá»¡ÇaŸ¡¯aÈi : '+s);
      str(crystal[8],s);
      HPrintXY4Select(X_Pos,Y_Pos+2*15,'Ça¡ Ë¢ÇaŸ¡¯aÈi : '+s);
      str(crystal[9],s);
      HPrintXY4Select(X_Pos,Y_Pos+3*15,'Ça Ÿ¡ ¯a Èi ¥© : '+s);

   end;
end;

Procedure ViewParty;

 Procedure ViewPartySub(i:integer);
 begin
    s := ' ˆa“w'; if party.etc[i] = 0 then s := ' ¦‰ˆa';
 end;

 Procedure AbilitySub(i:integer);
 begin
    s := ' ˆa“w'; if not getbit(i) then s := ' ¦‰ˆa';
 end;

var
   X_Pos, Y_Pos : integer;
   s1,s2,s3 : string[10];
begin
   setcolor(7);
   with party do begin
      X_Pos := 270;
      str(x,s); HPrintXY(X_Pos,45,'X Â‚ = '+s);
      str(y,s); HPrintXY(X_Pos,60,'Y Â‚ = '+s);
      str(food,s); HPrintXY(X_Pos,80,'q·e ¯¢œ· = '+s);
      str(gold,s); HPrintXY(X_Pos,95,'q·e Ñ×‹q = '+s);
      str(arrow,s); HPrintXY(X_Pos,115,'q·e ÑÁ¬i = '+s);
      X_Pos := 430;
      ViewPartySub(1);
      HPrintXY4Select(X_Pos,80,' a¤ó· Ñõ¦‰ :'+s);
      ViewPartySub(4);
      HPrintXY4Select(X_Pos,95,'‰·º— ¦¬w   :'+s);
      ViewPartySub(2);
      HPrintXY4Select(X_Pos,115,'¢‰¶áŸi ˆé·q :'+s);
      ViewPartySub(3);
      HPrintXY4Select(X_Pos,130,'“|¶áŸi ˆé·q :'+s);
      Y_Pos := 160;
      X_Pos := 270;
      AbilitySub(8);
      HPrintXY4Select(X_Pos,Y_Pos+0*15,'µ¡ Ça  ‹i :'+s);
      AbilitySub(10);
      HPrintXY4Select(X_Pos,Y_Pos+1*15,'Ëa ©  ‹i :'+s);
      AbilitySub(12);
      HPrintXY4Select(X_Pos,Y_Pos+2*15,'Å¡¥©Ëa ‹i :'+s);
      AbilitySub(14);
      HPrintXY4Select(X_Pos,Y_Pos+3*15,'—aœaÅ¥ ‹i :'+s);
      X_Pos := 430;
      AbilitySub(7);
      HPrintXY4Select(X_Pos,Y_Pos+0*15,'µ¡ Ça   i :'+s);
      AbilitySub(9);
      HPrintXY4Select(X_Pos,Y_Pos+1*15,'Ëa ©   i :'+s);
      AbilitySub(11);
      HPrintXY4Select(X_Pos,Y_Pos+2*15,'Å¡¥©Ëa  i :'+s);
      AbilitySub(13);
      HPrintXY4Select(X_Pos,Y_Pos+3*15,'—aœaÅ¥  i :'+s);
      X_Pos := 270;
      str(year,s1);
      str((day div 30)+1,s2);
      str((day mod 30)+1,s3);
      HPrintXY4Select(X_Pos,240,s1+' ‘e '+s2+' ¶© '+s3+' ·©');
      str(hour,s1);
      str(min,s2);
      HPrintXY4Select(X_Pos,255,s1+' ¯¡ '+s2+' ¦…');
   end;
end;

Procedure ViewCharacter;

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
    k := Select(106,j,j,clean,TRUE);
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

const
   X_Pos = 260;
begin
   Clear;
   hany := 30;
   print(15,'“wb·i ¥¡‰¡¯¼·e ·¥¢‰·i ¬åÈ‚Ða¯¡µ¡');
   i := ChooseWhom(FALSE);
   Clear;
   if i = 0 then Exit;
   with player[i] do begin
      setcolor(11);
      HPrintXY4Select(X_Pos,30,'# ·¡Ÿq : '+name);
      HPrintXY4Select(X_Pos,46,'# ¬÷¥i : '+ReturnSex(i));
      HPrintXY4Select(X_Pos,62,'# ‰‹s : '+ReturnClass(i));
      setcolor(3);
      str(strength,s);
      HPrintXY4Select(X_Pos+4,88,'ÁA  b : '+s);
      str(mentality,s);
      HPrintXY4Select(X_Pos+4,104,'¸÷¯¥b : '+s);
      str(concentration,s);
      HPrintXY4Select(X_Pos+4,120,'»³º—b : '+s);
      str(endurance,s);
      HPrintXY4Select(X_Pos+4,136,'·¥b : '+s);
      str(resistance,s);
      HPrintXY4Select(X_Pos+4,152,'¸áÐwb : '+s);
      str(agility,s);
      HPrintXY4Select(X_Pos+4,168,'£¥Àó¬÷ : '+s);
      str(accuracy,s);
      HPrintXY4Select(X_Pos+4,184,'¸÷ÑÂ¬÷ : '+s);
      str(luck,s);
      HPrintXY4Select(X_Pos+4,200,'Ð—¶…   : '+s);
      SetColor(2);
      j := X_Pos+150;
      if classtype = sword then begin
         str(sword_skill,s);
         HPrintXY4Select(j,88,'¥A“e ¢‹¡  ‹¡®‰Ã¡  : '+s);
         str(axe_skill,s);
         if class <> 7 then
            HPrintXY4Select(j,104,'¿¢“e ¢‹¡  ‹¡®‰Ã¡  : '+s)
         else
            HPrintXY4Select(j,104,'Ã¡ža  a¤ó  “wbÃ¡  : '+s);
         str(spear_skill,s);
         HPrintXY4Select(j,120,'¿¡Ÿa“e ¢‹¡ ‹¡®‰Ã¡ : '+s);
         str(bow_skill,s);
         HPrintXY4Select(j,136,'±¡“e ¢‹¡  ‹¡®‰Ã¡  : '+s);
         str(shield_skill,s);
         HPrintXY4Select(j,152,'¤wÌ ¬a¶w  ‹¡®‰Ã¡  : '+s);
         str(fist_skill,s);
         HPrintXY4Select(j,168,' …­¥ ¬a¶w  ‹¡®‰Ã¡  : '+s);
      end
      else if classtype = magic then begin
         str(attack_magic,s);
         HPrintXY4Select(j,88,'‰·‰b  a¤ó “wbÃ¡ : '+s);
         str(pheno_magic,s);
         HPrintXY4Select(j,104,'¥eÑÁ  a¤ó “wbÃ¡ : '+s);
         str(cure_magic,s);
         HPrintXY4Select(j,120,'Ã¡ža  a¤ó “wbÃ¡ : '+s);
         str(special_magic,s);
         HPrintXY4Select(j,136,'Ëb®  a¤ó “wbÃ¡ : '+s);
         str(esp_magic,s);
         HPrintXY4Select(j,152,'Á¡ ¸aµeb “wbÃ¡ : '+s);
         str(summon_magic,s);
         HPrintXY4Select(j,168,'­¡ÑÅ  a¤ó “wbÃ¡ : '+s);
      end;
      setcolor(3);
      str(experience,s);
      HPrintXY4Select(X_Pos+4,216,'## ‰wÐñÃ¡ : '+s);
      str(level,s);
      HPrintXY4Select(X_Pos+220,216,'## A¥I : '+s);
      setcolor(2);
      HPrintXY4Select(X_Pos+4,240,'¬a¶w ¢‹¡ - '+ReturnWeapon(player[i].weapon));
      if shield <> 0 then
         HPrintXY4Select(X_Pos+4,256,'¤wÌ - '+ReturnShield(shield));
      if armor <> 0 then
         HPrintXY4Select(X_Pos+190,256,'ˆsµµ - '+ReturnArmor(armor));
   end;
end;

Procedure QuickView;
const
   X_Pos = 270;
var
   color : integer;
begin
   color := GetColor;
   setcolor(15);
   HPrintXY(X_Pos+30,40,'·¡Ÿq');
   setcolor(12);
   HPrintXY(X_Pos+150,40,' º—•¢ ·¯¢¦‰¡w º‚·q');
   setcolor(7);
   for j:= 1 to 6 do
   with player[j] do
   if name <> '' then begin
      HPrintXY4Select(X_Pos,60+j*15,name);
      str(poison,s);
      HPrintXY4Select(X_Pos+174,60+j*15,s);
      str(unconscious : 3,s);
      HPrintXY4Select(X_Pos+214,60+j*15,s);
      str(dead : 5,s);
      HPrintXY4Select(X_Pos+250,60+j*15,s);
   end;
end;

Procedure CastSpell;
begin
   person := ChooseWhom(FALSE);
   if person = 0 then exit;
   if not exist(person) then begin
      ReturnSexData;
      Message(7,SexData+'“e  a¤ó·i ¬a¶wÐi®·¶“e ¬wÈˆa ´a“³“¡”a');
      exit;
   end;
   if (player[person].classtype = sword) and (player[person].class <> 7) then begin
      s := player[person].name+ReturnSJosa(player[person].name);
      Message(7,s+'  a¤ó·i ¬a¶wÐi ® ´ô“e ‰µi·³“¡”a.');
      exit;
   end;
   m[0] := '¬a¶wÐi  a¤ó· ¹·ŸA ===>';
   m[1] := 'Ã¡ža  a¤ó';
   m[2] := '¥eÑÁ  a¤ó';
   k := Select(80,2,2,TRUE,TRUE);
   case k of
      1 : CureSpell;
      2 : PhenominaSpell;
   end;
end;

Function ReturnPredict : integer;
var
   data : integer;
begin
   case party.etc[20] of
      0 : if not getbit(0) then data := 1 else data := 2;
   1..2 : data := 3;
      3 : case party.etc[21] of
             0 : if mapname <> 'Gaea' then data := 4 else data := 5;
             1 : data := 6;
             2 : data := 7;
             3 : if getbit(4) then data := 11
                 else if getbit(1) then data := 10
                 else if (mapname = 'Ground3') or (mapname = 'TrolTown') or
                         (mapname = 'Vesper') then data := 9
                 else data := 8;
          end;
   4..6 : if getbit(6) then data := 18
          else if mapname = 'Ground5' then data := 17
          else if getbit(5) then begin
             if mapname = 'Ground2' then data := 16 else data := 15;
          end else if mapname = 'Ground4' then data := 14
          else if mapname = 'Gaea' then data := 13
          else if (mapname = 'Ground2') or (mapname = 'Valiant') or
                  (mapname = 'OccTown') then data := 7
          else if party.etc[20] in [5] then data := 3
          else if party.etc[20] in [4] then data := 11
          else data := 12;
      7 : data := 19;
      8 : data := 20;
   end;
   if party.etc[25] = 1 then begin
      case party.etc[20] of
         9 : data := 19;
        10 : data := party.etc[26] + 21;
        11 : data := 11;
      end;
   end
   else if party.etc[25] = 2 then begin
      if party.year >= 795 then data := 30
      else if getbit(49) then data := 29
      else if getbit(48) then data := 28
      else if getbit(32) then data := 27
      else if mapname = 'UnderGrd' then data := 26
      else data := 25;
   end;
   ReturnPredict := data;
end;

Procedure Extrasense;

 Procedure ESPnotEnough;
 begin
    Message(7,' a¤ó »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
 end;

const
   Max_Predict_Data = 30;
   Predict_Data : array [1..Max_Predict_Data] of string =
                  ('¡Aá¯a ‰×¬e·i aˆi',
                   '¡—a´eµA‰A ¦‰aˆi',
                   '¡—a´e‰Á ‰­¢ ·¡´¡‹¡ Ði',
                   'ˆa·¡´aÉAœa¡ ˆi',
                   'ˆa·¡´a ÉAœa¬÷· ¬÷ºµA‰A ¦Èb·i ¤h·i',
                   'µ¡Ça  a·i·i ¸ñw Ði',
                   'ˆa·¡´a ÉAœa¬÷· ¬÷ºŸi ”a¯¡  ei',
                   '´aÏa¡—¡ÉA ÉAœa¡ ˆi',
                   '”ŸB· º—´wµA ·¶“e ¥A¯aÌá¬÷·i ¸ñw Ði',
                   '¥A¯aÌá¬÷ ¦‚•·½¢· Ëa©  a·i·i ¸ñw Ði',
                   '¡—a´eµA‰A •©´aˆi',
                   'ˆa·¡´a ÉAœa¡ ”a¯¡ ˆi',
                   'ˆa·¡´a ÉAœa¬÷ ¦‚½¢µA ·¶“e ‰A·¡ËaŸi É·Ð ·¡®á•¡ ÉAœa¡ ˆi',
                   '”ŸB §B•·½¢µA ·¶“e Å¡¥©Ëa  a·i·i ¸ñw Ði',
                   'ˆa·¡´a ÉAœa¡ •©´aˆi',
                   '¤Ÿ¡´åËa Ï¡Ïi»a· ¬÷ºŸi  ea ¶œa’¯a ÉAœa¡ ˆi',
                   '—aœaÅ¡“¡´e¬÷·i ¸ñw Ði',
                   '”ŸB· ¬á½¢µA ·¶“e ·±ÍAŸ¡´ñ  a·¡á¬÷µA¬á µA·¥­eËa ·¡§i·i  ei',
                   '”a¯¡ ¡—a´e·i  ei',
                   '¤Ÿ¡´åËa Ï¡Ïi»a· ¤eœe·i »¥´sÐaa ˆi',
                   'ˆa·¡´a ÉAœaµA ·¶“e µ¡Ça· ¶¥Ñ¥·i ¥··¥ Ði',
                   '´aÏa¡—¡ÉA ÉAœaµA ·¶“e Ëa©· ¶¥Ñ¥·i ¥··¥ Ði',
                   '·¡®á•¡ ÉAœaµA ·¶“e Å¡¥©Ëa· ¶¥Ñ¥·i ¥··¥ Ði',
                   '¡´á ”ŸBµA ·¶“e —aœaÅ¡“¡´e· ¶¥Ñ¥·i ¥··¥ Ði',
                   'Ða•A¯a ‰A·¡ËaŸi É·Ð¬á Ða•A¯a ÉAœa¡ ˆi',
                   'Ê¯¡Ÿi É·Ð¬á ´á˜å ¸w­¡Ÿi ¤i‰e Ði',
                   'µA·¥­eËa ·¡§i· •¡¶‘·i ¤h·e–á ”a¯¡ ¡´á ”ŸB·a¡ aˆi',
                   'ÑA´á¹v”å •·žaŸi  ei',
                   '¡´á¬÷· Š—¬a—i‰Á ‰i¸å·i ¤é·©',
                   '¡´á¬÷µA¬á ¡—a´e‰Á ÂAÒ· ‰i¸å·i ¤é·©');

var
   i,j,k : integer;
label
   Exit_For;
begin
   Clear;
   person := ChooseWhom(FALSE);
   if person = 0 then exit;
   ReturnSexData;
   if not exist(person) then begin
      Message(7,SexData+'“e Á¡ˆqˆb·i ¬a¶wÐi®·¶“e ¬wÈˆa ´a“³“¡”a');
      exit;
   end;
   if player[person].classtype = sword then begin
      Print(7,SexData+'µA‰A“e Á¡ˆqˆb· “wb·¡ ´ô¯s“¡”a.');
      exit;
   end;
   m[0] := '¬a¶wÐi Á¡ˆqˆb· ¹·ŸA ===>';
   for j := 1 to 5 do m[j] := ReturnMagic(5,j);
   k := Select(74,5,5,TRUE,TRUE);
   if k = 5 then begin
      Message(7,ReturnMagic(5,5)+'·e ¸åÊµA¬á e ¬a¶w–S“¡”a.');
      exit;
   end;
   case k of
      1 : begin
             if Map_Header.handicap then
             if (Map_Header.handicap_bit and BIT5) > 0 then begin
                Print(13,' ”w¯¥·e ’Š…ˆaµA‰A Ê¯¡Ÿi ¤wÐ ¤h‰¡ ·¶”a.');
                exit;
             end;
             if player[person].esp_magic < 70 then begin
                Print(7,SexData+'“e Ê¯¡Ÿi ¯¡•¡Ð ¥¡´v»¡ e ´a»¢·e µb¦¹¢·¡´ö”a.');
                exit;
             end;
             if player[person].sp < 10 then begin
                ESPnotEnough;
                exit;
             end;
             move(font^[0],font^[55],296);
             for i := 5 to 296 do font^[0,i] := 0;
             if position in [den,keep] then begin
                move(font^[52],chara^[55],296);
                for i := 5 to 296 do font^[52,i] := 0;
             end;
             if position in [ground] then begin
                move(font^[20],chara^[55],296);
                for i := 5 to 296 do font^[20,i] := 0;
             end;
             Silent_Scroll;
             Print(15,'·©Ð—·e º¶áŸi Ê¯¡Ða‰¡ ·¶”a.');
             PressAnyKey;
             move(font^[55],font^[0],296);
             if position in [den,keep] then move(chara^[55],font^[52],296);
             if position in [ground] then move(chara^[55],font^[20],296);
             Silent_Scroll;
             player[person].sp := player[person].sp - 10;
          end;
      2 : begin
             if player[person].esp_magic < 10 then begin
                Print(7,SexData+'“e µ´å·i ¯¡•¡Ð ¥¡´v»¡ e ´a»¢·e µb¦¹¢·¡´ö”a.');
                exit;
             end;
             if player[person].sp < 5 then begin
                ESPnotEnough;
                exit;
             end;
             Print(7,' ”w¯¥·e ”w¯¥· £¡œŸi µ´åÐe”a ...');
             Print(7,'');
             k := ReturnPredict;
             if k in [1..Max_Predict_Data] then
                s := '”w¯¥·e ' + Predict_Data[k] + ' ˆõ·¡”a'
             else
                s := '”w¯¥·e ´á˜å Ó±µA ·Ð µ´å·i ¤wÐ ¤h‰¡ ·¶”a';
             cPrint(10,15,' # ',s,'');
             player[person].sp := player[person].sp - 5;
          end;
      3 : begin
             if player[person].esp_magic < 40 then begin
                Print(7,SexData+'“e •¢¯±·i ¯¡•¡Ð ¥¡´v»¡ e ´a»¢·e µb¦¹¢·¡´ö”a.');
                exit;
             end;
             if player[person].sp < 20 then begin
                ESPnotEnough;
                exit;
             end;
             Message(15,'”w¯¥·e ¸q¯¡•·´e ”aŸe ¬aœq·  a·q·i ·ª·i® ·¶”a.');
             party.etc[5] := 3;
          end;
      4 : begin
             if player[person].esp_magic < 55 then begin
                Print(7,SexData+'“e ÀåŸ¡´e·i ¯¡•¡Ð ¥¡´v»¡ e ´a»¢·e µb¦¹¢·¡´ö”a.');
                exit;
             end;
             if player[person].sp < player[person].level * 5 then begin
                ESPnotEnough;
                exit;
             end;
             player[person].sp := player[person].sp - player[person].level * 5;
             x1 := 0; y1 := 0;
             case face mod 4 of
                0 : y1 := 1;
                1 : y1 := -1;
                2 : x1 := 1;
                3 : x1 := -1;
             end;
             Map_Header.startX := x; Map_Header.startY := y;
             Aux := SoundOn;
             SoundOn := FALSE;
             hany := 30;
             print(15,'ÀåŸ¡´e· ¬a¶wº— ...');
             setcolor(14);
             HPrintXY4Select(250,184,'´a¢Ç¡a ’Ÿa¯¡µ¡ ...');
             for i := 1 to player[person].level do begin
                x := x + x1; y := y + y1;
                if (x<5) or (x>=Map_Header.xmax-3) or (y<5) or (y>=Map_Header.ymax-3) then begin
                   x := x - x1; y := y - y1;
                end
                else begin
                   Scroll(FALSE);
                   c := readkey;
                   if c = #0 then c := readkey;
                   if c = #27 then goto Exit_For;
                end;
             end;
Exit_For:
             Clear;
             x := Map_Header.startX; y := Map_Header.startY;
             SoundOn := Aux;
             Scroll(TRUE);
          end;
   end;
   DisplaySP;
end;

Procedure Rest;
var
   long : longint;
   ok : boolean;
begin
   Clear;
   Print(11,'·©Ð—·¡ µa‹¡¬á ®é ¯¡ˆe·i »¡¸÷ Ða¯³¯¡µ¡.');
   setcolor(15);
   HGotoXY(266,70);
   HPrint('## ');
   setcolor(10);
   str(Rest_Time : 2,s);
   HPrint(s);
   setcolor(15);
   HPrint(' ¯¡ˆe •·´e');
   setcolor(10);
   ok := FALSE;
   repeat
      j := 0;
      c := readkey;
      if c in [#13,#27] then ok := TRUE;
      if c = #0 then begin
         c := readkey;
         case c of
            #75,#80 : j := -1;
            #72,#77 : j := 1;
         end;
         if j <> 0 then begin
            Rest_Time := Rest_Time + j;
            if (Rest_Time<1) or (Rest_Time>24) then Rest_Time := Rest_Time - j
            else begin
               str(Rest_Time : 2,s);
               setfillstyle(1,8);
               bar(290,70,305,86);
               HPrintXY(290,70,s);
            end;
         end;
      end;
   until ok;
   Clear;
   if c = #27 then exit;

   for person := 1 to 6 do
   with player[person] do
   if name <> '' then begin
      if sex = male then s := '‹a·' else s := '‹a‘a·';
      if party.food <= 0 then Print(4,'·©Ð—·e ¯¢œ··¡ ¤a”bv”a')
      else if dead > 0 then Print(7,name+ReturnSJosa(name)+' º‚´ö”a')
      else if (unconscious>0) and (poison=0) then begin
         unconscious := unconscious - level*(Rest_Time div 2);
         if unconscious <= 0 then begin
            Print(15,name+ReturnSJosa(name)+' ·¯¢·¡ ÒA¥¢–A´ö”a');
            unconscious := 0;
            if hp <= 0 then hp := 1;
            dec(party.food);
         end
         else Print(15,name+ReturnSJosa(name)+' µa¸åÓ¡ ·¯¢ ¦‰¡w·¡”a');
      end
      else if (unconscious>0) and (poison>0) then
         Print(7,'•¢˜¢…µA, '+name+' '+s+' ·¯¢·e ÒA¥¢–A»¡ ´g´v”a')
      else if poison > 0 then
         Print(7,'•¢˜¢…µA, '+name+' '+s+' ˆåˆw·e ÒA¥¢–A»¡ ´g´v”a')
      else begin
         i := level * Rest_Time;
         if hp >= (endurance * level * 10) then if party.food < 255 then inc(party.food);
         hp := hp + i;
         if hp >= (endurance * level * 10) then begin
            hp := endurance * level * 10;
            Print(15,name+ReturnSJosa(name)+' ¡¡—e ˆåˆw·¡ ÒA¥¢–A´ö”a');
         end
         else Print(15,name+ReturnSJosa(name)+' Ã¡ža–A´ö”a');
         dec(party.food);
      end;
   end;
   if party.etc[1] > 0 then begin
      i := Rest_Time div 3 + 1;
      if party.etc[1] >= i then party.etc[1] := party.etc[1] - i
      else party.etc[1] := 0;
   end;
   for i := 2 to 4 do party.etc[i] := 0;
   for i := 1 to 6 do
   with player[i] do
   if exist(i) then begin
      if classtype = magic then sp := mentality * level * 10
      else if (classtype = sword) and (class = 7) then sp := mentality * level * 5
      else sp := 0;
   end;

   Print(7,'');
   for k := 1 to 6 do
   if exist(k) then begin
      long := player[k].potential_experience;
      j := 0;
      repeat
         inc(j);
      until (long < ReturnEXP(j)) or (j > 40);
      dec(j);
      if (player[k].level < j) or (j = 40) then begin
         if (j < 40) or (player[k].level <> 40) then begin
            str(j,s);
            Print(11,player[k].name+'· A¥I·e '+s+' ·³“¡”a');
            player[k].level := j;
         end;
      end;
   end;

   SimpleDisCond;
   PlusTime(Rest_Time,0,0);

   if Time_Watch then begin
      with party do
      if ((year > watch_year) or
          ((year = watch_year) and (day > watch_day)) or
          ((year = watch_year) and (day = watch_day) and (hour > watch_hour)) or
          ((year = watch_year) and (day = watch_day) and (hour = watch_hour) and (min >= watch_min))) then begin
             year := watch_year;
             day := watch_day;
             hour := watch_hour;
             min := watch_min;
             sec := watch_sec;
      end;
   end;

end;

Procedure SetBackPack;
type
   position_type = (disarm,equip);
var
   data_ptr,absolute_ep,equip_ptr,disarm_ptr : byte;
   data : array[1..60,1..2] of byte;
   enable_disarm,enable_equip : boolean;
   select_position : position_type;
   i,j,k : integer;

 procedure pr(pos : position_type; line : byte; s_data : string);
 begin
    case pos of
       disarm : OutHPrintXY(288,(line-1)*32+96,s_data,FALSE);
       equip  : OutHPrintXY(424,(line-1)*16+80,s_data,FALSE);
    end;
 end;

 function init_data : boolean;
 var
    i,j : integer;
 begin
    data_ptr := 0;
    for j := 1 to 6 do
    for i := 1 to 10 do
    if party.BackPack[j,i] > 0 then begin
       inc(data_ptr);
       data[data_ptr,1] := j;
       data[data_ptr,2] := i;
    end;
    init_data := (data_ptr > 0);
 end;

 function ReturnEquipment(no : byte) : string;
 var
    i,j,k : byte;
    s : string[21];
 begin
    j := data[no,1];
    i := data[no,2];
    k := party.BackPack[j,i];
    if k > 0 then begin
       str(k : 3,s);
       s := ' '+s+' ';
       case j of
       1..4 : s := s + ReturnWeapon((j-1)*7+i);
          5 : s := s + ReturnShield(i);
          6 : s := s + ReturnArmor(i);
       end;
       ReturnEquipment := s;
    end else ReturnEquipment := '';
 end;

 procedure cursorsub(x,y,len,thick : word);
 var
    dest_off, gap : word;
 begin
    dest_off := 80 * (y-1) * 16 + x-1;
    thick := thick * 16;
    gap := 80 - len;
    asm
       push es
       mov ax, $A000
       mov es, ax
       mov di, dest_off
       mov dx, $3C4
       mov ax, $0702
       out dx, ax
       mov cx, thick
    @for_j:
       push cx
       mov cx, len
    @for_i:
       mov al, es:[di]
       xor al, $FF
       stosb
       loop @for_i
       add di,gap
       pop cx
       loop @for_j
       pop es
    end;
 end;

 procedure cursor;
 begin
    case select_position of
       disarm : cursorsub(36,(disarm_ptr-1) * 2 + 7, 16, 1);
       equip  : cursorsub(55,equip_ptr + 5, 18, 1);
    end;
 end;

 procedure display_disarm;
  procedure clearsub(line : byte);
  begin
     Bar(280,(line-1)*32 + 96,415,(line-1)*32+96+15);
  end;
 begin
    clearsub(1);
    pr(disarm,1,ReturnWeapon(player[person].weapon));
    clearsub(2);
    pr(disarm,2,ReturnShield(player[person].shield));
    clearsub(3);
    pr(disarm,3,ReturnArmor(player[person].armor));
    with player[person] do
       enable_disarm := (weapon > 0) or (shield > 0) or (armor > 0);
 end;

 procedure display_equip;
  procedure clearsub(line : byte);
  begin
     Bar(424,(line-1)*16+80,583,(line-1)*16+80+15);
  end;
 var
    i : byte;
 begin
{    while (data_ptr > 0) and (data_ptr > absolute_ep + equip_ptr) do begin
       if equip_ptr > 1 then dec(equip_ptr)
       else dec(absolute_ep);
    end;}
    if (data_ptr > 0) and (equip_ptr = 0) then equip_ptr := 1;
    if data_ptr = 0 then begin
       select_position := disarm;
       enable_equip := FALSE;
       Bar(424,80,583,271);
       exit;
    end;
    i := 0;
    repeat
       inc(i);
       clearsub(i);
       if (i + absolute_ep <= data_ptr) then begin
          pr(equip,i,ReturnEquipment(i+absolute_ep));
       end;
       if (select_position = equip) and (i = equip_ptr) then cursorsub(55,i+5,18,1);
    until (i = 12);
 end;

begin
   Clear;
   person := ChooseWhom(FALSE);
   if person = 0 then exit;
   with player[person] do enable_disarm := (weapon > 0) or (shield > 0) or (armor > 0);
   enable_equip := init_data;
   if (not enable_disarm) and (not enable_equip) then begin
      Print(7,player[person].name+ReturnSJosa(player[person].name)+' ˆa»¥ ˆõ·¡ ´a¢ ˆõ•¡ ´ô”a.');
      exit;
   end;
   if enable_disarm then select_position := disarm else select_position := equip;
   SetColor(LightGreen);
   OutHPrintXY(272,32,chr(1)+' ¬åÈ‚ : ',FALSE);
   SetColor(Green);
   OutHPrintXY(344,32,player[person].name,FALSE);
   SetColor(Yellow);
   OutHPrintXY(272,55,'<E>     <D>     <Enter>     <Esc>    ',FALSE);
   Setcolor(Brown);
   OutHPrintXY(272,55,'   ¸wÀb    Ð¹A        ¬åÈ‚      ¹·ža',FALSE);
   SetFillStyle(SolidFill,Black);
   SetColor(White);
   Bar(272,80,415,175);
   moveto(272,176); lineto(416,176); lineto(416,80);
   OutHPrintXY(272,80,'¢‹¡',FALSE);
   OutHPrintXY(272,112,'¤wÌ',FALSE);
   OutHPrintXY(272,144,'ˆsµµ',FALSE);
   Bar(424,80,583,271);
   moveto(424,272); lineto(584,272); lineto(584,80);
   SetColor(LightGray);
   absolute_ep := 0;
   equip_ptr := 1;
   disarm_ptr := 1;
   display_disarm;
   display_equip;
   if select_position = equip then cursor;
   repeat
      cursor;
      case select_position of
         disarm:
         repeat
            c := readkey;
            if c = #0 then c := readkey;
            case c of
               #72:
               begin
                  cursor;
                  if disarm_ptr > 1 then dec(disarm_ptr) else disarm_ptr := 3;
                  cursor;
               end;
               #80:
               begin
                  cursor;
                  if disarm_ptr < 3 then inc(disarm_ptr) else disarm_ptr := 1;
                  cursor;
               end;
               #13:
               begin
                  ok := FALSE;
                  case disarm_ptr of
                     1 :
                     if player[person].weapon > 0 then begin
                        ok := TRUE;
                        j := (player[person].weapon - 1) div 7 + 1;
                        i := player[person].weapon - (j-1) * 7;
                        if party.BackPack[j,i] < 255 then inc(Party.BackPack[j,i]);
                        player[person].weapon := 0;
                     end;
                     2 :
                     if player[person].shield > 0 then begin
                        ok := TRUE;
                        if party.BackPack[5,player[person].shield] < 255 then
                           inc(party.BackPack[5,player[person].shield]);
                        player[person].shield := 0;
                     end;
                     3 :
                     if player[person].armor > 0 then begin
                        ok := TRUE;
                        if party.BackPack[6,player[person].armor] < 255 then
                           inc(party.BackPack[6,player[person].armor]);
                        player[person].armor := 0;
                     end;
                  end;
                  if ok then begin
                     enable_equip := init_data;
                     display_disarm;
                     display_equip;
                     cursor;
                  end;
               end;
               'E','e':
               if enable_equip then begin
                  cursor;
                  select_position := equip;
               end else c := #255;
            end;
         until c in ['E','e',#27];
         equip:
         repeat
            c := readkey;
            if c = #0 then c := readkey;
            case c of
               #72:
               if absolute_ep + equip_ptr > 1 then begin
                  if equip_ptr <= 1 then begin
                     dec(absolute_ep);
                     display_equip;
                  end
                  else begin
                     cursor;
                     dec(equip_ptr);
                     cursor;
                  end;
               end;
               #80:
               if absolute_ep + equip_ptr < data_ptr then begin
                  if equip_ptr >= 12 then begin
                     inc(absolute_ep);
                     display_equip;
                  end
                  else begin
                     cursor;
                     inc(equip_ptr);
                     cursor;
                  end;
               end;
               #13:
               begin
                  j := data[absolute_ep + equip_ptr,1];
                  i := data[absolute_ep + equip_ptr,2];
                  ok := FALSE;
                  case j of
                     1..4:
                     if player[person].weapon = 0 then begin
                        if Verify_Weapon(person,(j-1) * 7 + i) then begin
                           ok := TRUE;
                           player[person].weapon := (j-1) * 7 + i;
                        end;
                     end;
                     5:
                     if player[person].shield = 0 then begin
                        if Verify_Shield(person,i) then begin
                           ok := TRUE;
                           player[person].shield := i;
                        end;
                     end;
                     6:
                     if player[person].armor = 0 then begin
                        if Verify_Armor(person,i) then begin
                           ok := TRUE;
                           player[person].armor := i;
                        end;
                     end;
                  end;
                  if ok then begin
                     dec(party.BackPack[j,i]);
                     if party.BackPack[j,i] = 0 then begin
                        enable_equip := init_data;
                        if absolute_ep + equip_ptr > data_ptr then begin
                           if absolute_ep + equip_ptr > 0 then dec(equip_ptr)
                        end else cursor;
                        display_equip;
                     end else begin
                        Bar(424,(equip_ptr-1)*16+80,583,(equip_ptr-1)*16+80+15);
                        pr(equip,equip_ptr,ReturnEquipment(absolute_ep+equip_ptr));
                        cursor;
                     end;
                     display_disarm;
                  end
                  else begin
                     sound(200);
                     delay(30);
                     nosound;
                  end;
                  if not enable_equip then begin
                     select_position := disarm;
                     c := 'D';
                  end;
               end;
               'D','d':
               if enable_disarm then begin
                  cursor;
                  select_position := disarm;
               end else c := #255;
            end;
         until c in ['D','d',#27];
      end;
   until c in [#27];
   SetFillStyle(SolidFill,DArkGray);
   Clear;
end;

Procedure Use_Item(select_num : byte);

 Procedure Use_1;
 begin
    with player[person] do begin
       hp := hp + 1000;
       if hp > endurance * level * 10 then begin
          Print(15,' '+name+ReturnSJosa(name)+' ¡¡—e ˆåˆw·¡ ÒA¥¢ –A´ö¯s“¡”a.');
          hp := endurance * level * 10;
       end
       else Print(15,' '+name+ReturnSJosa(name)+' ˆåˆw·¡ ÒA¥¢ –A´ö¯s“¡”a.');
    end;
    Display_Condition;
 end;

 Procedure Use_2;
 begin
    if (player[person].classtype <> magic) and (player[person].class <> 7) then begin
       Print(7,' '+player[person].name+ReturnSJosa(player[person].name)+'  a¤ó¬a ‰µi·¡ ´a“³“¡”a.');
       exit;
    end;
    with player[person] do begin
       if classtype = magic then begin
          sp := sp + 1000;
          if sp > mentality * level * 10 then begin
             Print(15,' '+name+ReturnSJosa(name)+' ¡¡—e  a¤ó »¡®ˆa ÒA¥¢ –A´ö¯s“¡”a.');
             sp := mentality * level * 10;
          end
          else Print(15,' '+name+ReturnSJosa(name)+'  a¤ó »¡®ˆa ÒA¥¢ –A´ö¯s“¡”a.');
       end
       else begin
          sp := sp + 1000;
          if sp > mentality * level * 5 then begin
             Print(15,' '+name+ReturnSJosa(name)+' ¡¡—e  a¤ó »¡®ˆa ÒA¥¢ –A´ö¯s“¡”a.');
             sp := mentality * level * 5;
          end
          else Print(15,' '+name+ReturnSJosa(name)+'  a¤ó »¡®ˆa ÒA¥¢ –A´ö¯s“¡”a.');
       end;
    end;
    Display_Condition;
 end;

 Procedure Use_3;
 begin
    with player[person] do begin
       if poison = 0 then begin
          Print(7,' '+name+ReturnSJosa(name)+' º—•¢ –A»¡ ´g´v¯s“¡”a.');
          exit;
       end;
       poison := 0;
       Print(15,' '+name+ReturnSJosa(name)+' Ð•¢ –A´ö¯s“¡”a.');
    end;
    Display_Condition;
 end;

 Procedure Use_4;
 begin
    k := ChooseWhom(FALSE);
    if k = 0 then exit;
    with player[k] do begin
       if unconscious = 0 then begin
          Print(7,' '+name+ReturnSJosa(name)+' ·¯¢·¡ ·¶¯s“¡”a.');
          exit;
       end;
       unconscious := 0;
       if dead = 0 then begin
          Print(15,' '+name+ReturnSJosa(name)+' ·¯¢·i Àav¯s“¡”a.');
          if hp <= 0 then hp := 1;
       end else
          Print(7,' '+name+ReturnSJosa(name)+' ·¡£¡ º‚·e ¬wÈ ·³“¡”a.');
    end;
    Display_Condition;
 end;

 Procedure Use_5;
 begin
    k := ChooseWhom(FALSE);
    if k = 0 then exit;
    with player[k] do begin
       if dead = 0 then begin
          Print(7,' '+name+ReturnSJosa(name)+' º‚»¡ ´g´v¯s“¡”a.');
          exit;
       end;
       if dead < 10000 then begin
          dead := 0;
          if unconscious >= endurance * level then unconscious := endurance * level - 1;
          Print(15,' '+name+ReturnSJosa(name)+' ”a¯¡ ¬i´av¯s“¡”a.');
       end else begin
          Print(7,' '+name+'· º‚·q·e ·¡ ´¢Á¡¡“e ¬iŸ¡»¡ ¡µÐs“¡”a.');
       end;
    end;
    Display_Condition;
 end;

 Procedure Use_6;

  function r(seed : byte) : integer;
  begin
     r := random(seed*2+1)-seed;
  end;

 var
    i,j,ability : word;
 begin
    ability := 0; j := 0;
    for i := 1 to 5 do begin
       if exist(i) then begin
          j := j + 1;
          ability := ability + player[i].level;
       end;
    end;
    ability := round(ability * 5 / j);
    with player[6] do begin
       case random(8) of
          0 : begin
                 name := '¤…”á¯aÃ¡';
                 endurance := 15+r(5);
                 resistance := 8+r(5);
                 accuracy := 12+r(5);
                 weapon := 33;
                 wea_power := ability * 3;
                 potential_ac := 3;
                 ac := 3;
              end;
          1 : begin
                 name := 'ÄŸ¡µ¥ Ça©œá';
                 endurance := 20+r(5);
                 resistance := 14+r(5);
                 accuracy := 13+r(5);
                 weapon := 34;
                 wea_power := ability * 1;
                 potential_ac := 3;
                 ac := 3;
              end;
          2 : begin
                 name := 'ÅEÈa¶ž¯a';
                 endurance := 17+r(5);
                 resistance := 12+r(5);
                 accuracy := 18+r(2);
                 weapon := 35;
                 wea_power := round(ability * 1.5);
                 potential_ac := 2;
                 ac := 2;
              end;
          3 : begin
                 name := '•A¡¡‰¡Ÿa‰¥';
                 endurance := 18+r(5);
                 resistance := 5+r(5);
                 accuracy := 17+r(3);
                 weapon := 36;
                 wea_power := ability * 4;
                 potential_ac := 4;
                 ac := 4;
              end;
          4 : begin
                 name := '—IœaÐe';
                 endurance := 10+r(5);
                 resistance := 20;
                 accuracy := 17;
                 weapon := 16;
                 wea_power := ability * 1;
                 potential_ac := 3;
                 ac := 3;
              end;
          5 : begin
                 name := 'µAË¥';
                 endurance := 10+r(5);
                 resistance := 10;
                 accuracy := 10+r(9);
                 weapon := 8;
                 wea_power := round(ability * 0.8);
                 potential_ac := 1;
                 ac := 1;
              end;
          6 : begin
                 name := 'ÑIÐa¶…—a';
                 endurance := 14+r(5);
                 resistance := 9+r(5);
                 accuracy := 11+r(5);
                 weapon := 33;
                 wea_power := ability * 3;
                 potential_ac := 2;
                 ac := 2;
              end;
          7 : begin
                 name := '£¡‘¡Èa¶ž¯a';
                 endurance := 13+r(5);
                 resistance := 11+r(5);
                 accuracy := 14+r(5);
                 weapon := 9;
                 wea_power := ability * 3;
                 potential_ac := 2;
                 ac := 2;
              end;
       end;
       sex := neutral;
       class := 0;
       classtype := unknown;
       strength := 10+r(5);
       level := ability div 5;
       strength := 10+r(5);
       mentality := 10+r(5);
       concentration := 10+r(5);
       agility := 0;
       luck := 10+r(5);
       poison := 0;
       unconscious := 0;
       dead := 0;
       hp := endurance * level * 10;
       sp := 0;
       experience := 0;
       potential_experience := 0;
       shield := 0;
       shi_power := 0;
       armor := 0;
       sword_skill := 0;
       axe_skill := 0;
       spear_skill := 0;
       bow_skill := 0;
       shield_skill := 0;
       fist_skill := 0;
       Display_Condition;
    end;
    Print(15,player[6].name+ReturnSJosa(player[6].name)+' ”aŸe Àa¶¥·a¡ ¦Èá ­¡ÑÅ –A´á¹v¯s“¡”a.');
 end;

 Procedure Use_7;
 begin
    if party.etc[1] + 10 > 255 then party.etc[1] := 255
    else party.etc[1] := party.etc[1] + 10;
    Print(15,' ·©Ð—·e ”Ñw Ñõ¦‰·i Åv¯s“¡”a.');
    Silent_Scroll;
 end;

 Procedure Use_8;
 begin
    Wizard_Eye;
 end;

 Procedure Use_9;
 begin
    party.etc[2] := 255;
    party.etc[3] := 255;
    party.etc[4] := 255;
    Print(15,' ·©Ð—·e ¡¡– §¡Ð— ¦ÃaŸi ¯¥´ö¯s“¡”a.');
 end;

 Procedure Use_10;
 begin
    Teleport;
 end;

var
   _select : integer;
   remember : string;
begin
   m[0] := '¬a¶wÐi ¢‰Î‘·i ‰¡Ÿa¯¡µ¡.';
   m[1] := 'ÁAb ÒA¥¢´¢';
   m[2] := ' a¤ó ÒA¥¢´¢';
   m[3] := 'Ð•¢· ´¢Á¡';
   m[4] := '·¯¢· ´¢Á¡';
   m[5] := '¦ÑÉ· ´¢Á¡';
   m[6] := '­¡ÑÅ ¢…¬á';
   m[7] := '”Ñw Ñõ¦‰';
   m[8] := '®¸÷ Š¯i';
   m[9] := '§¡Ð— ¦Ãa';
   m[10] := '·¡•· Š¯i';
   _select := Select(70,select_num,select_num,TRUE,TRUE);
   if _select = 0 then exit;
   remember := m[_select];
   if party.item[_select] = 0 then begin
      if _select in [1,2,7,8,10] then s := '·¡' else s := 'ˆa';
      Print(7,' Ða»¡ e '+remember+s+' ´ô¯s“¡”a.');
      PressAnyKey;
      exit;
   end;
   dec(party.item[_select]);
   case _select of
      1 : Use_1;
      2 : Use_2;
      3 : Use_3;
      4 : Use_4;
      5 : Use_5;
      6 : Use_6;
      7 : Use_7;
      8 : Use_8;
      9 : Use_9;
      10: Use_10;
   end;
   if _select <> 8 then begin
      str(party.item[_select],s);
      SetColor(3);
      HPrintXY4Select(hwinx1,256,' '+remember+ReturnSJosa(remember)+' ·¡¹A '+s+'ˆ q´v¯s“¡”a.');
      if party.etc[6] = 1 then PressAnyKey;
   end;
end;

Procedure Use_Crystal;
var
   i,j : integer;
begin
   j := 0;
   for i := 6 to 9 do
   if party.crystal[i] > 0 then begin
      inc(j);
      m[j] := ReturnMagic(7,i);
   end;
   if j = 0 then exit;
   Clear;
   m[0] := '';
   Print(12,'ÇaŸ¡¯aÈi·i ¬a¶w ----');
   Print(7,'');
   Print(11,'”w¯¥·¡ ¬a¶wÐi ÇaŸ¡¯aÈi·i ‰¡Ÿa¯¡µ¡.');
   k := Select(130,j,j,FALSE,TRUE);
   if k = 0 then exit;
   i := 5;
   j := 0;
   repeat
      inc(i);
      if party.crystal[i] > 0 then inc(j);
   until (j = k);
   case i of
      6 : with player[6] do begin
             case random(5) of
              0,1 : begin
                       name := 'ÇaŸ¡¯aÈi —aœ‰¥';
                       classtype := dragon;
                       strength := 25;
                       mentality := 20;
                       concentration := 20;
                       endurance := 30;
                       resistance := 20;
                       agility := 0;
                       accuracy := 20;
                       luck := 20;
                       weapon := 49;
                       wea_power := 255;
                       potential_ac := 4;
                    end;
              2,3 : begin
                       name := 'ÇaŸ¡¯aÈi ‰¡Q';
                       classtype := golem;
                       strength := 20;
                       mentality := 0;
                       concentration := 0;
                       endurance := 40;
                       resistance := 25;
                       agility := 0;
                       accuracy := 13;
                       luck := 0;
                       weapon := 0;
                       wea_power := 150;
                       potential_ac := 5;
                    end;
                4 : begin
                       name := '”Àå¬a¸w';
                       classtype := magic;
                       strength := 20;
                       mentality := 20;
                       concentration := 20;
                       endurance := 30;
                       resistance := 19;
                       agility := 20;
                       accuracy := 20;
                       luck := 20;
                       weapon := 44;
                       wea_power := 200;
                       potential_ac := 5;
                    end;
             end;
             sex := neutral;
             class := 0;
             level := 30;
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             ac := potential_ac;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
             dec(party.crystal[6]);
          end;
      7 : begin
             for i := 1 to 6 do begin
                if player[i].name <> '' then begin
                   if player[i].dead = 0 then begin
                      player[i].unconscious := 0;
                      player[i].hp := player[i].endurance * player[i].level * 10;
                   end else begin
                      player[i].dead := 0;
                      player[i].unconscious := 0;
                      player[i].hp := 1;
                   end;
                end;
             end;
             Print(7,' µAá»¡ ÇaŸ¡¯aÈi·e ˆwÐe µAá»¡Ÿi  ¶Ÿ¡ ”¶¥');
             Print(7,'—i· ¡±­¢·a¡  ¤wÂ‰Ðaµv‰¡  ‹a µAá»¡Ÿi ÂáÐe');
             Print(7,'”¶¥—i·e ¡¡– ¶¥œ· ‹¡¶…·i –AÀx´v”a.');
             Display_Condition;
             PressAnyKey;
             dec(party.crystal[7]);
          end;
      8 :
      begin
         if (mapname = 'UnderGrd') and (x = 46) and (y = 48) then begin
            Clear;
            Print(7,' ˆs¸a‹¡ ”w¯¥· ¶á½¢µA¬á ŠáµA ·¢·e ·q¬÷·¡ —i');
            Print(7,'aµÖ”a.  ‹a ¡¢­¡Ÿ¡· º·¥‰··e µA·¥­eËa ·¡§i');
            Print(7,'·¡´ö”a.');
            PressAnyKey;
            Print(9,' µb¯¡  ”w¯¥·e ¹Aˆa ¬—ˆbÐ–”å”¡ ¸÷ i Ò‰ŸWÐa');
            Print(9,'¯³“¡”a.  ”w¯¥·¡ Àx·e ·¡‰µ·¡œa¡e ´a a ¥AŸ¡´å');
            Print(9,'Ëa Ï¡Ïi»a· ¬aœq—i·¡ ®‘‹¡µA“e Â—¦…Ði ˆõ·³“¡');
            Print(9,'”a.  ¸qŒe e ‹¡”aa º¯³¯¡µ¡.  ¸á· µqb·a¡');
            Print(9,'•¡¯¡Ÿi ˆå¬éÐ ¥¡‰V¯s“¡”a.');
            PressanyKey;
            mapname := 'Dome';
            Load;
            for j := 1 to Map_Header.ymax do
            for i := 1 to Map_Header.xmax do
            if random(10) = 0 then map^[i,j] := 45 else map^[i,j] := 47;
            x := 25;
            y := 50;
            Scroll(TRUE);
            with party do begin
               watch_year := year;
               watch_day := day;
               watch_hour := hour;
               watch_min := min;
               watch_sec := sec;
            end;
            Time_Watch := TRUE;
            Time_Event_No := 1;
            watch_min := watch_min + 20;
            if watch_min > 59 then begin
               watch_min := watch_min - 60;
               watch_hour := watch_hour + 1;
               if watch_hour > 23 then begin
                  watch_hour := watch_hour - 24;
                  watch_day := watch_day + 1;
                  if watch_day > 359 then begin
                     watch_day := watch_day - 360;
                     watch_year := watch_year + 1;
                  end;
               end;
            end;
         end else begin
            Clear;
            Print(7,' ÇaŸ¡¯aÈiµA“e ´a¢œå ¤e·w·¡ ´ô´ö”a.');
         end;
      end;
      9 :
      begin
         if Map_Header.Tile_Type <> ground then begin
            Print(7,' ÇaŸ¡¯aÈi ¥©·e º¶áˆa Ëa·¥‰µµA¬á e ¸b•·Ðs“¡');
            Print(7,'”a.');
            exit;
         end;
         with party do begin
            watch_year := year;
            watch_day := day;
            watch_hour := hour;
            watch_min := min;
            watch_sec := sec;
         end;
         Time_Watch := TRUE;
         Time_Event_No := 5;
      end;
   end;
end;

Procedure GameOption;
var
   i : integer;
begin
   m[0] := '‰A·± ¬åÈ‚ ¬wÑ×';
   m[1] := 'e·¡•¡ ¹¡¸é';
   m[2] := '¸÷¯¢ ·©Ð—· ®…¬á ¸÷i';
   m[3] := '·©Ð—µA¬á ¹A¶A ¯¡Ç±';
   m[4] := '·©Ð—· ¸w§¡Ÿi ¤áŸ±';
   m[5] := '·¡¸å· ‰A·±·i ¸ˆ';
   m[6] := 'Ñe¸· ‰A·±·i ¸á¸w';
   m[7] := '‰A·±·i  aÃ±';
   k := Select(60,7,7,TRUE,TRUE);
   case k of
      1 : begin
             SetColor(12);
             HPrintXY(275,30,'Ðe¤åµA Â‰ÑeÐa“e ¸â—i·');
             HPrintXY(287,46,'ÂA”Ã¡Ÿi ‹¡·³Ða¯³¯¡µ¡');
             m[0] := '';
             for i:= 1 to 6 do begin
               str(i+2,s); m[i] := s+' ¡w· ¸â—i';
             end;
             i := Select(90,6,6,FALSE,TRUE)+2;
             if i in [3..8] then maxenemy^ := i;

             m[0] := '·©Ð——i· »¡‹q ¬÷‰b·e ´á˜ý¯s“¡Œa ?';
             m[1] := '·©¦œá ¸åÊŸi Ï¡Ða‰¡ ¯¼”a';
             m[2] := 'á¢ ¸x·e ¸åÊ“e ¶¥Ða»¡ ´g“e”a';
             m[3] := ' aºÃ¥ ¸â‰Á“e ¸åÊŸi Ða‰V”a';
             m[4] := '¥¡·¡“e ¸â—i‰Á“e ¡¡– ¸åÊÐa‰V”a';
             m[5] := '‹a—i·e Ï¡µA Š‹ºa ·¶”a';
             i := Select(71,5,5,FALSE,TRUE);
             if i in [1..5] then encounter^ := 6-i;

             m[0] := '·¯¢ ¦‰¡w·¥ ¸âŒa»¡ ‰·‰b Ða‰V¯s“¡Œa ?';
             m[1] := '¢‰¥ ‹aœý”a';
             m[2] := '‹aœý»¡ ´g”a';
             i := Select(90,2,2,FALSE,TRUE);
             if i > 0 then Cruel := (i = 1);
          end;
      2 : begin
             setcolor(12);
             HPrintXY(275,30,'Ñe¸· ·©¶¥· ¸åÊ ®…¬áŸi ¸÷i Ða¯³¯¡µ¡.');
             setcolor(11);
             HPrintXY(265,70,'®…¬áŸi ¤aŽ‰ ·©¶¥');
             m[0] := '';
             for i := 2 to 5 do
                if player[i].name <> '' then m[i-1] := player[i].name
                else m[i-1] := ' §¥¸aŸ¡';
             j := select(105,4,4,FALSE,FALSE) + 1;
             if j = 1 then begin
                clear; exit;
             end;
             setcolor(11);
             HPrintXY(445,70,'®…¬áŸi ¤aŽ‰ ·©¶¥');
             for i := 2 to 5 do m[i-1] := '                       '+m[i-1];
             k := select(105,4,4,FALSE,FALSE) + 1;
             if k = 1 then begin
                clear; exit;
             end;
             move(player[j],player[7],sizeof(player[7]));
             move(player[k],player[j],sizeof(player[7]));
             move(player[7],player[k],sizeof(player[7]));
             Display_Condition;
             clear;
          end;
      3 : begin
             setcolor(12);
             HPrintXY(275,35,'·©Ð—µA¬á ¹A¶A ¯¡Ç© ¬aœq·i ‰¡Ÿa¯³¯¡µ¡.');
             m[0] := '';
             for i := 2 to 6 do
                if player[i].name <> '' then m[i-1] := player[i].name
                else m[i-1] := '§¥¸aŸ¡';
             k := select(75,5,5,FALSE,TRUE) + 1;
             if k = 1 then begin
                clear; exit;
             end;
             player[k].name := '';
             Display_Condition;
          end;
      4 : begin
             Clear;
             Print(12,'¸w§¡Ÿi ¤áŸ© ¬aœq·i ‰¡Ÿa¯¡µ¡.');
             k := ChooseWhom(FALSE);
             if k = 0 then exit;
             Print(12,'¤áŸ© ¸w§¡Ÿi ‰¡Ÿa¯¡µ¡.');
             m[0] := '';
             m[1] := ReturnWeapon(player[k].weapon);
             m[2] := ReturnShield(player[k].shield);
             m[3] := ReturnArmor(player[k].armor);
             j := Select(120,3,3,FALSE,TRUE);
             if j = 0 then exit;
             with player[k] do
             case j of
                1 : begin
                       weapon := 0;
                       Print(7,name+'· ¢‹¡“e Ð¹A –A´ö¯s“¡”a.');
                    end;
                2 : begin
                       shield := 0;
                       Print(7,name+'· ¤wÌ“e Ð¹A –A´ö¯s“¡”a.');
                    end;
                3 : begin
                       armor := 0;
                       Print(7,name+'· ˆsµµ·e Ð¹A –A´ö¯s“¡”a.');
                    end;
             end;
          end;
      5 : Restore_Game;
      6 : begin
             if Time_Watch then begin
                Clear;
                Print(12,' »¡‹q·e ‰A·± ¸á¸w·i Ði ® ´ô¯s“¡”a.');
                Print(12,' ¸q¯¡ e ”á ‹¡”aa º¯³¯¡µ¡.');
                exit;
             end;
             m[0] := '‰A·±· ¸á¸w ¸w­¡Ÿi ¬åÈ‚Ða¯³¯¡µ¡.';
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
             k := select(65,10,10,FALSE,TRUE);
             if k < 2 then exit;
             LoadNo := chr(k+47);
             setcolor(12);
             HPrintXY(312,80,'Ñe¸· ‰A·±·i ¸á¸wÐs“¡”a');
             Save;
             setcolor(7);
             HPrintXY(360,102,'¬÷‰·Ð–¯s“¡”a');
             LoadNo := '1';
             PressAnyKey;
          end;
      7 : GameOver;
   end;
end;

Procedure SelectMode;
begin
   m[0] := '”w¯¥· ¡ww·i ‰¡Ÿa¯¡µ¡ ===>';
   m[1] := '·©Ð—· ¬wÑ×·i ¥¥”a       [P]';
   m[2] := 'ˆ·¥· ¬wÑ×·i ¥¥”a       [V]';
   m[3] := '·©Ð—·¡ ˆa»¥ ¢‰Î‘·i ÑÂ·¥  [I]';
   m[4] := '·©Ð—· ˆåˆw ¬wÈŸi ¥¥”a  [Q]';
   m[5] := ' a¤ó·i ¬a¶wÐe”a          [C]';
   m[6] := 'Á¡“wb·i ¬a¶wÐe”a        [E]';
   m[7] := '¢‹¡ ¸wÀb £¹ Ð¹A        [W]';
   m[8] := 'µa‹¡¬á ®å”a              [R]';
   m[9] := '¢‰Î‘·i ¬a¶wÐe”a          [U]';
   m[10] := '‰A·± ¬åÈ‚ ¬wÑ×           [G]';
   k := Select(60,10,10,TRUE,TRUE);
   case k of
      0 : exit;
      1 : ViewParty;
      2 : ViewCharacter;
      3 : Inventory;
      4 : QuickView;
      5 : CastSpell;
      6 : Extrasense;
      7 : SetBackPack;
      8 : Rest;
      9 :
      begin
          m[0] := '';
          m[1] := '´¢Á¡a ´¢¢‰·i ¬a¶wÐe”a';
          m[2] := 'ÇaŸ¡¯aÈi·i ¬a¶wÐe”a';
          case Select(100,2,2,TRUE,TRUE) of
             0 : exit;
             1 :
             begin
                person := ChooseWhom(FALSE);
                if person > 0 then begin
                   if exist(person) then Use_Item(10)
                   else Print(7,' '+player[person].name+ReturnSJosa(player[person].name)+
                                ' ¢‰Î‘·i ¬a¶wÐi ® ·¶“e ¬wÈˆa ´a“³“¡”a.');
                end;
             end;
             2 : Use_Crystal;
          end;
      end;
      10: GameOption;
   end;
end;

end.