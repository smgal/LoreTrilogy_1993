Unit LoreMenu;

INTERFACE

Uses
   Crt, Dos, Graph, UHanX, LoreSub;

 Procedure AttackSpell;
 Procedure SPnotEnough;
 Procedure HealOne(whom : byte);
 Procedure CureOne(whom : byte);
 Procedure ConsciousOne(whom : byte);
 Procedure RevitalizeOne(whom : byte);
 Procedure HealAll;
 Procedure CureAll;
 Procedure ConscoisAll;
 Procedure RevitalizeAll;
 Procedure CureSpell;
 Procedure PhenominaSpell;
 Procedure ViewParty;
 Procedure ViewCharacter;
 Procedure QuickView;
 Procedure CastSpell;
 Function ReturnPredict : integer;
 Procedure Extrasense;
 Procedure Rest;
 Procedure GameOption;
 Procedure SelectMode;


IMPLEMENTATION

Procedure AttackSpell;
begin
   Talk('¸åÊ ¡¡—aˆa ´a“©˜“e ‰·‰b  a¤ó·i ¬a¶wÐi ® ´ô¯s“¡”a.');
end;

Procedure SPnotEnough;
begin
   Talk('‹aœáa,  a¤ó »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
end;

Procedure HealOne(whom : byte);
begin
   with player[whom] do begin
      if (dead > 0) or (unconscious > 0) or (poison > 0) then begin
         if party.etc[6] = 0 then Print(7,name+'“e Ã¡ža–I ¬wÈˆa ´a“³“¡”a.');
         exit;
      end;
      if hp >= endurance * level[1] then begin
         if party.etc[6] = 0 then Print(7,name+'“e Ã¡žaÐi Ï©¶aˆa ´ô¯s“¡”a.');
         exit;
      end;
   end;
   i := 2 * player[person].level[2];
   if player[person].sp < i then begin
      if party.etc[6] = 0 then SPnotEnough;
      exit;
   end;
   player[person].sp := player[person].sp - i;
   player[whom].hp := player[whom].hp + i * 3 div 2;
   with player[whom] do
   if hp > level[1] * endurance then hp := level[1] * endurance;
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
      if unconscious > endurance * level[1] then
         unconscious := endurance * level[1];
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

Procedure ConscoisAll;
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
   m[0] := '’ŠµA‰A';
   for i:= 1 to 6 do m[i] := player[i].name;
   j := 6;
   if player[6].name <> '' then j := 7;
   m[j] := '¡¡—e ¬aœq—iµA‰A';
   whom := Select(60,j,j,TRUE,TRUE);
   if whom = 0 then exit;
   m[0] := '¬åÈ‚';
   if whom <> j then begin
      for i := 19 to 25 do m[i-18] := ReturnMagic(i);
      i := player[person].level[2] div 2 + 1;
      if i > 7 then i := 7;
      j := Select(60,i,7,FALSE,TRUE);
      if j = 0 then exit;
      case j of
         1 : HealOne(whom);
         2 : CureOne(whom);
         3 : begin
                CureOne(whom);
                HealOne(whom);
             end;
         4 : ConsciousOne(whom);
         5 : RevitalizeOne(whom);
         6 : begin
                ConsciousOne(whom);
                CureOne(whom);
                HealOne(whom);
             end;
         7 : begin
                RevitalizeOne(whom);
                ConsciousOne(whom);
                CureOne(whom);
                HealOne(whom);
             end;
      end;
   end
   else begin
      for i := 26 to 32 do m[i-25] := ReturnMagic(i);
      i := player[person].level[2] div 2 - 3;
      if i < 0 then begin
         print(7,player[person].name+'“e ˆwÐe Ã¡ža  a¤ó·e ´a»¢ ¦‰ˆa“w Ðs“¡”a.');
         PressAnyKey;
         exit;
      end;
      j := Select(60,i,7,TRUE,TRUE);
      case j of
         1 : HealAll;
         2 : CureAll;
         3 : begin
                CureAll;
                HealAll;
             end;
         4 : ConscoisAll;
         6 : RevitalizeAll;
         5 : begin
                ConscoisAll;
                CureAll;
                HealAll;
             end;
         7 : begin
                RevitalizeAll;
                ConscoisAll;
                CureAll;
                HealAll;
             end;
      end;
   end;
   Print(7,''); Print(7,'');
   SimpleDisCond;
   PressAnyKey;
end;

Procedure PhenominaSpell;

 Procedure SPnotEnough;
 begin
    Message(7,' a¤ó »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
 end;

var
   ok : boolean;
begin
   m[0] := '¬åÈ‚';
   for i := 1 to 8 do m[i] := ReturnMagic(i+32);
   if player[person].level[2] > 1 then j := player[person].level[2] div 2 + 1
   else j := 1;
   if j > 8 then j := 8;
   k := Select(60,j,8,TRUE,TRUE);
   if k = 0 then exit;
   case k of
      1 : begin
             if player[person].sp < 1 then begin
                SPnotEnough;
                exit;
             end;
             if party.etc[1] < 255 then inc(party.etc[1]);
             Message(15,'·©Ð—·e  a¤ó· Ñõ¦‰·i ¤jÑv¯s“¡”a.');
             dec(player[person].sp);
             Scroll(TRUE);
          end;
      2 : begin
             if player[person].sp < 5 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'·©Ð—·e ‰·º—¦¬wº— ·³“¡”a.');
             party.etc[4] := 255;
             player[person].sp := player[person].sp - 5;
          end;
      3 : begin
             if player[person].sp < 10 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'·©Ð—·e ¢‰¶áŸi ˆé·i® ·¶¯s“¡”a.');
             party.etc[2] := 255;
             player[person].sp := player[person].sp - 10;
          end;
      4 : begin
             if player[person].sp < 20 then begin
                SPnotEnough;
                exit;
             end;
             Message(15,'·©Ð—·e “|¶áŸi ˆé·i® ·¶¯s“¡”a.');
             party.etc[3] := 255;
             player[person].sp := player[person].sp - 20;
          end;
      5 : begin
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
                town : if map[x,y] in [0,27..47] then ok := TRUE;
                ground : if map[x,y] in[0,24..47] then ok := TRUE;
                den : if map[x,y] in[0,41..47] then ok := TRUE;
                keep : if map[x,y] in[0,40..47] then ok := TRUE;
             end;
             if not ok then begin
                x := x - 2*x1; y := y - 2*y1;
                Message(7,'‹¡ÑÁ ·¡•··¡ É·Ða»¡ ´g¯s“¡”a.');
                exit;
             end;
             player[person].sp := player[person].sp - 25;
             if (map[x-x1,y-y1] = 0) or
             ((position in [den,keep]) and (map[x+x1,y+y1] = 52)) then begin
                x := x - 2*x1; y := y - 2*y1;
                Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·  a¤ó·i ¤ÀâÐs“¡”a.');
             end
             else begin
                Message(15,'‹¡ÑÁ ·¡•··i  aÁv¯s“¡”a.');
                Scroll(TRUE);
             end;
          end;
      6 : begin
             if party.map in [20,25,26] then begin
                Message(13,' ·¡ •·Š‰· ´b· Ó±·¡ ·¡  a¤ó·i ¤wÐÐs“¡”a.');
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
             if (map[x+x1,y+y1] = 0) or
             ((position in [den,keep]) and (map[x+x1,y+y1] = 52)) then begin
                x1 := 0; y1 := 0;
                Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·  a¤ó·i ¤ÀâÐs“¡”a.');
             end
             else begin
                map[x+x1,y+y1] := k;
                Message(15,'»¡Ñw ¥eÑÁµA ¬÷‰·Ð–¯s“¡”a.');
                Scroll(TRUE);
             end;
          end;
      7 : begin
             if party.map in [20,25,26] then begin
                Message(13,' ·¡ •·Š‰· ´b· Ó±·¡ ·¡  a¤ó·i ¤wÐÐs“¡”a.');
                exit;
             end;
             if player[person].sp < 50 then begin
                SPnotEnough;
                exit;
             end;
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
             repeat begin
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
                town : if map[x,y] in [27..47] then ok := TRUE;
                ground : if map[x,y] in [24..47] then ok := TRUE;
                den : if map[x,y] in [41..47] then ok := TRUE;
                keep : if map[x,y] in [27..47] then ok := TRUE;
             end;
             if not ok then begin
                x := x - k*x1; y := y - k*y1;
                Message(7,'‰·ˆe ·¡•· ¸w­¡¡ ¦¸âÐs Ðs“¡”a.');
                exit;
             end;
             player[person].sp := player[person].sp - 50;
             if (map[x,y] = 0) or
             ((position in [den,keep]) and (map[x+x1,y+y1] = 52)) then begin
                x := x - k*x1; y := y - k*y1;
                Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·i ¤ÀâÐs“¡”a.');
             end
             else begin
                Message(15,'‰·ˆe ·¡•·  a¤ó·¡ ¬÷‰·Ð–¯s“¡”a.');
                Scroll(TRUE);
             end;
          end;
      8 : begin
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
             for i := 0 to 1 do begin
                page := 1 - page;
                setactivepage(page);
                hany := 30;
                Print(15,' ¯¢œ· ¹A¹¡  a¤ó·e ¬÷‰·¸â·a¡ ®Ð—–A´ö¯s“¡”a');
                hany := hany + 20;
                str(j,s);
                Print(15,'            '+s+' ˆ· ¯¢œ··¡ »wˆa–Q');
                hany := hany + 30;
                str(party.food,s);
                Print(11,'      ·©Ð—· Ñe¸ ¯¢œ··e '+s+' ˆ ·³“¡”a');
             end;
          end;
   end;
   displaySP;
