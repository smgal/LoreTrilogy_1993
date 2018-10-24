Unit DarkMenu;
{$X+}
INTERFACE

Uses
   Crt, Dos, Graph, UHanX, DarkSub;

 Procedure CureSpell;
 Procedure PhenominaSpell;
 Procedure ViewParty;
 Procedure ViewCharacter;
 Procedure QuickView;
 Procedure CastSpell;
 Function ReturnPredict : integer;
 Procedure Extrasense;
 Procedure Rest;
 Procedure Use_Item(select_num : byte);
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
   Clear_View_Screen;
   if (xmax <= 100) and (ymax <= 80) then begin
      x_init := 1; y_init := 1;
      x_end := xmax; y_end := ymax;
   end
   else begin
      x_init := x-50; y_init := y-40;
      x_end := x+50; y_end := y+40;
      if x_init < 1 then begin
         x_init := 1;
         if xmax > 100 then x_end := 100 else x_end := xmax;
      end;
      if y_init < 1 then begin
         y_init := 1;
         if ymax > 80 then y_end := 80 else y_end := ymax;
      end;
      if x_end > xmax then begin
         x_end := xmax;
         if xmax > 100 then x_init := xmax - 100 else x_init := 1;
      end;
      if y_end > ymax then begin
         y_end := ymax;
         if ymax > 80 then y_init := ymax - 80 else y_init := 1;
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
                   1..20 : k := White;
                   22    : k := LightCyan;
                   48    : k := LightBlue;
                   23,49 : k := Cyan;
                   50    : k := LightRed;
                   0     : if party.map = 4 then k := White else k := Black;
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
                      52    : if party.map = 2 then k := LightBlue else k := Black;
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
   if party.map in [15,16,17] then begin
      Print(13,'·¡ •·Š‰· ´b· Ó±·¡ ‰·ˆe ·¡•··i ¤wÐ Ðs“¡”a.');
      Teleport := FALSE;
      exit;
   end;
   Teleport := FALSE;
   m[0] := '';
   Print(15,'<<<  ¤wÐ··i ¬åÈ‚Ða¯¡µ¡  >>>');
   m[1] := '¦‚½¢';
   m[2] := 'q½¢';
   m[3] := '•·½¢';
   m[4] := '¬á½¢';
   for i := 1 to 4 do m[i] := m[i]+'·a¡ ‰·ˆe·¡•·';
   x1 := 0; y1 := 0;
   k := Select(80,4,4,FALSE,TRUE);
   if k = 0 then exit;
   case k of
      1 : y1 := -1;
      2 : y1 := 1;
      3 : x1 := 1;
      4 : x1 := -1;
   end;
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
   if (x<5) or (x>=xmax-3) or (y<5) or (y>=ymax-3) then begin
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
      x := x - k*x1; y := y - k*y1;
      Message(7,'‰·ˆe ·¡•· ¸w­¡¡ ¦¸âÐs Ðs“¡”a.');
      exit;
   end;
   if (Real_map(x,y) = 0) or
      ((position in [den,keep]) and (Real_map(x+x1,y+y1) = 52)) then begin
      x := x - k*x1; y := y - k*y1;
      Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·i ¤ÀâÐs“¡”a.');
   end
   else begin
      x := x - k*x1; y := y - k*y1;
      for i := 1 to k-1 do begin
         x := x + x1; y := y + y1;
         Scroll(FALSE);
      end;
      x := x + x1; y := y + y1;
      Message(15,'‰·ˆe ·¡•·  a¤ó·¡ ¬÷‰·Ð–¯s“¡”a.');
      Scroll(TRUE);
   end;
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
             if player[person].sp < 5 then begin
                SPnotEnough;
                exit;
             end;
             player[person].sp := player[person].sp - 5;
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
             if party.map in [15,16,17] then begin
                Print(13,'·¡ •·Š‰· ´b· Ó±·¡ ‹¡ÑÁ ·¡•··i ¤wÐ Ðs“¡”a.');
                exit;
             end;
             if player[person].sp < 25 then begin
                SPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  ¤wÐ··i ¬åÈ‚Ða¯¡µ¡  >>>');
             m[1] := '¦‚½¢';
             m[2] := 'q½¢';
             m[3] := '•·½¢';
             m[4] := '¬á½¢';
             for i := 1 to 4 do m[i] := m[i]+'·a¡ ‹¡ÑÁ ·¡•·';
             k := Select(80,4,4,FALSE,TRUE);
             x1 := 0; y1 := 0;
             if k = 0 then exit;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             x := x + 2*x1; y := y + 2*y1;
             if (x<5) or (x>=xmax-3) or (y<5) or (y>=ymax-3) then begin
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
             if party.map in [4,15,16,17] then begin
                Print(13,'·¡ »¡µb· ´b· Ó±·¡ »¡Ñw ¥eÑÁŸi ¤wÐ Ðs“¡”a.');
                exit;
             end;
             if player[person].sp < 30 then begin
                SPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  ¤wÐ··i ¬åÈ‚Ða¯¡µ¡  >>>');
             m[1] := '¦‚½¢';
             m[2] := 'q½¢';
             m[3] := '•·½¢';
             m[4] := '¬á½¢';
             for i := 1 to 4 do m[i] := m[i]+'µA »¡Ñw ¥eÑÁ';
             x1 := 0; y1 := 0;
             k := Select(80,4,4,FALSE,TRUE);
             if k = 0 then exit;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
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
             else if (position = town) and (Real_map(x+x1,y+y1) >= 48) then begin
                x1 := 0; y1 := 0;
             end
             else begin
                Putmap(x+x1,y+y1,k);
                Message(15,'»¡Ñw ¥eÑÁµA ¬÷‰·Ð–¯s“¡”a.');
                Scroll(TRUE);
             end;
          end;
      8 : begin
             if player[person].sp < 50 then begin
                SPnotEnough;
                exit;
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
             if party.map in [4,15,16,17] then begin
                Print(13,'·¡ »¡µb· ´b· Ó±·¡ »¡Ñw ¥eÑÁŸi ¤wÐ Ðs“¡”a.');
                exit;
             end;
             if player[person].sp < 60 then begin
                SPnotEnough;
                exit;
             end;
             m[0] := '';
             Print(15,'<<<  ¤wÐ··i ¬åÈ‚Ða¯¡µ¡  >>>');
             m[1] := '¦‚½¢';
             m[2] := 'q½¢';
             m[3] := '•·½¢';
             m[4] := '¬á½¢';
             for i := 1 to 4 do m[i] := m[i]+'µA »¡Ñw ¥eÑÁ';
             x1 := 0; y1 := 0;
             k := Select(80,4,4,FALSE,TRUE);
             if k = 0 then exit;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
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
                else if (position = town) and (Real_map(x+x1*j,y+y1*j) >= 48) then begin
                   x1 := 0; y1 := 0;
                   j := h+1;
                end
                else begin
                   Putmap(x+x1*j,y+y1*j,k);
                end;
             until j >= h;
             if j = h then Message(15,'»¡Ñw ¥eÑÁµA ¬÷‰·Ð–¯s“¡”a.');
             Silent_Scroll;
          end;
   end;
   displaySP;
