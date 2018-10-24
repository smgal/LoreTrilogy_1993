Unit MystTal2;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystBatt, MystEnd;

 Procedure TalkMode_Sub0;


IMPLEMENTATION

Function sgn(eq : integer) : integer;
begin
   if eq > 0 then sgn := 1
   else if eq < 0 then sgn := -1
   else sgn := 0;
end;

Procedure TalkMode_Sub0;
begin

   Clear;

   if mapname = 'Lore' then begin

      if at(91,65) or at(94,68) or at(87,73) then Grocery;
      if at( 8,71) or at(14,69) or at(14,73) then Weapon_Shop;
      if at(86,12) or at(87,14) then Hospital;
      if at(16,64) then Sell_Item;
      if at(21,12) or at(25,13) then About_Class;
      if at(12,13) then Sell_EXP;

      { Inn }
      if at(12,49) then
         Print(14,' ·¡ ­A‰· Àw¯¡¸a“e ´eµw‹¡“±·¡¯¡¡a ‹a“e ¶á”Ðe Ïa¡‹aœ á·³“¡”a.');
      if at(15,55) then begin
         if not getbit(35) then begin
            Print(7,' ”w¯¥·¡ Ñ¢¯¡   ´a—i Äa‘¡Î¯aµÁ ˆ{·e ˆq¤w');
            Print(7,'·i ¬a¶wÐ–”å '+player[1].name+ReturnBJosa(player[1].name)+' ´a“¥ˆa¶a?');
            Print(7,' µb¯¡ ‹aœýŠ…¶a. ”w¯¥·¡ ¥A¯aÌá¬÷·a¡ ¶¥¸÷·i');
            Print(7,'ˆe”a“e  i·i —i´ö¯s“¡”a.  e´¢ µa·Aˆa ·¶·a¯¡');
            Print(7,'”a¡e   ´a—i·i ”w¯¥· ·©Ð—µA Àqˆa ¯¡Åa º');
            Print(7,'¯© ® ·¶‰V¯s“¡Œa? »¡‹q·e §¡¢ ¸é•¡ ºA¡ ¸s');
            Print(7,'Ña ·¶“e ¡±·¡»¡ e  ¶¥œ  ´a—i· Ž‘·e ¡´á');
            Print(7,'¬÷ ÂA· ¸å¬aˆa –A“e ˆõ·¡´ö¯s“¡”a.  ´a a »±');
            Print(7,'·e –A»¡ ´g·i ˆõ·³“¡”a. ¹A¤i ¦ÈbÐs“¡”a.');
         end
         else begin
            Print(7,' '+player[1].name+'“±. ¹A ´a—i·i ¸i ¦ÈbÐs“¡”a.');
         end;
      end;
      if at(22,50) then begin
         cPrint(7,11,' a· ·¡Ÿq·e ','´iÅ¡Ÿa','œa‰¡ Ðaµ¡.  a“e ·¡‰µ·');
         Print(7,'ˆñ¬a¡¬á a· ‹©·i ˆÀâÐaaÐaµ¡. ËbÓ¡ ”w¯¥');
         Print(7,'‰Á ÐqA ¥A¯aÌá¬÷· ¶¥¸÷·i Ða‰¡ ¯¼·e•A ”w¯¥');
         Print(7,'¬—ˆb·e ´á˜ý­¡?');
         m[0] := '';
         m[1] := '‹aˆá ¹½·e ¬—ˆb·¡Š…¶a';
         m[2] := '£¡´eÐa»¡ e ‹aœå ¹± ´ásŠ…¶a';
         if Select(150,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '´iÅ¡Ÿa';
                  sex := male;
                  class := 3;
                  classtype := sword;
                  level := 2;
                  strength := 15;
                  mentality := 5;
                  concentration := 6;
                  endurance := 12;
                  resistance := 15;
                  agility := 14;
                  accuracy := 16;
                  luck := 12;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := endurance * level * 10;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 3;
                  shield := 0;
                  armor := 1;
                  potential_ac := 2;
                  sword_skill := 40;
                  axe_skill := 0;
                  spear_skill := 0;
                  bow_skill := 0;
                  shield_skill := 0;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(22,50,44);
                  setbit(36);
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
      if at(22,54) then begin
         cPrint(7,11,' a“e ·¡‰µ· ‹¡¬a¡ ·¶“e ','£¡¸aŸa','œa‰¡Ðaµ¡.');
         Print(7,'”w¯¥· ·±¢µA •·ÀqÐe”a¡e  Çe µw‰×·a¡ µa‹¡');
         Print(7,'‰V­¡.');
         m[0] := '';
         m[1] := '‹aœñ ‹aœý‰A Ða¯¡µ¡';
         m[2] := 'Ða»¡ e ‹aˆå ¹± ‰¥œeÐaµ¡';
         if Select(140,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '£¡¸aŸa';
                  sex := male;
                  class := 2;
                  classtype := sword;
                  level := 2;
                  strength := 13;
                  mentality := 6;
                  concentration := 8;
                  endurance := 15;
                  resistance := 16;
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
                  weapon := 2;
                  shield := 1;
                  armor := 2;
                  potential_ac := 2;
                  sword_skill := 20;
                  axe_skill := 10;
                  spear_skill := 5;
                  bow_skill := 0;
                  shield_skill := 10;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(22,54,44);
                  setbit(37);
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

      { Pub }
      if at(13,27) then begin
         if player[1].sex = female then s := 'µa¬÷' else s := 'q¬÷';
         Print(7,' ˆá‹¡ '+s+'¦…, ´á¬á ´f·a¯¡»¡¶a.');
      end;
      if at(18,27) then
         Print(7,' ¶Ÿ¡ º¸ñ· ¡w¢‰·¥ Å¡Ÿ¡´a ¶á¯aÇ¡  u ¹± ¥¡¯¡‰V¯s“¡Œa?');
      if at(21,33) then
         Print(7,' ‰Á·q·e ¬qˆaÐa¯³¯¡¶a.');
      if at(18,38) then begin
         Print(7,' ¸a‘AŸi ¡µ ¥©º‰ ´i´v“e•A ”a¯¡ ¥¡‰A –A´öŠ….');
         Print(7,'¸a! ‹a ‹¡‘q·a¡ Ðe ¸e ¤h‰Aa. µÅ~~~¬µ !!');
         if party.etc[5] > 0 then begin
            Print(7,'');
            Print(7,' ”w¯¥· ¡¡¯s·i ¥¡“¡  ˆa ˆa·¡´a ÉAœa· ®');
            Print(7,'¬â ¶á¸á—a¡ ·¶·i ˜ˆa  ¬—ˆba“eŠ….  ¸a‘AŸi');
            Print(7,'•¡µÁº‰¡Ïe  a·q·¡ ·¶“e•A ¸a‘A“e ´á˜åˆa?');
            m[0] := '';
            m[1] := 'µb¯¡ ´eÈaA¯a”sŠ…¶a';
            m[2] := '´e•ö»¡ e ¬a´·Ða‰V¯s“¡”a';
            if Select(170,2,2,FALSE,TRUE) = 1 then begin
               k := 0;
               repeat
               inc(k);
               until (player[k].name = '') or (k = 6);
               if k < 6 then begin
                  with player[k] do begin
                     name := '´eÈaA¯a Jr.';
                     sex := male;
                     class := 4;
                     classtype := magic;
                     level := 15;
                     strength := 10;
                     mentality := 20;
                     concentration := 20;
                     endurance := 15;
                     resistance := 17;
                     agility := 19;
                     accuracy := 17;
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
                     armor := 2;
                     potential_ac := 0;
                     sword_skill := 60;
                     axe_skill := 30;
                     spear_skill := 30;
                     bow_skill := 0;
                     shield_skill := 0;
                     fist_skill := 0;
                     Modify_Item(k);
                     PutMap(18,38,47);
                     setbit(38);
                     Silent_Scroll;
                     Display_Condition;
                     Clear;
                  end;
               end
               else begin
                  Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š….  ”a·q ‹¡ÒAŸi');
                  Print(7,'‹¡”aŸ¡•¡¢ Ða»¡.');
                  exit;
               end;
            end
            else asyouwish;
         end;
      end;
      if at(13,32) then
         Print(7,' µb¯¡ ®‰·e Å¡Ÿ¡´a ¶á¯aÇ¡(­¡º)ˆa ÂA‰¡´¡.');
      if at(15,35) then
         Print(7,' ·q¡, ·q¡, Æ‰Æ‰Æ‰...');
      if at(18,33) then begin
         Print(7,' ·¡ ­A‰“e ”a¬õˆ· ”ŸB·¡ ·¶”a‰¡ Ða”áŠ…¶a.');
         Print(7,' ¡´á ”ŸB, ˆa·¡´a ÉAœa,  ´aÏa¡—¡ÉA ÉAœa,');
         Print(7,'·¡®á•¡ ÉAœa, ¶œa’¯a ÉAœaˆa ·¶”a‰¡ —i´ö¯s');
         Print(7,'“¡”a.');
      end;
      if at(10,30) then begin
         Print(7,'  e´¢ ”w¯¥·¡ ¥A¯aÌá¬÷·a¡ ˆaa Ðe”a¡e,  ˆa');
         Print(7,'·¡´a ÉAœaŸi ˆáÁa  ‹a ¬÷·¡ ·¶“e  ´aÏa¡—¡ÉA');
         Print(7,'ÉAœa¡ ˆa´¡ Ðs“¡”a.');
      end;

      { Prison }
      if at(50,11) then begin
         Print(7,' ”w¯¥·e ¸÷ i Ð—¶…·³“¡”a.  ¡—a´e“±·e Ðe ¤å');
         Print(7,'¬å‰¡Ÿ¥ Ï¡‰¡·¥µA ”Ð¬á“e  ¸é”¡ ¬a¡e ¯¡');
         Print(7,'Åa º“e ·©·¡ ´ô´ö“e•A  i·³“¡”a.');
      end;
      if at(53,11) then begin
         Print(7,' ”w¯¥·e ¡—a´e“±µA ·Ð¬á ¬åÈ‚ –A´á»¥ ·¥ˆe');
         Print(7,'·³“¡”a.');
      end;
      if at(41,10) then begin
         if party.etc[20] = 0 then
            Print(7,' Ëb¥iÐe ·©·¡ ´ô“eÐe ¶Ÿ¡ –‰·e Íw¬— µa‹¡¬á »¡‰ˆá¶a.')
         else
            Print(7,' a•¡ ¸a‘AÀáœñ ¡¡Ðñ·i Ða‰¡ ¯¼­¡.');
      end;
      if at(63,9) then begin
         Print(7,' a“e ”aŸe ¹·¹¢‰Á· ÑÁÐsµA ”Ðe À‚·i  ¤iˆe');
         Print(7,'Ðaa”aˆa ¬aÑw ¬å‰¡Ÿi ¤h´v¯s“¡”a. a“e ¸÷ i');
         Print(7,'´â¶‰Ðs“¡”a.  ¡—a´e“±·  i·¥»b ´b·i Ð—Ða“e');
         Print(7,'”aŸe ¹·¹¢‰Á· ÑÁÐs·e  ´b‰Á· ÑÁÐs·i  iÐa“e');
         Print(7,'ˆõ·¡œa“e ˆó“¡”a. ˆa ´a“e ¡y¡y· ¹·¹¢—i·e');
         Print(7,'Ð—i ¡Ã¡‹¡•¡ Ða»¡ e ‹aˆõ·e ‹a¸á ‹a—i· ­¢');
         Print(7,'¬÷·© ª…·¡»¡ ‰iÅ¡ ¥¥¬÷·¡ ´bÐe ˆõ·e ´a“³“¡”a.');
         Print(7,'¡—a´e“±·i ¶á¯¡Ðe ·¡‰µ· Ša·BÁA‰“e á¢a');
         Print(7,'¬å·i ˆw¹¡Ða¡a ´b·i ¤ÀâÐaa Ðs“¡”a. Ða»¡ e');
         Print(7,'´á“a ¸÷•¡· Ï©¶a´b•¡ ·¶´á´¡ Ða¡a ·¡œå Ša·B');
         Print(7,'¤w¯¢µA ·Ðe ÍwÑÁ“e ¸q¯¡ª…·¡»¡   aÃ±“e ¸a');
         Print(7,'ÁA¸â·a¡ ¦—ŠAÐ ¤áŸ©ˆó“¡”a.');
      end;
      if at(40,15) then begin
         Print(7,' å µ| ¤wµA ·¶´ö”å '+player[1].name+' ´a¡.');
         Print(7,' ·¡¹A ¹A¤ó ¡—a´e· Â—¯©Ðe ˆˆa –A´öŠ…. ‹a');
         Print(7,'ˆa º“e ”iÅ±Ðe ¬aÈwµA ¡Ÿ¡Ÿi Óe—a“e ‰b·¡œa');
         Print(7,'...');
      end;
      if at(61,15) then begin
         Print(7,' a“e ¸å‰Áˆa  g´a¬á ¬aÑw¬å‰¡Ÿi ¤h´v¯s“¡”a.');
         Print(7,'¡—a´e“±•¡ á¢Ða¯³“¡”a.  ¤ñºA´ô“e  ­A¬w·i');
         Print(7,' e—a“e ˆõ•¡ ¹½»¡ e a ˆ{·e ¹±•¡–‚µA‰A•¡ ¬a');
         Print(7,'Ñw·i ¬å‰¡Ða¯¡”a“¡...');
      end;

      { Grave }
      if at(72,78) then begin
         Print(7,' µa‹¡“e ¡´á¬÷· ¢a»¡·³“¡”a. Ðq¦¡ —i´áˆa');
         Print(7,'»¡  a¯³¯¡¶a.');
      end;
      if at(64,76) then begin
         Print(7,' §¡¬âµA ´á˜å ‹i·¡ ¸âÑa ·¶´ö”a.');
         Print(7,'');
         Print(7,'');
         Print(15,'   µa‹¡“e ¶á”Ðe µ´å¸a •A‘A§a· ¢a');
         Print(15,'     620‘e 8¶© 30·© µa‹¡µA ¸q—i”a');
         Print(7,'');
         Print(7,'');
         Print(7,' ”w¯¥·¡ ¸a­AÓ¡ ¥¡“¡ ¢a§¡· ´aœ½¢µA Ó£¡Ða');
         cPrint(7,11,'‰A ','27,6',' ·¡œa‰¡ ¬‰a¹a ·¶·q·i ´i´v”a.');
      end;

      { Citizen }
      if at(56,64) then begin
         Print(7,' ·¡ ­A¬wµA ¹¥¸Ða“e ¡¡—e ¬å· ”Îa¸a“e  ¡');
         Print(7,'—a´e“±·¡¡a ´b· ”Îa¸a“e µA·¥­eËa ·¡§i·³“¡');
         Print(7,'”a.');
      end;
      if at(59,82) then begin
         Print(7,' ­A¬w· ´b·e ¡¡– ·w»·–A´á´¡ Ðs“¡”a.  ´a a');
         Print(7,'‹aˆå ¡—a´e“± e·¡ Ði ® ·¶·i ˆó“¡”a.');
      end;
      if at(10,73) then begin
         Print(7,' ¡´á ”ŸBµA“e ·¡‰µ ¡´á¬÷‰Á ”ŸB· q•·½¢');
         Print(7,'µA ·¶“e œa¯aËa —¡Ã¡¬÷·¡ ·¶¯s“¡”a. ¡´á¬÷·e');
         Print(7,'»¡¯¢· ¬÷¸å·¡œe ›u·¡¡a  œa¯aËa —¡Ã¡¬÷·e ÂA');
         Print(7,'ÒŒa»¡ ¤áË¡“e ¸a—i· ¬÷·¡œe ›u·³“¡”a.');
      end;
      if at(80,23) then begin
         Print(7,' a“e ”ŸB· q•·½¢µA ·¶“e ¡Aá¯a ‹q‰×µA¬á');
         Print(7,'·©Ða‰¡ ·¶¯s“¡”a.');
      end;
      if at(24,37) then begin
         Print(7,' µ¡Ça¹¢‰Á Ëa©¹¢·e £¡ˆ ¹·¹¢·¡œa  ¶Ÿ¡µÁ“e');
         Print(7,'Àa¶¥·¡ ËiŸ¡»¡¶a.');
      end;
      if at(90,42) then begin
         Print(7,' Ëa©¹¢·e º¡ •·Š‰­¢µA ¬i¡a Ñ¡¸å¸â·¥ ¬÷Î‘');
         Print(7,'·i »¡‘v´á¶a.');
      end;
      if at(31,64) then begin
         Print(7,' µA·¥­eËa ·¡§i·e  ·¡ ­A¬wµA ´b·i ªŸ¡‰¡ ”a');
         Print(7,'“¡“e ´aº a«e ¸a·³“¡”a.');
      end;
      if at(90,82) then begin
         Print(7,' Àå¯¥· ”ŸB‰Á  ”»¡¯¥· ”ŸB·e  Çe ¬e ‚·i');
         Print(7,'‰w‰¡ a’´á¹a ·¶”a”å•A¶a.');
      end;
      if at(62,38) then begin
         Print(7,' Ëa©¹¢µA ·Ðe ¥A¯aÌá¬÷ Ã±‰··e µA·¥­eËa ·¡');
         Print(7,'§i·¡ ¤Ò ¹¡¹·Ðe ˆõ·¡œa‰¡  ¡—a´e“±·¡ ‹aœá');
         Print(7,'¯¡”áŠ…¶a.');
      end;
      if at(42,31) then begin
         Print(7,' ÇaŸ¡¯aÈi¡ ­¡ÑÅ ¯¡Ç¥ ¡y¡y· ¬—¢‰—i·e ¸é”');
         Print(7,'º·¥·i ¤¤eÐa»¡ ´g“e”a‰¡ Ða”áŠ…¶a.');
      end;

      { Soldier in Palace }
      if at(50,51) or at(52,51) then Print(7,' ”w¯¥· ¬÷‰··i »¥¯±·a¡ ‹¡¶¥Ðs“¡”a.');
      if (x in [48..54]) and (y in [31..37]) then begin
         if party.etc[20] < 3 then
            Print(7,' ´á¬á ¶Ÿ¡ ¬÷º“±·i  ea ¥¡¯¡»¡¶a.')
         else
            Print(7,'  e­A,  e­A,  e e­A, ¡—a´e  e­A');
      end;

      { Lord Ahn }
      if at(51,28) then
      case party.etc[20] of
         2 : begin
                Print(7,' a“e ¥A¯aÌá¬÷ ¶¥¸÷µA ˜aŸe  »¡¶¥¸aŸi  Àx‰¡');
                Print(7,'·¶´ö­¡. µaœá ¤w¡e·a¡ ®­¡¢…Ðe {µA ”w¯¥·i');
                Print(7,'¬åÈ‚Ða‰A –Eˆá¶a.  e´¢ ”w¯¥·¡ ¥A¯aÌá¬÷ ¶¥¸÷');
                Print(7,'·i ¬÷‰·Ÿ¡µA {…”a¡e  ”w¯¥· ¸å‰Á“e  iq·¡');
                Print(7,'´ôµA º‰V­¡.  ‹aŸ¡‰¡ ”w¯¥·¡ ¶¥Ða“e ¬k·i ¹A');
                Print(7,'‰·Ð º‰ ·´·•¡ ·¶­¡. ”w¯¥·¡ ºÂ‚·¡ –A´á µa');
                Print(7,'œá ¶w¬a—i·i Ðs­A ¯¡Ç© ®•¡ ·¶­¡. ”w¯¥·¡ ¬÷');
                Print(7,'‰·¸â·a¡ ·±¢Ÿi µÅ®Ða‹¡ ¶áÐe  ¸a‹q•¡ º‰V');
                Print(7,'­¡.  ¥A¯aÌá¬÷·  ¶áÃ¡Ÿi  ¸i ¡¡Ÿa‰V”a¡e   a');
                Print(7,'·i ¬aœq—iµA‰A ¢‰´á ¥¡¡e –Iˆá¶a.  ”aŸe ¬÷µA');
                Print(7,'¬á µ¥ ¶¥¸÷”µÁ  ¥iˆ¡ Ð—•·Ð•¡  ¬w‰Å´ô­¡.');
                Print(7,'‹aŸ¡‰¡  ˆa ”aŸe ¬÷· ¬÷º—iµA‰A•¡ ”w¯¥µA');
                Print(7,'‰A Ñ¡·Ÿi ¥AÎ‰´á º•¡¢ ¦ÈbÐ–·a“¡  ´aÏa¡');
                Print(7,'—¡ÉA ÉAœaŒa»¡ ˆa“e•A ¥i ´áa¶‘·e ´ô·iˆá¶a.');
                Print(7,'”w¯¥·i £¨‰V­¡.');
                Print(7,'');
                Print(11,' [ Ñ×‹q + 5000 ]');
                Print(7,'');
                PressAnyKey;
                party.gold := party.gold + 5000;
                inc(party.etc[20]);
             end;
         3 : begin
                Print(7,' ”w¯¥·e ´aÏa¡—¡ÉA ÉAœa· ¥A¯aÌá¬÷·a¡  »¡');
                Print(7,'‹q »b¯¡ ˜áa´¡ Ðaµ¡.');
             end;
         4 : begin
                Print(7,' '+player[1].name+', ¸÷ i ¸wÐe ·©·i Ðº´ö­¡.');
                Print(7,' ·¡¹A ”w¯¥·e µÅ¸åÐe ¸a·A· ¡±·¡µ¡. ·¡ˆå a');
                Print(7,'· ¬÷·œaµ¡.');
                Print(11,' [ Ñ×‹q + 40000 ] [ ‰wÐñÃ¡ + 200000 ]');
                party.gold := party.gold + 40000;
                for i := 1 to 6 do
                if player[i].name <> '' then
                   player[i].experience := player[i].experience + 200000;
                inc(party.etc[20]);
             end;
         5 : begin
                Print(7,' ”w¯¥µA‰A  Ðe ˆa»¡ ¦Èb·i  ”á Ð•¡ –A‰V­¡?');
                Print(7,'·¡ ·©·e ”w¯¥‰Á ˆ{·e µw¶——i e·¡  Ði ® ·¶‹¡');
                Print(7,'˜¢…µA  ”w¯¥µA‰A ¦ÈbÐa“e ˆõ·¡µ¡.  ´a»¢ ·¡');
                Print(7,'­A‰µA“e ·¥ˆe ·¡¶AµA Å¡¥©Ëa¹¢‰Á —aœaÅ¡“¡´e');
                Print(7,'¹¢·¡ ·¶­¡.  ‹a ¹·¹¢—i·e µ¡Çaa Ëa©ˆ{·e Ða');
                Print(7,'‹s ¹·¹¢µA §¡Ð¬á“e  ¶©—wÐe ¸åÊb·i ˆa»¡‰¡');
                Print(7,'·¶“e•A”aˆa —aœaÅ¡“¡´e¹¢ ˆ{·e ‰w¶µA ·¶´á¬á');
                Print(7,'“e ¶Ÿ¡¥¡”a ”á šá´áe »¡“w‰Á ¢…ÑÁŸi ˆa»¡‰¡');
                Print(7,'·¶­¡.  ‹a—i·e 2ˆ· ”ŸB·i Àa»¡Ða‰¡ ·¶·a¡e');
                Print(7,'¬á Ðw¬w ·¥ˆe—i·i ¤ÀâÐa‰¡ ·¶‹¡ ˜¢…µA ·¥ˆe');
                Print(7,'—i· »¥Â‰·i ¤wÐÐa“e ¶a­¡œa‰¡  Ði ® ·¶­¡.');
                Print(7,' e´¢ ‹a—i·¡ ¶Ÿ¡—i·¡ ·¶“e ”ŸB·i  Ã±¤ñÐe”a');
                Print(7,'¡e ´á˜ý‰A –Iœå»¡“e Â—¦…Ó¡ µ¬w–Iˆá¶a. ËbÓ¡');
                Print(7,'—aœaÅ¡“¡´e¹¢·¡ ”ñ¥a—e”a¡e ¡´á ”ŸB·i ¹A¶A');
                Print(7,'Ða‰¡“e ¡¡– ¸å¡i –Iˆõ·¡ ¨åÐe ·©·¥•A”aˆa ·¡');
                Print(7,'‰µ µb¯¡•¡ ‹aŸ¡ µ¡œ“e ”ÐwÐa‹¡ Ó±—iˆõ·¡µ¡.');
                Print(7,'‹a—i·¡ ®—¤Ða‰¡ ·¶“e ´b· ÑÁ¯¥ µA·¥­eËa ·¡');
                Print(7,'§i·¡ ‹a—i·i ¬å•·Ðaµa ·¡‰µ·a¡ Áa—i´áµÖ·i˜');
                Print(7,'Ÿi ¬w¬wÐ ¥Ö­¡?  ´a a  ®Àå‘e·i ·A»¡Ðµ¡”å');
                Print(7,'·¡‰µ· ÍwÑÁ“e ¬e¬eÓ¡ Œ´á¹a ¤áŸ© ˆõ·¡µ¡.');
                Print(7,'');
                inc(party.etc[20]);
                PressAnyKey;
             end;
         6 : begin
                Print(7,' ”w¯¥µA‰A ¦ÈbÐa‰V­¡.  Å¡¥©Ëa¹¢‰Á —aœaÅ¡“¡');
                Print(7,'´e¹¢·i ¬å¹A ‰·‰bÐaµa  ·¡‰µ· ÍwÑÁŸi ¥¡¸wÐa');
                Print(7,'‰¡  ¯¥”ŸB ˆÀâ·i ´|”w‹¡‰A Ðº¯¡µ¡.   e´¢');
                Print(7,'”w¯¥·¡ ‹a – ¹·¹¢·i ¡iÐº…”a¡e a“e ¶œa’');
                Print(7,'¯aÉAœaŸi ”w¯¥µA‰A ñ‰aº‰ ·´·•¡ ·¶­¡. ¹A¤i');
                Print(7,'¦ÈbÐaµ¡.');
             end;
         7 : begin
                Print(7,' •©´aµÖŠ…¶a. '+player[1].name+'.');
                Print(7,' µb¯¡ ˆa ¥¡“e ’…·e ¸÷ÑÂÐ–­¡.  ”w¯¥·¡œa¡e');
                Print(7,'¦…¡wÓ¡  ¶Ÿ¡µA‰A  ¯wŸ¡Ÿi ´e‰aº‰ˆáœeˆé ´i´v');
                Print(7,'­¡. ”w¯¥µA‰A º‹¡¡ ´¢­¢Ðe ¶œa’¯a ÉAœa•¡');
                Print(7,'‰¨ ”w¯¥· ­¥µA —i´áˆi ˆá¶a. ‹aŸ¡‰¡ ‹a˜ ”w');
                Print(7,'¯¥·e ‹a‰µ· ¬÷ºˆa –A“e ˆõ·¡µ¡.');
                Print(11,' [ Ñ×‹q + 100000 ] [ ‰wÐñÃ¡ + 2500000]');
                party.gold := party.gold + 100000;
                for i := 1 to 6 do
                if player[i].name <> '' then
                player[i].experience := player[i].experience + 2500000;
                PressAnyKey;
                Print(7,' Ða»¡ e  ‹a¸åµA  å¸á Ði ·©·¡ ¬—‰v­¡.  »¡‹q');
                Print(7,'¤Ÿ¡´åËa Ï¡Ïi»aµA¬á ””¸â·¥ ¤eœe·¡ ¤i¬—Ð–');
                Print(7,'“e•A ¨iŸ¡ »¥´sÐa»¡ ´g·a¡e  ”aŸe ¬÷·a¡Œa»¡');
                Print(7,'¤å»©»¡•¡ ¡¡Ÿaµ¡.  ·¡¤å· ¤eœe·e  aµA ”Ðe');
                Print(7,'¤eµb·±‰Á •·¯¡µA  ¬åµA ”Ðe •¡¸å·¡œa‰¡ ¤h´a');
                Print(7,'—i·¡‰¡ ·¶­¡.  ‹a—i· ·¡œå Ð—¶á“e µa»¡Œõ »¡');
                Print(7,'Åaµ¥ ÍwÑÁŸi Œ´á ¤áŸ¡a“e  µA·¥­eËa ·¡§i·');
                Print(7,' a»¡ b ¤i´b·¥ˆõ ˆ{­¡.');
                setbit(50);
                inc(party.etc[20]);
             end;
         8 : begin
                Print(7,' »b¯¡ ¤Ÿ¡´åËa Ï¡Ïi»a¡ ˆa¬á Í¢•··i »¥´sÐ');
                Print(7,'º¯¡µ¡.  ”w¯¥·¡ ‹a ·©·i {‰¡ •©´aµ¡¡e a');
                Print(7,'“e ”w¯¥µA‰A ‰·¸b· ¸b¶áµÁ ÐqA ¶œa’¯a ÉA');
                Print(7,'œaµA  ”w¯¥· ‰·Š‚·i ˆå¬éÐa•¡¢ ÐáœbÐ º‰V');
                Print(7,'­¡.');
             end;
         9 : begin
                Print(7,' ”w¯¥ ”âÈ‚µA  ­A¬w·e µÅ¸åÐe ÍwÑÁŸi ´è‰A –A');
                Print(7,'´ö­¡.  ‹aŸ¡‰¡ ´¢­¢Ðe”¡ ”w¯¥µA‰A ¶œa’¯a');
                Print(7,'ÉAœa· É·Ã¡Š¥‰Á ‰·¸b· Ã·Ñ¡Ÿi aº‰V­¡.');
                Print(7,' Â‚ÐaÐaµ¡, '+player[1].name+' ‰·¸b...');
                Print(7,' ‹aœå•A  £¡´eÐa»¡ e Ðeˆa»¡ ¦Èb e  ”á —i´á');
                Print(7,'º‰V­¡? ”w¯¥·¡ ¡i w¯¡Ç¥ ‘A¹·¹¢·¡ ¬a¯©·e µÅ');
                Print(7,'¸åÓ¡ ¬aœa»¥‰A ´a“¡µ¡. ‹a—i·e »¡‹q Ñe¸, º‚');
                Print(7,'´áˆe ‹a ¹·¹¢· ·»¡ˆa  Ðaa¡ ¢—Áa  ¸a¯¥·¡');
                Print(7,'·¶”å ”ŸBµA  ¶¥Ñ¥·¡ –A´á q´a·¶­¡.  ‹aˆõ—i');
                Print(7,'º—µA¬á“e  ¯a¯a¡· ·»¡¡ ·¡‰µ·i Ð·Ð µ¡“e');
                Print(7,'¶¥Ñ¥•¡ ·¶­¡.  ‹a ¶¥Ñ¥—i·¡ ·¡ ”ŸBµA —i´áµÁ');
                Print(7,'¬á ¶Ÿ¡µA‰A ¥¢®Ða‹¡ ¸åµA ¶Ÿ¡ˆa  å¸á ‹a—i');
                Print(7,'·i ¤i‰eÐaµa ˆwÐe Ó±­¢µA ¥··¥ ¯¡Åa ¤áa´¡Ða');
                Print(7,'µ¡. ‹aœ¬á ¦ÈbÐaˆå•A, ·¡ ÇaŸ¡¯aÈi ¥©·i ¤h');
                Print(7,'·a¯¡µ¡. ·¡ ÇaŸ¡¯aÈi ¥© ­¢·i —iµa”a ¥¡¡e µ¡');
                Print(7,'Ça, Ëa©, Å¡¥©Ëa, —aœaÅ¡“¡´e ¹·¹¢· ¶¥Ñ¥·¡');
                Print(7,'·¶“e ¸w­¡ˆa —aœáiŒá¶a. ‹aŸ¡‰¡ ‹a ¸w­¡µA¬á');
                Print(7,'‹a—i· ¶¥Ñ¥·i ¤i‰eÐaµa ÇaŸ¡¯aÈi ¥© ­¢µA ¥·');
                Print(7,'·¥ ¯¡Åa ¤áŸ¡¯¡µ¡. ‘A ¹·¹¢·i ¡¡– ¥··¥ ¯¡Åv');
                Print(7,'·i˜  ‹a ÇaŸ¡¯aÈi ¥©·i aµA‰A ˆa¹aµ¡¡e  ‹a');
                Print(7,'·¡Ò“e ˆa ´i´a¬á Ða‰V­¡.  ‹aŸ¡‰¡  ”w¯¥·');
                Print(7,'µwÉ¡·¥ ¶œa’¯a ÉAœa¡ ·¡•· ¯¡Åa º‰V­¡.');
                Print(11,' [ ÇaŸ¡¯aÈi ¥© + 1 ]');
                Print(7,'');
                PressAnyKey;
                inc(party.crystal[9]);
                inc(party.etc[20]);
             end;
        10 : begin
                Print(7,' ˆa º… ÇaŸ¡¯aÈi ¥©·i ·¡¶wÐaµa  ‘A ¹·¹¢·');
                Print(7,'¶¥Ñ¥·i ¡¡– ‹a ´eµA ¥··¥¯¡Åa¬á aµA‰A ˆa¹a');
                Print(7,'µ¡¯¡µ¡. ¢ ¦ÈbÐaµ¡.');
             end;
        11 : begin
                x := 51; y := 31;
                face := 1;
                if player[1].classtype = magic then inc(face,8);
                Delete_Scroll_Screen;
                delay(1000);
                Silent_Scroll;
                Print(10,' µ¡, '+player[1].name+' ‰·¸b!');
                Print(10,' ”w¯¥·e a·  a»¡ b ¦ÈbŒa»¡ Ò‰ŸWÐa‰A —i´á');
                Print(10,'º´ö­¡.  ·¡¹A“e ”w¯¥µA‰A ”á ·¡¬w ·¡œå ·©·i');
                Print(10,'¯¡Ç¡»¡ ´g‰V”a‰¡ ´¢­¢Ðaµ¡.   å¸á, ‘A ¹·¹¢·');
                Print(10,'¶¥Ñ¥·i ¥··¥Ðe ÇaŸ¡¯aÈi ¥©·i ·¡Ÿ¡ º¯¡µ¡.');
                PressAnyKey;
                for i := 5 downto 4 do begin
                   PutTile(5,i+1,42);
                   PutSprite(5,i,face);
                   delay(500);
                end;
                delay(1000);
                for i := 4 to 5 do begin
                   PutTile(5,i,42);
                   PutSprite(5,i+1,face);
                   delay(500);
                end;
                Print(10,' ·¡¹A“e ·¡ ®¸÷Š¯i·i µÅ¸åÓ¡ ¥··¥Ð¬á ”a¯¡');
                Print(10,'“e ‹a—i· ¶¥Ñ¥·¡ ¶Ÿ¡Ÿi ¶áÑsÐa»¡ ¡µÐa‰A Ð');
                Print(10,'´¡‰V­¡.');
                delay(1000);
                Print(7,'');
                Print(7,' ¡—a´e·  ­¥µA —iŸ¥ ÇaŸ¡¯aÈi ¥©·¡  ˆa¥s‰A');
                Print(7,'˜áµ¡Ÿa‹¡ ¯¡¸bÐ–”a. ¡—a´e·e ÀaÃq ´·­¥· ‹¡');
                Print(7,'b·i »wˆw ¯¡Åv‰¡ ÇaŸ¡¯aÈi ¥©·e ¦Š‰A ”i´aµ¡');
                Print(7,'Ÿa‹¡ ¯¡¸bÐ–”a. ‰¨·¡´á ÇaŸ¡¯aÈi ¥©·e ·¡‹iˆá');
                Print(7,'Ÿ¡“e µAá»¡ ‰··a¡ ¥eÐaµv”a.');
                Print(7,'');
                PutSprite(5,4,20);
                PressAnyKey;
                Print(10,' ¸a, ·¡¹A ·¡ˆõ·i ´a¢•¡ Š¹A Ði ® ´ô“e ‰µ');
                Print(10,'·a¡ ¥¡ ¤áa´¡‰V­¡.  ‹a‰µ·e ¤a¡ ¡´á ”');
                Print(10,'ŸB· »¡ÐaµA ·¶“e Ða•A¯a ÉAœaœa‰¡—i Ða“e ‰µ');
                Print(10,'·¡µ¡.');
                delay(1000);
                Print(7,'');
                Print(7,' ¡—a´e·¡ ´·­¥·i Ÿ¡¸a µAá»¡ ‰··e ¬á¬áÓ¡');
                Print(7,'£»·a¡ ˜é´á»¡‹¡ ¯¡¸bÐ–”a.  ‹aŸ¡‰¡“e ¤a”bµA');
                Print(7,'¯a¡a—a“e ˆõÀáœñ ˜w­¢·a¡ ¬aœa¹a ¤áv”a.');
                Silent_Scroll;
                PressAnyKey;
                Print(10,' ‹aœñ, ·¡¹A ”w¯¥·i ¶œa’¯a ÉAœa¡ ¥¡ º');
                Print(10,'‰V­¡.');
                PressAnyKey;
                PutTile(5,3,42);
                PutTile(5,4,54);
                Print(10,' ‹a¸åµA ”w¯¥·e ¬¡¶… ¡¡¯s·a¡ È´áiŒá¶a.');
                Print(10,'‹aœá‹¡ ¶áÐ¬á“e  ”w¯¥· ·©Ð——i‰Á a· ¯¥Ða');
                Print(10,'—i·¡ ¸aŸ¡Ÿi Ï¡Ðº¡´¡ e Ðaµ¡.  ‹a ·¡·A“e Àa');
                Print(10,'Àa ´ia —aŸ¡Ÿ¡”a.');
                PressAnyKey;
                for i := 2 to 6 do player[i].name := '';
                Display_Condition;
                for j := 3 to 5 do begin
                   PutTile(2,j*2,44);
                   PutTile(8,j*2,44);
                end;
                Print(7,' ¸q¯¡ˆe· Ã±¢‚·¡ Óiœö”a.');
                delay(3000);
                Print(7,'');
                Print(7,' »¡‹q  º¶áµA“e ´a¢•¡ ´ô”a“e ˆõ·i  ÑÂ·¥Ðe');
                Print(7,'¡—a´e·e  ˆs¸a‹¡ ”w¯¥·i Ð·Ð •¢¯±·i ¬a¶wÐa');
                Print(7,'‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e ‹¥¸w·i µÅ¸åÓ¡ Î‰‰¡ ·¶');
                Print(7,'´ö”å•A”aˆa ¡—a´e· ˆs¸b¯aœå ÂA¡eµA  ia—i');
                Print(7,'´á  ¤w´áŸi Ði ‹¡ÒA•¡ ´ô·¡  ‹aµA‰A •¢¯±®‰·i');
                Print(7,'”wÐaµv”a. ”w¯¥·e ‰¨ ”w¯¥· ¸a·A·¬aŸi ·°´á');
                Print(7,'¤áv‰¡ ¸÷¯¥·¡ ´a—bÐ»¡‹¡ ¯¡¸bÐaµv”a.');
                PressAnyKey;
                Print(10,' ¸÷ i £¡´eÐa‰A •ö‘A, '+player[1].name+'.');
                Print(10,' ”w¯¥·e  µa»¡Œõ aŸi ¶áÐ ·©Ð º´ö“e•A a');
                Print(10,'“e ”w¯¥µA‰A ·¡œý‰A Ði ® ¤cµA“e ´ô”a‘A. a');
                Print(10,'“e  Àá·q¦Èá ·¡£¡ ”w¯¥·i  »¡¡¢Ða‰¡ ·¶´ö»¡.');
                Print(10,'aµÁ· ‰Å‰Ÿi  e—i‹¡ ¶áÐ¬á  ”w¯¥·i ¬i·¥ºA');
                Print(10,'¡ ¡©´v”å ˆõ•¡ aµv‰¡,  Ðw¬w ÀåŸ¡´e‰Á Ê¯¡');
                Print(10,'¡  ”w¯¥·i ˆq¯¡Ða”å ¬aœq•¡  ¤a¡ aµv”a‘A.');
                Print(10,'»¡‹q· ”w¯¥·e  a ¡—a´e·i ¹A¶AÐa‰¡“e ¡w¯©');
                Print(10,'‰·Ó¡ ·¡ ­A‰ ÂAˆw· ¶w¬a·¡»¡. ˆa »¡‹q Ða');
                Print(10,'a“e ·¡´¡‹¡Ÿi ¸i —i´á¥¡‰A.');
                PressAnyKey;
                Print(10,' ·¡‰µ·e Ñe¸ á¢ ÍwÑÁˆa »¡­¢–A´á¬á ¬aœq—i');
                Print(10,'·¡ Ñe¸· ÍwÑÁŸi ¸åÑa ‰¡ a¶¡ Ðiº‰·i ¡¡Ÿe”a');
                Print(10,'‘A.  ‹aœ¬á ˆa ¬¡¶… ·©·i »¡‹q Ž£¡aÐa');
                Print(10,'»¡. ‹a ·©·¡œe ´á˜å ´b· Â¹·¸aˆa ·¡ ­A‰µA');
                Print(10,'aÈaa  ¬aœq—i·i ¶áÑsÐa‰¡ ´b·i Ìá›aa¬á ·¡');
                Print(10,'­A‰· ÍwÑÁŸi  i¬iÐaa‰¡ Ði˜ aµÁ ˆa ¬å');
                Print(10,'È‚Ðe ·¥¢‰· ÑÉ´¢·a¡ ­A‰“e ”a¯¡ ÍwÑÁŸi Àx');
                Print(10,'‰A–A‰¡  º£¥—i·e ”á¶‚ aµA‰A ˆq¬aÐa¡a ¬å·i');
                Print(10,'»¡Ç¡a ‘¡bÐe”a“e ¶w·©­A. ·¡œå ·©·i ˆa');
                Print(10,'Ž¡v”a“e ˆõ·i  ´a¢•¡ ´i»¡¡µÐe”a¡e a“e ¦…');
                Print(10,'¡wÓ¡  ÍwÑÁ· Š­Aº¡¬á· ¸aŸ¡Ÿi  ÑÂ¥¡Ða‰A');
                Print(10,'–E”a‘A.  µa‹¡¬á Ï©¶aÐe ¬aœq·e  ¤a¡ ¶áµA¬á');
                Print(10,' iÐe ''´b· Â¹·¸a''ˆa –I  ¬aœq·¡‘A.  Ða»¡ e');
                Print(10,'´a¢•¡ »¡¶¥Ða»¡ ´g·iˆáœeˆå  ¨åÐe ¬a¯©·¡»¡.');
                Print(10,'‹aœ¬á ­A‰Ÿi ¶áÑs Ði  eÐe “wb·i ˆa»¥  ”w');
                Print(10,'¯¥·i ·¡œå¯¢·a¡ i´á —i·¥ˆáœa‘A. ”w¯¥·e Ðw');
                Print(10,'¬w ´b·i Ìá›aŸ¡a  ·¡ ­A‰µA  ¤i·i Ÿ¡»¡ e');
                Print(10,'¤å¤åÓ¡ aµÁ ˆa ¬åÈ‚Ðe ¶w¬aµA ·Ð Ì¤Ða');
                Print(10,'‰A –A»¡. ‹aˆõ·¡ ¤a¡ ”w¯¥·¡ ·¡¹A »¡‰A–I ¶…');
                Print(10,'¡w·¡œa‘A.  ”w¯¥·e ·¡¹A ¯a¯a¡· ¸a·A·¬aµA');
                Print(10,'‰Å‰´ô·¡ ¶…¡wµA ¢ƒµa¬á Ð—•·Ða‰A –Iˆé­A. Ða');
                Print(10,'»¡ e Ì¤Ÿi á¢ ·¯¢Ði Ï©¶a“e ´ô‘A.  ÂA¹·');
                Print(10,'¸â·¥ ¯wŸ¡“e ”w¯¥·¡ Ða‰A  e—i´á º‰ÉA“¡Œa...');
                Print(10,'');
                PressAnyKey;
                Print(7,' ¡—a´e·e  i·i  aÃ¡¸a  ”w¯¥·i Ð·Ð  ¤‚¬‚·');
                Print(7,'ˆažŸi ªŸ¡¡a º¢…·i ¶A¶‹¡ ¯¡¸bÐ–”a.');
                delay(2000);
                PutTile(5,6,42);
                PutSprite(5,6,26);
                PutSprite(5,5,25);
                PressAnyKey;
                Print(10,' ”w¯¥·e ·¡¹A ´b· Â¹·¸a¡¬á· ÑwÁAŸi ˆxÂ');
                Print(10,'´ö”a‘A. 4 m ˆaœ·· Ç¡µÁ ˆwbÐe  ab·i ‰q§¡');
                cPrint(10,11,'Ðe ´b· ÂA” ¸åÊ¬a¡¬á...  ”w¯¥·e ·¡¹A ','‘A','');
                cPrint(10,11,'','Ça¡ e¬á','œe ·¡Ÿq·a¡  ·¡ ­A¬w· ÍwÑÁˆa µ¡œ');
                Print(10,'»¡­¢ –I ˜  ·¡ ­A¬w·i ¶áÑsÐaa aµ© ¶…¡w');
                Print(10,'·i ˆa»¡‰A –A´ö”a‘A.  ”w¯¥·e ‹a˜  ¶œa’¯a');
                Print(10,'ÉAœaŸi ‹¡¸ñ·a¡ ­Ab·i ¨èÃ¡‰A –Iˆé­A. ‹a˜');
                Print(10,'“e ”w¯¥·¡ ¶œa’¯a ÉAœa· º·¥·¡ –Iˆáœa‘A.');
                Print(10,'´a a ‹a˜¬á´¡  ˆa ”w¯¥µA‰A ¶œa’¯a ÉAœa');
                Print(10,'Ÿi º‰V”a“e ´¢­¢·¡ »¡Åa»© ˆé­A.');
                Print(10,'');
                Print(10,' ‹aœñ... ´e‘w, ‘AÇa¡ e¬á.');
                Print(10,'');
                PressAnyKey;
                PutTile(5,6,42);
                PutTile(5,5,42);
                Print(7,' ‘AÇa¡ e¬á¡ ¥eÐe ”w¯¥·e ‰·ˆe· Ëq·i É·Ð');
                Print(7,'”aŸe ‰·ˆe·a¡ ¨a¹a ¤áv”a.  ‹aŸ¡‰¡ ¡´á ­A');
                Print(7,'‰· ÍwÑÁˆa á¢ µ¡œ ·A»¡–I ˜  ”w¯¥·e ¶…');
                Print(7,'¡wµA ·Ð ·¡ ­A‰¡ a µ© ˆõ·¡”a.');
                PressAnyKey;
                Clear;
                Screen_Fade_Out(500);
                SoundOn := FALSE;
                mapname := 'UnderGrd';
                Load;
                x := 31; y := 21;
                PutMap(46,48,54);
                OverLap(400,FALSE);
                PutSprite(5,6,20);
                while (x <> 46) or (y <> 48) do begin
                   x := x + sgn(46-x);
                   y := y + sgn(48-y);
                   Scroll(FALSE);
                   PutSprite(5,6,20);
                   delay(300);
                end;
                mapname := 'Dome';
                Load;
                x := 26; y := 6;
                PutMap(28,21,53);
                OverLap(400,FALSE);
                PutSprite(5,6,20);
                while (x <> 26) or (y <> 14) do begin
                   x := x + sgn(26-x);
                   y := y + sgn(48-y);
                   Scroll(FALSE);
                   PutSprite(5,6,20);
                   delay(500);
                end;
                Scroll(FALSE);
                delay(5000);
                for y := 15 to 18 do begin
                   Scroll(FALSE);
                   delay(1000);
                end;
                delay(3000);
                for j := 11 downto 9 do begin
                   if j < 11 then PutTile(8,j+1,44);
                   PutTile(8,j,52);
                   delay(500);
                end;
                Print(13,' ´a¯a¡¡•A¶¯aµa,  ¤w‹q µAá»¡ ‰··¡ ·¡ ¤w·a');
                Print(13,'¡ —i´áˆa“e ˆõ·i ¥¡´v“e•A ´á˜ý‰A –Eˆõ·¥ˆa?');
                PressAnyKey;
                Print(12,' µ, ¡AÏ¡¯aÉ¡ÍIA¯a“±.  ‹aˆõ·e ¶¥Ñ¥·¡ ¥··¥');
                Print(12,'–E µAá»¡ ‰··¥•A  ¡—a´e·¡ »¡Ða­A‰¡ ¤áŸ¥');
                Print(12,'ˆõ·³“¡”a. ‹aœå•A ‹aˆõ·¡ Äa£¡á¯a³¡· ¡± ­¢');
                Print(12,'·a¡ —i´áˆv¯s“¡”a.');
                PressAnyKey;
                Print(13,' ‹aœ? ‹aœý”a¡e ¦…¡w Äa£¡á¯a³¡· ¸a­¥º—µA');
                Print(13,'¬á ¶¥Ñ¥·i ¥··¥ÐeÀ È´á a“e ´a·¡ˆa ËiŸ±´ô');
                Print(13,'·¡ ·¶·i ˆõ·¡”a. ‹a ´a·¡ˆa È´áv·i˜, ¶Ÿ¡');
                Print(13,'· Ó±·a¡ ¥··¥–E ¶¥Ñ¥·i Î‰´á ¤áŸ¥”a¡e ¶Ÿ¡');
                Print(13,'“e ‹a Ó±·i ·¡¶wÐ ­A‰Ÿi »¡¤Ði ® ·¶·i ˆõ');
                Print(13,'·¡”a. ÒÒÒ, ¡—a´e·e ¸÷ i  ÷À÷Ðe »µ·i Ð–');
                Print(13,'Š….');
                Print(13,' ¶Ÿ¡µA‰A •¡Ÿ¡´á ·¡œå ‹¡ÒAŸi º¡ ¤áŸ¡”a“¡..');
                PressAnyKey;
                End_Demo(1);
             end;
      end;
   end;

   if mapname = 'Dark' then begin

      if at(87,73) or at(94,68) or at(91,65) then Grocery;
      if at( 8,71) or at(14,69) or at(14,73) then Weapon_Shop;
      if at(86,12) or at(87,14) then Hospital;
      if at( 9,64) then Sell_Item;
      if at(82,16) then Medicine;
      if at(21,12) or at(25,13) then About_Class;
      if at(28,12) then Sell_EXP;

      if at(19,53) then
         Print(14,' ·¡ ­A‰· Àw¯¡¸a“e ´eµw‹¡“±·¡¯¡¡a ‹a“e ¶á”Ðe Ïa¡‹aœ á·³“¡”a.');
      if at(13,55) then begin
         Print(7,' ·¡¯³ ¡y‘e ¸åµA  ·¡‰µ·e  ‘AÇa¡ e¬áœe ¸aµA');
         Print(7,'·Ð Çe Ñ¥œe·¡ ·¶´ö¯s“¡”a.');
      end;
      if at(24,50) then begin
         Print(7,' ´e‘wÐa¯¡µ¡.');
      end;
      if at(13,27) or at(18,27) then begin
         Print(7,' µa‹¡“e Å¡Ÿ¡´a ¶á¯aÇ¡ˆa ¹A·© ¸i ÌiŸ³“¡”a.');
      end;
      if at(21,33) then begin
         Print(7,' ¶a»a·q·e á¢ Ði ·©·¡ ´ô´á¬á ˜a¦…Ðs“¡”a.');
      end;
      if at(18,33) then begin
         Print(7,' ”w¯¥  ¸÷ i ·¡¬wÐe ÀaŸ±·¡Š…¶a.  ˆá· 100‘e');
         Print(7,'¸åµAa ·³”å µµ·¥•A...');
      end;
      if at(13,32) then begin
         Print(7,' Ç¢Ç¢.. ¸÷ i ¶¯a¶… ¥¢¸w·i Ða‰¡ ·¶Š…¶a.');
      end;
      if at(18,38) then begin
         Print(7,' ¶a¬“e á¢ ˜a¦…Ðe ­A¬w· µe­¢·¡µA¶a.');
      end;
      if at(50,11) or at(53,11) then begin
         Print(7,' µaÈŒõ ‹e 20‘eˆe  ´a¢•¡ ·¡‰µµA ˆhÓ¡»¡ ´g');
         Print(7,'´vºa. ‹aœ¬á ¸á“e á¢ Ði ·©·¡ ´ô¯s“¡”a.');
      end;
      if at(72,78) then begin
         Print(7,' µa‹¡“e ¡´á¬÷· ¢a»¡·³“¡”a. Ðq¦¡ —i´áˆa');
         Print(7,'»¡  a¯³¯¡¶a.');
      end;
      if at(77,46) then begin
         Print(7,' ¡Aá¯a“e Í‰×·¡ –E»¡ 50‘e·¡ ñ´öºa.');
      end;
      if at(83,59) then begin
         Print(7,' œa¯aËa—¡Ã¡“e º£¥ —w¢·i  aÃ¥ ¸a e·¡ —i´á');
         Print(7,'ˆi ®·¶ºa.');
      end;
      if at(83,25) then begin
         Print(7,' 20‘e ¸åµA ´i§¡Aµ¡œa“e ¬aœq·¡ ·¡¬wÐe µ´å');
         Print(7,'¬áŸi q‰vºa. ˆá‹¡¬á ”aÇa ¡A·¡»¡œa“e ¬aœq·¡');
         Print(7,'aÈae”a‰¡ Ð–´ö“e•A ¯©¹A¡“e aÈaa»¡ ´g´v');
         Print(7,'´á¶a.');
      end;
      if at(68,61) then begin
         Print(7,' ”w¯¥—i· µµ·e ¸÷ i Ëb·¡ÐaŠ…¶a. 100‘e¸å ¬a');
         Print(7,'œq ˆ{´a¶a.');
      end;

      if at(50,51) or at(52,51) then begin
         Print(7,' ´e‘wÐa¯¡µ¡.');
      end;
      if (x in [48..54]) and (y in [31..37]) then begin
         Print(7,' ...');
      end;

      if at(51,28) then begin
         Print(6,' ¡—a´e!! ”w¯¥·e aŸi ‹¡´âÐa‰V­¡?  100‘e¸å');
         Print(6,'¿qµA  aŸi ·¡¶wÐaµa  ¢‰¡Ðe ‘A ¹·¹¢·i ¡i w');
         Print(6,'¯¡Ç¡‰A  e—i´ö”åˆõ•¡  i·¡µ¡.');
         Print(7,'');
         Print(7,' ”w¯¥·  i·¡ À {a‹¡•¡ ¸åµA  ¡—a´e·e ”a');
         Print(7,'‹sÐa‰A ¶AÁv”a.');
         Print(7,'');
         Print(9,' ‰wÑ¡¶¥, ‰wÑ¡¶¥ !!');
         Print(7,'');
         Print(7,' ®…ˆe ¡y¡w· ¶w¬aˆa º¶áµA¬á aµÁ ¡—a´e·i');
         Print(7,'ˆq°v”a.');
         PressAnyKey;
         enemynumber := 7;
         for i := 1 to 3 do joinenemy(i,69);
         for i := 5 to 3 do joinenemy(i,68);
         joinenemy(7,70);
         repeat
            DisplayEnemies(TRUE);
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then Clear;
         until party.etc[6] = 0;
         Clear;
         enemynumber := 5;
         for i := 1 to 3 do joinenemy(i,71);
         joinenemy(4,72);
         joinenemy(5,74);
         repeat
            DisplayEnemies(TRUE);
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then Clear;
         until party.etc[6] = 0;
         Clear;
         Print(15,' ”w¯¥·e —a—¡´á ®‚¸â ¡—a´e·i ¢‰Ÿ¡Áv”a.');
         PressAnyKey;
         End_Demo(3);
      end;
   end;
end;

end.