end;

Procedure ViewParty;

 Procedure ViewPartySub(i:integer);
 begin
    s := ' ˆa“w'; if party.etc[i] = 0 then s := ' ¦‰ˆa';
 end;

begin
   setcolor(7);
   with party do
   for i := 0 to 1 do begin
      SetActivePage(i);
      str(x,s); HPrintXY(250,45,'X Â‚ = '+s);
      str(y,s); HPrintXY(250,60,'Y Â‚ = '+s);
      str(food,s); HPrintXY(250,80,'q·e ¯¢œ· = '+s);
      str(gold,s); HPrintXY(250,95,'q·e Ñ×‹q = '+s);
      ViewPartySub(1);
      HPrintXY4Select(250,115,' a¤ó· Ñõ¦‰ :'+s);
      ViewPartySub(4);
      HPrintXY4Select(250,130,'‰·º— ¦¬w   :'+s);
      ViewPartySub(2);
      HPrintXY4Select(250,145,'¢‰¶áŸi ˆé·q :'+s);
      ViewPartySub(3);
      HPrintXY4Select(250,160,'“|¶áŸi ˆé·q :'+s);
   end;
end;

Procedure ViewCharacter;
begin
   Clear;
   hany := 30;
   print(15,'“wb·i ¥¡‰¡¯¼·e ·¥¢‰·i ¬åÈ‚Ða¯¡µ¡');
   i := ChooseWhom(FALSE);
   Clear;
   if i = 0 then Exit;
   with player[i] do begin
      setcolor(11);
      HPrintXY4Select(240,30,'# ·¡Ÿq : '+name);
      HPrintXY4Select(240,46,'# ¬÷¥i : '+ReturnSex(i));
      HPrintXY4Select(240,62,'# ‰‹s : '+ReturnClass(i));
      setcolor(3);
      str(strength,s);
      HPrintXY4Select(244,88,'ÁAb   : '+s);
      str(mentality,s);
      HPrintXY4Select(434,88,'¸÷¯¥b : '+s);
      str(concentration,s);
      HPrintXY4Select(244,104,'»³º—b : '+s);
      str(endurance,s);
      HPrintXY4Select(434,104,'·¥b : '+s);
      str(resistance,s);
      HPrintXY4Select(244,120,'¸áÐwb : '+s);
      str(agility,s);
      HPrintXY4Select(434,120,'£¥Àó¬÷ : '+s);
      str(luck,s);
      HPrintXY4Select(244,136,'Ð—¶…   : '+s);
      setcolor(14);
      HPrintXY4Select(250,180,'´a¢Ç¡a ’Ÿa¯³¯¡µ¡ ...');
      c := readkey;
      if c = #0 then c := readkey;
      SetfillStyle(1,8);
      bar(244,88,610,196);
      for j := 0 to 1 do begin
         SetActivePage(page);
         page := 1 - page;
         setcolor(11);
         HPrintXY4Select(240,30,'# ·¡Ÿq : '+name);
         HPrintXY4Select(240,46,'# ¬÷¥i : '+ReturnSex(i));
         HPrintXY4Select(240,62,'# ‰‹s : '+ReturnClass(i));
         setcolor(3);
         str(accuracy[1],s);
         HPrintXY4Select(244,88,'¢‹¡· ¸÷ÑÂ¬÷   : '+s);
         str(accuracy[2],s);
         HPrintXY4Select(244,104,'¸÷¯¥b· ¸÷ÑÂ¬÷ : '+s);
         str(accuracy[3],s);
         HPrintXY4Select(244,120,'Á¡ˆqˆb· ¸÷ÑÂ¬÷ : '+s);
         str(level[1],s);
         HPrintXY4Select(434,88, '¸åÊ A¥I   : '+s);
         str(level[2],s);
         HPrintXY4Select(434,104,' a¤ó A¥I   : '+s);
         str(level[3],s);
         HPrintXY4Select(434,120,'Á¡ˆqˆb A¥I : '+s);
         str(experience,s);
         HPrintXY4Select(244,136,'## ‰wÐñÃ¡   : '+s);
         setcolor(2);
         HPrintXY4Select(244,160,'¬a¶w ¢‹¡ - '+ReturnWeapon(player[i].weapon));
         if player[i].shield <> 0 then
            HPrintXY4Select(244,176,'¤wÌ - '+ReturnShield(i)+' ¤wÌ');
         if player[i].armor <> 0 then
            HPrintXY4Select(434,176,'ˆsµµ - '+ReturnArmor(i)+' ˆsµµ');
      end;
   end;