end;

Procedure ViewParty;

 Procedure ViewPartySub(i:integer);
 begin
    s := ' ˆa“w'; if party.etc[i] = 0 then s := ' ¦‰ˆa';
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
      X_Pos := 270;
      str(item[1],s);
      HPrintXY4Select(X_Pos,150,'ÁAb ÒA¥¢´¢ : '+s);
      str(item[2],s);
      HPrintXY4Select(X_Pos,165,' a¤ó ÒA¥¢´¢ : '+s);
      str(item[3],s);
      HPrintXY4Select(X_Pos,180,'Ð•¢· ´¢Á¡ : '+s);
      str(item[4],s);
      HPrintXY4Select(X_Pos,195,'·¯¢· ´¢Á¡ : '+s);
      str(item[5],s);
      HPrintXY4Select(X_Pos,210,'¦ÑÉ· ´¢Á¡ : '+s);
      X_Pos := 430;
      str(item[6],s);
      HPrintXY4Select(X_Pos,150,'­¡ÑÅ ¢…¬á : '+s);
      str(item[7],s);
      HPrintXY4Select(X_Pos,165,'”Ñw Ñõ¦‰ : '+s);
      str(item[8],s);
      HPrintXY4Select(X_Pos,180,'®¸÷ Š¯i : '+s);
      str(item[9],s);
      HPrintXY4Select(X_Pos,195,'§¡Ð— ¦Ãa : '+s);
      str(item[10],s);
      HPrintXY4Select(X_Pos,210,'·¡•· Š¯i : '+s);
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
      j := X_Pos+160;
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
         HPrintXY4Select(X_Pos+196,256,'ˆsµµ - '+ReturnArmor(armor));
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
   Return : integer;
