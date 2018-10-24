Unit MystTalk;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystBatt, MystTal1, MystTal2, MystEnd;

 Procedure TalkMode;


IMPLEMENTATION

Procedure TalkMode_Sub1;
begin

   Clear;

   if mapname = 'LastDtch' then begin

      if at(57,17) or at(54,20) or at(58,22) then Grocery;
      if at(59,56) or at(59,58) or at(59,60) then Weapon_Shop;
      if at(17,60) or at(17,56) then Hospital;
      if at(17,58) then Medicine;
      if at(16,24) or at(24,19) then About_Class;
      if at(18,19) then Sell_EXP;

      if at(21,61) then begin
         if getbit(4) then begin
            Print(7,' ¥A¯aÌá¬÷µA ”Ðe ¥¢®Ÿi Ðº­a¬á ””eÓ¡ ˆq');
            Print(7,'¬aÐs“¡”a.');
         end
         else if (party.etc[5] > 0) and (not getbit(10)) then begin
            Print(7,' ¶¥Ða¯¥”a¡e ¹Aˆa Ëa©· ‹i·i ˆaŸaÁa —aŸ¡ºa.');
            Print(7,'¯¢œ· 50 ˆ e º¯¡¡e ·©º·©´eµA ¡¡– ˆaŸaÁa');
            Print(7,'—aŸ¡‰V¯s“¡”a.');
            m[0] := '';
            m[1] := '‹aµA‰A Ëa©· ‹i·i ¤¶…”a';
            m[2] := '‹a· ¹A´e·i ˆá¸éÐe”a';
            if Select(150,2,2,FALSE,TRUE) = 1 then begin
               if party.food >= 50 then begin
                  Delete_Scroll_Screen;
                  Print(7,' ”w¯¥·e ‹aµA‰A ·©º·©ˆe Ëa©· ‹i·i ¤¶¶”a.');
                  PressAnyKey;
                  party.day := party.day + 7;
                  party.food := party.food - 50;
                  setbit(10);
                  Scroll(TRUE);
                  Print(7,' ·¡¹A ”w¯¥·e  Ëa©· ‹i·i  ·ª‰¡ ³i ® ·¶‰A');
                  Print(7,'–A´ö”a.');
               end
               else begin
                  Print(7,' Ða»¡ e ”w¯¥µA‰A“e Â—¦…Ðe ¯¢œ··¡ ´ôŠ…¶a.');
               end;
            end;
         end
         else begin
            Print(7,' ¸á“e ¥A¯aÌá¬÷µA¬á ·¡‰µ·a¡  ˆaŒa¯a¡ ÈiÂ‰');
            Print(7,'Ð µÖ¯s“¡”a. ´a a ¥A¯aÌá¬÷· ¬—¹¥¸a“e ´a¢');
            Print(7,'•¡ ´ô·i ˆõ·³“¡”a. a“e  ’…·a¡ a· ´a');
            Print(7,'µÁ ´áŸ¥ ¸a¯¢·¡ Ëa©¹¢· ‰¥¥·µA º‚´áˆa“e ˆõ');
            Print(7,'·i ¥Ö¯s“¡”a.  a“e Àa a ‹a‰µ·i ˜áa‰¡ ¯¼»¡');
            Print(7,'“e ´g´v»¡ e  ·¡ ­¡¯¢·i  ”aŸe ”ŸBµA ´iŸ¡‹¡');
            Print(7,'¶áÐ ‰a¶ ÈiÂ‰µA ¬÷‰·Ðaµa µa‹¡¬á Ã¡žaŸi ¤h');
            Print(7,'‰¡ ·¶¯s“¡”a.');
         end;
      end;
      if at(61,58) then begin
         cPrint(7,11,' a· ·¡Ÿq·e ','´iÈa·¡Ÿa','œa‰¡ Ðaµ¡. •¢®Ÿ¡ˆ{·e');
         Print(7,'¶w —·i »¡‘v”a“e ›u·¡»¡¶a. a“e ·¡ ¢‹¡¬w¸ñ');
         Print(7,'µA¬á ·©Ða¡e¬á Ìa·¡Èá¡¬á· ‹¡®‰·i µe aÐ–­¡.');
         Print(7,' e´¢ ”w¯¥·¡ aŸi Ï©¶a¡ Ðe”a¡e ‹¡Œá·¡ •¡µÁ');
         Print(7,'º‰V­¡.');
         m[0] := '';
         m[1] := 'aµA‰A“e ”w¯¥ˆ{·e ¬aœq·¡ Ï©¶aÐaµ¡';
         m[2] := '‹aœé Ï©¶aŒa»¡“e ´ô­¡';
         if Select(165,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '´iÈa·¡Ÿa';
                  sex := male;
                  class := 1;
                  classtype := sword;
                  level := 3;
                  strength := 19;
                  mentality := 4;
                  concentration := 3;
                  endurance := 18;
                  resistance := 10;
                  agility := 16;
                  accuracy := 15;
                  luck := 14;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 9;
                  shield := 2;
                  armor := 2;
                  potential_ac := 2;
                  sword_skill := 10;
                  axe_skill := 30;
                  spear_skill := 10;
                  bow_skill := 10;
                  shield_skill := 10;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(61,58,44);
                  setbit(39);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
               Print(7,'Ÿi ‹¡”aŸ¡»¡¶a.');
               exit;
            end;
         end
         else asyouwish;
      end;
      if at(34,30) then begin
         Print(7,' a· ·¡Ÿq·e  ˆa ˆa»¥ ·¡ ÐaÏaµA¬á ·Aœ–E');
         cPrint(7,11,'','¥Aˆa','œa‰¡ Ða¡a  Ñe¸“e  ·¡‰µ· ·q·A¯¡·¥·a¡');
         Print(7,'·¶¯s“¡”a.  a“e ¶¥œ  ·¡‰µ ¸á‰µ·i •©´a”a“e');
         Print(7,'¬÷£¡œa¬á ‰­¢ ·¡‰µµA  á¢Ÿa“e ˆõ·e  ¶ ”s');
         Print(7,'”sÐs“¡”a. ‹aœ¬á ”w¯¥‰Á ÐqA µaÐ—Ða‰¡ ¯¼¯s');
         Print(7,'“¡”a.');
         m[0] := '';
         m[1] := '¹½­¡, ÐáœbÐa»¡¶a';
         m[2] := '¶Ÿ¡ˆa Ða“e ·©·e á¢ ¶áÐñÐ¬á...';
         if Select(160,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '¥Aˆa';
                  sex := female;
                  class := 2;
                  classtype := magic;
                  level := 4;
                  strength := 6;
                  mentality := 16;
                  concentration := 19;
                  endurance := 10;
                  resistance := 17;
                  agility := 9;
                  accuracy := 15;
                  luck := 18;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 0;
                  shield := 0;
                  armor := 1;
                  potential_ac := 0;
                  sword_skill := 10;
                  axe_skill := 40;
                  spear_skill := 10;
                  bow_skill := 10;
                  shield_skill := 10;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(34,30,47);
                  setbit(41);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
               Print(7,'Ÿi ‹¡”aŸ¡‰V¯s“¡”a.');
               exit;
            end;
         end
         else asyouwish;
      end;

      { Lord }
      if at(38,17) then begin
         if not getbit(4) then begin
            Print(7,' a“e ¡—a´eµA‰A¬á ”w¯¥·¡ µa‹¡¡ µ¥”a“e ­¡');
            Print(7,'¯¢·i —i´ö­¡. ·Aˆq¯aœó‰A•¡ ¶Ÿ¡ ¬÷· ¶¥¸÷”');
            Print(7,'“e ¤é°á ˜áv”aµ¡.  ”w¯¥•¡ ¨iŸ¡ –á˜aœa ˆv·a');
            Print(7,'¡e Ðaµ¡.  ¬÷´e· ¦‚½¢µA ˆa·¡´a ÉAœa¡ É·Ða');
            Print(7,'“e ‰A·¡Ëaˆa ·¶­¡. ‹a‰µ·a¡ —i´áˆa¡e ˆa·¡´a');
            Print(7,'ÉAœa¡ ·¡•· –I ˆõ·¡µ¡.  •©´aµ¡“e ¤w¤ó•¡  a');
            Print(7,'Àeˆa»¡œaµ¡. ¦—¡ ¬÷‰·Ða‹¡Ÿi §©‰V­¡.');
         end
         else begin
            Print(7,' ”w¯¥·e µb¯¡ ¡—a´e·¡ »¡¡¢Ðe ¶w¬a”s­¡.  ¸÷');
            Print(7,' i Ò‰ŸWÐe ·©·i Ð´ö­¡.');
         end;
      end;

      if at(60,42) then begin
         Print(7,' ˆa ¸åµA  ´á˜å ¡¡ÐñˆaŸi É·Ð¬á ´éÏµ —i´ö');
         Print(7,'“e•A ·¡ ­A‰µA“e ¡¡– µa¬õˆ· ÉAœaˆa ·¶”a');
         Print(7,'‰¡ —i´ö¯s“¡”a.');
      end;
      if at(61,46) then begin
         Print(7,' ¸÷ i  ¡—a´e·e ¬å· ¬w»··³“¡”a.  ·¡¤åµA•¡');
         Print(7,'¬aˆå·¡ Èá»¡¸a  a¸a ´b·i ¢¿¡Ÿa‹¡ ¶áÐ¬á ‘¡');
         Print(7,'b·i ”a Ð–·a“¡Œa  i·³“¡”a.');
      end;
      if at(56,59) then begin
         Print(7,' ¸åˆi· ¯±¸w·i ¬w»·Ða“e ·¡Ÿq·i ˆa»¥ ´eÈaA');
         Print(7,'¯aœa“e ¸a·  a¤ó “wb·e ¸÷ i ””eÐ–¯s“¡”a.');
         Print(7,' Ðe˜, ˆa·¡´a ÉAœa¬÷· ®¬â ¶á¸á—a¡¬á  »¡');
         Print(7,'¬w ÂA”· ‰·‰b  a¤ó·i Š¬aÐa”áŠ…¶a.  ´¢ ¡y');
         Print(7,'‘e ¸åµA ·¡‰µµA  á¢‰œö”å ¸â·¡ ·¶¯s“¡”a.');
      end;
      if at(36,19) then begin
         Print(7,' ·¡ ­A¬wµA¬á ¡—a´e eÇq Ã·­·¤h“e ·¥¢‰•¡ —a');
         Print(7,'¢‰ ˆó“¡”a. ‹a“e Ðw¬w ¬å· ¬å¥·µA ¬á¬á º£¥');
         Print(7,'—i·i ´b·a¡¦Èá »¡Åa‰¡ ·¶·a“¡Œa¶a.');
      end;
      if at(36,21) then begin
         Print(7,' ''ÉAœa''œa‰¡ Ða“e  i·e œaË¥´á¡ ”ŸB·¡œe ›u');
         Print(7,'·¡»¡¶a.');
      end;
      if at(41,20) then begin
         Print(7,' ·¡ ¬÷´eµA ·¶“e ‰A·¡Ëa“e  ˆa·¡´a ÉAœa· ¤');
         Print(7,'Ÿ¡´åËa Ï¡Ïi»aœa“e ¬÷·a¡ É·Ð ·¶¯s“¡”a.');
      end;
      if at(41,18) then begin
         Print(7,' œa¯aËa —¡Ã¡¬÷‰Á ¤Ÿ¡´åËa Ï¡Ïi»a¬÷·e  ¬—‹±');
         Print(7,'¬ˆa ™¢ˆ{¯s“¡”a.');
      end;
      if at(41,22) then begin
         Print(7,' ·a·b! ¶a»qµA•¡ ·q´b ¹A´áÐa‹¡ Ó±—e  Ìa¯aÄi');
         Print(7,'´å´á¡ ‰A·±·i  e—a“e ¢¯¢Ðe ¬aœq·¡ ·¶”a“¡.');
      end;
      if at(37,41) or at(40,41) then Print(7,'... ...');
   end;

   if mapname = 'Valiant' then begin

      if at(54,27) or at(58,26) or at(61,21) then Grocery;
      if at(54,57) or at(54,59) then Weapon_Shop;
      if at(24,59) or at(20,60) or at(19,56) then Hospital;
      if at(21,55) then Medicine;
      if at(20,21) or at(22,23) then About_Class;
      if at(15,19) then Sell_EXP;

      if at(17,24) then begin
         cPrint(7,11,' a· ·¡Ÿq·e ¡A—A¬a·  áŸ¡Ÿi ›uÐa“e ','´i‰©','·¡');
         Print(7,'œa‰¡Ðaµ¡. a“e ·¡ŸqÀáœñ, ¥¡‹¡ eÐ•¡ ¬w”Ÿi');
         Print(7,'¹A´sÐi ® ·¶“e ¶w —·i »¡‘v­¡.  a“e ­¡ÑÅ‰');
         Print(7,'É··  a¤ó·i ·¡ ‰µµA¬á ® ‘e·i µe aÐ–”aµ¡.');
         Print(7,' ·¡¹A“e  a· “wb·i ¯©¸åµA ·¡¶wÐi ˜ˆa –A');
         Print(7,'´ö­¡. a“e ¢ ”w¯¥· ¶¥¸÷·i •¡µÁº‰¡ ¯¼­¡.');
         m[0] := '';
         m[1] := '”w¯¥ˆ{·¡ ¶w —·i »¡“¥¸aœa¡e ¹½­¡';
         m[2] := '´g•ö»¡ e ¸á“e »¡‹q ¤a«aŠ…¶a';
         if Select(180,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '´i‰©';
                  sex := male;
                  class := 3;
                  classtype := magic;
                  level := 3;
                  strength := 10;
                  mentality := 17;
                  concentration := 15;
                  endurance := 8;
                  resistance := 12;
                  agility := 11;
                  accuracy := 14;
                  luck := 20;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 0;
                  shield := 0;
                  armor := 1;
                  potential_ac := 0;
                  sword_skill := 10;
                  axe_skill := 20;
                  spear_skill := 20;
                  bow_skill := 0;
                  shield_skill := 0;
                  fist_skill := 35;
                  Modify_Item(k);
                  PutMap(17,24,27);
                  setbit(40);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
               Print(7,'Ÿi ‹¡”aŸ¡»¡¶a.');
               exit;
            end;
         end
         else asyouwish;
      end;

      if at(56,40) then begin
         Print(7,' a“e ÅEÈa¶ž¯a· ¸÷‹¡Ÿi ¤h·e ¬a·Ž…·a¡,');
         cPrint(7,11,'','Ïa¢¯¡ a','œa‰¡Ðaµ¡.  ·¡ŸqµA¬á ´i® ·¶—u·¡ a');
         Print(7,'· ®Ñ¡¬÷·e ´iÌa ­EÈa¶Ÿ¡œaµ¡. ¬a··i aµ¥');
         Print(7,'º—µA  ”w¯¥·¡ ·¡ ‰µµA ·¶”a“e ­¡Ÿ¡Ÿi —h‰¡ ”w');
         Print(7,'¯¥· ·©Ð—µA Àqˆa Ðaa‰¡ µÖ”åˆá¶a.  aŸi ¤h');
         Print(7,'´a —i·¡‰V­¡?');
         m[0] := '';
         m[1] := '¹½­¡, ¯wœbÐa»¡¶a';
         m[2] := '‹i­A¶a, ‰¥œeÐe•A¶a';
         if Select(175,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := 'Ïa¢¯¡ a';
                  sex := male;
                  class := 4;
                  classtype := sword;
                  level := 4;
                  strength := 15;
                  mentality := 5;
                  concentration := 6;
                  endurance := 16;
                  resistance := 11;
                  agility := 16;
                  accuracy := 19;
                  luck := 10;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 26;
                  shield := 0;
                  armor := 2;
                  potential_ac := 1;
                  sword_skill := 0;
                  axe_skill := 0;
                  spear_skill := 10;
                  bow_skill := 40;
                  shield_skill := 0;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(56,40,27);
                  setbit(42);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
               Print(7,'Ÿi ‹¡”aŸ¡»¡¶a.');
               exit;
            end;
         end
         else asyouwish;
      end;

      if at(38,17) then begin
         if (not getbit(5)) or getbit(6) then begin
            Print(7,' a· ¬÷ ¤Ÿ¡´åËa Ï¡Ïi»aµA µ¡¯¥ ˆõ·i ””e·¡');
            Print(7,'ÑÅµwÐaµ¡.  ¶Ÿ¡ ¬÷· ·¡ŸqµA¬á  ´i ® ·¶—u·¡');
            Print(7,'·¡ ‰µ· ¬aœq—i·e  »¥¸÷Ðe ¶w‹¡µA¬á µ¡“e Àq”a');
            Print(7,'¶… ¶w‹¡Ÿi ´aº ‘¼·¡ ÍwˆaÐa‰¡ ·¶­¡. ”w¯¥ˆ{·¡');
            Print(7,'¶w‹¡·¶“e ¸a—i·¡œa¡e  ·¡ ¬÷ ´á“a ‰µµA¬á•¡ ÑÅ');
            Print(7,'µw·i ¤h·i ˆõ·¡µ¡.');
         end else begin
            Print(7,' ”w¯¥· ¶á¶w·e ¡¡– ¸åÐ —i´ö­¡.  ·¥ŸAŸi ¶á');
            Print(7,'ÑsÐa“e ­A ¹·¹¢·i ´ôµA‰¡   a»¡ b q·e ¶œa’');
            Print(7,'¯a ÉAœa· —aœaÅ¡“¡´e¹¢·i ¤éÐaœá ˆe”a‰¡ —i´ö');
            Print(7,'­¡.  aµA‰A“e ¶œa’¯a ‰A·¡ËaŸi µa“e  a¤ó·¡');
            Print(7,'·¶­¡. ‹aœñ ”w¯¥·i ¶œa’¯a ÉAœa¡ ¥¡ —aŸ¡');
            Print(7,'Ÿ¡”a.');
            PressAnyKey;
            Delete_Scroll_Screen;
            mapname := 'Ground5';
            Load;
            OverLap(400,TRUE);
         end;
      end;

      if at(45,45) then begin
         Print(7,'ˆa·¡´a ÉAœa“e ”»¡¯¥·i ¬w»·Ða“e ”ŸB·³“¡”a.');
      end;
      if at(32,61) then begin
         Print(7,' µ¡Ça¹¢·e £¡ˆÐe »³”e·¡»¡ e ˆº—µA“e  áŸ¡ˆa');
         Print(7,'´¢ˆe šá´áa¬á   a¤ó “wb·¡ ·¶“e ¸a•¡ ·¶”a‰¡');
         Print(7,'Ða”áŠ…¶a.');
      end;
      if at(50,56) then begin
         Print(7,' µ¡Ça¹¢·  a·i·e ”ŸB· q•·½¢µA ·¶¯s“¡”a.');
         Print(7,'‹a—i· ¢‹¡“e ¯¡¶¥À§·e ˆõ—iª…·¡œa  ¶Ÿ¡µA‰A');
         Print(7,'¶áÑs·¡ –A»¡“e ´g¯s“¡”a.');
      end;
      if at(44,31) then begin
         if (not getbit(5)) or getbit(6) then begin
            Print(7,' ·¡ ”ŸBµA“e ¡¡– 4 ˆ· ”ŸB·a¡ ˆa“e ‰A·¡');
            Print(7,'Ëaˆa ·¶¯s“¡”a. ‹a º—, 2 ˆ· ‰A·¡Ëaˆa ·¡ ¬÷');
            Print(7,'´eµA ·¶¯s“¡”a.');
         end else begin
            Print(7,' »¡‹q ”w¯¥·e ¶œa’¯a ‰A·¡ËaŸi Àx‰¡ ·¶“e ˆõ');
            Print(7,'ˆ{·e•A,  ‹aœý”a¡e ¸áÓ ¬÷º“±·i  ea ¥¡¯³¯¡');
            Print(7,'¶a.');
         end;
      end;
      if at(36,19) then begin
         Print(7,' ‰¡” ÂAˆw·  a¤ó¬aµv”å  A—a ´eÈaA¯a· ´a');
         Print(7,'—i·¡ ¯¡‰·ˆe·i ñ´á  ·¡ ­A‰ ´á—¥ˆaµA¬á ¬i‰¡');
         Print(7,'·¶”a‰¡ —i´ö¯s“¡”a.');
      end;
      if at(41,21) then begin
         Print(7,' ­A¬wµA“e  ÇaŸ¡¯aÈiµA  µaœáˆa»¡ Ó±·i ¥··¥Ðe');
         Print(7,'¢‰»©·¡ ·¶¯s“¡”a.  ˆa¸w ˆwbÐe µwÑ¥· ÇaŸ¡¯a');
         Print(7,'Èi·e  ¡¡—e ¸â·i ÐeŒá¤åµA ·AÁA·¡Èi ¯¡Åa ¤áŸ¥');
         Print(7,'”a”áŠ…¶a. ‹aˆõª… e ´a“¡œa ÑÁµq· ÇaŸ¡¯aÈi‰Á');
         Print(7,'ÐeÌa· ÇaŸ¡¯aÈi ˆ{·e ‰·‰b¶w ÇaŸ¡¯aÈi,  ­¡ÑÅ');
         Print(7,'· ÇaŸ¡¯aÈi ˆ{·e ­¡ÑÅ¶w ÇaŸ¡¯aÈi•¡ ·¶‰¡, Ã¡');
         Print(7,'ža¶w‰Á  ‹a ·¡¶A· ¶w•¡¡ ³a·¡“e ˆõ•¡ ·¶”a‰¡');
         Print(7,'—i´ö¯s“¡”a.');
      end;
      if at(41,19) then begin
         if (not getbit(4)) then begin
            Print(7,' ¹A ¬—ˆbµA“e ”w¯¥·¡ »¡‹qÐaa‰¡ Ða“e ·©·¡ µ°');
            Print(7,'»¡ ´g”a‰¡ ¥³“¡”a.  §¡¢ Ëa©¹¢·¡ ´¡ e¯aœó‰¡');
            Print(7,'Ñ¡¸å¸â·¡œa“e Ða»¡ e  ´a¢œå ·¡·A´ô·¡ ¥A¯aÌá');
            Print(7,'¬÷·i Ã±‰·Ðaa Ð–‰V¯s“¡Œa?  ”w¯¥·e »¡‹q ¶¥·¥');
            Print(7,'·e ¡¡ŸeÀ  ‰i‰Á e·i ˆa»¡‰¡  ¦…ˆÐa‰¡ ·¶”a“e');
            Print(7,'¬—ˆb·i ´eÐa¯³“¡Œa? ¹± ”á ‹¼·¡ ´i´a¥¡‰¡ Ð•·');
            Print(7,'Ða“e ˆõ·¡ »¥¸÷Ðe ¶w‹¡œa‰¡ ¥³“¡”a.');
         end else begin
            Print(7,' ”w¯¥·¡ Ëa©¹¢·i ¡iÐe ˆõ·e  Ò­AµA µ¡¸ñ·a¡');
            Print(7,'q·i ˆõ·³“¡”a.');
         end;
      end;
      if at(36,21) then begin
         if (not getbit(5)) then begin
            Print(7,' ·¡®á•¡ ÉAœaµA“e  ´a»¢ ·¥ŸA· ¢…¡w·¡ ¨èÃ¡»¡');
            Print(7,'¡µÐ–¯s“¡”a. ˆá‹¡µA“e Å¡¥©Ëa¹¢·¡ »¡¤Ða‰¡ ·¶');
            Print(7,'‹¡ ˜¢…µA ´a¢•¡ ¸ó‹eÐa»¡ ¡µÐ–”å ˆõ·³“¡”a.');
            Print(7,'ˆa‹¡ eÐa¡e ¤å¤åÓ¡ ½¸‰a aµ¡‰¥ Ða“¡Œa¶a.');
         end else begin
            Print(7,' ”w¯¥ ”â¦…µA  ·¡¹A“e ·¡®á•¡ ÉAœaµA•¡ ·¥ˆe·');
            Print(7,'¢…¡w·i ¨èÃ©® ·¶‰A –A´ö¯s“¡”a.');
         end;
      end;

   end;

   if mapname = 'Gaea' then begin

      if at(37,39) or at(40,37) or at(41,41) then Grocery;
      if at(37,10) or at(40,12) or at(41,15) then Weapon_Shop;
      if at( 9,39) or at(12,41) then Hospital;
      if at(12,15) or at(15,12) then About_Class;
      if at(12,11) then Sell_EXP;

      if at(25,9) then begin
         Print(7,' ”w¯¥·¡ '+player[1].name+'œa“e ¬aœq·¡µ¡?');
         Print(7,'  ea¬á ¸÷ i ¤eˆs­¡.  a“e ·¡‰µ· ¸åÊ¯w·¥');
         cPrint(7,11,'','•A‘A¥©œa','œa‰¡Ðaµ¡.  ¬a¸aŸi ›uÐa“e a· ·¡Ÿq');
         Print(7,'µA¬á ´i ® ·¶—u·¡  a“e   …­¥ ¸åÊµA¬á e·e');
         Print(7,'´á“a ’ŠµA‰A•¡  »¡»¡ ´g­¡.  a“e ·¡‰µµA¬á');
         Print(7,'·¡®á•¡ ÉAœa· Å¡¥©Ëa¹¢·i ¸÷¤éÐa‰¡ ¯¥”ŸB·i');
         Print(7,'ˆÀâÐi ·©Ð—·i Àx‰¡ ·¶´ö­¡.  ˆa ”w¯¥· ·©');
         Print(7,'Ð—µA ÀqˆaÐaa“e•A ´á˜ý‰A ¬—ˆbÐaµ¡?');
         m[0] := '';
         m[1] := 'ÅáÓ¡ ¯wœbÐa‰V­¡';
         m[2] := 'Ða»¡ e ¸åÊ¯w·e Ï©¶a´ô­¡';
         if Select(200,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '•A‘A¥©œa';
                  sex := male;
                  class := 5;
                  classtype := sword;
                  level := 10;
                  strength := 20;
                  mentality := 5;
                  concentration := 6;
                  endurance := 18;
                  resistance := 12;
                  agility := 15;
                  accuracy := 17;
                  luck := 10;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 0;
                  shield := 0;
                  armor := 3;
                  potential_ac := 3;
                  sword_skill := 0;
                  axe_skill := 0;
                  spear_skill := 0;
                  bow_skill := 0;
                  shield_skill := 0;
                  fist_skill := 60;
                  Modify_Item(k);
                  PutMap(25,9,44);
                  setbit(43);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
               Print(7,'Ÿi ‹¡”aŸ¡»¡¶a.');
               exit;
            end;
         end
         else asyouwish;
      end;

      if at(11,36) then begin
         Print(7,' ¸á“e ·¡‰µµA¬á Á¡‹s a¤ó·i ¤¶“e  ÄaÍIœaœa');
         Print(7,'‰¡ Ðs“¡”a.  ¬a¯© ¡A·¡»¡¡¬á· ¹A “wb·e ´a');
         Print(7,'»¢  g·¡ ¦¹¢Ðs“¡”a.  ‹aœ¬á  ”w¯¥—i‰Á ÐqA');
         Print(7,'¯©¸åµA¬á  g·e ˆõ—i·i ¤¶‰¡ ¯¼¯s“¡”a. ¹Aˆa');
         Print(7,'·©Ð—µA ¡´á•¡ –A‰V¯s“¡Œa?');
         m[0] := '';
         m[1] := '‹aœý”a¡e Ðe¤å •·Ð—Ð ¥¡‰V­¡';
         m[2] := '”w¯¥·e ´a»¢ £¡®‚Ða“¡ ‰¥œeÐaµ¡';
         if Select(150,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := 'ÄaÍIœa';
                  sex := female;
                  class := 1;
                  classtype := magic;
                  level := 2;
                  strength := 5;
                  mentality := 15;
                  concentration := 20;
                  endurance := 10;
                  resistance := 19;
                  agility := 11;
                  accuracy := 17;
                  luck := 15;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 0;
                  shield := 0;
                  armor := 0;
                  potential_ac := 0;
                  sword_skill := 10;
                  axe_skill := 10;
                  spear_skill := 10;
                  bow_skill := 10;
                  shield_skill := 10;
                  fist_skill := 0;
                  Modify_Item(k);
                  PutMap(11,36,44);
                  setbit(44);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
               Print(7,'Ÿi ‹¡”aŸ¡‰V¯s“¡”a.');
               exit;
            end;
         end
         else begin
                 Print(7,' ‹aœý”a¡e Ði ® ´ôŠ…¶a.  ¹A ¯a¯w·¥ ´eÈaA¯a');
                 Print(7,'Jr.“±A¬á ¡´á¬÷µA ˆa¯¥Ò ¹½·e ¯a¯w·i ¡µ Àx');
                 Print(7,'´v‹¡µA ”w¯¥µA‰A ¦Èb —av”åˆå•A...');
         end;
      end;

      if at(42,25) then begin
         if getbit(3) and getbit(4) then begin
            Print(7,' ”w¯¥·¡ ¶¥Ðe”a¡e ¶Ÿ¡ ¬÷· ¦‚½¢µA ·¶“e ·¡®á');
            Print(7,'•¡ ÉAœa¡ ˆa“e ‰A·¡Ëa ·³ŠŸi µi´á º‰V­¡.');
            if not getbit(5) then begin
               Print(7,' ˆá‹¡µA“e Å¡¥©Ëa¹¢ e·¡ ¬i‰¡ ·¶·a“¡ ¹¡¯±Ða¯¡');
               Print(7,'µ¡.');
            end;
         end
         else case party.etc[21] of
            0 :
            begin
               Print(7,' µb¯¡ µÁ º´öŠ…¶a, '+player[1].name+'.');
               Print(7,' ”w¯¥·¡ »¡‹q ¥A¯aÌá¬÷µA ¶¥¸÷·i ˆa‰¡ ·¶“e º—');
               Print(7,'·¡œe ˆå ´i‰¡ ·¶­¡.  Ða»¡ e a· ¦Èb·i Ðaa');
               Print(7,'—i´á º»¡ ´g‰V­¡?');
               Print(7,' »¡‹q ¶Ÿ¡ˆa ·¶“e ˆa·¡´a ÉAœaµA“e ·¥ŸAµÁ µ¡');
               Print(7,'Ça¹¢·¡ ‰·¹¥Ða‰¡ ·¶­¡.  µ¡Ça¹¢—i·e ¶Ÿ¡ ”ŸB');
               Print(7,'·i ÒW”eÐa“e µaÐ—¸a—iµA‰A ´¢ˆe· Ï¡ÐŸi º‹¡');
               Print(7,'“e Ð–»¡ e ‹aŸ¡ ¢…¹A –I ˆõŒa»¡“e ´ô´ö­¡.  Ða');
               Print(7,'»¡ e ¥A¯aÌá¬÷· Àq¬aŸi —h‰¡a“¡ ¶Ÿ¡¬÷•¡ µ¡');
               Print(7,'Ça¹¢µA ”Ð¬á“e µ¶Aˆa ´a“¡œeˆé ´i´v­¡.  ¶');
               Print(7,'Ÿ¡ ¬÷µA¬á•¡  ¡y ¤å·e ‹a—i·i ¸÷¤éÐa¸a“e ·‰e');
               Print(7,'·¡ aµÖ»¡ e  ‹a—i· Ð´b¬÷·¡ ¥i¡ Ça»¡ ´g·e');
               Print(7,'•A”aˆa ‹a—i· ¸åµq¥w·¡ ¶Ÿ¡µA‰A µ«·i® ·¶”a');
               Print(7,'“e ¬—ˆbµA¬á  ¡¡–—i ‹¡Ï¡Ð µÖ”å‰A ¬a¯©·¡µ¡.');
               Print(7,'Ða»¡ e ¬aÈˆa ¬aÈ·¡“¡ eÇq Ðe¯¡ ¤a«¡ ‹a—i·i');
               Print(7,'¸÷¤éÐ´¡ e ¶Ÿ¡ˆa Íe´eÓ¡ »¡‰® ·¶‰V­¡.');
               Print(7,' µ¡Ça¹¢·i  ¸÷¤éÐ º»¡ ´g‰V­¡?   e´¢ ”w¯¥·¡');
               Print(7,'ÐáœbÐe”a¡e ”w¯¥µA‰A ·¡ ¬÷· ¥¡¢‰Àw‰¡Ÿi ˆ¤w');
               Print(7,'ÐaŸ¡”a.  ·¡‰µ º£¥·i ”ÎaÐaµa ”w¯¥µA‰A ¦Èb');
               Print(7,'Ða‰V­¡.');
               Print(7,'');
               PressAnyKey;
               inc(party.etc[21]);
            end;
            1 :
            begin
               Print(7,' µ¡Ça¹¢· µ¡ÇaÇ· e ¹AˆáÐe”a¡e ‹a—i· ¬aÒA“e');
               Print(7,'¦—ŠA –Iˆá¶a. ‹aŸ¡‰¡ µ¡Ça¹¢·  a·i·e ·¡ ¬÷·');
               Print(7,'•·½¢  éŸ¡µA ·¶­¡. ‹aœñ ¦ÈbÐaµ¡.');
            end;
            2 :
            begin
               Print(7,' ”w¯¥·¡œa¡e Ð‰º‰ ´i´v­¡. ‹a ”s¡ ¥¡¢‰Àw');
               Print(7,'‰¡Ÿi ”w¯¥µA‰A ˆ¤wÐa‰V­¡.  ˆá‹¡¬á  a·qŒõ Ï©');
               Print(7,'¶aÐe ˆõ·i ˆa¹a ˆa•¡¢Ða¯¡µ¡.');
               inc(party.etc[21]);
            end;
            3 :
            begin
               Print(7,' ¥A¯aÌá¬÷·¡ ·¶“e ´aÏa¡—¡ÉA ÉAœa¡ ˆa“e  ‰A');
               Print(7,'·¡Ëaˆa ”ŸB· ¦‚•·½¢ ¬e´b»¡µbµA ·¶­¡.  ¦—¡');
               Print(7,'”w¯¥·¡ ¬÷‰·Ða‹¡Ÿi ¤aœaµ¡.');
            end;
         end;
      end;

      if at(37,27) then begin
         Print(7,' µ¡Ça¹¢·e  ˆwÐe¸aˆa µ×·¡–A“e ¸åÉ··i  ˆa»¡‰¡');
         Print(7,'·¶¯s“¡”a.');
      end;
      if at(38,14) then begin
         Print(7,' µ¡Ça¹¢µA¬á ¹A”¡  a¤ó·i Ð—Ða“e ¸a“e  µ¡Ça');
         Print(7,'Ç·· ¶EÌi‰b·¥ ·¡Ç¡¡A·¡»¡ª…·³“¡”a.');
      end;
      if at(40,24) or at(40,27) then begin
         Print(7,' µ¡Ça—i·e  ¸÷ i ÂÐa‰¡ ”áœó‰¡ §¡¶á¬—¸â·¥ ¹·');
         Print(7,'¹¢·³“¡”a.');
      end;
      if at(37,24) then begin
         Print(7,' ¸á“e µ¡Ça¹¢µA ”Ð ® ‘e•·´e ¸÷¥¡®»³·i Ð–');
         Print(7,'´ö¯s“¡”a. ¹Aˆa ´i‰A–E ¤a¡“e, µ¡Ça· ¥¡¯a“e');
         Print(7,'µ¡ÇaÇ··¡¡a ‹a £»µA  µ¡Ça ´aÇ¡¡·ÇaµÁ µ¡Ça ´a');
         Print(7,'Ç¡¡A·¡»¡ˆa ·¶¯s“¡”a.  ™¡  ´aÇ¡¡A·¡»¡ £»µA“e');
         Print(7,'‹a·  a¤ó¹A¸a·¥ µ¡Ça  »¢·A¸áˆa 7 ¡w ·¶·a¡a');
         Print(7,'´aÇ¡¡·Ça £»µA“e 4 ¡w· µ¡Ça ¸å¬aµÁ ® ¯³ ™¡');
         Print(7,'“e ® ¤‚¡w· µ¡Ça ¥w¬aˆa ·¶¯s“¡”a.');
      end;
      if at(42,34) then begin
         Print(7,' —aœaÅ¡“¡´e¹¢·e  ·¥ˆe‰Á —aœ‰¥· Ëa‹¡œa”áŠ…');
         Print(7,'¶a.  ·¥ˆeÀáœñ – Ìi‰Á – ”aŸ¡ˆa ·¶·aa  áŸ¡');
         Print(7,'“e —aœ‰¥·  áŸ¡·¡¡a iˆµÁ ¡Ÿ¡ˆa ·¶‰¡  »¡');
         Print(7,'“w ™¡Ðe ¬w”wÓ¡ ‘¼”a‰¡ Ða”áŠ…¶a.');
      end;
      if at(27,15) then begin
         if not getbit(5) then begin
            Print(7,' Å¡¥©Ëa¹¢· ¤Èa¬÷ ˜¢…µA  ·¥ŸA· ¯¥­A‰ ˆ');
            Print(7,'Àâ·¡ “x´á»¡‰¡ ·¶¯s“¡”a. ‹a—i·i Š‰¥¢ ¯¡Åa Ðe');
            Print(7,'¯¡ ¤a«¡ ¬ ¯¡”Ÿi µi´á´¡ Ðs“¡”a.');
         end
         else begin
            Print(7,' ·¡¹A“e ¯¥­A‰ ˆÀâµA Ó±°á´¡ Ði ˜·³“¡”a.');
         end;
      end;
      if at(14,38) then begin
         Print(7,' ¸á“e Å¡¥©Ëa¹¢·¡ »¡¤Ða“e  ·¡®á•¡ ÉAœaµA ˆv');
         Print(7,'”aˆa ‰a¶ •¡ wÁa aµÖ¯s“¡”a. ‹a—i·e ¶A¦ ¹·');
         Print(7,'¹¢·¡ ‹a—i· µwµb µA —i´áµ¡“e ˆõ·i  ¶ ¯°');
         Print(7,'´áÐa”áŠ…¶a.  ‹a—i· ¢¸w·e ”aŸe ¹·¹¢¥¡”a ˆw');
         Print(7,'Ðaµa •¡¸áÓ¡ ”wÐ‹¡ Ó±—i´ö¯s“¡”a.');
      end;
      if at(24,29) then begin
         if (party.etc[5] = 0) or getbit(8) then begin
            Print(7,' ”w¯¥·¡ µ¡Ça·  i‰Á ‹i·i ¤¶…”a¡e ‹a—i‰Á ”');
            Print(7,'ÑÁˆa ·¡ž´á »©ˆá¶a.');
         end else begin
            Print(7,'  e´¢ ”w¯¥·¡ aµA‰A ‹q·i 2000ˆ º…”a¡e ‹¡Œá');
            Print(7,'·¡ ·©º·© eµA µ¡Ça· ‹i·i ˆaŸaÁa ºŸ¡”a.');
            m[0] := '';
            m[1] := '‹aœý‰A Ðs¯¡”a';
            m[2] := '¤¶‰ Ï©¶a“e ´ô·iˆõ ˆ{­¡';
            k := Select(100,2,2,FALSE,TRUE);
            if k = 1 then begin
               if party.gold < 2000 then begin
                  Print(7,' Ða»¡ e ”w¯¥µA‰A“e Â—¦…Ðe ‹q·¡ ´ôŠ…¶a.');
                  exit;
               end;
               party.gold := party.gold - 2000;
               Screen_Fade_Out(200);
               party.day := party.day + 7;
               party.hour := 11;
               party.min := 0;
               PlusTime(0,0,1);
               Print(7,' ·©º·©·¡ ‰w‰ÁÐ–”a.');
               PressAnyKey;
               OverLap(150,TRUE);
               Print(7,' ”w¯¥·e ·¡¹A µ¡Ça¹¢· ‹i·i ·ª·i ®ˆa ·¶­¡.');
               Print(7,' e´¢ ”w¯¥·¡ µ¡Ça¹¢·  i•¡ ¤¶‰¡ ¯¼”a¡e  ·¡');
               Print(7,'”ŸB· q•·½¢ ¬ñ·a¡ ˆa¯¡µ¡.');
               Print(7,' ‹aŸ¡‰¡, ”aŸe ­A ¹·¹¢·  i‰Á ‹i·i ¤¶‰ ®·¶');
               Print(7,'“e ‹©·¡ ¤e—a¯¡ ·¶·iˆá¶a.');
               setbit(8);
            end;
         end;
      end;
   end;

   if mapname = 'Ancient' then begin
      if at(10,17) or at(11,17) then begin
         Clear;
         Print(7,' ¯¥¸å ·³Š·¥—uÐe ‰µµA  ¯¥¸a·¥ˆõ ˆ{·e —aœaÅ¡');
         Print(7,'“¡´e –¡w·¡ ¬á ·¶´ö”a. ”w¯¥—i·i ¥¡‰¡ ¢¡œa‰¡');
         Print(7,'´i ® ´ô“e  i·i ¬á¡ »¡Œé·¡”á“¡ ¬áÊŸe ·¥ˆe');
         Print(7,'·  i¡ ”w¯¥µA‰A  iÐ–”a.');
         Print(7,'');
         Print(13,' µa‹¡“e  µA·¥­eËa ·¡§i“±· ¯¥¸å·i ¡¡¯¡‰¡ ·¶');
         Print(13,'“e ¯¥¸å·³“¡”a. ‹aŸ¡‰¡ ¶Ÿ¡ –‰·e ·¡‰µ·i ‰ÅŸ¡');
         Print(13,'Ða“e ¯¥•¡—i·³“¡”a.  ´á˜å ·©¡ µa‹¡µA µ¡­v¯s');
         Print(13,'“¡Œa?');
         m[0] := '';
         m[1] := '”w¯¥—i·i º‚·¡œá µÖ­¡';
         m[2] := 'µA·¥­eËa ·¡§i·i  eaœá µÖ­¡';
         k := Select(220,2,2,FALSE,TRUE);
         if k = 1 then begin
            enemynumber := 2;
            for i := 1 to 2 do begin
               joinenemy(i,48);
               enemy[i].name := '—aœaÅ¡“¡´e ¯¥•¡';
            end;
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            for i := 10 to 11 do PutMap(i,17,44);
            Scroll(TRUE);
            setbit(28);
         end else begin
            Print(13,' Ða»¡ e ‹a¦…·e ¤é°á ¡y ¤‚‘e ¸åµA •©´aˆa­v¯s');
            Print(13,'“¡”a. »¡‹q·e ‹a¦…·  i³q e q´a ¶Ÿ¡—i·i µ©');
            Print(13,'¤aŸa‰A »¡•¡Ða‰¡ ‰¯³“¡”a.');
         end;
      end;
   end;

   if mapname = 'Hut' then begin
      if at(15,9) then begin
         if getbit(204) or getbit(205) then begin
            Print(7,' ”w¯¥—i·¡ ˆa»¡‰¡ ·¶“e  Àw‰Á ˆsµµ·i ´á—¡¬åˆa');
            Print(7,'¥¥ ˆõ ˆ{·e•A...');
         end else if getbit(12) then begin
            Print(7,' ·¡¹A ”w¯¥·e  ¶Å eÐe Å¡¥©Ëa ‹i·i ·¡Ð Ði ®');
            Print(7,'·¶·i ˆó“¡”a.');
         end else begin
            Print(7,' a“e ´áŸ©˜¦Èá Å¡¥©Ëa¹¢µA‰A ¤i‰e–A´á ‹a—i');
            Print(7,'· ­¥µA ¸aœav¯s“¡”a.  »¡‹q·e §¡¢ ·¥ˆe·¡œa');
            Print(7,'“e ·¡·A¡ ‹a—i· »³”eµA¬á ­¡¶A–A´á ·¡‰µµA¬á');
            Print(7,'Ñ©¡ ¬i‰¡ ·¶»¡ e  Ðe˜“e Å¡¥©Ëa¹¢·  i‰Á ‹i');
            Print(7,'·i ¬a¶wÐa”å ¯¡¸é·¡ ·¶¯s“¡”a. ”w¯¥ Ñ¢¯¡ aµA');
            Print(7,'‰A ÁAb ÒA¥¢´¢ 5ˆ e º»¡ ´g‰V¯s“¡Œa?  ‹aœå');
            Print(7,'”a¡e  a“e ‹¡Œá·¡ ”w¯¥µA‰A Å¡¥©Ëa· ‹i·i ˆa');
            Print(7,'ŸaÁa º‰V¯s“¡”a.  ‹aˆõ•¡  ·©º·© eµA  i·³“¡');
            Print(7,'”a.');
            m[0] := '';
            m[1] := '¹½­¡, ‹aœý‰A Ðs¯¡”a';
            m[2] := 'ÁAb ÒA¥¢´¢ 5ˆ“e ¹±...';
            k := Select(220,2,2,FALSE,TRUE);
            if k = 1 then begin
               if party.item[1] >= 5 then begin
                  dec(party.item[5]);
                  Screen_Fade_Out(300);
                  Print(7,' ·©º·©·¡ »¡v”a.');
                  PressAnyKey;
                  setbit(12);
                  party.day := party.day + 7;
                  PlusTime(0,0,1);
                  OverLap(300,TRUE);
                  Print(7,' ”w¯¥·e ·¡¹A Å¡¥©Ëa ‹i·i ´i‰A –A´ö”a.');
               end else begin
                  Print(7,' Ða»¡ e ”w¯¥µA‰A“e ÁAb ÒA¥¢´¢ 5ˆˆa ´ô”a.');
               end;
            end;
         end;
      end;
   end;

   if mapname = 'Dome' then begin
      if at(26,14) then begin
         Print(7,' ¸á“e Äa£¡á¯aœa“e ‹a˜ ‹a ¬aœq·³“¡”a. ¶Ÿ¡');
         Print(7,'“e  ·¡  a·i·i  ''§¹· »¡¦—''·¡œa‰¡ ¡w¡wÐ–¯s“¡');
         Print(7,'”a. ''§¹''·e ¸÷·Ÿi ›uÐa‰¡ ''»¡¦—''·e ‹aˆõ·i »¡');
         Print(7,'Ç¡“e ˆõ ™¡“e »¡Ç¡“e ¬aœq·¡œe ›u·³“¡”a.  »b,');
         Print(7,'¸÷·Ÿi »¡Ç¡“e ¬aœq—i·  a·i·¡œe ›u·³“¡”a.');
      end;
      if at(13,27) then begin
         Print(7,' ”w¯¥·e ¶Ÿ¡—i· ¬—¡w· ·e·¥·³“¡”a. ™¡Ðe ¬');
         Print(7,'¡¶… ¡—a´e·¡ –A¯©  Â—¦…Ðe ˆa“w¬÷·i ˆx‰¡ ‰');
         Print(7,'¯¥¦…·³“¡”a.');
      end;
      if at(22,35) then begin
         Print(7,' ”w¯¥· ¶w‹¡·¶“e ‰i”eµA ¸÷ i ˆq‰bÐ–¯s“¡”a.');
      end;
      if at(39,29) then begin
         Print(7,' ”w¯¥‰Á µA·¥­eËa ·¡§i·¡ ¸÷ i »¥¸÷Ðe ¬å· ®');
         Print(7,'Ñ¡¸a·³“¡”a.');
      end;
      if at(19,54) then begin
         Print(7,' ”w¯¥·e §¡¢ ‰ÁˆáµA ¡—a´e· ¯±¥¢·a¡°á  Çe');
         Print(7,'¯©®Ÿi ¸á»©œö»¡ e ·¡¹A“e ¡w¯©‰·Ó¡ ·¡œå e­A');
         Print(7,'· Š­Aº·³“¡”a.');
      end;
      if at(30,63) then begin
         Print(7,' ¶Ÿ¡—i·e ÊÎa¡ ·¡‰µ· »¡•¡¸aŸi ¬åÂ‰Ð–¯s“¡');
         Print(7,'”a. ‹a“e ¤a¡ ¶Ÿ¡—i·i ·©´á¬á‰AÐe ¶wˆqÐe ¬a');
         Print(7,'œq, ¤a¡ Äa£¡á¯a³¡·³“¡”a.');
      end;
      if at(19,73) then begin
         Print(7,' ·¡‰µ ¬aœq—i·e  ¡¡– ”w¯¥µA‰A ‰¡ aµÁÐa‰¡ ·¶');
         Print(7,'‰¡  ”w¯¥·¡ ¶Ÿ¡ˆa ¡µ”aÐe ·©·i Ðº‰ˆáœa £¨‰¡');
         Print(7,'·¶¯s“¡”a.');
      end;
      if at(38,41) then begin
         if not getbit(202) then begin
            Print(7,' ”w¯¥· ¶w‹¡µA”Ðe  a· ¸b·e ¸÷¬÷·¡µ¡.  ¸a');
            cPrint(7,11,'·¡ˆé ¤h·a¯¡µ¡. ¶Ÿ¡ ¹¡¬w ””¡ aµ¡”å ','µA','');
            cPrint(7,11,'','¥¡“¡ ÇaŸ¡¯aÈi','·¡œeˆá¶a.');
            inc(party.crystal[4]);
            setbit(202);
         end else begin
            Print(7,' ¬w”wÓ¡ ŠáÐe ¢‰ˆå·¡“¡ ¹¡¯±Ð¬á ˆe»¢Ða¯¡µ¡.');
         end;
      end;
   end;
end;

Procedure TalkMode_Sub3;
begin

   Clear;

   if mapname = 'DracTown' then begin
      h := 0;
      if at(24,98) then begin
         h := 1;
         if getbit(13) then begin
            Print(7,' ´a“¡! ·¥ˆe·¡ µa‹© —i´áµ¡”a“¡...');
            PressAnyKey;
         end;
      end;
      if at(24,92) then begin
         h := 2;
         if getbit(13) then begin
            Print(7,' ·q? á“e... Ñ¡¡¡ ¬aÏ¡µE¯a ¹·¹¢·¡¡Š…. ·¡Àá');
            Print(7,'œñ Ða—wÐe Í¡·AŸAˆa  ˆqÓ¡  —aœaÅ¡“¡´e ¹·¹¢·');
            Print(7,'µwµb·i Ã±¤óÐa”a“¡ ‘©œsŠ….');
            PressAnyKey;
         end;
      end;
      if at(25,81) then begin
         h := 3;
         if getbit(13) then begin
            Print(7,' ‹aœ... á ¸i ev”a. Ðe¤å º‚´á¥Áœa.');
            PressAnyKey;
         end;
      end;
      if at(34,100) then begin
         h := 4;
         if getbit(13) then begin
            Print(7,' ”w¯¥·¡ ¶Ÿ¡Ÿi ¸÷¤éÐaœá µÖ”a“e   i·i —i´ö“e');
            Print(7,'•A ¢¥ˆa ¸i¡µ ´e ˆõ·e ´a“¡µ¡? µaÈŒõ ¶Ÿ¡ ¹·');
            Print(7,'¹¢‰Á ”w¯¥—i·e ´a¢œå ¸óÁ¢•¡ ´ô´ö“e•A ´b·Ÿi');
            Print(7,'Î‘·eÀ ·¡‰µ·a¡ µ© ·¡·Aˆa ´ô»¡ ´g­¡. ´á¼aÏ¡');
            Print(7,'”w¯¥·e ¶Ÿ¡—i· ¬w”ˆa ´e–A“¡  µa‹¡¬á °â ¢‰');
            Print(7,'œá a¯¡µ¡.');
            PressAnyKey;
         end;
      end;
      if at(36,93) then begin
         h := 5;
         if getbit(13) then begin
            Print(7,' ¶Ÿ¡ —aœaÅ¡“¡´e¹¢·e —aœ‰¥‰Á ·¥ˆe· ¸w¸ñ e');
            Print(7,'·i ¡¡´a »¥ÑÁÐe ¬—¡wÁA¡°á —aœaÅ¥·¡œa‰¡ º‰µa');
            Print(7,'¦Ÿa‹¡•¡ Ða»¡. »¡“w·e IQ 200µA¬á 250 ¸÷•¡¡');
            Print(7,'·¥ˆe· –¤ ¸÷•¡·¡‰¡ Ç¡•¡ Íw‹E 2m 30cm¡ ·¥');
            Print(7,'ˆe¥¡”a Ça‰¡  ‰A”aˆa iˆ•¡ ·¶´á¬á Ða“i·i a');
            Print(7,'“e ˆõ•¡ ˆa“wÐa‘A. ®¡w•¡ 150 µA¬á 200 ­A ¸÷');
            Print(7,'•¡œa¬á ·¥ˆe¥¡”a ¤i¸å ˆa“w¬÷•¡ šá´áa»¡.');
            Print(7,' ÓaÓaÓa... ´á˜? ·¡œ•¡ ¶Ÿ¡µA‰A ”ÐwÐa‰V“e');
            Print(7,'ˆa?');
            PressanyKey;
         end;
      end;
      if at(42,84) then begin
         h := 6;
         if getbit(13) then begin
            Print(7,' ¶µÁ~~  i¡ e —h”å ·¥ˆe·i »¢¸ó ·¡œý‰A ¥¡‰A');
            Print(7,'–A”a“¡... ¸÷ i ¯¥‹¡Ða‰A ¬—‰v‘A.');
            PressAnyKey;
         end;
      end;
      if at(33,82) then begin
         h := 7;
         if getbit(13) then begin
            Print(7,' Å·´i eÐe ˆõ—i·¡ ˆó•¡ ´ô·¡ —i´á µ¡”a“¡.  ¯±');
            Print(7,'¯±Ða”å ÀaµA ¸i•öŠ…. °a¶‘·¡a ˆé´á´¡»¡.');
            PressAnyKey;
         end;
      end;
      if at(41,70) then begin
         h := 8;
         if getbit(13) then begin
            Print(7,' ¼ó¼ó, ¤‰¡Ìa.');
            PressAnyKey;
         end;
      end;
      if at(32,22) then begin
         h := 9;
         if getbit(13) then begin
            Print(7,' a“e ·¡‰µ ÂA‰¡· ¢‰Ÿ¡Ðb¸a·©­A. ‹aŸ¡‰¡ a·');
            Print(7,'·¡Ÿq·e ´a·¥¯AÈa·¥·¡œa‘A. ˆa ´áŸ©˜  áŸ¡ˆa');
            Print(7,'µÅ¸åÓ¡ •©·¡´ö»¡.  ‹aœ¬á Ðw¬w ´a·¡—i·¡ aŸi');
            cPrint(7,10,'¥¡¡a ','"Du bist ein Stein"',' ·¡œa‰¡ ‘©Ÿ¡‰¥Ð–»¡.');
            Print(7,'ˆá‹¡¬á aµ¥ ·¡Ÿq·¡  ·¡Ÿq·¥ ''Einstein''·©­A');
            PressAnyKey;
         end;
      end;
      if at(40,33) then begin
         h := 10;
         if getbit(13) then begin
            Print(7,'  e´¢, ”w¯¥·¡ ¸aŽ ¶Ÿ¡Ÿi ¶áÑsÐa‰V”a¡e ¶Ÿ¡');
            Print(7,'“e ¬÷· ¬á½¢ ˆqµ¢µA ·¶“e ·¥ˆe—i·i ¡¡– ÀáÑw');
            Print(7,'¯¡Åa ¤áŸ©ÉA”a.');
            PressAnyKey;
         end;
      end;
      if at(16,19) then begin
         h := 11;
         if getbit(13) then begin
            Print(7,' aŸi µa‹¡¬á ÈiÂ‰ ¯¡Åa º¯¡µ¡.  ‹aœá¡e ¶Ÿ¡');
            Print(7,'ˆa¢…· ¥¡¢‰·i —aŸ¡Ÿ¡”a.');
            PressAnyKey;
         end;
      end;
      if at(16,35) then begin
         h := 12;
         if getbit(13) then begin
            Print(7,' a•¡ a«e ‘±·¡»¡ e  ”w¯¥·e ”á a«e ‘±·¡µ¡.');
            Print(7,'µá ‹aœý¡‰¡ ¢‰·a¡e ¶•»¡¶a.');
            Print(7,' ·aÐaÐaÐa.. ©©.. ÓaÓaÓa...');
            PressAnyKey;
         end;
      end;
      if at(15,48) then begin
         h := 13;
         if getbit(13) then begin
            Print(7,' ¶á”Ðe Ïa¡‹aœ á·¡¯¡¡a ·¡ ­A‰· Àw¯¡¸a·¡');
            Print(7,'¯¥ ¦…‰Á Èa·±¶¡Äá ´i§¡Aµ¡“e  •··©·¥¢‰·¡œa“e');
            Print(7,'¬—ˆb·¡ ´e—aµ¡?');
            PressAnyKey;
         end;
      end;
      if h > 0 then begin
         if not(h in [3,7]) then begin
            Print(7,' ”w¯¥ ´|µA ·¶“e —aœaÅ¡“¡´e¹¢·i  ”w¯¥·e ´á˜ý');
            Print(7,'‰A Ði ˆõ·¥ˆaŸi ¬åÈ‚Ða¯¡µ¡.');
            m[0] := '';
            m[1] := 'º‚µa ¤áŸ¥”a';
            m[2] := '‹a· ¬ia º…”a';
            k := Select(110,2,2,FALSE,TRUE);
            if k <> 1 then exit;
         end;
         enemynumber := 1;
         joinenemy(1,48);
         DisplayEnemies(TRUE);
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         PutMap(x+x1,y+y1,44);
         Scroll(TRUE);
         setbit(111+(h-1));
         exit;
      end;
      if at(15,57) then begin
         Print(7,' a“e —aœaÅ¥¹¢· É·Ã¡ÁA¹AµA ¤e¤iÐa”aˆa ·¡‰µ');
         Print(7,'µA ¤eµbºA¡ ¸sÑaµ¡‰A –A´ö­¡. ”w¯¥ µb¯¡ ·¡‰µ');
         Print(7,'· ÁA¹AŸi  ¸å¥¢ ¯¡Ç¡a“e‰A  º¡¢¸â·¥ˆõ ˆ{·e');
         Print(7,'•A, ¶Ÿ¡ Ó±·i ÐsÐ ¥¡“e‰A ´á˜ý‰V­¡.');
         m[0] := '';
         m[1] := '‹aœý‰A Ða»¡¶a';
         m[2] := '‹aˆå ´e–A‰V­¡';
         if Select(170,2,2,FALSE,TRUE) = 1 then begin
            join(48,6);
            PutMap(15,57,44);
            Silent_Scroll;
            Display_Condition;
         end
         else asyouwish;
      end;
      if at(22,24) then begin
         Print(7,' a“e  a»·ˆa Z Ÿi ¯©¹A¡ ¥¡´vºa.  ¸÷ i ¢®A');
         Print(7,'Ìi, ¢®A”aŸ¡, ¡ÅUËaº â·i ˆa»¡‰¡ ·¶”áŠ…¶a.');
         Print(7,' e´¢ ¸å¸—·¡ ·©´áa¡e ·¥Àå ´|¤a”aˆa ˆiœa»¡¡a');
         Print(7,'Â‰•·Ðe”a‰¡ —i´ö´á¶a. ‹aˆõª… e ´a“¡ºa.  ¸q¯©');
         Print(7,'Š¸w·¡ µiŸ¡¡e¬á ¡AÄe”á V •¡ aµ¡‰¡ §¡žwÍ¢Í¡');
         Print(7,'µA¬á“e  ‹aE”a·¡¹aˆa  “AÇaÏaŸ¡ËaµÁ ÐsÁAÐaµa');
         Print(7,'Â‰‰bÐa‰¡  ·BŠ…¥¥¦µA ¥¡Ñ¡ w·¡ Áa»¡¡a ‹aA·¡');
         Print(7,'Ëa  a»·ˆaµÁ §¡á¯a A ˆa ˆ{·¡ aÈaa‰¡  ‰·Š…');
         Print(7,'¥¥¦µA¬á Â‰•·Ðe •¢®Ÿ¡ 5 Ñw¹Aˆa ¹¡Š‚· Àw‰·');
         Print(7,'·i »¡Ç¡‰A –Aºa. ¢‰¥ ‹±¤b¬aˆa  e—e ÈŠ¥ V•¡');
         Print(7,'ÂAÒ· Ó w·a¡ ¤áË¡‰¡ ·¶ºa. ¢¡,£¨‹¡»¡ ´g“e');
         Print(7,'”a¡e Š‚¤w¦ ¸w‰Å“±A »¢¸ó ¢‰´á ¥¡¯¡ºa.');
         Print(7,'');
         PressAnyKey;
         Print(7,' ¹A ·¡Ÿq·¡ ¢¡¡Š¶a ? ¸á“e ®A•©·¡µA¶a.');
      end;
      if at(24,50) then begin
         if party.etc[5] = 0 then begin
            Print(7,' ‹a“e ”w¯¥·i ¯i¼â¥¥ Ò ”a¯¡ ¸a‹¡ Ði ·© e Ða');
            Print(7,'‰¡ ·¶´ö”a.');
         end
         else begin
            Print(7,' ”w¯¥·e »¡‹q ¡—a´eµA‰A ­¢‰¡ ·¶­¡.  ‹a“e Îa');
            Print(7,'¡e¸â·¥  ¬å·i Ð—Ða‹¡ ¶áÐ¬á  ”w¯¥·i ·¡¶wÐa‰¡');
            Print(7,'·¶“e ˆõ·¡µ¡.  ”w¯¥·¡ —aœaÅ¡“¡´e¹¢·i  ¸â”¯¡');
            Print(7,'Ði ·¡·Aˆa ´ô­¡. ‹a—i·e ·¥ˆeµA‰A ´a¢œå Ï¡Ð');
            Print(7,'•¡ ˆe¬ó•¡ ´ô·¡ ¬i´aµÖ­¡. ‹a—i·¡ µA·¥­eËa ·¡');
            Print(7,'§i·i ®—¬wÐe”a“e ˆõ·¡  ¸÷¤é· ·¡·Aˆa –I ®“e');
            Print(7,'´ô­¡.  ”w¯¥·e µA·¥­eËa ·¡§i·i »¥¸÷·a¡  ea');
            Print(7,'¥¡‹¡œa•¡ Ð–­¡?  ”w¯¥·e ¶á¬å¸a ¡—a´e·  i e');
            Print(7,'£¨‰¡ µA·¥­eËa ·¡§i‰Á ‹a· Â¹·¸a—i·i ¤ÀâÐa');
            Print(7,'‰¡ ·¶“eˆáœe  i·¡µ¡.  ”w¯¥·e ´áŸ©˜¦Èá µA·¥');
            Print(7,'­eËa ·¡§i‰Á  ´b·e a«a”a‰¡  ¬a¬wŠa·B·i ¤h´a');
            Print(7,'µÖ”åˆé ´a¯¡µ¡? »¥Ÿ¡Ÿi ¡¡ŸeÀ ”e»¡ ¶áµA¬á ˆa');
            Print(7,'ŸaÃ¡“e”¡ ¤¶¡a  ‹aˆõ·i »¥¯©¡ ¤h´a—i·¡‰¡');
            Print(7,' áŸ¡­¢µA ¬‰v”å‰A ¤a¡ ÑÁ‹e·¡´ö”å ˆõ·¡µ¡.');
            Print(7,'');
            PressAnyKey;
         end;
      end;
      if at(67,21) then begin
         if party.etc[5] = 0 then begin
            Print(7,' ‹a“e ”w¯¥·i ¥¡”á“¡ ¶A¡eÐ ¤áv”a.');
         end else begin
            case party.etc[24] of
            0..1 : begin
                      Print(7,' ‹a“e ”w¯¥·i Ó©u ¥¡”á“¡ ¶A¡eÐ ¤áv”a.');
                      inc(party.etc[24]);
                   end;
               2 : begin
                   if getbit(13) then begin
                      Print(7,' a“e —aœaÅ¡“¡´e¹¢· ”µ´å¸a¶a. aµA‰A“e ”w');
                      Print(7,'¯¥· £¡œˆa ¥¡·¥”aµ¡.  ‹aœáa  ‹aˆõ·e á¢a');
                      Print(7,'¢¬á¶… ˆõ·¡‹¡µA Ðq¦¡ ´Á‹¡Ði ® ´ô­¡.');
                      inc(party.etc[24]);
                   end;
                   end;
               3 : if getbit(13) then begin
                      Print(7,' ¹½­¡, ´‹¡Ð º‰V­¡.  ”w¯¥·e ‰¨ µA·¥­eËa ·¡');
                      Print(7,'§i“±·i  ea‰A –Iˆá¶a. ‹aŸ¡‰¡ ¡—a´e·i ¤¯¥Ða');
                      Print(7,'a“e ¬åÈ‚·i Ði»¡•¡ ¡¡Ÿa“e ®…ˆe·¡ ”aˆaµ© ˆõ·¡');
                      Print(7,'µ¡.  ‹a˜· ¬åÈ‚·e ”w¯¥· ‰i i·i Ça‰A –áÓe—i');
                      Print(7,'ˆõ·¡µ¡.');
                      inc(party.etc[24]);
                   end
              else begin
                      Print(7,' ‹a“e ”w¯¥·i Ó©u ¥¡”á“¡ ¶A¡eÐ ¤áv”a.');
                   end;
            end;
         end;
      end;
      if at(14,105) or at(15,106) then begin
         if getbit(13) then begin
            Print(13,' ¸qŒe, áÓ—i·e ’Š¡? ·¡ ´e·a¡ —i´áˆi ®');
            Print(13,'·¶“e ˆõ·e —aœaÅ¡“¡´e¹¢ ª…·¡”a. °â ¢‰œáaœa.');
            m[0] := '';
            m[1] := '¸â‰Á °a¶…”a';
            m[2] := '‹a· ¢‰œá¬å”a';
            k := Select(170,2,2,FALSE,TRUE);
            if k <> 1 then exit;
         end;
         enemynumber := 5;
         for i := 1 to 4 do joinenemy(i,49);
         joinenemy(5,51);
         DisplayEnemies(TRUE);
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(103);
         PutMap(14,105,44); PutMap(15,106,44);
         Silent_Scroll;
      end;
      if at(47,61) or at(48,61) then begin
         if getbit(13) then begin
            Print(13,' ·¡‰µ·e áÓˆ{·e ·¡¤w·¥·e ¸é” —i´áˆi ® ´ô');
            Print(13,'“e ‰µ·¡”a. ‹aœ•¡ {Œa»¡ —i´áˆaa Ðe”a¡e a');
            Print(13,'µÁ· ¬a¬—‰i”e·¡ q´v·iª…·¡”a.');
            PressAnyKey;
         end;
         enemynumber := 8;
         for i := 1 to 7 do joinenemy(i,49);
         joinenemy(8,52);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(102);
         for j := 59 to 61 do
         for i := 47 to 48 do PutMap(i,j,44);
         Silent_Scroll;
      end;
      if at(27,54) then begin
         if getbit(13) then begin
            Print(13,' µ¡! µA·¥­eËa ·¡§i“±·¡¯¡µa! ‹a”· ·¡Ÿq·a¡');
            Print(13,'¸á—iµA‰A Ì¤Ÿi ¡wÐa­¡¬á.');
            PressAnyKey;
         end;
         enemynumber := 8;
         for i := 1 to 4 do joinenemy(i,49);
         for i := 5 to 6 do joinenemy(i,50);
         joinenemy(7,47);
         joinenemy(8,53);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(101);
         for i := 24 to 27 do PutMap(i,54,44);
         Silent_Scroll;
      end;
      if at(84,59) then begin
         if getbit(13) then begin
            Print(13,' ˆa  ‰×œe¸aœa‰¡ ¦‰Ÿ¡“e ·¡·AŸi  áÓ—iµA‰A');
            Print(13,'¥¡µaº»¡. ¸a,  u ¹± ¥Áœu!');
            PressAnyKey;
         end;
         enemynumber := 8;
         for i := 1 to 7 do joinenemy(i,53);
         joinenemy(8,54);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(100);
         for j := 59 to 61 do PutMap(84,j,44);
         Silent_Scroll;
      end;
      if at(79,88) then begin
         if getbit(13) then begin
            Print(13,' a“e áÓ—i‰Á ˆ{·e  ¥¡¢‰ ´¢Èi¸a—i·i ¹AˆáÐa');
            Print(13,'‹¡ ¶áÐ ¥¡¢‰Àw‰¡ ´|·i »¡Ç¡‰¡ ·¶“e  Ïa¡¯aËa');
            Print(13,'—aœaÅ¡“¡´e·¡”a. a· —‹¡µÁ ÐeÌa‰·‰bµA“e ´a');
            Print(13,'¢ ¸áÐw•¡ Ða»¡ ¡µÐa‰¡ aˆa ˜é´á»© ˆõ·¡”a.');
            PressAnyKey;
         end;
         enemynumber := 8;
         for i := 1 to 7 do joinenemy(i,47);
         joinenemy(8,55);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(99);
         for i := 79 downto 77 do PutMap(i,88,44);
         Silent_Scroll;
      end;
      if at(59,48) then begin
         if getbit(13) then begin
            Print(13,'  õ¡¡Ÿa‰¡ išá‰¡ ·¶“e ·¥ˆe—i´a —i´áœa. a“e');
            Print(13,'¬÷¸å¬a· ¡wµŸi ˆé‰¡  —aœaÅ¡“¡´e¹¢‰Á ¶Ÿ¡·');
            Print(13,'µ×·i ¶áÐ °a¶‰ ˆõ·¡”a.');
            PressAnyKey;
         end;
         enemynumber := 4;
         for i := 1 to 2 do joinenemy(i,51);
         joinenemy(3,56);
         joinenemy(4,52);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(98);
         for i := 59 to 61 do PutMap(i,48,44);
         Silent_Scroll;
      end;
      if at(73,40) then begin
         if getbit(13) then begin
            Print(13,' ‘Aˆa ”á ·¡¬w ·¡ ´e·a¡ —i´áˆi ® ´ô“e ·¡·A');
            Print(13,'“e ¤a¡ ˆa ·¶‹¡ ˜¢…·¡”a.  ˆa  e—e a·');
            Print(13,'ÑÅ¬w­¢µA¬á á“e ¯a¯a¡· “wbµA ”Ðe §¡´Ÿi');
            Print(13,'“a©® ¤cµA ´ô·i ˆõ·¡”a.');
            PressAnyKey;
         end;
         enemynumber := 1;
         joinenemy(1,57);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(97);
         for i := 73 to 75 do PutMap(i,40,44);
         Silent_Scroll;
      end;
      if at(94,37) then begin
         if getbit(13) then begin
            Print(13,' a“e ´aÇ¡—aœaÅ¡“¡´e·¡œa‰¡ Ða“e µa‹¡ ÂAˆw·');
            Print(13,'¶w¬a·¡”a.  ™¡Ðe  —aœaÅ¡“¡´eÇ·· ¤w·i »¡Ç¡“e');
            Print(13,'‰wÑ¡”¸w·¡”a.  áˆ{·e ¸a—i·e  a· “wb·a¡');
            Print(13,'Â—¦…Ó¡ ¹AˆáÐ ¤áŸ©® ·¶”a.');
            PressAnyKey;
         end;
         enemynumber := 8;
         for i := 1 to 4 do joinenemy(i,53);
         for i := 5 to 7 do joinenemy(i,51);
         joinenemy(8,58);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(96);
         for i := 94 to 96 do PutMap(i,37,44);
         Silent_Scroll;
      end;
   end;

   if at(102,21) and (not getbit(95)) then begin
      Clear;
      Print(13,' a“e  ‘Aˆa ¡¢Îa¡Ða“e  —aœaÅ¡“¡´e¹¢· µ×·¡');
      Print(13,'”a.  ´a a ·¡‰µµA ¬i´a q·e ¶Ÿ¡ ¹·¹¢· ¸åÊ');
      Print(13,'¬a—i·e ˆá· ´ô·i ˆõ·a¡ ´e”a. ¥¡·¡”a¯¡Ï¡ »¡');
      Print(13,'‹q á· ´|µA“e  aµÁ ˆa—a —aœaÅ¡“¡´e 3¡w ¤c');
      Print(13,'µA“e ´ô”a.  á“e ·¡ ‹¡ÒAŸi ‘½Ã¡»¡ ´g‰¡ ¤e—a');
      Print(13,'¯¡  aŸi ³aœá›aa¬á  —aœaÅ¡“¡´e ¹·¹¢·i ¡i w');
      Print(13,'¯¡Ç¡a Ði ˆõ·¡œeˆå  ´i‰¡ ·¶”a.  Ða»¡ e »¡‹q');
      Print(13,'a· Íe·¡ ¦‰Ÿ¡Ða”a‰¡  ˆa »¥”a“e ˆõ·e ´a“¡');
      Print(13,'”a.  a µb¯¡ ¤e—a¯¡ áÓ—i·i Ì¤ ¯¡Åa¬á ¶');
      Print(13,'Ÿ¡ ¹·¹¢·i ¹¥­¢ ¯¡Ç¡a‰¡ Ï©¬a¸â·¡”a.');
      Print(13,' ·¡¹A a· ›u·i ´i´v·i ˆõ·¡œa £¨“e”a.  ‹aœñ');
      Print(13,'·¡¹A ‰i¸å·¡”a!');
      PressAnyKey;
      PutTile(5,4,44); PutTile(5,3,53);
      delay(500);
      PutTile(4,5,44); PutTile(4,6,53);
      delay(200);
      PutTile(6,5,44); PutTile(6,6,53);
      delay(300);
      PutTile(5,5,42); PutSprite(5,5,12);
      delay(1500);
      PutSprite(4,5,15); PutSprite(6,5,19);
      PutTile(5,5,42); PutSprite(5,5,17);
      PutSprite(5,4,16);
      PutSprite(4,4,14); PutSprite(6,4,18);
      PressAnyKey;
      enemynumber := 4;
      for i := 1 to 3 do joinenemy(i,50);
      joinenemy(4,59);
      repeat
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then Clear;
      until party.etc[6] = 0;
      setbit(95);
      PutMap(102,20,44); PutMap(102,21,42);
      PutMap(101,21,44); PutMap(103,21,44);
      Silent_Scroll;
      Clear;
      Print(7,' ”w¯¥·e  a»¡ b ¸â·¥  —aœaÅ¡“¡´e¹¢· µ×·i Àá');
      Print(7,'Ã¡Ð–”a.  ‹¡«q·i ˆqÂ»¡ ¡µÐeÀ •©´a aµ¡a‰¡');
      Print(7,'Ði˜ ˆs¸a‹¡ e•A´ô“e ´qÓb·¡  ¬÷ ¸åÁAŸi –á”ü');
      Print(7,'‹¡ ¯¡¸bÐ–”a.  ‹aµÁ •·¯¡µA ¸÷ÁA¦‰¡w· ¡¢­¡Ÿ¡');
      Print(7,'ˆa ´á—¡µA¬åˆa —iaµÖ”a.');
      Print(7,'');
      Print(13,' a“e  —aœaÅ¡“¡´e¹¢· ®Ñ¡w·¡”a.  áÓ—i·e');
      Print(13,'á¢a Çe ¯©®Ÿi aµA‰A ¸á»©œö”a. a“e º‚´á');
      Print(13,'ˆe  —aœaÅ¡“¡´e¹¢· ¥¢®Ÿi ¶áÐ  áÓ—i·i ·¡');
      Print(13,'­A¬wµA¬á ­¡¡i¯¡Åa ¤áŸ¡aÐe”a. áÓ—i·e a·');
      Print(13,'¬w”ˆa ¸åÑa–A»¡ ´g“e”a. ·¡¿qµA¬á ¸b¥i·¥¬aa');
      Print(13,'Ð–“e‰A ¹½·i ˆõ·¡”a.');
      Print(7,'');
      PressAnyKey;
      enemynumber := 1;
      joinenemy(1,59);
      enemy[1].name := '—aœaÅ¥ ®Ñ¡w';
      enemy[1].specialcastlevel := enemy[1].specialcastlevel or $80;
      repeat
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then Clear;
      until party.etc[6] = 0;
      setbit(6);
      Clear;
      Print(15,' ”w¯¥·e —aœaÅ¡“¡´e¹¢·i ¡i w ¯¡Åv”a.');
   end;

   if mapname = 'Imperium' then begin
      if at(9,7) then begin
         Print(7,' µ¸åµA“e ¡´á¬÷ º£¥‰Á•¡  Šaµb Ð–´ö”a‰¡ Ða');
         Print(7,'“e•A  ¡y ¤‚‘e ¸å¦Èá“e ¢¯e ·¡·A·¥»¡“e ¡©œa');
         Print(7,'•¡ µ×œˆa µÅ¸åÓ¡ g‰a ¤áv´á¶a.');
      end;
      if at(8,35) then begin
         Print(7,' ·¡ ¬÷· º—´wµA“e  µA·¥­eËa ·¡§i“±· ·»¡ˆa');
         Print(7,'¸q—i´á ·¶¯s“¡”a.');
      end;
      if at(45,35) then begin
         Print(7,' ·¡‰µ· •¡¬á‰Å·e ¬‚”aŸe ¶w· ¥¡‰¡œaµ¡.');
      end;
      if at(24,39) then begin
         Print(7,' ”w¯¥·e ¡µ ¥¡”å ¬aœq·¡Š…¶a. ´a a µaÐ—¸a·¥ˆõ');
         Print(7,'ˆ{·e•A ¶Ÿ¡ ¬÷µA µ¥ ˆõ·i ÑÅµwÐaµ¡.');
      end;
      if at(26,39) then begin
         Print(7,' µa‹¡“e  µA·¥­eËa ·¡§i“±·  ¸a§¡¡°á ­A¶¡»¥');
         Print(7,'''·±ÍAŸ¡´ñ  a·¡á¬÷''·³“¡”a.');
      end;
      if at(16,28) or at(18,27) then Grocery;
      if at(32,27) or at(34,29) then Hospital;
      if at(18,18) then begin
         PutTile(5+x1,6+y1,47);
         PutSprite(5+x1,6+y1,24);
         Print(7,' ´e‘wÐa¯¡µ¡, '+player[1].name+'.');
         Print(7,' a“e  a· ‰A·±­¢· ¤á‹aŸi Àxˆáa e·¡•¡Ÿi');
         Print(7,'¹¡¸éÐa‹¡ ¶áÐ¬á  Ðw¬w ‰A·±­¢·i ˜á•¡“e ·¡ ‰A');
         cPrint(7,14,'·±· ¹A¸b¸a ','´e µw‹¡','œa“e ¬aœq·¡µ¡. ˜¡“e ¡');
         Print(7,'´á¬÷· ¥w¬a¡  ˜¡“e  ”aŸe ¹·¹¢· º£¥·a¡');
         Print(7,'‰­¢ ¥e¸wÐa¡a ·¡‰µ ¸á‰µ·i ˜á•©´a ”a“¥”aµ¡.');
         Print(7,' ”w¯¥·e ¤é°á ·¡ ‰A·±· ¤e ·¡¬w·i Ð–Š…¶a. a');
         Print(7,'“e ”w¯¥µA‰A  g·e ˆõ·i ¤aœa»¡“e ´g“e”aµ¡. ”a');
         Print(7,' e, ˆa ·¡ ‰A·±·i É·Ð  iÐa‰¡¸aÐa“e Ñe¯©¸â');
         Print(7,'·¥ º¹AŸi  ´i´a º´ö·a¡e Ða“e ¤aœ‘·¡ ·¶·iª…');
         Print(7,'·¡œaµ¡.');
         PressAnyKey;
         Silent_Scroll;
      end;
      if at(16,20) then begin
         Print(7,' ´e µw‹¡“±·¡ ‹aœá¯¡”å•A  ''™¡ ”aŸe »¡¯¢· ¬÷');
         Print(7,'¸å''·e ¶¥œ  éË¡ µE—··¡ ´a“¡´ö‰¡  ''”aÇa ¡A·¡');
         Print(7,'»¡ ¯©Ÿ¡´e Äa£¡á¯a''“e  Š…·³” ¯¡ˆe·¡ ‹s¤bÐ');
         Print(7,'¬á  éË¡ µE—··i  e—i»¡ ¡µÐ–”a‰¡ Ða“e•A  ·¡¤å');
         Print(7,'‰A·±·e ÑÂ¯©Ðe  éË¡ µE—··¡œa”áŠ…¶a.');
      end;
      if at(33,18) then begin
         Print(7,' ¸á“e  µ´å¸a¡¬á· “wb·i Ç¡¶“e º—·³“¡”a.');
         Print(7,'¸á· µ´å “wb·e ´a»¢ £¡®‚Ða»¡ e  ”w¯¥· £¡');
         Print(7,'œˆa ¹¡‹q·e µ{¥¡·³“¡”a.  ”w¯¥·e  á»¡´g´a º—');
         Print(7,'¶aÐe ¬åÈ‚· ®…ˆe·i  x‰A –I ˆõ·³“¡”a. ‹a˜·');
         Print(7,'¬åÈ‚µA ˜aœa  ”w¯¥·e Çe ¶…¡w· ¬e ‚·i ñ´á´¡');
         Print(7,'Ði ˆõ·³“¡”a.');
      end;
      if at(33,20) then begin
         Print(7,' ·¡‰µµA“e  ´e µw‹¡“±·¡  e—e ‰A·±—i·¡ ¥¡‰Å–A');
         Print(7,'´á ·¶¯s“¡”a.  Àõ¤å¼¡  e—e ''3D ˆå”q''·¡œa“e');
         Print(7,'¯¡£IA·¡­e ‰A·±· APPLE SOFT BASIC ‰Á 65C02');
         Print(7,'‹¡‰´á ­¡¯a Ïa¡‹aœ‘¦Èá  13¤å¼ ‰A·±·¥ ''™¡');
         Print(7,'”aŸe »¡¯¢· ¬÷¸å''‰Á  16¤å¼ ‰A·±·¥ ''”aÇa ¡A');
         Print(7,'·¡»¡ ¯©Ÿ¡´e Äa£¡á¯a'', ™¡ 17¤å¼ ‰A·±·¥ ''§¡');
         Print(7,'¸å ­¢·a¡''µÁ ˆ{·e ‰A·±·¡ ­¡¯aµÁ ÐqA ¥¡‰Å–A');
         Print(7,'´á ·¶¯s“¡”a.');
      end;
      if at(22,17) or at(28,18) then begin
         Print(7,' ºA­·Ðs“¡”a.  Ïa¡‹aœ£· ¯¡ˆe ‰Å‰¬w ¹A¸b¸a');
         Print(7,'ˆa ¸áÓ ˆa‰AŸi Ïa¡‹aœ£· Ða»¡ ¡µÐ–Š…¶a.');
         Print(7,'‹aœ¬á ¸áÓ ˆa‰A“e ¶…µw–A»¡ ´g¯s“¡”a.');
      end;
      if at(24,29) then begin
         Print(7,' ·¡ ´e·e ''§¡¸å· »¡¯¢''·¡œa“e ¯¥¸å·¡µ¡. µA·¥');
         Print(7,'­eËa ·¡§i“±· ·»¡ˆa ¸q—e ‰µ·¡‹¡•¡ Ða»¡¶a.');
      end;
      if at(26,29) then begin
         Print(7,' ·¡ ´e· – ¬aœq·e µA·¥­eËa ·¡§i“±· ·»¡Ÿi');
         Print(7,'Œ”p·e ¬aœq—i·¡»¡¶a.  ”w¯¥µA‰A  ‰iÅ¡ ˆá»µ i');
         Print(7,'˜a¶á“e Ða»¡ ´g·i ˆáµ¶a.');
      end;
      if at(22,24) then begin
         Print(7,'µA·¥­eËa ·¡§i“±·e  µ¸åµA ´aº ”â·¡ ‘¼·e Ñe');
         Print(7,'¸aµv´ö»¡¶a.  ™¡Ðe ¡—a´e‰Á•¡ ¢Àâ Ã¥Ðe ¬a·¡');
         Print(7,'µv´á¶a. ®¤‚‘e¸åµA ¡—a´e·¡ ¬å·¡œa“e ¸å¹AŸi');
         Print(7,'ˆé‰¡ ·¡ ­A‰Ÿi É·Ã¡ Ð–´ö»¡¶a. ¡—a´e· Ò‰ŸW');
         Print(7,'Ðe ¸÷Ã¡µA  ¡¡—e ”ŸB·e ÍwÑÁŸi ’Ÿ¡‰A –A´ö‰¡');
         Print(7,'‹a‰A á¢  eµe–E a á»¡  Ñe¸· ÍwÑÁŸi ´aº');
         Print(7,'”wµe¯¡ Ð¤áŸ¡‰¡“e ‹aˆõ·i »¡Ç¡a“e ¬—ˆb·e ¸ó');
         Print(7,'´á–…À  Ðw¬w qµA ·Ð ÍwÑÁŸi ¥¡¸w ¤h·aa“e');
         Print(7,'¬a¬w·¡ Ì—¤Ð¹vºa.  Ò­¥—i·e ‹s‹¡´¡  ¸a¯¥·');
         Print(7,'¹¡¬w·¡ ÓiŸ¥  Ï¡· ¥¡”s·a¡  ·¡œý‰A ÍwÑÁ¡¶…');
         Print(7,'­A¬w·¡ ¬—‰av”a“e ˆõ·i Œa }‰A ·¸´á¤áŸ¡‹¡ ¯¡');
         Print(7,'¸bÐ–‰¡  aÃ± ¡—a´e·e ‹aœå ¬aœq—iµA‰A ‰wˆb');
         Print(7,'¯±·i ¦Â‰a ¥¡¸a“e ·•¡¡  ¬¡¶… ˆ‘q·i •¡');
         Print(7,'·³Ð–ºa.  ‹aˆõ·¡ ¤a¡ ‹a”—i·¡ ''´b''·¡œa‰¡ ¤');
         Print(7,'¶… ˆõ—i·¡µ¶a.  ‹a˜ ¡—a´e· Â¬w¸â·¥ ''´b''');
         Print(7,'· ˆ‘q·i  ŠÁA¸â·¥ ''´b''·a¡  e—i‹¡ ¶áÐ ‹a');
         Print(7,'¬w»··¡ –A´áº‰ ¬aœq·i  ®­¡¢…Ð–ºa.  ¡—a´e·');
         Print(7,'Ã¥Š ”¦¦…·e  ‹a· ›uµA Àe¬÷ÐÖ»¡ e  ´a¢•¡');
         Print(7,'¸a¯¥·¡ ''´b''·i ”ÎaÐa“e ‹aœå µb·i  {´a  q—i');
         Print(7,'¡¦Èá §¡e¤h‰¡ ¸áº¤h“e µb·i Ðaa‰¡“e Ða»¡');
         Print(7,'´g´vºa. ‹a˜ aÈae ¬aœq·¡ ¤a¡ µA·¥­eËa ·¡');
         Print(7,'§i“±·¡µ¶a.  ‹a¦…·e µaÈŒõ »¡‘v”å Ò‰ŸWÐe ¡w');
         Print(7,'¬÷—i·i ¤áa–…À ´b· »³”¬÷·a¡ Š…Ÿ±Ð–»¡¶a.');
         Print(7,'¥¥¡w ™¡Ðe ¤áŸ¡‰¡ »¡‹q· ·¡Ÿq·i ¬a¶wÐa¡a  ¡');
         Print(7,'—a´e· ·©µA ¸â‹b •·ÀqÐ–´á¶a. ‹a· ¹¥¸ ˜¢…');
         Print(7,'µA  ¡´á ­A‰· ¬aœq—i·e  ´b·a¡¦Èá ¸a¯¥‰Á');
         Print(7,'ˆa¹¢·i »¡Ç¡‹¡ ¶áÐ  ¯a¯a¡ ¬å·i ¸aˆbÐa‰¡ Ñe');
         Print(7,'¸· ÍwÑÁµA ˆq¬aÐa¡a  ‹a ÍwÑÁŸi ·A»¡Ðaa ‘¡');
         Print(7,'bÐa“e ¸a­AŸi ˆa»¡‰A –Eˆáºa.  ¡—a´e·e ¬aœq');
         Print(7,'—i· ‰wˆb¯±·i ”á ¦Â‹¡‹¡ ¶áÐ  »¡‹q µA·¥­e');
         Print(7,'Ëa ·¡§i·¡ µaœá ‰µµA¬á ·¡œå ¸áœå ŠÁA¸â·¥ ´b');
         Print(7,'Ð—·i ·©¬q‰¡ ·¶”a‰¡ ˆá»µ·a¡ ­¡¢…·i ÌáËaŸ¡‹¡');
         Print(7,'¯¡¸bÐ–‰¡  ´áŸ©˜¦Èá Ša·B‰Á¸÷µA ‹aœå ¬a¬w·i');
         Print(7,'¯±´á ý´á  ´áŸe·¡ –A´á¬á•¡ ¬å·i »¡Åa´¡ Ðe”a');
         Print(7,'“e ˆ‘q·¡ ´ô´á»¡»¡ ´g•¡¢ ÐµÖ´á¶a.');
         Print(7,'');
         PressAnyKey;
      end;
      if at(27,26) then begin
         Print(7,'¡—a´e·e ¬åµA ”Ðe á¢ ˆwÐe »³Àb ˜¢…µA º—');
         Print(7,'”Ðe ¯©®Ÿi ¸á»©œöºa. ¤a¡ ”w¯¥·i ¯¡Åa¬á µ¡');
         Print(7,'Ça, Ëa©, Å¡¥©Ëa, —aœaÅ¡“¡´e  ·¡  ‘A ¹·¹¢·i');
         Print(7,'¡i w¯¡Ç¥‰A ‹a ¯©®µ¶a.  ¡—a´e·e ·¥ˆe·i ·¡');
         Print(7,'³‰A Ða‰¡¸a ´aÏa¡—¡ÉA ÉAœa· Ëa©¹¢·i ¡©´a');
         Print(7,'‰¡  ‹a‰µµA ¥A¯aÌá¬÷·¡œe ¸åÁ¡‹¡»¡Ÿi ˆå¬éÐ–');
         Print(7,'ºa. ‹a‰µ·e ·¥ˆeµA‰A ””eÓ¡ ·A¶wÐe ¸a¶¥·i ¹¡');
         Print(7,'”iÐ–‰¡ ‹a¡·¥Ð ¡—a´e· Íw·e ¬w”wÓ¡ ‘¼´a¹v');
         Print(7,'´á¶a. ‹aŸ¡‰¡ ÂA‹eµA“e ”a¯¡  a»¡ b q·e Ëa©');
         Print(7,'¬÷·i ‰·‰bÐaµa ´aÏa¡—¡ÉA ÉAœaŸi µÅ¸åÓ¡ ·¥ˆe');
         Print(7,'· ˆõ·a¡  e—i¸a“e ‰ÒB·i ­A¶‰¡ ¥A¯aÌá¬÷·');
         Print(7,'º£¥—iµA‰A ¡wwÐ–ºa. ¥A¯aÌá¬÷ ¬aœq—i·e ÑA¡');
         Print(7,'·¥·¡œe  a´¢·i Ëa©¬÷·a¡ ¤e·³Ð¬á  Ëa©º£¥');
         Print(7,'—iµA‰A Ìi´v´á¶a. »b, ®·³•¡ µ©Ÿ¡‰¡ Ëa©¹¢·i');
         Print(7,' a´¢ º—•¢¸a¡  e—i´á  a´¢ ‰·‹s¶¥·¥ ¥A¯aÌá¬÷');
         Print(7,'º£¥—iµA‰A ¥¢¹·Ða‰A Ðaa“e ·•¡µv´á¶a. ™¡Ðe');
         Print(7,'¥A¯aÌá¬÷· ˆw‰wÌa ­Ab·e ®¯¡¡ Ëa©¹¢· •·');
         Print(7,'Š‰µA Ã±·³Ðaµa ‹a—i·i ŠA³Ó¡‹¡ ¯¡¸bÐ–‰¡  aÃ±');
         Print(7,' ””¸â·¥ Ã±œ¢·i ¯¡¸bÐ–»¡¶a.  Ëa©¬÷·i Ã±');
         Print(7,'œ¢Ðe ·¡—i·e ¸÷ i ¸eÑ¢Ðe ®¤ó·a¡  Ëa©· Ó');
         Print(7,'¬—¸aŸi ÀáŸ¡Ðaµa ‹a—i· ¬a‹¡Ÿi ˜é´á›aŸ¡a Ð–');
         Print(7,'»¡ e ‰iŠ‚ Òa‰Á“e ¤e”¡ aÈaa¬á ”á¶‚ ”á Ëa');
         Print(7,'©¹¢·i ¦…‘¡µA ˜é‰A Ð–ºa. ‹aŸ¡‰¡“e •¡Ÿ¡´á ‹a');
         Print(7,'—iµA‰A ´¡¯s·i ”wÐ¬á ¥A¯aÌá¬÷·e ¬s¯¡ˆeµA ´a');
         Print(7,'®œa¸w·¡ –A‰¡  ‹s‹¡´¡ ¡¡—e º£¥·¡ Ó¬—·i ”w');
         Print(7,'Ða‰A –A´ö”å ˆáµ¶a.');
         Print(7,' ·¡ ·©·¡ ·¶·e Ò ¡—a´e·e ¡´á¬÷· º£¥—iµA');
         Print(7,'‰A ÍeÌa¸â·a¡ ­¡¯¢·i ´ivºa.  ¸a¯¥· ¸i¡µ·e');
         Print(7,'·eÍÐeÀ  ¥A¯aÌá¬÷·¡ ”wÐe ‰i‰Á e·i ¤aÈw·a¡');
         Print(7,'Ëa©¹¢µA ”Ðe ¸âˆ¯±·i ¦Â‰vºa.  ‹aŸ¡‰¡ ‹a');
         Print(7,'ˆõ·i  ”aŸe ¹·¹¢µA Œa»¡ ÑÂ¬e¯¡Åa  »¡‹qµAŒa»¡');
         Print(7,'·¡Ÿaœö”å ˆáµ¶a. ”w¯¥·¡ Ðe ·© ˜¢…µA ·¥ˆe·e');
         Print(7,'¡´á ­A‰µA ·¶“e 5ˆ· ”ŸB ¡¡–Ÿi  ­¥µA ý');
         Print(7,'‰A –A´öºa.  ´bµA ”Ðe ¸÷¤é·¡œe  ˆáÀwÐe ¡¢Îa');
         Print(7,'–áµA“e ·¥ˆe· µwÉ¡Ÿi ìÓ¡‰V”a“e ¸÷¥¢¸a· ´¡');
         Print(7,'¶b·¡ ®‘´á·¶´õ”a“e ˆõ·i ´i´a´¡ –Iˆáµ¶a.  ‹a');
         Print(7,'´¡¶b ˜¢…µA  ºA´ô“e  ® g·e Èa¹·¹¢ º£¥—i·¡');
         Print(7,'´b·¥·a¡ ¡©a §¡ÀqÐe ÂAÒŸi  x·¡Ða‰A–E ˆõ·i');
         Print(7,'”w¯¥•¡ ·¥¸÷Ða»¡¶a?');
         Print(7,' ·¥ˆe· ·³¸wµA¬á ¬—ˆbÐi ˜“e ¢‰¥ ”w¯¥·e µw');
         Print(7,'¶—·¡ºa. Ða»¡ e ¡¡—e ¹·¹¢· ‰Å¸ñµA¬á ¥¥ ”w¯¥');
         Print(7,'·e §¡¸÷Ðe ¸÷¥¢¸a· ¢–ˆb¯¡·©ª…·¡µ¶a. a·');
         Print(7,' i·i ‹¼·¡ ¬‹¡‰¡,  á»¡´g·e £¡œµA ·¶·i º—¶a');
         Print(7,'Ðe ¬åÈ‚µA Ñe¡wÐe Ìe”e·i Ða‹¡ ¤aœa‰V´á¶a.');
         Print(7,'');
         PressAnyKey;
      end;
   end;
end;

Procedure TalkMode;
begin
   if (mapname = 'Lore') or (mapname = 'Dark') then
      TalkMode_Sub0
   else if (mapname = 'Imperium') or (mapname = 'DracTown') then
      TalkMode_Sub3
   else if Map_Header.Tile_Type = town then
      TalkMode_Sub1
   else
      TalkMode_Sub2
end;

end.