end;

Procedure QuickView;
var
   color : integer;
begin
   color := GetColor;
   for i:= 0 to 1 do begin
      SetActivePage(i);
      setcolor(15);
      HPrintXY(280,40,'·¡Ÿq');
      setcolor(12);
      HPrintXY(400,40,' º—•¢ ·¯¢¦‰¡w º‚·q');
   end;
   setcolor(7);
   for i := 0 to 1 do begin
      SetActivePage(i);
      for j:= 1 to 6 do
      with player[j] do
      if name <> '' then begin
         HPrintXY4Select(250,60+j*15,name);
         str(poison,s);
         HPrintXY4Select(424,60+j*15,s);
         str(unconscious : 3,s);
         HPrintXY4Select(464,60+j*15,s);
         str(dead : 5,s);
         HPrintXY4Select(500,60+j*15,s);
      end;
   end;
   SetActivePage(1-page);
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
   m[0] := '¬a¶wÐi  a¤ó· ¹·ŸA ===>';
   m[1] := '‰·‰b  a¤ó';
   m[2] := 'Ã¡ža  a¤ó';
   m[3] := '¥eÑÁ  a¤ó';
   k := Select(80,3,3,TRUE,TRUE);
   case k of
      1 : AttackSpell;
      2 : CureSpell;
      3 : PhenominaSpell;
   end;