begin
   Return := 0;
   with party do begin
      case etc[10] of
         0 : Return := 1;
         1 : Return := 2;
         2 : Return := 3;
         3 : Return := 4;
         4 : Return := 5;
         5 : case etc[11] of
                0 : Return := 6;
                1 : Return := 7;
                2 : Return := 8;
                3 : Return := 9;
                4 : Return := 8;
                5 : Return := 3;
             end;
         6 : Return := 3;
         7 : Return := 1;
         8 : Return := 10;
         9 : begin
                Return := 15;
                if etc[9] and bit4 = 0 then Return := 14;
                if etc[9] and bit3 = 0 then Return := 13;
                if etc[9] and bit2 = 0 then Return := 12;
                if etc[9] and bit1 = 0 then Return := 11;
             end;
         10: Return := 3;
         11: Return := 16;
         12: begin
                Return := 15;
                if etc[9] and bit7 = 0 then Return := 18;
                if etc[9] and bit6 = 0 then Return := 17;
                if etc[9] and bit5 = 0 then Return := 11;
             end;
         13: Return := 3;
         14: Return := 19;
         15: begin
                Return := 22;
                if etc[9] and bit3 = 0 then Return := 21;
                if etc[9] and bit2 = 0 then Return := 20;
                if etc[9] and bit1 = 0 then Return := 11;
             end;
         16: begin
                Return := 22;
             end;
      end;
   end;
   ReturnPredict := Return;
end;