end;

Function ReturnPredict : integer;
var
   Return : integer;
begin
   Return := 0;
   with party do begin
      case etc[10] of
         0..2 : Return := 1;
         3 : Return := 2;
         4,5 : Return := 3;
         6 : Return := 4;
      end;
      if Return = 4 then if map = 7 then Return := 5;
      case etc[13] of
         1 : Return := 6;
         2 : Return := 7;
         3 : Return := 8;
      end;
      if etc[13] = 3 then
      case etc[14] of
         0 : Return := 9;
         1 : Return := 10;
         2 : Return := 11;
         3 : Return := 9;
         4 : Return := 12;
         5 : Return := 11;
         6 : Return := 13;
      end;
      if etc[14] = 6 then if map = 16 then Return := 14;
      if (etc[14]=6) and (map=2) then Return := 13
      else if Return = 13 then
      case etc[15] of
         0 : Return := 15;
         1 : Return := 16;
         2 : Return := 15;
         3 : Return := 17;
         4 : Return := 15;
         5 : Return := 18;
      end;
      if (map = 13) and not (odd(party.etc[40]) or odd(party.etc[40])) then
         Return := 19;
      if etc[15] = 5 then begin
         if map in [4,19..21] then Return := 20;
         if odd(party.etc[40]) and odd(party.etc[41]) then Return := 21
      end;
      if map = 5 then Return := 22;
      if (etc[15] = 5) and (map > 21) then
      case map of
         22,24 : Return := 22;
         23 : Return := 23;
         25 : Return := 24;
         26 : Return := 25;
      end;
   end;
   ReturnPredict := Return;
end;

Procedure Extrasense;

 Procedure ESPnotEnough;
 begin
    Message(7,'ESP »¡®ˆa Â—¦…Ða»¡ ´g¯s“¡”a.');
 end;

const
   Predict_Data : array [1..25] of string =
                  ('Lord Ahn ·i  ei',
                   'MENACEŸi ÈqÐñÐi',
                   'Lord AhnµA‰A ”a¯¡ •©´aˆi',
                   'LASTDITCH¡ ˆi',
                   'LASTDITCH· ¬÷ºŸi  ei',
                   'PYRAMID ­¢· Major MummyŸi ¢‰Ÿ¡Ã©',
                   'LASTDITCH· ¬÷ºµA‰A¡ •©´aˆi',
                   'LASTDITCH· GROUND GATE¡ ˆi',
                   'GAIA TERRA· ¬÷ºŸi  ei',
                   'EVIL SEALµA¬á Ñ×‹q· ¥··¥·i ¤i‰eÐi',
                   'GAIA TERRA· ¬÷ºµA‰A •©´aˆi',
                   'QUAKEµA¬á ArchiGagoyleŸi ¢‰Ÿ¡Ã©',
                   '¦‚•·½¢· WIVERN •·Š‰µA ˆi',
                   'WATER FIELD¡ ˆi',
                   'WATER FIELD· Š…ºŸi  ei',
                   'NOTICE ­¢· HidraŸi ¢‰Ÿ¡Ã©',
                   'LOCKUP ­¢· Dragon·i ¢‰Ÿ¡Ã©',
                   'GAIA TERRA · SWAMP GATE¡ ˆi',
                   '¶á½¢· ‰A·¡ËaŸi É·Ð SWAMP KEEP·a¡ ˆi',
                   'SWAMP ”ŸBµA ¹¥¸Ða“e –ˆ· ¥··¥·i Î‰',
                   'SWAMP KEEP· œa¤a ‰A·¡ËaŸi ¸b•· ¯¡Ç©',
                   '¸â· »³‰i»¡·¥ EVIL CONCENTRATION·a¡ ˆi',
                   '®‘‰a»¥ ¸â·  a»¡ b ¶a¬¡ —i´áˆi',
                   '¶á½¢· •·Š‰µA¬á NecromancerŸi  ei',
                   'NecromancerµÁ  a»¡ b ‰i¸å·i ¤é·©');

var
   i,j,k : integer;
label
   Exit_For;