Procedure Extrasense;

 Procedure ESPnotEnough;
 begin
    Message(7,' a¤ó »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
 end;

const
   Max_Predict_Data = 21;
   Predict_Data : array [1..Max_Predict_Data] of string =
                  ('¡—a ´e·i  ei',
                   '¡Aá¯a¡ ˆi',
                   '”a¯¡ ¡—a ´eµA‰A ˆi',
                   '”a¯¡ ¡Aá¯aŸi ¹¡¬aÐi',
                   '”a¯¡ ¡´á ¬÷·a¡ •©´aˆi',
                   'œa¯aËa —¡Ã¡· ¬÷ºŸi  ei',
                   'Ï¡œa£¡—a ­¢· ¡´á ÐåÈáŸi Àx·i',
                   'œa¯aËa —¡Ã¡· Š…ºµA‰A¡ •©´aˆi',
                   'Ï¡œa£¡—a ­¢· – •·Š‰µA¬á –ˆ· ¬âÌe·i Àx·i',
                   'Àõ¤å¼ ¶©¯¢·i ‹¡”aŸ©',
                   '¡Aá¯aŸi É·Ð »¡Ða ­A‰¡ ˆi',
                   '§¹· »¡¦—·i ¤w¢…Ði ˆõ',
                   '§¹· ¬a¶¥µA¬á ´b· Â¹·¸a—i· ¡A­A»¡Ÿi ¥©',
                   'Ï©¡i· ¬—¹¥·i ÈqÐñÐi ˆõ',
                   '»¡Ða ­A‰ º—´w· É·¡Ÿi É·Ð »¡¬w·a¡ ˆi',
                   '–¤å¼ ¶©¯¢·i ‹¡”aŸ©',
                   '¥AŸ¡´i· •·Š‰µA¬á ‰i¸å·i ¤é·©',
                   '¡©¢· •·Š‰µA¬á ‰i¸å·i ¤é·©',
                   ' a»¡ b ­A¤å¼ ¶©¯¢·i ‹¡”aŸ©',
                   '´a¯a¡¡•A¶¯a· •·Š‰µA¬á ‰i¸å·i ¤é·©',
                   '¡AÏ¡¯aÉ¡ÍIA¯aµÁ ”‰i·i ¤é·©');

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
             if player[person].esp_magic < 70 then begin
                Print(7,SexData+'“e Ê¯¡Ÿi ¯¡•¡Ð ¥¡´v»¡ e ´a»¢·e µb¦¹¢·¡´ö”a.');
                exit;
             end;
             if player[person].sp < 10 then begin
                ESPnotEnough;
                exit;
             end;
             move(font^[0],font^[55],246);
             for i := 5 to 246 do font^[0,i] := 0;
             if position in [den,keep] then begin
                move(font^[52],chara^[55],246);
                for i := 5 to 246 do font^[52,i] := 0;
             end;
             Silent_Scroll;
             Print(15,'·©Ð—·e º¶áŸi Ê¯¡Ða‰¡ ·¶”a.');
             PressAnyKey;
             move(font^[55],font^[0],246);
             if position in [den,keep] then move(chara^[55],font^[52],246);
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
             m[0] := '';
             Print(15,'<<<  ¤wÐ··i ¬åÈ‚Ða¯¡µ¡  >>>');
             m[1] := '¦‚½¢';
             m[2] := 'q½¢';
             m[3] := '•·½¢';
             m[4] := '¬á½¢';
             for i := 1 to 4 do m[i] := m[i]+'·a¡ ÀåŸ¡´e·i ¬a¶w';
             k := Select(80,4,4,FALSE,TRUE);
             x1 := 0; y1 := 0;
             if k = 0 then exit;
             player[person].sp := player[person].sp - player[person].level * 5;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             party.xaxis := x; party.yaxis := y;
             Aux := SoundOn;
             SoundOn := FALSE;
             hany := 30;
             print(15,'ÀåŸ¡´e· ¬a¶wº— ...');
             setcolor(14);
             HPrintXY4Select(250,184,'´a¢Ç¡a ’Ÿa¯¡µ¡ ...');
             for i := 1 to player[person].level do begin
                x := x + x1; y := y + y1;
                if (x<5) or (x>=xmax-3) or (y<5) or (y>=ymax-3) then begin
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
             x := party.xaxis; y := party.yaxis;
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
end;

Procedure Exchange;
var
   sort : byte;

 Procedure swap(var i,j : byte);
 var
    temp : byte;
 begin
    temp := i;
    i := j;
    j := temp;
 end;

begin
   m[0] := '¬á¡ ¤aŽ‰ ¢‰Î‘·i ‰¡Ÿa¯¡µ¡';
   m[1] := '¬a¶wº—·¥ ¢‹¡';
   m[2] := '¬a¶wº—·¥ ¤wÌ';
   m[3] := '¬a¶wº—·¥ ˆsµµ';
   sort := select(95,3,3,TRUE,TRUE);
   case sort of
      1 : s := '¢‹¡Ÿi';
      2 : s := '¤wÌŸi';
      3 : s := 'ˆsµµ·i'
      else exit;
   end;
   setcolor(11);
   HPrintXY(275,70,s+' ¤aŽ‰ ·©¶¥');
   m[0] := '';
   for i := 1 to 5 do
   if player[i].name <> '' then m[i] := player[i].name
   else m[i] := '§¥¸aŸ¡';
   j := select(95,5,5,FALSE,FALSE);
   if (j = 0) or (m[j] = 'Reserved') then begin
      clear; exit;
   end;
   setcolor(11);
   HPrintXY(465,70,s+' ¤aŽ‰ ·©¶¥');
   for i := 1 to 5 do m[i] := '                        '+m[i];
   k := select(95,5,5,FALSE,FALSE);
   if (k = 0) or (player[k].name = '') then begin
      clear; exit;
   end;
   case sort of
      1 : swap(player[j].weapon,player[k].weapon);
      2 : swap(player[j].shield,player[k].shield);
      3 : swap(player[j].armor,player[k].armor);
   end;
   Modify_Item(j);
   Modify_Item(k);
   Display_Condition;
   clear;
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

Procedure GameOption;
var
   i : integer;
begin
   m[0] := '‰A·± ¬åÈ‚ ¬wÑ×';
   m[1] := 'e·¡•¡ ¹¡¸é';
   m[2] := '¸÷¯¢ ·©Ð—· ®…¬á ¸÷i';
   m[3] := '·©Ð—· ¸w§¡Ÿi Ð¹A';
   m[4] := '·©Ð—µA¬á ¹A¶A ¯¡Ç±';
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
             Clear;
             Print(12,'¸w§¡Ÿi ¹AˆáÐi ¬aœq·i ‰¡Ÿa¯¡µ¡.');
             k := ChooseWhom(FALSE);
             if k = 0 then exit;
             Print(12,'¹AˆáÐi ¸w§¡Ÿi ‰¡Ÿa¯¡µ¡.');
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
      4 : begin
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
      5 : Restore_Game;
      6 : begin
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
   m[3] := '·©Ð—· ˆåˆw ¬wÈŸi ¥¥”a  [Q]';
   m[4] := ' a¤ó·i ¬a¶wÐe”a          [C]';
   m[5] := 'Á¡“wb·i ¬a¶wÐe”a        [E]';
   m[6] := 'µa‹¡¬á ®å”a              [R]';
   m[7] := '¢‰Î‘·i ¬á¡ ŠaÑÅÐe”a';
   m[8] := '¢‰Î‘·i ¬a¶wÐe”a          [U]';
   m[9] := '‰A·± ¬åÈ‚ ¬wÑ×           [G]';
   k := Select(60,9,9,TRUE,TRUE);
   case k of
      0 : exit;
      1 : ViewParty;
      2 : ViewCharacter;
      3 : QuickView;
      4 : CastSpell;
      5 : Extrasense;
      6 : Rest;
      7 : Exchange;
      8 : begin
             person := ChooseWhom(FALSE);
             if person > 0 then begin
                if exist(person) then Use_Item(10)
                else begin
                   Print(7,' '+player[person].name+ReturnSJosa(player[person].name)+
                           ' ¢‰Î‘·i ¬a¶wÐi ® ·¶“e ¬wÈˆa ´a“³“¡”a.');
                end;
             end;
          end;
      9 : GameOption;
   end;
end;

end.