begin
   Clear;
   person := ChooseWhom(FALSE);
   if person = 0 then exit;
   if not exist(person) then begin
      ReturnSexData;
      Message(7,SexData+'“e Á¡ˆqˆb·i ¬a¶wÐi®·¶“e ¬wÈˆa ´a“³“¡”a');
      exit;
   end;
   if not ((player[person].class in [2,3,6]) or (party.etc[38] and bit1 > 0)) then begin
      Talk('”w¯¥µA‰A“e ´a»¢ “wb·¡ ´ô¯s“¡”a.');
      exit;
   end;
   m[0] := '¬a¶wÐi Á¡ˆqˆb· ¹·ŸA ===>';
   for j := 1 to 5 do m[j] := ReturnMagic(j+40);
   k := Select(74,5,5,TRUE,TRUE);
   if k = 5 then begin
      Message(7,ReturnMagic(k+40)+'·e ¸åÊ ¡¡—aµA¬á e ¬a¶w–S“¡”a.');
      exit;
   end;
   case k of
      1 : begin
             if party.map > 24 then begin
                Message(13,' ·¡ •·Š‰· ´b· Ó±·¡ ·¡  a¤ó·i ¤wÐÐs“¡”a.');
                exit;
             end;
             if player[person].esp < 10 then begin
                ESPnotEnough;
                exit;
             end;
             Aux := SoundOn;
             SoundOn := FALSE;
             move(font^[0],font^[55],246);
             for i := 5 to 246 do font^[0,i] := 0;
             if position in [den,keep] then begin
                move(font^[52],chara^[55],246);
                for i := 5 to 246 do font^[52,i] := 0;
             end;
             Scroll(TRUE);
             Print(15,'·©Ð—·e º¶áŸi Ê¯¡Ða‰¡ ·¶”a.');
             PressAnyKey;
             move(font^[55],font^[0],246);
             if position in [den,keep] then move(chara^[55],font^[52],246);
             Scroll(TRUE);
             SoundOn := Aux;
             player[person].esp := player[person].esp - 10;
          end;
      2 : begin
             if player[person].esp < 5 then begin
                ESPnotEnough;
                exit;
             end;
             Print(7,' ”w¯¥·e ”w¯¥· £¡œŸi µ´åÐe”a ...');
             Print(7,'');
             k := ReturnPredict;
             if k in [1..25] then
                s := '”w¯¥·e ' + Predict_Data[k] + ' ˆõ·¡”a'
             else
                s := '”w¯¥·e ´á˜å Ó±µA ·Ð µ´å·i ¤wÐ ¤h‰¡ ·¶”a';
             cPrint(10,15,' # ',s,'');
             player[person].esp := player[person].esp - 5;
             PressAnyKey;
          end;
      3 : begin
             if player[person].esp < 20 then begin
                ESPnotEnough;
                exit;
             end;
             Message(15,'”w¯¥·e ¸q¯¡•·´e ”aŸe ¬aœq·  a·q·i ·ª·i® ·¶”a.');
             party.etc[5] := 3;
          end;
      4 : begin
             if party.map > 24 then begin
                Message(13,' ·¡ •·Š‰· ´b· Ó±·¡ ·¡  a¤ó·i ¤wÐÐs“¡”a.');
                exit;
             end;
             if player[person].esp < player[person].level[3] * 5 then begin
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
             player[person].esp := player[person].esp - player[person].level[3] * 5;
             case k of
                1 : y1 := -1;
                2 : y1 := 1;
                3 : x1 := 1;
                4 : x1 := -1;
             end;
             party.xaxis := x; party.yaxis := y;
             Aux := SoundOn;
             SoundOn := FALSE;
             for i := 0 to 1 do begin
                page := 1 - page;
                setactivepage(page);
                hany := 30;
                print(15,'ÀåŸ¡´e· ¬a¶wº— ...');
                setcolor(14);
                HPrintXY4Select(250,184,'´a¢Ç¡a ’Ÿa¯¡µ¡ ...');
             end;
             for i := 1 to player[person].level[3] do begin
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
   DisplayESP;
end;

Procedure Rest;
begin
   Clear;
   for person := 1 to 6 do
   with player[person] do
   if name <> '' then begin
      if sex = male then s := '‹a·' else s := '‹a‘a·';
      if party.food <= 0 then Print(4,'·©Ð—·e ¯¢œ··¡ ¤a”bv”a')
      else if dead > 0 then Print(7,name+'“e º‚´ö”a')
      else if (unconscious>0) and (poison=0) then begin
         unconscious := unconscious - level[1] - level[2] - level[3];
         if unconscious <= 0 then begin
            Print(15,name+'“e ·¯¢·¡ ÒA¥¢–A´ö”a');
            unconscious := 0;
            if hp <= 0 then hp := 1;
            dec(party.food);
         end
         else Print(15,name+'“e µa¸åÓ¡ ·¯¢ ¦‰¡w·¡”a');
      end
      else if (unconscious>0) and (poison>0) then
         Print(7,'•¢˜¢…µA, '+name+' '+s+' ·¯¢·e ÒA¥¢–A»¡ ´g´v”a')
      else if poison > 0 then
         Print(7,'•¢˜¢…µA, '+name+' '+s+' ˆåˆw·e ÒA¥¢–A»¡ ´g´v”a')
      else begin
         i := (level[1]+level[2]+level[3]) * 2;
         if hp >= endurance * level[1] then if party.food < 255 then inc(party.food);
         hp := hp + i;
         if hp >= endurance * level[1] then begin
            hp := endurance * level[1];
            Print(15,name+'“e ¡¡—e ˆåˆw·¡ ÒA¥¢–A´ö”a');
         end
         else Print(15,name+'“e Ã¡ža–A´ö”a');
         dec(party.food);
      end;
   end;
   if party.etc[1] > 0 then dec(party.etc[1]);
   for i := 2 to 4 do party.etc[i] := 0;
   for i := 1 to 6 do with player[i] do if name <> '' then begin
      sp := mentality * level[2];
      esp := concentration * level[3];
   end;
   SimpleDisCond;
   PressAnyKey;
end;

Procedure GameOption;
begin
   m[0] := '‰A·± ¬åÈ‚ ¬wÑ×';
   m[1] := 'e·¡•¡ ¹¡¸é';
   m[2] := '¸÷¯¢ ·©Ð—· ®…¬á ¸÷i';
   m[3] := '·©Ð—µA¬á ¹A¶A ¯¡Ç±';
   m[4] := '·¡¸å· ‰A·±·i ¸ˆ';
   m[5] := 'Ñe¸· ‰A·±·i ¸á¸w';
   m[6] := '‰A·±·i  aÃ±';
   k := Select(60,6,6,TRUE,TRUE);
   case k of
      1 : begin
             setcolor(12);
             HPrintXY(255,40,'Ðe¤åµA Â‰ÑeÐa“e ¸â—i·');
             HPrintXY(287,56,'ÂA”Ã¡Ÿi ‹¡·³Ða¯³¯¡µ¡');
             m[0] := '';
             for i:= 1 to 5 do begin
               str(i+2,s); m[i] := s+' ¡w· ¸â—i';
             end;
             maxenemy^ := Select(90,5,5,FALSE,TRUE)+2;
             if maxenemy^ = 2 then maxenemy^ := 5;
             setcolor(12);
             m[0] := '·©Ð——i· »¡‹q ¬÷‰b·e ´á˜ý¯s“¡Œa ?';
             m[1] := '·©¦œá ¸åÊŸi Ï¡Ða‰¡ ¯¼”a';
             m[2] := 'á¢ ¸x·e ¸åÊ“e ¶¥Ða»¡ ´g“e”a';
             m[3] := ' aºÃ¥ ¸â‰Á“e ¸åÊŸi Ða‰V”a';
             m[4] := '¥¡·¡“e ¸â—i‰Á“e ¡¡– ¸åÊÐa‰V”a';
             m[5] := '‹a—i·e Ï¡µA Š‹ºa ·¶”a';
             encounter^ := Select(71,5,5,FALSE,TRUE);
             if encounter^ = 0 then encounter^ := 3;
             encounter^ := 6 - encounter^;
          end;
      2 : begin
             setcolor(12);
             HPrintXY(240,30,'Ñe¸· ·©¶¥· ¸åÊ ®…¬áŸi ¸÷i Ða¯³¯¡µ¡.');
             setcolor(11);
             HPrintXY(255,70,'®…¬áŸi ¤aŽ‰ ·©¶¥');
             m[0] := '';
             for i := 2 to 5 do
                if player[i].name <> '' then m[i-1] := player[i].name
                else m[i-1] := 'Reserved';
             j := select(95,4,4,FALSE,FALSE) + 1;
             if j = 1 then begin
                clear; exit;
             end;
             setcolor(11);
             HPrintXY(445,70,'®…¬áŸi ¤aŽ‰ ·©¶¥');
             for i := 2 to 5 do m[i-1] := '                        '+m[i-1];
             k := select(95,4,4,FALSE,FALSE) + 1;
             if k = 1 then begin
                clear; exit;
             end;
             move(player[j],player[7],55);
             move(player[k],player[j],55);
             move(player[7],player[k],55);
             Display_Condition;
             clear;
          end;
      3 : begin
             setcolor(12);
             HPrintXY(245,35,'·©Ð—µA¬á ¹A¶A ¯¡Ç¡‰¡ ¯¼·e ¬aœq·i ‰¡Ÿa¯³¯¡µ¡.');
             m[0] := '';
             for i := 2 to 6 do
                if player[i].name <> '' then m[i-1] := player[i].name
                else m[i-1] := 'Reserved';
             k := select(75,5,5,FALSE,TRUE) + 1;
             if k = 1 then begin
                clear; exit;
             end;
             player[k].name := '';
             Display_Condition;
          end;
      4 : begin
             m[0] := '¦‰œá ‰¡ ¯¼·e ‰A·±·i ¬åÈ‚Ða¯³¯¡µ¡.';
             m[1] := '´ô¯s“¡”a';
             m[2] := '¥¥ ‰A·± •A·¡Èa';
             m[3] := '‰A·± •A·¡Èa 1 (¦)';
             m[4] := '‰A·± •A·¡Èa 2 (¦)';
             m[5] := '‰A·± •A·¡Èa 3 (¦)';
             k := select(65,5,5,FALSE,TRUE);
             if k < 2 then exit;
             LoadNo := chr(k+47);
             setcolor(11);
             HPrintXY(280,80,'¸á¸wÐ–”å ‰A·±·i ”a¯¡ ¦‰œáµ³“¡”a');
             LoadFont := FALSE; Load; Scroll(TRUE); Display_Condition;
             LoadNo := '1';
             Clear;
          end;
      5 : begin
             m[0] := '‰A·±· ¸á¸w ¸w­¡Ÿi ¬åÈ‚Ða¯³¯¡µ¡.';
             m[1] := '´ô¯s“¡”a';
             m[2] := '¥¥ ‰A·± •A·¡Èa';
             m[3] := '‰A·± •A·¡Èa 1 (¦)';
             m[4] := '‰A·± •A·¡Èa 2 (¦)';
             m[5] := '‰A·± •A·¡Èa 3 (¦)';
             k := select(65,5,5,FALSE,TRUE);
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
      6 : GameOver;
   end;
end;

Procedure SelectMode;
begin
   m[0] := '”w¯¥· ¡ww·i ‰¡Ÿa¯¡µ¡ ===>';
   m[1] := '·©Ð—· ¬wÑ×·i ¥¥”a';
   m[2] := 'ˆ·¥· ¬wÑ×·i ¥¥”a';
   m[3] := '·©Ð—· ˆåˆw ¬wÈŸi ¥¥”a';
   m[4] := ' a¤ó·i ¬a¶wÐe”a';
   m[5] := 'Á¡“wb·i ¬a¶wÐe”a';
   m[6] := 'µa‹¡¬á ®å”a';
   m[7] := '‰A·± ¬åÈ‚ ¬wÑ×';
   k := Select(60,7,7,TRUE,TRUE);
   case k of
      0 : exit;
      1 : ViewParty;
      2 : ViewCharacter;
      3 : QuickView;
      4 : CastSpell;
      5 : Extrasense;
      6 : Rest;
      7 : GameOption;
   end;
end;

begin
end.