Unit LoreTalk;

INTERFACE

Uses
   Crt, Graph, UHanX, LoreSub;

 Procedure talkmode;


IMPLEMENTATION

Procedure talkmode;
begin
  Clear;
  case party.map of
     6 : begin
      if at(9,64) then begin
         Print(7,' ”w¯¥·¡ ¡¡Ðñ·i ¯¡¸bÐe”a¡e,  g·e ŠA¢‰—i·i  ei ˆõ·¡µ¡.');
         s := ' ¢´õ¥¡”a•¡, Serpent µÁ Insects µÁ Python ·e';
         talk(s+'  —•¢·¡ ·¶·a“¡ º· Ða¯¡‹¡ ¤aœaµ¡.');
      end;
      if at(72,73) then talk('Orc “e ˆa¸w Ða‹s ŠA¢‰·¡µ¡.');
      if at(51,72) then begin
         if party.etc[50] and bit5 = 0 then begin
            i := 100 + 20 * x1;
            j := 100 + 20 * y1;
            putimage(i,j,font^[44],CopyPut);
            putimage(i,j,chara^[24+28],AndPut);
            putimage(i,j,chara^[24],OrPut);
            Print(7,' ”w¯¥·¡  NecromancerµA »¥¸÷·a¡  ”ÐwÐa‰¡¸a');
            Print(7,'Ðe”a¡e, ·¡ ¬÷· ¤a¡¶áµA ·¶“e Ï¡œa£µµA ˆa¥¡');
            Print(7,'•¡¢Ða¯¡µ¡. ‹a ‰µ·e NecromancerµÁ •·¯¡µA ¤a');
            cPrint(7,11,'”aµA¬á ˜áµ¡Ÿe ','™¡”aŸe »¡¯¢· ¬÷¸å','·¡‹¡ ˜¢…·¡');
            Print(7,'µ¡.  ”w¯¥·¡ ´á“a ®º…·¡ –A´á ‹a ‰µµA —i´áˆe');
            Print(7,'”a¡e  »¥¸÷Ðe ·¡ ­A‰· »¥¯©·i ´i® ·¶·iˆõ·¡');
            talk('µ¡.');
            party.etc[50] := party.etc[50] or bit5;
            putimage(i,j,font^[53],CopyPut);
         end
         else begin
            Print(7,' `MENACE'' ­¢µA“e Dwarf, Giant, Wolf, Python');
            talk('ˆ{·e ŠA¢‰—i·¡ ¬i‰¡ ·¶­¡.');
         end;
      end;
      if at(58,74) then begin
         s := ' a· ¦¡¡“±·e Python · •¢µA ·Ð •©´a ˆa­v¯s“¡”a.';
         talk(s+' Python ·e ¸÷ i ¶áÐñÐe ¹¥¸·³“¡”a.');
      end;
      if at(63,27) then begin
         Print(7,' ”e»¡ Lord Ahn  e·¡ “wb ¬w·a¡ Necromancer µA‰A •¡¸åÐi ® ·¶¯s“¡”a.');
         s := ' Ða»¡ e Lord Ahn ¸a¯¥·¡ ”Ÿ³·i ¯°´áÐ¬á, Ñe¸“e';
         Talk(s+' Necromancer µA‰A ”ÐwÐi ¸aˆa ´ô¯s“¡”a.');
      end;
      if at(90,82) then
         talk(' ¶Ÿ¡“e Ancient Evil·i ¤ÀâÐa‰¡ Lord Ahn“±·i ¤h—i´á´¡ Ðs“¡”a.');
      if at(94,68) then begin
         talk(' ¶Ÿ¡“e MENACE · •·½¢µA ·¶“e a¢¡¦Èá  g·e ¯¢œ··i ´è·e¸â·¡ ·¶¯s“¡”a.');
      end;
      if at(19,53) then begin
         Print(10,' ·¡ ­A‰· Àw¯¡¸a“e ´e µw‹¡“± ·¡¯¡¡a, ‹a“e ¶á”Ðe Ïa¡‹aœ á ·³“¡”a.');
         PressAnyKey;
      end;
      if at(13,27) or at(18,27) then begin
         s := ReturnSex(1);
         Print(7,' ´á¬á µ¡¯³¯¡µ¡. µa‹¡“e LORE º¸ñ·³“¡”a.');
         if random(2) = 0 then
            talk(' ˆá‹¡ '+s+'¦… ´á¬á µ¡¯³¯¡µ¡.')
         else
            talk(' ¶á¯aÇ¡µA¬á ÄbÉA·©Œa»¡  a·qŒõ ¬åÈ‚Ða¯³¯¡µ¡.');
      end;
      if at(21,33) then talk('...');
      if at(10,30) then talk('¶a¬ ¢”ñ½¢µA¬á ·Aw·¡ ˜á•¥”a”å•A...');
      if at(13,32) then talk('ÐaÐaÐa, ¸a‘A•¡ Ðe¤å  a­a¥¡‰Aa.');
      if at(15,35) then begin
         Print(7,' ·¡¹A Lord Ahn· ¯¡”•¡ {aˆa“eˆa ? ‹aŒa»µ');
         Print(7,'Necromancerœa“e ¸b¸aµA‰A ¼é¼é  “e ©·¡œa“¡');
         Print(7,'...  ÀaœaŸ¡ ˆa aˆa¬á ‹a ‘±‰Á °a¶“e‰A v');
         talk('‰V”a.');
      end;
      if at(18,33) then begin
         Print(7,' ”w¯¥·e Skeleton ¹¢· Ðe¡w·¡ ¶Ÿ¡µÁ ÐqA ¬—');
         Print(7,'ÑÉÐaa Ðe”a“e ˆõµA ”Ð¬á ´á˜ý‰A ¬—ˆbÐa¯³“¡');
         Print(7,'Œa ?  ¸á“e ‹a  i·i —i´ö·i˜ á¢ Ñqµ¡¯aœá¶¶');
         Print(7,'¯s“¡”a. ´á¬á ¨iŸ¡ ‹a ¬i´a·¶“e ©a”aŠáŸi µa‹¡');
         talk('¬á ½¸´a–·a¡e ¹½‰V¯s“¡”a.');
      end;
      if at(21,36) then talk(' ... a~~·b ... ...');
      if at(18,38) then begin
         Print(7,' ·¡¥¡‰A ¸a‘A,  i ¹± —i´á ¥¡‰Aa.  a· Ã¥');
         Print(7,'Š—i·e ·¡¹A ·¡ ­A¬wµA ´ô”a‘A. ‹a—i·e á¢a');
         Print(7,'•¡ ¶wˆqÐa‰¡ £¨·q»¢¯aœå Ã¥Š—i·¡´ö“e•A... ');
         Print(7,'ˆa ”aŸ¡Ÿi ”aÁa ¥w¶¥µA ·¶·i •·´e ‹a—i·e ¡¡–');
         Print(7,'·¡ ”ŸB· ÍwÑÁŸi ¶áÐ LORE Ëb‰·”µA »¡¶¥ Ð–');
         Print(7,'”a‘A.  Ða»¡ e ‹a—i·e ´a¢•¡ ”a¯¡“e •©´aµ¡»¡');
         Print(7,'¡µÐ–´á.  ‹aœå ‹a—iµA‰A ·¡œý‰A ¬i´a·¶“e a¡');
         Print(7,'¬á“e £¡´eÐi ª…·¡‘A  ‹aœ¬á ®‰¡ ai·i ¥¡');
         Print(7,'‰¡ ·¶»¡. ºAÀ‚ˆq·i ·¸‹¡¶áÐ¬á  i·¡»¡...');
         talk('');
      end;
      if at(72,78) then begin
         Print(7,' ¢‰œáa¯³¯¡µ¡.  µa‹¡“e ¶w¬a· ·A‰©—i·i ´eÃ¡');
         talk('Ð ‘½·e ‰µ·³“¡”a.');
      end;
      if at(63,76) and (party.etc[50] and bit1 = 0) then begin
         Print(7,' ”w¯¥·¡  Ðe ·A‰© ´|µA ¬ö·i˜  ·¡¬wÐe “a±‰Á');
         talk('ÐqA  å‰µ·a¡ ¦Èá ´á˜å ­¡Ÿ¡ˆa —iaµÖ”a.');
         Print(13,' ´e‘wÐa¯¡µ¡. ””qÐe ¶w¬aµa.');
         Print(13,' ”w¯¥·¡ a· ¸q·i Œ¶¶­¡ ?  a“e ‰¡”µA ·¡');
         Print(13,'‰µ·i »¡Ç¡”aˆa º‚´áˆe ‹¡¬a Jr. Antares œa‰¡');
         Print(13,'Ðaµ¡.  ¸á· ´a¤á»¡“e Red Antares œa‰¡ ¦‰Ÿ¡');
         Print(13,'¶¶”å ÂAˆw·  a¤ó¬aµv­¡.  ‹a“e  i‘eµA  ´á˜å');
         Print(13,'•·Š‰¡ ·e¯¥·i Ðe Ò ´a¢µA‰A•¡ ¡¡¯s·i aÈa');
         Print(13,'»¡ ´g´v­¡.  Ða»¡ e ”w¯¥· ¶…¡w·e a· ´a');
         Print(13,'¤á»¡Ÿi  ea´¡ eÐa“e ¶…¡w·¡œa“e ˆõ·i ´i®·¶');
         Print(13,'­¡.  ¤e—a¯¡ a· ´a¤á»¡Ÿi  ea¬á ”w¯¥·¡ ´i');
         Print(13,'»¡ ¡µÐ–”å ¬¡¶… “wb—i·i ¤¶¯¡µ¡. ‹aŸ¡‰¡');
         Print(13,'a· ´a¤á»¡Ÿi ”w¯¥· •·Ð—·a¡ Àqˆa¯¡Ç¡•¡¢');
         Print(13,'Ða¯¡µ¡. ¢‰¥ ¹± ´ás‰V»¡ e ...');
         talk('');
         Print(13,' ´aÀq,  ‹aŸ¡‰¡ ˆa º‚‹¡¸åµA µa‹¡µA ¢¥ˆaŸi');
         Print(13,'µa‹¡µA ®‘‰a –´ö“e•A  ”w¯¥µA‰A •¡¶‘·¡ –I»¡');
         Print(13,'¡¡Ÿa‰V­¡. ‹aœñ, a“e ”a¯¡ µ¡œ… ¸q·a¡ —i´á');
         Print(13,'ˆa´¡ ‰V­¡.');
         PressAnyKey;
         for i := 79 to 81 do  map[62,i] := 44;
         map[62,82]:=0; map[62,83]:=14;
         Silent_Scroll;
         party.etc[50] := party.etc[50] or bit1;
      end;
      if at(24,50) then begin
         Print(7,' Ó±‰A, '+player[1].name);
         Print(7,' ¸a‘Aœa¡e Â—¦…Ó¡ NecromancerŸi ¢¿¡Ÿi® ·¶');
         talk('·i ˆé­A. ¸a‘A e £¨‰V‘A.');
      end;
      if at(24,54) then begin
         Print(7,' ¶á· ¸á Ã¥Š¡¦Èá  ”w¯¥ ´Á‹¡  g·¡ —i´ö¯s');
         Print(7,'“¡”a. ¸á“e ¶Ÿ¡¬÷µA¬á ”w¯¥ˆ{·e ¶wˆqÐe ¬aœq');
         talk('·¡ ·¶”a“eˆé ¸aœw¯aœó‰A ¬—ˆbÐs“¡”a.');
      end;
      if at(13,55) then begin
         Print(7,'  e´¢, ”w¯¥—i·¡  ‹a ·©·i Ð‹¡ˆa ´ás”a‰¡');
         Print(7,'¬—ˆb–A¯¡¡e LASTDITCH ¬÷µA¬á  ¬÷¢…·i »¡Ç¡‰¡');
         Print(7,'·¶“e Polarisœe À÷‘e·i ·©Ð—µA Àqˆa¯¡Åa º¯³');
         Print(7,'¯¡µ¡.  ¦…¡w ‹a ¬aœq·¡œa¡e ÅáÓ¡ ¯wœbÐi ˆó“¡');
         talk('”a.');
      end;
      if at(50,11) then begin
         Print(7,' ·¡ ´eµA ˆhÑa·¶“e ¬aœq—iµA‰A“e ·©ÁA ¡eÒAˆa');
         talk('Ðá¶w–A»¡ ´g¯s“¡”a. aˆa º¯³¯¡µ¡.');
      end;
      if at(53,11) then begin
         Print(7,' µa‹¡“e Lord Ahn· ÁA¹AµA ”Ð¬á ‹¼·e ¤eˆq');
         Print(7,'·i ˆa»¡‰¡ ·¶“e ¸a—i·i ®¶wÐa‰¡ ·¶¯s“¡”a.');
         Print(7,' ´a a ‹a—i·e º‚‹¡¸åµA“e ·¡‰µ·i aµ©® ´ô·i');
         talk('ˆó“¡”a.');
      end;
      if at(41,10) then begin
         Print(7,' a“e ·¡‰µ· ‹¡¬a¡¬á  ·¡ ­A‰· ¡¡—e ”ŸB');
         Print(7,'·i ÈqÐñÐa‰¡ •©´aµÖ´ö¯s“¡”a. ˆa  a»¡ b ”');
         Print(7,'ŸB·i •©´v·i˜  a“e ¬¡¶… ¹¥¸Ÿi ¤i‰eÐ–¯s');
         Print(7,'“¡”a. ‹a“e ¤a¡ µ¸åŒa»¡•¡ Lord Ahn‰Á ”Ÿ³');
         Print(7,'Ða”å Ancient Evil·¡œa“e ¹¥¸µv¯s“¡”a. »¡‹q');
         Print(7,'¶Ÿ¡· ¬÷µA¬á“e Àé¸áÐa‰A ¤‰bÐa•¡¢ ´áŸ©˜');
         Print(7,'¦Èá ˆaŸaÃ± ¤h´aµ¥ ‹a Ancient Evil·¡´ö¯s“¡');
         Print(7,'”a.  Ða»¡ e ‹a‰µµA¬á ¥¥ ‹a“e ¶Ÿ¡ˆa ´i‰¡·¶');
         Print(7,'“e ‹aµÁ“e ¸åÑa ”aŸe ·¥ˆe£¡Ÿi ˆa»¥   i ‹a”');
         Print(7,'¡  ¯¥‰Áˆ{·e ¹¥¸µv¯s“¡”a.  ˆa ‹a· ¯¥´w');
         Print(7,'´aœ ·¶“e ´á“a •¡¯¡Ÿi •©¡e¬á ˆa “a¥ˆõ·e');
         Print(7,'¸÷ i Lord AhnµA‰A¬á“e Àx´a¥©®ˆa ´ô“e ‹aœå');
         Print(7,'¸a´µÁ ˜a›uÐe ¸÷·¡´ö¯s“¡”a.  ‹aŸ¡‰¡ µaÈŒõ');
         Print(7,'ˆa ´i‰¡ ·¶“e ‹aµA ”Ðe »¡¯¢·¡  ¸÷ i ¸i¡µ');
         Print(7,'–A´ö”a“e ˆõ‰Á  ·¡œå ¬a¯©·i ”aŸe ¬aœqµA‰A•¡');
         Print(7,'´iaº‰¡ ¯¼”a“e ·¡·A¡  ‹a· ¬a¬w·i Ìá›aŸ¡');
         Print(7,'”a ·¡œý‰A ¸sÓ¡‰A –Eˆõ·³“¡”a.');
         talk('');
         Print(7,' Ða»¡ e ”á¶‚ ·¡¬wÐeˆõ·e Lord Ahn ¸a¯¥•¡ ‹a');
         Print(7,'µA ”Ðe ¬a¯©·i ·¥¸÷Ða¡e¬á•¡  µá ¶Ÿ¡µA‰A“e');
         Print(7,'‹aŸi ¤‰bÐa•¡¢ e Ša·B¯¡Ç¡“e ˆaŸi  ´i‰¡ ¯¼');
         Print(7,'·iª…·³“¡”a. Lord AhnA¬á“e aŸi ·¡ÐÐe”a‰¡');
         Print(7,'Ða­v»¡ e ¬aÒA Ñ¥œe·i ¤w»¡Ða‹¡ ¶áÐ aŸi ·¡');
         Print(7,'œý‰A ¤cµA Ði® ´ô”a‰¡  i³qÐa¯¡”áŠ…¶a. ‹aŸ¡');
         Print(7,'·¡ˆõ·e ¬å·i ”ÎaÐa“e ¸a‹¡¡¬á“e ·¡ ¤w¤ó ¤c');
         Print(7,'µA“e ´ô”a‰¡ Ða¯¡”áŠ…¶a.');
         Print(7,' Ða»¡ e Lord Ahn·  a·q·e ¬a¯© ·¡œý»¡ ´g”a');
         Print(7,'“eˆé ´i® ·¶´ö¯s“¡”a.  Ancient Evil·  i¡');
         Print(7,'“e ¬a¯© ¬á¡ˆa  ¶ ¸éÃ¥Ðe ‰Å‰·±·i ´i®ˆa');
         Print(7,'·¶´ö‹¡ ˜¢…·³“¡”a.');
         talk('');
      end;
      if at(40,15) then begin
         Print(7,' Ó¡Ó¡Ó¡... ¶á”Ðe ¶w¬a“±. ©©©.. ˆa ”w');
         Print(7,'¯¥—i· ·©Ð—µA ¡·¡¡e ´e–IŒa¶a ? ¶Ó¡Ó¡Ó¡..');
         m[0] := '';
         m[1] := '‹aœý”a¡e ”w¯¥·i ¤h´a—i·¡»¡¶a';
         m[2] := '”w¯¥·e ·¡‰µµA ‹a· ·¶“e‰A u‰V­¡';
         k := select(125,2,2,FALSE,TRUE);
         if k = 1 then begin
            k := 6;
            join(1,k);
            with player[k] do begin
               name := 'Mad Joe';
               class := 8;
               weapon := 0;
               shield := 0;
               armor := 0;
               wea_power := 0;
               shi_power := 0;
               arm_power := 0;
               ac := 0;
            end;
            Display_Condition;
            map[40,15] := 47;
            Silent_Scroll;
            party.etc[50] := party.etc[50] or bit2;
         end
         else asyouwish;
      end;
      if at(63,10) then begin
         Print(7,' ´e‘wÐa¯¡µ¡. a“e Ðe˜ ·¡ ‰µ· ·A¡wÐe •¡–‚');
         Print(7,'·¡´ö”å ¬aœq·¡µ¡.  ‰iŠ‚ ‹a ˜¢…µA a“e ¸sÑa');
         Print(7,'¬á Íw¬— µa‹¡µA ·¶‰A –A´ö»¡ e...');
         cPrint(7,11,' ‹aˆå ‹aœý‰¡, ˆa LORE ¬÷· ¥¡¢‰·¥ ','Ñ×‹q·','');
         cPrint(7,11,'','¤wÌ','Ÿi Ò‘Áa ”i´aa”a. ‹a e ‹aˆõ·i MENACEœa');
         Print(7,'“e ‹q‰×µA ®‘‰a ‘½·eÀ ¸sÑa ¤áŸ¡‰¡  i´v­¡.');
         Print(7,'a“e ·¡¹A ‹aˆõ·i ˆa¹a¥Ö¸a ³i˜•¡ ´ô·a“¡ Àa');
         Print(7,'œaŸ¡ ”w¯¥·¡ ‹aˆé ˆa»¡¯¡µ¡. ˆa e·¶¸a...  ´á');
         Print(7,'—¡µv”áœa...  ‹aœ ! MENACE· ˆa¶…•A¿qµA ¥b');
         Print(7,'·a¡ ¬a¤w·¡ –‰œá °aµa»¥ ‰µ·¡´ö“e•A..  ”w¯¥');
         Print(7,'—i·¡œa¡e  »¡‹q µa‹¡µA —i´áµ¥ˆõ‰Á ˆ{·e ¤w¤ó');
         Print(7,'·a¡ —i´áˆa¬á ¤wÌŸi Àx·i® ·¶·iˆõ·¡µ¡. Ð—');
         Print(7,'¶…·i §©‰V­¡.');
         talk('');
      end;
      if at(60,15) then begin
         Print(7,' ”w¯¥—iµA‰A ‰w‰¡Ð –‰V“e•A ˆåáÍe ¤wµA ·¶');
         Print(7,'“e Joe“e µ¡œ… ®ˆq¬—ÑÉ {µA £¡Áa ¤áŸ¡‰¡  i');
         Print(7,'´v­¡.  ‹a·  iµA ­¢´a¬á ”w¯¥‘A ·©Ð—µA Àqˆa');
         talk('¯¡Ç¡“e ‹aœå ¯©®“e Ða»¡ a¯¡µ¡.');
      end;
      if at(42,78) or at(42,80) then begin
         if (party.etc[50] and bit4) = 0 then begin
            Print(7,' Lord Ahn “±· ¡wwµA ·Ð¬á ”w¯¥—iµA‰A Ðe');
            Print(7,'ˆa»¡· ¢‹¡Ÿi —aŸ¡‰V¯s“¡”a.  —i´áˆa­a¬á ¢');
            Print(7,'‹¡Ÿi ¬åÈ‚Ð º¯³¯¡µ¡.');
         end
         else begin
            Print(7,' µa‹¡¬á ˆa¹aˆa¯¥ ¢‹¡Ÿi ¸i ¬a¶wÐa­a¬á ­A‰');
            Print(7,'· ¸â·¥ NecromancerŸi ¢¿©œá º¯³¯¡µ¡.');
         end;
         PressAnyKey;
      end;
      if at(51,14) then talk('MENACE µA“e ‹q”÷·¡ˆa  g”a”å•A...');
      if at(83,27) then talk('MENACE “e Ðe˜ ‹q‰×·¡´ö¯s“¡”a.');
      if at(87,73) or at(91,65) then Grocery;
      if at(8,71) or at(14,69) or at(14,73) then Weapon_Shop;
      if at(87,14) or at(86,12) then hospital;
      if at(21,12) or at(25,13) then train_center;
      if at(50,51) or at (52,51) then
      if party.etc[30] and bit1 = 1 then talk('Ð—¶…·i §©‰V­¡ !!!')
      else if party.etc[10] < 3 then talk('¸áÓ ¬÷º“±·i  ea ¥¡¯³¯¡µ¡.')
      else begin
         Print(10,'”w¯¥·e ·¡ ‰A·± ­A‰µA •¡¸åÐa‰¡ ¯¼¯s“¡Œa ?');
         Print(10,'(Y/n)');
         c := readkey;
         if c = #0 then c := readkey;
         if upcase(c) = 'Y' then begin
            map[49,52]:=47; map[50,52]:=44; map[51,52]:=44;
            map[52,52]:=44; map[53,52]:=47; map[49,53]:=47;
            map[50,53]:=44; map[51,53]:=44; map[52,53]:=44; map[53,53]:=45;
            Print(7,'');
            Print(7,'µ.');
            Print(7,'');
            talk('·¡¹A¦Èá ”w¯¥·e »¥¸÷Ðe ·¡ ­A‰µA ¤i·i —¡—¡‰A –A“e ˆõ·³“¡”a.');
            party.etc[30] := party.etc[30] or bit1;
            Scroll(TRUE);
         end
         else begin
            Print(7,'');
            Print(7,'´a“¡µ¡.');
            Print(7,'');
            talk('”a¯¡ ¬—ˆb Ð¥¡¯³¯¡µ¡.');
         end;
      end;
      if at(51,87) then
      if party.etc[30] and bit2 = 0 then begin
         for i := 49 to 53 do map[i,88] := 44;
         talk('e ”w¯¥·i £¨­¡, '+player[1].name+'.');
         party.etc[30] := party.etc[30] or bit2;
         Scroll(TRUE);
      end
      else talk('Ó±¯¡µ¡, '+player[1].name+'.');
      if (x in [48..54]) and (y in [31..37]) then
      if party.etc[10] = 0 then talk('¸áÓ ¬÷º“±·i  ea¯³¯¡µ¡.')
      else talk('”w¯¥·¡ ¬÷‰·Ða‹¡Ÿi §³“¡”a.');
      if at(51,28) then
      case party.etc[10] of
         0 : begin
          cPrint(7,11,' a“e ','Lord Ahn',' ·¡µ¡.');
          Print(7,' ·¡¹A¦Èá ”w¯¥·e  ·¡ ‰A·±µA¬á ¬¡¶… ·¥¢‰¡');
          Print(7,'¬á ¬—·i ¯¡¸bÐa‰A –Iˆõ·¡µ¡. ‹aœñ a· ·¡´¡‹¡');
          talk('Ÿi ¯¡¸bÐa‰V­¡.');
          inc(party.etc[10]);
             end;
         1 : begin
          Print(7,' ·¡ ­A‰“e ˆa É·Ã¡Ða“e •·´eµA“e ¢Àâ ÍwÑÁ');
          Print(7,'¡¶… ­A¬w·¡ »¥Ð—–A´á µÖ´ö­¡.  ‹aœáa ‹aˆõ·e');
          Print(7,'Ðe ¶…¡w· ¸we·a¡ ¢ÀqÓ¡ Œ´á¹a ¤áv­¡.');
          Print(7,' Ðei, ”‹¡· ‰·ˆe·¡ »¥•·Ða¡a e•A´ô“e ÎŸe');
          Print(7,'¤åˆˆa ”ŸB—i º—· ÐaaŸi ˆwÈaÐ–­¡.  ‰·ˆe·e');
          Print(7,'Òá´á»¡‰¡ ¯¡ˆe·e »¥•·Ða¡a  ·¡ ­A‰Ÿi ‰·Í¡ ­¢');
          Print(7,'·a¡ ¡©‰¡ ˆv­¡.  ‹a ¤åˆ· ¶áb·a¡ ‹a ¦‰¶…');
          Print(7,'Ðe ”ŸB·e  Ñ×ÍÑÁ–E ¶w´q ”»¡¡ ¥eÐa‰¡  i´v');
          Print(7,'‰¡, ”aŸe Ðaa· ”ŸB·e Â—•©¯¡· »¥•·µA ·Ð');
          Print(7,'¤a”a ‹¼·¡ ˆaœa´f´a ¤áv­¡.');
          Print(7,' ‹aœå ·©·¡ ·¶·e ÐeÀq ÒµA,  ·¡¬wÐa‰A•¡ ¶w´q');
          Print(7,'”»¡· ”ŸB·a¡¦Èá ˆwÐe ¬—¡w· ‹¡¶…·¡ ¤i¬e');
          Print(7,'–A‹¡ ¯¡¸b Ð–­¡.  ‹aœ¬á, ¶Ÿ¡—i·e ‹a ¶¥·¥·i');
          Print(7,'´i´a¥¡‹¡ ¶áÐ ''LORE Ëb‰·”''Ÿi ¹¡»¢Ða‹¡¡ Ðs');
          Print(7,'·Ÿi Ða‰¡ ·¡‰µµA ·¶“e ˆá· ¡¡—e ¶w¬a—i·i ¡¡');
          Print(7,'´a¬á ¶w´q ”»¡¡ ¥eÐe ‹a ”ŸB·a¡ ‹sÓ¡ ‹a—i');
          Print(7,'·i Ìa‰eÐaµv»¡ e µaÈŒõ ´a¢ ­¡¯¢•¡ —h»¡¡µÐ–');
          Print(7,'­¡. ‹a—i·¡ ¬—¹¥Ð ·¶“e»¡ ¹¡Àa•¡  i·¡µ¡.');
          Print(7,' ·¡œå ¸áœå ¤w¤ó·i É·Ðaµa ‹a—i· ¬—¬aŸi ´i´a');
          cPrint(7,11,'a”åº— ¶µeÓ¡ ¶Ÿ¡—i·e ''','Necromancer','''œa‰¡ ¦‰');
          Print(7,'Ÿ¡¶“e  ¶w´q ”»¡­¢·  ¬¡¶… ­Ab· ¹¥¸Ÿi');
          Print(7,'´i´a´ö‰¡,  ‹a˜· ‹a—i·e ·¡£¡  bˆwÐe ­Ab');
          Print(7,'·a¡ ¬÷¸wÐˆa‰¡ ·¶“eº— ·¡´ö­¡.  ‹a˜· ¤åˆ');
          Print(7,'“e ‹aˆa ·¡ ‰·ˆe·a¡ ·¡•·Ða“e ®”e·¡´ö­¡. »b');
          Print(7,'‹a“e ·¡ ‰·ˆe· ·¥¢‰·¡ ´a“¥ ”aŸe Àa¶¥·i ˆa»¥');
          Print(7,'‰·ˆeµA¬á µÖ”å ˆõ·¡µ¡.');
          Print(7,' ‹a“e Ñe¸ ·¡ ­A‰· ¤e·i  ‹a· ­AbŠ¥ ´eµA');
          Print(7,'ý‰¡ ·¶­¡. µa‹¡¬á ”w¯¥· Š—‹b¸â·¥ ·±¢“e ¤a');
          cPrint(7,11,'¡ ''','Necromancer · ´¡¯±·i ¥·­á ¯¡Ç¡“e ˆõ','''·¡');
          Print(7,'œa“e ˆé ¡w¯±Ð –¯¡µ¡.');
          talk('');
          inc(party.etc[10]);
             end;
         2 : begin
          Print(7,' Necromancer · µwÐ·b·e ·¡£¡ LORE ”ŸBŒa»¡');
          Print(7,'•¡”iÐ·¶­¡.  ™¡Ðe ‹a—i·e ·¡ ”ŸB· q¬á½¢µA');
          Print(7,'''MENACE'' œa‰¡ ¦‰Ÿ¡¶“e »¡Ða •·Š‰·i ´é a¸åµA');
          Print(7,'ŠÂ‚Ð–­¡.  ‹aœ¬á, ‹a •·Š‰· ¹¥¸ ˜¢…µA ¶');
          Print(7,'Ÿ¡—i·e ‹aµA‰A ¶áÑs·i ”wÐa‰A –A´ö”å ˆõ·¡µ¡.');
          Print(7,' Ða»¡ e, LORE Ëb‰·”ˆa ·¡ ”ŸB·i ˜áeÒ¡“e');
          Print(7,'‹a ·©”w—iµA‰A ”¸âÐi ¶w¬a“e  ·¡£¡  q´a·¶»¡');
          Print(7,'´g´v­¡. ‹aœ¬á ¦ÈbÐaˆå•A, ‹a •·Š‰·i º—¯±¦');
          Print(7,'Œa»¡ Èq¬aÐ º¯¡µ¡.');
          Print(7,' a“e ”w¯¥—iµA‰A NecromancerµA ”Ðe ·©·i  {');
          Print(7,'‹¡‰¡ ¯¼»¡ e, ´a»¢·e ”w¯¥—i·  ÑÂ¯©Ðe “wb·i');
          Print(7,'¡¡Ÿa“e ¬wÈ·¡»¡¶a.  ‹aœ¬á ·¡ ·©·e ”w¯¥—i·');
          Print(7,'¸q¸b·i »w¡wÐ º“e ¹½·e ‹¡ÒAˆa –Iˆõ·¡µ¡.');
          Print(7,'  e´¢ ”w¯¥—i·¡ ¢‹¡ˆa Ï©¶aÐa”a¡e ¢‹¡‰¡µA¬á');
          Print(7,'´¢ˆe· ¢‹¡Ÿi ˆa¹aˆa•¡¢ ÐáœbÐa‰V­¡.');
          talk('');
          inc(party.etc[10]);
             end;
         3 : begin
          cPrint(7,11,' ”ŸB· q¬á½¢µA ·¶“e `','MENACE','''Ÿi Èq¬aÐ º¯¡µ¡.');
          PressAnyKey;
             end;
         4 : begin
          Print(7,'”w¯¥—i· ¬÷‰··i Â‚ÐaÐaµ¡ !!');
          Print(11,'[EXP + 1000]');
          for i := 1 to 6 do if player[i].name <> '' then
             player[i].experience := player[i].experience + 1000;
          inc(party.etc[10]);
          PressAnyKey;
             end;
         5 : begin
          Print(7,' —a—¡´á a“e ”w¯¥—i· “wb·i £¨·i® ·¶‰A –A');
          Print(7,'´ö­¡.  ‹aœý”a¡e ”w¯¥—iµA‰A Necromancer ·w»·');
          Print(7,'·¡œa“e  bº—Ðe ·±¢Ÿi Ðe¤å  {‰a ¥¡‰V­¡.');
          cPrint(7,11,'  å¸á ”ŸB· •·½¢µA ·¶“e ''','LASTDITCH','''µA ˆa¥¡');
          cPrint(7,11,'•¡¢ Ða¯¡µ¡. ''','LASTDITCH','''¬÷µA“e »¡‹q  g·e ‹e');
          Print(7,'¯±µA °}µa·¶­¡. ‹a—i·i •¡µÁ º¯¡µ¡.');
          PressAnyKey;
          inc(party.etc[10]);
             end;
         6 : talk(' ”w¯¥·e ·¡¹A ¯a¯a¡ Ð—•·Ð aˆa¯¡µ¡.');
      end;
         end;

     7 : begin
      if at(51,55) then
         talk('LASTDITCH ¬÷‰Á VALIANT PEOPLES ¬÷·e  ¶ ”k´v”a“e  i·¡ ·¶¯s“¡”a.');
      if at(8,44) then
         talk('·¡ ­A‰“e ”a¬õˆ· ”ŸB·a¡ –A´á ·¶”a”áŠ…¶a.');
      if at(68,35) then
         talk('ˆbˆb· ”ŸBµA“e ¬á¡ É·Ða“e ¢…·¡ ¹¥¸Ðs“¡”a.');
      if at(43,9) then
         talk('”w¯¥·e PYRAMID ´eµA¬á ®ó‰A Àw·i ¤i‰eÐi ® ·¶·iˆõ·³“¡”a.');
      if at(65,10) then
         talk('GROUND GATE “e µa‹¡¡¦Èá ¬á½¢µA aÈaa‰¥ Ðs“¡”a.');
      if at(14,68) then
         talk('LORE Ëb‰·”· »¡Òá‰Å·e ¸á· qÍe·¥•A `Lore Hunter''œa‰¡ ¦‰v¯s“¡”a.');
      if at(57,42) then
         talk('Major Mummy µÁ – aŸ¡· Sphinx · ‰·‰b·e ˆaÓ¡ Ã¡¡w¸â·³“¡”a.');
      if at(44,34) then
         talk('GROUND GATE “e ”w¯¥·i ”aŸe ”ŸB·a¡ ·¥•¡Ð º‰ˆõ·³“¡”a.');
      if at(32,56) then
         talk('LORE Ëb‰·”· »¡Òá‰Å·e ¬w”wÓ¡ “wb·¶“e ·¥¢‰·¡´ö¯s“¡”a.');
      if at(36,19) or at(36,21) or at(41,18) or at(41,20) or at(41,22) or at(40,41) then
      if party.etc[13] = 0 then talk('¬÷º“±·i  ea ¥¡¯³¯¡µ¡.')
      else talk('”w¯¥·¡ ¬÷‰·Ða‹¡Ÿi §³“¡”a.');
      if at(37,41) and (party.etc[13]<2) then begin
         cPrint(7,11,'a· ·¡Ÿq·e ','Polaris',' ¶a.');
         Print(7,'”w¯¥—i‰Á ˆ{·¡ Major Mummy Ÿi ¢‰Ÿ¡Ã¡‰¡ ¯¼­¡.');
         Print(10,'ˆa ”w¯¥· ·©Ð—µA ¡µa•¡ –A‰V­¡ ?');
         m[0] := '';
         m[1] := 'a“e ”w¯¥· ¹A´e·i ¤h´a —i·¡‰V­¡';
         m[2] := 'a“e ”w¯¥· •¡¶‘·e Ï©¶a ´ô­¡';
         k := select(125,2,2,FALSE,TRUE);
         if k = 1 then begin
            k := ReturnJoinMember;
            if k = 1 then exit;
            join(9,k);
            with player[k] do begin
               name := 'Polaris';
               class := 4;
               level[2] := 3;
               weapon := 4;
               shield := 1;
               armor := 1;
               wea_power := 10;
               shi_power := 1;
               arm_power := 2;
               ac := 3;
            end;
            Display_Condition;
            map[37,41] := 44;
            Silent_Scroll;
         end
         else asyouwish;
      end;
      if at(18,19) or at(24,19) or at(21,21) or at(16,24) then train_center;
      if at(57,17) or at(54,20) or at(58,22) or at(59,25) then grocery;
      if at(59,56) or at(59,58) or at(59,60) then weapon_shop;
      if at(17,56) or at(17,58) or at(17,60) then hospital;
      if at(38,17) then
      case party.etc[13] of
         0 : begin
          Print(7,' ”w¯¥·¡ '+player[1].name+'·¡µ¡ ?');
          Print(7,' a“e Lord Ahn µA‰A ”w¯¥·¡ µ¥”a“e ­¡¯¢·i ¸å');
          Print(7,'Ð¤h´v­¡.  —i´ö”a¯¡Ï¡ ¶Ÿ¡¬÷µA“e  Çe ¢…¹Aˆa');
          Print(7,'·¶­¡. ‹aˆõ·e ·¡ ¬÷· ¦‚½¢µA ¶áÃ¡Ð·¶“e •·Š‰');
          Print(7,'˜¢…·¡µ¡.  ‹a •·Š‰˜¢…µA ¶Ÿ¡—i·e ¬w”wÐe ´s');
          Print(7,'¤b·i¤h‰¡ ·¶­¡.');
          cPrint(7,11,'  e´¢ ”w¯¥—i·¡ ¶á”Ðe µw¶—·¡œa¡e, ','PYRAMID','œa');
          cPrint(7,11,'“e •·Š‰µA ·¶“e ','Major Mummy','Ÿi Àá”eÐ º¯¡µ¡.');
          Print(7,' ”w¯¥—i·¡ ·¡ ·±¢Ÿi µÅ®Ða¡e  a“e ”w¯¥—iµA');
          Print(7,'‰A •¡¶‘µA ”Ðe ”•ˆaŸi Ã¡ž¡º‰V­¡.');
          talk('');
          inc(party.etc[13]);
             end;
         1 : begin
          cPrint(7,11,' ¦ÈbÐaˆå•A, PYRAMID· ''','Major Mummy','''Ÿi Àá”e');
          Print(7,'Ð º¯¡µ¡.');
          PressAnyKey;
             end;
         2 : begin
          Print(7,'”w¯¥· ¬÷‰·µA ‰w·Ÿi ÎaÐaµ¡.');
          Print(11,'[EXP + 10000]');
          talk('”w¯¥· •¡¶‘ ”â¦…µA ¶Ÿ¡· ¬÷·¡ Š¹A –A´ö­¡.');
          for i := 1 to 6 do if player[i].name <> '' then
          player[i].experience := player[i].experience + 10000;
          inc(party.etc[13]);
             end;
         3 : begin
          cPrint(7,11,' ·¡ ¬÷· ¦‚•·½¢µA ''','GROUND GATE',''' œa“eˆõ·¡ ·¶');
          cPrint(7,11,'­¡.  e´¢ ”w¯¥·¡ ''','GROUND GATE',''' ­¢µA —i´áˆe”a');
          cPrint(7,11,'¡e ''','VALIANT PEOPLES','''¬÷·a¡ É·Ða‰A –Iˆõ·¡µ¡.');
          cPrint(7,11,'''','VALIANT PEOPLES','''“e NecromancerµA‰A  ¶ ¯±');
          Print(7,'Ða‰A µwÐ··i ¤h‰¡·¶­¡.');

          PressAnyKey;
             end;
      end;
         end;

     9 : begin
      if at(12,11) or at(15,12) or at(12,15) then train_center;
      if at(40,37) or at(37,39) or at(41,41) then grocery;
      if at(37,10) or at(40,12) or at(41,15) then weapon_shop;
      if at(9,39) or at(12,41) or at(16,40) then hospital;
      if at(24,38) then
         talk(' EVIL SEAL · ´á—¡µEˆaµA ''Ñ×‹q· ¥··¥''·¡ ®‘‰a¹a ·¶”a”áŠ…¶a.');
      if at(23,12) then
         talk(' Ñ×‹q· ˆsµµ·¡ QUAKE •·Š‰ ´eµA ®‘‰a¹a·¶”a“e ­¡¢…·¡ ˜á•©‰¡ ·¶¯s“¡”a.');
      if at(28,18) then begin
         Print(7,' VALIANT PEOPLES ¬÷·e NecromancerµA ”Ðe ˆw');
         Print(7,'Ðe¸áÐw ˜¢…µA  ‹aµA ·Ð ²‚¤{·¡ –A´á ¤áv¯s');
         Print(7,'“¡”a.');
         PressAnyKey;
      end;
      if at(30,31) then begin
         Print(7,' VALIANT PEOPLES ÂA”· ¬a·Ž…·¥ Rigel·e ¬÷');
         Print(7,'·iÌaŠA¯¡Ç¥ ¸â—i·i ¢‰Ÿ¡Ã¡‹¡ ¶áÐ¬á EVIL SEAL');
         Print(7,'¡ —i´áˆv¯s“¡”a.');
         PressAnyKey;
      end;
      if at(34,38) then
         talk('¶á½¢µA“e SWAMP ”ŸB·a¡ É·Ða“e ¢…·¡ ·¶»¡ e ´a¢•¡ ¸ó‹e Ði ®ˆa ´ô¯s“¡”a.');
      if at(38,14) then
         talk('QUAKE­¢µA“e  g·e §¡£©¢…·¡ ·¶”a‰¡ —i´ö¯s“¡”a.');
      if at(15,42) then
         talk('WATER FIELD ¡ É·Ða“e ¢…µA“e ­A aŸ¡· Wivern·¡ »¡Ç¡‰¡ ·¶¯s“¡”a.');
      if at(26,7) then
         talk('SWAMP ”ŸB·a¡ É·Ða“e ¢…µA“e ‰¡Ÿa‰¥ ­A¸a ˆa ¬i‰¡ ·¶­¡.');
      if at(34,24) or at(37,24) or at(41,24) or at(35,27) or at(38,27) or at(41,27) then
      if party.etc[14] = 0 then talk('¶Ÿ¡ ¬÷º“±·i  ea¥¡¯³¯¡µ¡.')
      else talk('”w¯¥· ¬÷‰··i §©‰V¯s“¡”a.');
      if at(42,25) then
      case party.etc[14] of
         0 : begin
          Print(7,' ”w¯¥·i  ea‰A–A´á µw‰×·¡µ¡.');
          Print(7,' a“e LORE ”ŸBµA¬á· ”w¯¥· ‰·Ò…·i ‘¼·¡ Íw');
          Print(7,'ˆaÐa¡a, ™¡Ðe LAST DITCH¬÷·i Š¹AÐaˆõµA ”Ð');
          Print(7,'¬á•¡ ˆq¬aŸi ÎaÐaµ¡.  LAST DITCH ¬÷· °w–—·¡');
          cPrint(7,11,'¬÷·¥ ''','VALIANT PEOPLES','''“e NecromancerµA ”Ðe');
          Print(7,'ˆwÐe ¸áÐw ˜¢…µA ‹aµA ·Ð¬á  ÀáÀqÓ¡ ÌaŠA–A');
          Print(7,'´ö­¡.  ‹aœåÒµA ‹a“e ''VALIANT PEOPLES''· »¡');
          cPrint(7,11,'ÐaµA”aˆa ','EVIL SEAL','·¡œa“e •·Š‰·i ŠÂ‚Ðaµv­¡.');
          Print(7,'‹aŸ¡‰¡ ‹a“e EVIL SEAL· ´á—¡µEˆaµA  ·¡ ”ŸB');
          Print(7,'· ¶…¡w·i ”q‰¡ ·¶“e  Ñ×‹q· ¥··¥·i ®‘‰a‘½´v');
          Print(7,'­¡.  e´¢ ‹a ¥··¥·¡ Î‰´á»¥”a¡e, ·¡ ”ŸB·e ¥·');
          Print(7,'·¥ ­¢µA¬á aÈae ŠA¢‰—iµA ·Ð¬á Ñ×ÍÑÁ  –I');
          Print(7,'ˆõ·¡µ¡.');
          cPrint(7,11,' Ðe¯¡¤a«¡ EVIL SEAL ¡ ˆa¯¡µ¡, ‹aŸ¡‰¡ ''','Ñ×‹q','');
          cPrint(7,11,'','· ¥··¥','''·i Àx·a¯¡µ¡.');
          talk('');
          inc(party.etc[14]);
             end;
         1 : begin
          cPrint(7,11,' VALIANT PEOPLESµA ·¶“e EVIL SEAL¡ ˆa¬á ','Ñ×','');
          cPrint(7,11,'','‹q· ¥··¥','·i Àx´aµ¡¯¡µ¡.');
          Print(7,' »¡‹q »¡ÁAÐi ¯¡ˆe·¡ ´ô­¡.');
          PressAnyKey;
             end;
         2 : begin
          Print(15,' µ¡, ”w¯¥·e Ñ×‹q· ¥··¥·i Àx´vŠ…¶a !');
          Print(15,' [ EXP + 10000 ]');
          for i := 1 to 6 do if player[i].name <> '' then
          player[i].experience := player[i].experience + 10000;
          PressAnyKey;
          inc(party.etc[14]);
             end;
         3 : begin
          Print(7,' ‹aœáa, ·¡ ”ŸBµA“e ´a»¢ ¶áÐñÐe ¸w­¡ˆa   g');
          Print(7,'·¡ ·¶­¡.');
          cPrint(7,11,' µa‹¡¡¦Èá ¦‚•·½¢µA ''','QUAKE',''' œa‰¡ ¦‰Ÿ¡“e •·');
          Print(7,'Š‰·¡·¶­¡.  e´¢ QUAKE  a¸á ¢á›aŸ¡¡e, ·¡ ”');
          Print(7,'ŸB·e ”a¯¡ ÍwÑÁ³‰A –Iˆõ·¡µ¡.');
          cPrint(7,11,' ','QUAKE',' ¡ ˆa¬á ¥¡¯a·¥ ArchiGagoyle‰Á Zombie');
          Print(7,'—i·i ¢‰Ÿ¡Áa º¯³¯¡µ¡.');
          PressAnyKey;
          inc(party.etc[14]);
             end;
         4 : begin
          cPrint(7,11,'QUAKE· ','ArchiGagoyle','·i ¢‰Ÿ¡Ã¡¯³¯¡µ¡.');
          PressAnyKey;
             end;
         5 : begin
          Print(7,'”w¯¥—i·e ¶á”Ðe µw¶—·±µA ËiŸ±´ôŠ…¶a.');
          Print(11,'[ EXP + 40000 ]');
          Print(7,'');
          cPrint(7,11,' µa‹¡µA ','Water Key','ˆa ·¶­¡.');
          cPrint(7,11,' ·¡ µi®A“e ','WATER FIELD','· ¢…·i µiˆõ·¡µ¡.');
          for i := 1 to 6 do if player[i].name <> '' then
             player[i].experience := player[i].experience + 40000;
          PressAnyKey;
          inc(party.etc[14]);
             end;
         6 : begin
          cPrint(7,11,'WIVERN •·Š‰· ','WATER FIELD· ¢…','·i É·Ðaµa ”a·q ”ŸB·a¡ ˆa¯³¯¡µ¡.');
          PressAnyKey;
             end;
      end;
         end;

     10 : begin
      if at(36,32) or at(38,33) or at(39,35) then train_center;
      if at(17,57) or at(12,59) or at(11,55) then grocery;
      if at(11,30) or at(11,32) or at(13,34) then weapon_shop;
      if at(33,60) or at(35,54) or at(41,58) then hospital;
      if at(11,16) then
         talk('NOTICE •·Š‰· Hidra“e  áŸ¡ˆa ­U·¡a ”iv”a”áŠ…¶a.');
      if at(14,18) then
         talk('NOTICE •·Š‰·e Ñ¥œe¯aœá¶… £¡¡œa¬á Ðw¬w º¶áŸi µq–µA –­a´¡ Ðs“¡”a.');
      if at(24,22) then
         talk('LOCKUP •·Š‰·e £¡¡¡ Š¬÷–E •·Š‰·¡µ¡.');
      if at(27,22) then
         talk('LOCKUP ­¢µA Minotaur“e Necromancer· ¦Ða“e ´a“³“¡”a.');
      if at(24,69) then begin
         Print(7,' LOCKUP · ¥¡¯a·¥ Huge Dragon·e ´aº ˆá”Ðe');
         Print(7,'¶w·¡œa“e•A,  ‹aˆõ· ¡Ÿ¡ ™¡Ðe ˆwbÐe ¢‹¡œa');
         Print(7,'¬á ¹¡¯±Ð´¡ Ðiˆõ·¡µ¡.');
         PressAnyKey;
      end;
      if at(37,16) then begin
         Print(7,' ‰¡Ÿa‰¥ ­A¸a · Ó±·e Necromancer· Ó±‰Á Ï©');
         Print(7,'¸âÐa»¡ e º—”Ðe ´¢¸ñ·¡ Ðaa ·¶­¡.');
         PressAnyKey;
      end;
      if at(40,18) then
         talk('Stheno µÁ Euryale“e ˆá· ¦‰¡i· ¬—¡wÁA ·³“¡”a.');
      if at(40,56) then begin
         hany := 20;
         Print(7,' a“e LORE Ëb‰·”· ”¸w·¥ Lore Hunter œa‰¡');
         Print(7,'Ðaµ¡. µa‹¡¬á· ¸â—i‰Á“e, ·¡¹A ”ÐwÐa‹¡ˆa Ñ¥');
         Print(7,'¸a¬á“e ¢Ÿ¡œa‰¡ Ìe”eÐ–­¡. ‹aœ¬á, a“e µaÈ');
         Print(7,'Œõ µa‹¡¬á ¬¡¶… µw¶——i·i ‹¡”aŸ¡‰¡ ·¶´ö­¡.');
         Print(7,' ˆa ”w¯¥· ·©Ð—µA ¡‰A –A“eˆé ´á˜ý‰A ¬—ˆb');
         Print(7,'Ðaµ¡ ?');
         m[0] := '';
         m[1] := '¶Ÿ¡•¡ ‹aœá‹¡Ÿi ¤aœaµ¡';
         m[2] := '¡±·¡ µÅ¸åÓ¡ ÒA¥¢–I˜Œa»¡ ‹¡”aŸ¡¯¡µ¡';
         k := select(145,2,2,FALSE,TRUE);
         if k = 2 then asyouwish;
         if k <> 1 then exit;
         k := ReturnJoinMember;
         if k = 1 then exit;
         join(39,k);
         with player[k] do begin
            name := 'Lore Hunter';
            class := 7;
            weapon := 5;
            shield := 2;
            armor := 1;
            wea_power := 15;
            shi_power := 2;
            arm_power := 2;
            ac := 4;
         end;
         Display_Condition;
         map[40,56] := 44;
         Silent_Scroll;
         party.etc[38] := party.etc[38] or bit4;
      end;
      if at(25,18) then
      case party.etc[15] of
         0 : begin
          Print(7,' µa‹¡“e WATER FIELD œa“e ¬÷·¡µ¡.  ·¡‰µ·¡ ”w');
          Print(7,'¯¥·¡  a»¡ b·a¡ ˆáÃ© ¶Ÿ¡Íe· ¬÷·¡µ¡.');
          Print(7,' Àa¶¥· Ëq·i É·Ð Necromancerˆa a µ¡”åi');
          Print(7,'·¡ ”ŸB·e ˆá· ¸å¦ˆa ¤a”a¡ ˆaœa´g´v­¡. Ða');
          Print(7,'»¡ e  ‹a˜µA ¬i´a q·e ¬aœq—i·e ´a»¢ ˆaœa´g');
          Print(7,'»¡ ´g·e ·¡‰µµA Àx´aµÁ¬á ·¡ ¬÷·i ˆåŸ³Ð–­¡.‹a');
          Print(7,'Ÿ¡‰¡“e  ‰··¡ Äö”å aŸi µ×·a¡ Â”Ð–”å ˆõ·¡');
          Print(7,'µ¡.');
          Print(7,' ”w¯¥•¡ ¬—ˆbÐa‰¡ ·¶”a¯¡Ï¡ ·¡ ”ŸB·e ˆá· ¢‰');
          Print(7,'¡ ”üÑa·¶­¡.  Ða»¡ e ·¡‰µÀáœñ ¢‰·¡ Àa»¡´g·e');
          Print(7,'–‰µµA Necromancer “e ·¡£¡ ·¡ ”ŸB· »¡¤Ÿi');
          Print(7,'¶áÐe •·Š‰·i  e—i´ö­¡. ‹a –‰µ· ¸â—i·e µaÈa');
          Print(7,'· ”ŸB‰Á“e §¡Šaˆa ´e–I ¸÷•¡·  ˆá”Ðe ¸â—i');
          Print(7,'·¡  g·¡ ·¶­¡.');
          Print(7,' ¶Ÿ¡¡¬á“e ”á ·¡¬w ­¥·i ³i®ˆa ´ô­¡.  ·¡‰µ');
          Print(7,'¬aœq—i·  a»¡ b Ó w·¥  ·¡ ‰µ·¡ ¸â—iµA‰A ¸ñ');
          Print(7,'w–E”a¡e WIVERN •·Š‰¡ ·¡´á»¡“e ¶¡Èá ‰A·¡Ëa');
          Print(7,'Ÿi É·Ð ”aŸe ”ŸB•¡ Ðaa–‰³¢  ¸ñw–A´á ˆiˆõ');
          Print(7,'·¡µ¡.');
          talk('');
          inc(party.etc[15]);
             end;
         1 : begin
          Print(7,'  å¸á,  µa‹¡¬á q¬á½¢· ´á“a ¬ñµA ·¶“e •·Š‰');
          Print(7,'·¥ NOTICEµA ˆa¬á ¥¡¯a·¥ HidraŸi ¢‰Ÿ¡Áa º¯³');
          Print(7,'¯¡µ¡.');
          PressAnyKey;
             end;
         2 : begin
          Print(7,'HidraŸi ¢‰Ÿ¡Ã¡”a“¡ ... ””eÐe “wb·¡µ¡.');
          Print(11,'[ EXP + 150000 ]');
          Print(7,'');
          for i := 1 to 6 do if player[i].name <> '' then
             player[i].experience := player[i].experience + 150000;
          Print(7,'·¡¹A“e ­¡¢…·a¡ e —h”å ”w¯¥—i· “wb·i £¨·i');
          Print(7,'® ·¶‰V­¡.');
          PressAnyKey;
          inc(party.etc[15]);
             end;
         3 : begin
          Print(7,' ·¡¤åµA“e  ”ŸB· •·½¢µA ·¶“e LOCKUP •·Š‰­¢');
          Print(7,'· Huge Dragon·i ¢‰Ÿ¡Áa º¯¡µ¡.');
          PressAnyKey;
             end;
         4 : begin
          Print(7,'µb¯¡ ¶á”Ðe µw¶—·¡µ¡ !!');
          Print(11,'[ EXP + 300000 ]');
          Print(7,'');
          for i := 1 to 6 do if player[i].name <> '' then
             player[i].experience := player[i].experience + 300000;
          Print(7,'µa‹¡µA Swamp Key ˆa ·¶­¡.');
          PressAnyKey;
          inc(party.etc[15]);
             end;
         5 : begin
          Print(7,' Swamp Key “e GAIA TERRA · ¯aµÑÏa ‰A·¡ËaŸi');
          Print(7,'µa“e•A ¬a¶w–Aµ¡.  ˆá‹¡¬á “|· ”ŸB·a¡ ˆa¯¡');
          Print(7,'µ¡. “|· ”ŸB·e µÅ¸åÐe ¸â—i· ­¡Š‰·¡£a¡  ');
          Print(7,'¶ º·Ða¯¡µ¡.');
          PressAnyKey;
             end;
      end;
          end;
     24 : begin
      if at(11,22) or at(14,24) then train_center;
      if at(33,35) or at(35,37) or at(41,38) then grocery;
      if at(33,21) or at(37,24) or at(40,23) then weapon_shop;
      if at(15,36) or at(11,38) or at(14,40) then hospital;
      if at(17,15) then
         talk(' Ancient Evil·e ¶Ÿ¡· Š­Aºµv¯s“¡”a.');
      if at(18,10) then
         talk(' ·¡ ­A¬w·i ·¡œý‰A ¦‰Ð—Ða‰A Ðe¸a“e ¤a¡ ´e µw‹¡œa“e Ïa¡‹aœ á·³“¡”a.');
      if at(20,13) then
         talk(' ¶Ÿ¡“e µaÈŒõ ”w¯¥—i·¡ µ¡‹¡Ÿi ‹¡”av¯s“¡”a.');
      if at(27,8) then
         talk(' Ancient Evil·e ‰iÅ¡ ÍwÌe‰Á ˆ{·¡ a«e ¹¥¸ˆa ´a“³“¡”a.');
      if at(31,13) then
         talk(' ”w¯¥—i·e ¦…¡wÓ¡ ¶Ÿ¡—i·i ¤c·a¡ aˆa‰A Ðº‰ˆõ·³“¡”a.');
      if at(33,10) then begin
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         putimage(i,j,font^[47],CopyPut);
         putimage(i,j,chara^[24+28],AndPut);
         putimage(i,j,chara^[24],OrPut);
         Print(7,' ·¡ ¬aœq—i·e ¸i ¡¡Ÿa‰V»¡ e  ¬a¯© a“e ·¡ ‰A');
         Print(7,'·±· ¹A¸b¸a·¥ ´e µw‹¡¶a.');
         Print(7,' a“e µaÈŒõ ‰­¢ ”w¯¥—i·¡ ˆa“e •¡¯¡ a”a º');
         Print(7,'£¥·a¡ ˆa¸wÐeÀ ”w¯¥—i·i »¡Åa ¥¡´v­¡. ·¡ ‰A');
         Print(7,'·±· ¤á‹aŸi Àxˆáa e·¡•¡Ÿi ¹¡¸éÐa‹¡ ¶áÐ¬á');
         Print(7,' i·¡¶a.  e´¢ ”w¯¥—i·¡ Necromancer Ÿi ¢‰Ÿ¡Ã¥');
         Print(7,'”a¡e ˆa  a»¡ b·a¡ ”w¯¥´|µA aÈaa‰V­¡.');
         Print(7,' ‹aœñ, ·¡ e a“e ˆa¥¡‰V­¡.');
         talk('');
         party.etc[43] := party.etc[43] or bit4;
         map[33,10] := 47;
         scroll(TRUE);
      end;
          end;
     27 : begin
      if at(15,6) then begin
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         putimage(i,j,font^[44],CopyPut);
         putimage(i,j,chara^[24+28],AndPut);
         putimage(i,j,chara^[24],OrPut);
         Print(7,' ”w¯¥ ´|· ¬aœq·¡ ˆs¸a‹¡ ´á˜å q¸a¡ ¥eÐaµv');
         Print(7,'”a.');
         PressAnyKey;
         Print(7,' ”w¯¥‰Á“e Á¡¡e·¡ ´a“¡»¡¶a? LORE ¬÷µA¬á•¡ ¥Ö');
         Print(7,'·a“¡Œa  i·¡ºa. ”w¯¥·e a· ¸÷ÁAˆa ´á˜é»¡ Š—');
         Print(7,'‹qÐa‹¡•¡ Ða‰V»¡ e aº—µA ¤jÑa»© ·©·¡·¡Œa Àå');
         Print(7,'ÀåÓ¡ ´i´a¥¡‹¡¡ Ða‰¡   å¸á ·¡ Ï¡œa£µµA ”Ð');
         Print(7,'¬á  iÐa‹¡¡ Ða»¡¶a.');
         Print(7,' ·¡ Ï¡œa£µ·e NecromancerµÁ ÐqA ¸áÍe· ‰·ˆe');
         Print(7,'µA¬á Ê—‰a¹a aµÖ»¡¶a. ·¡‰µ·e ·B¯¥·e º‚‰¡ ·');
         Print(7,'»¡ e q·e ¬aœq—i· ´e¯¢Àáœa‰¡•¡ Ði® ·¶ºa.');
         Print(7,' µa‹¡· ''·»¡''—i º—µA¬á  ”w¯¥‰Á ‰Å‰ˆa ´ô“e');
         Print(7,'·»¡“e ¡¡– ¸ˆa –A´á¤áŸ© ˆá¶a. µa‹¡¬á ´è·e');
         Print(7,'¸÷¥¡“e ¡¡– ”w¯¥· ¶…¡w·i ”á¶‚ ”á ¡¡»©‰A  e');
         Print(7,'—i´á ¤áŸ© ˆõ—i·¡»¡ e,  e´¢ ”w¯¥·¡ ´i»¡ ¡µÐe');
         Print(7,'”a¡e ”á”á¶‚ ”á ”w¯¥·i Ó±‰s‰A Ða“e ˆõ—i e ·¶');
         Print(7,'»¡¶a.  ”w¯¥· Ñe¡wÐe Ìe”eµA ¡¡—eˆé  {‹¡•¡¢');
         Print(7,'Ða»¡¶a.');
         talk('');
         putimage(i,j,font^[52],CopyPut);
      end
      else if at(10,14) then begin
         Print(7,' ”w¯¥·¡ ·A‰©µA ”aˆa¬á¸a  ´á—¡¬åˆa ­¡Ÿ¡ˆa —i');
         Print(7,'aµÖ”a.');
         PressAnyKey;
         Print(7,' µ¡! ”w¯¥·¡ a· ¸q·i Œ¶¶a ?');
         Print(7,' ¯©¡ ¡y Àå‘e  eµA ¥¡“e ­A¬w·¡Š…. a“e ”w¯¥');
         cPrint(7,12,'· ¶…¡w¸â·¥  eq·i ‰Å¸wÐa“e ','•A‘A§a· ·»¡','œa');
         Print(7,'‰¡ ¦‰Ÿ¡¶‰¡ ·¶»¡. ”w¯¥·¡  ea‰A –I ¬aœq—i·e');
         Print(7,'·¡£¡ ¸a‘Aˆa ­A¬wµA a‹¡ ¸å¦Èá  ¸÷Ð¹a ·¶´ö');
         Print(7,'”a‘A.   e´¢ ‹a ¬aœq—i·i  ea»¡ ´g‰¡  »¡aÁa');
         Print(7,'¤áŸ¥”aˆáa ¡µ  ea“e ‰w¶ˆa ¬—‹¥”a¡e ¸é”¡');
         Print(7,'Necromancer Ÿi ¢‰Ÿ¡Ã¡»¡ ¡µÐiˆé­A.  ‹aœý”a¡e');
         Print(7,'”w¯¥·¡ ¢  ea´¡ Ði ¬aœq—i·i  iÐ ¥¡‰V‘A.');
         talk('');
         Print(15,' Red Antares');
         Print(7,' ‹a“e ·¡£¡ º‚·e»¡ˆa ® Àå‘e·¡ »¡v»¡ e ‹a·');
         Print(7,'·»¡“e ´a»¢ NOTICEœe •·Š‰­¢µA ¸q—i´á ·¶‘A.');
         Print(7,' ‹a“e ‰Áˆá ÂAˆw·  a¤ó¬a¡¬á ·¡ ˜w·i É·Ã¡Ða');
         Print(7,'µv‰¡ ”a¯¡ ­A‰ˆa Ñ¥£¡¯aœá¶‰˜ ¬¡·¡ aÈaa');
         Print(7,'‰V‘¡œa‰¡  iÐa¡a  Ñ©¡ ‹a •·Š‰µA¬á ¬i”aˆa º‚');
         Print(7,'´ö»¡. Ða»¡ e »¡‹q·¡ ‹aˆa  iÐe˜œa“e ˆé ‹a·');
         Print(7,'µwÑ¥·¡ ´i®·¶‰A e Ðe”a¡e,  ‹a“e ”a¯¡‹q ÂAˆw');
         Print(7,'·  a¤ó¬a¡ ¦ÑÉÐ¬á ”w¯¥—i·i •¡µÁº‰A –A“e');
         Print(7,'¬aœq·¡»¡.');
         talk('');
         Print(15,' Spica');
         Print(7,' »¡‹q  Á¡¸aµebµA ”Ð ´i‰¡·¶‰¡ ¬a¶wÐi® ·¶');
         Print(7,'“e ¬aœq·e ¡y¡w–A»¡ ´g“e•A, ‹aº—· Ðe ¬aœq·¡');
         Print(7,'Necromancer ·¡‰¡ ™¡ »¡‹q  iÐa“e Spica œa‘A.');
         Print(7,' ¸a‘Aˆa ·¡ ‹¡®‰·i ‹a‘aµA‰A ¤¶»¡ ´g“e ”a¡e');
         Print(7,'Necromancer Ÿi  ea‹¡ ¶áÐe •¡º—µA ¢Ÿ|·i Ž');
         Print(7,'‰¡  iˆõ·¡¡a ¬éw ‹aµÁ ”‰iÐa‰A –E”a Ð•¡ ¸a');
         Print(7,'‘A—i·e ÀqÌŸi Ða‰A –Iˆé­A. ·¡ ‹¡®‰¡ ¸aµe·i');
         Print(7,'¹¡¸bÐa‰¡ ·¥ˆe·  a·q·i ·ª·a¡a ¯¡‰·ˆe·i ñ‰a');
         Print(7,'¥©® e ·¶”a¡e  ¦…¡w ”w¯¥·e ­A‰ ÂAˆw· ¸å¬a');
         Print(7,'ˆa –A´á·¶·i ˆé­A.  ‹aŸ¡‰¡, ‹a‘aˆa ·¶“e ‰µ·e');
         Print(7,'¤a¡ ¢‰¡ ”ü·¥ ”ŸB· Dragon ·¡ ¬a“e •·Š‰·');
         Print(7,'´á“a ‹¼®‚Ðe ‰µ·¡œa‘A.');
         talk('');
         Print(15,' Ancient Evil');
         Print(7,' ‹a“e »¡‹q, “|· ”ŸB· ¬á½¢ ¤a”a ˆåá ¸b·e');
         Print(7,'¬ñµA ¬i‰¡ ·¶”a‘A.  ‹aˆa ¬a“e ¬ñ·i Àx‹¡“e ¢');
         Print(7,'Àâ ´ás‰V»¡ e Á¡¸aµeb·a¡ ‰·ˆe·i ñ‰a ¥¡´a');
         Print(7,'¶áÃ¡Ÿi Ìa´bÐeÒ ÉIŸ¡Í¡Ëa  a¤ó·i É·Ð ·¡•·Ða');
         Print(7,'¡e ”a”aŸi® ·¶·i ˆé­A.  ‹a“e  ”w¯¥· £¡œŸi');
         Print(7,'®ó‰A Î‰´áº‰¡, ™¡ ¬¡¶…  eq·i ·¡´áº‰A –I');
         Print(7,'ˆé­A.');
         talk('');
         Print(7,' ·¡ ¶AµA•¡ Polaris, Jr.Antares, Lore Hunter');
         Print(7,', Rigel —w—w· ¬aœq—i·i ®•¡ ´ô·¡  ea‰A –A');
         Print(7,'‰V»¡ e ¤e—a¯¡ ”w¯¥µA‰A •¡¶‘·i º»¡ e·e ´g·i');
         Print(7,'ˆõ·¡¡a,  e´¢ ”w¯¥·¡ q·i •¡µÁ º…”a¡e ¤e—a¯¡');
         Print(7,'‹a•¡  ”w¯¥µA‰A ¥¡·¡»¡ ´g“e •¡¶‘·i º‰A –Iˆá');
         Print(7,'œa“e  i·i {·a¡  a“e ”a¯¡ ¡yÀå‘e· ¸q·a¡');
         Print(7,'¨a¹a—i´á´¡ ‰V‘A. ‹aœñ ´e‘wÓ¡ ...');
         talk('');
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,j,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end
      else if at(10,18) then begin
         Print(7,' ”w¯¥·¡ ·A‰©µA ”aˆa¬á¸a  ´á—¡¬åˆa ­¡Ÿ¡ˆa —i');
         Print(7,'aµÖ”a.');
         PressAnyKey;
         Print(7,' ”w¯¥‰Á a·  eq·e ´áœý—u ¶…¡w¸â·¡‘A. a“e');
         Print(7,'”w¯¥·¡ ·¡˜¿q aŸi Àx´aµ¡Ÿ¡œa‰¡ ˆa ¸q—i‹¡');
         Print(7,'¸å ¡y Àå‘e ¸åµA ·¡£¡ ´i‰¡ ·¶´ö”a‘A.');
         Print(7,' ­¡ˆÐa»¡. a“e ”w¯¥· ®…ÒA¸â ¶…¡w·i ‰Å¸wÐa');
         cPrint(7,12,'“e ','¯¡Ÿ¡¶¯a· ·»¡','œa‰¡ Ða‘A. ”w¯¥·e aŸi Àá');
         Print(7,'·q  ¥Ö‰V»¡ e a“e ¶¥œ ”w¯¥· ™¡”aŸe ¦…¯¥·a');
         Print(7,'¡¬á ”w¯¥·e ‰iÅ¡ aµA‰A“e y ¬é»¡ˆa ´g”a‘A.');
         Print(7,'”w¯¥·e ´á“a ®…ˆeµA•¡ ”w¯¥·¡  ”e»¡ ·¡ ­A‰µA');
         Print(7,'¬á e ”w¯¥· ¬k·¡ ¹¥¸Ðe”a‰¡ ¬—ˆbÐa“eˆa ? ¦…');
         Print(7,'¡w »¡‹q Ñe¸¡¬á“e ‹aœý‰A ¤cµA  ¬—ˆb·i ¡µÐa');
         Print(7,'»¡ e ¯©¹A“e ‹aœý»¡ ´g»¡.  ”w¯¥·e ¦…¡w ·¡ ®…');
         Print(7,'ˆeµA•¡ ”aŸe ‰·ˆeµA¬á“e ™¡ ”aŸe ¬k·i ¬i‰¡ ·¶');
         Print(7,'”a‘A. Ða»¡ e ... ''™¡ ”aŸe ¬k''·¡œa‰¡ ˆa  i');
         Print(7,'Ð–»¡ e  ‰iŠ‚·e Ðe ¶…¡w·i ˆa»¡‰¡ ‰­¢ ·EÒAÐa');
         Print(7,'“e ˆõ·©ª…·¡»¡.  a“e ·¡œý‰A ”w¯¥·¡ Àx´aµ¡“e');
         Print(7,'ˆõ e•¡ ÑA´aŸ©® ´ô·¡ ‰c´ö»¡.  ´å¹Aa ”w¯¥·e');
         Print(7,'¸÷Ð»¥ ¶…¡w ˜¢…µA ´á¼é® ´ô·¡ aŸi ‰­¢ Àx');
         Print(7,'´aµ¡‰A –A“e ˆáœa‘A.  ·¡Ðˆa ˆa»¡ ´g·iˆáœa‰¡');
         Print(7,'a•¡ ¬—ˆbÐa¡e¬á•¡ ”iŸ¡ ¬é¡wÐi ¤w•¡ˆa ´ô´á¬á');
         Print(7,'·¡œå ´ Ðe  i e –AÎ‰·¡ Ði ª…·¡‘A.');
         talk('');
         Print(7,' ”á ¸a­AÐe ¶…¡w·i ´i‰¡ ¯¼”a¡e ¯aµÑÏa ‰A·¡Ëa');
         Print(7,'µA ·¶“e Ï¡œa£µ· µ´å¬áŸi ·ª´á ¥¡‰Aa. ‹aœá');
         Print(7,'¡e ”á ·¡Ðˆa ¨aŸiˆé­A.');
         Print(7,' ‹aœ•¡ ¸i ·¡Ðˆa ´e–E”a¡e ''“|· ”ŸB''· ¶A');
         Print(7,'˜e ¬ñµA ·e–…Ða‰¡ ·¶“e Draconian·i  ea ¥¡•¡');
         Print(7,'¢ Ða‰A. ‹a“e Necromancerˆa ·¡¸å· ‰·ˆeµA¬á');
         Print(7,'·¡ ‰·ˆe·a¡ µ¥ ·¡·AŸi ´i‰¡ ·¶‹¡ ˜¢…·¡œa‘A.');
         Print(7,' ‹aœñ ¶Ÿ¡·  eq·e  ”a·q ‰·ˆe· ™¡ ”aŸe ¶…');
         Print(7,'¡wµA ·Ð ”a¯¡ ¯¡¸b–Iˆé­A. ‹aœñ ‹a˜Œa»¡ ´e');
         Print(7,'‘wÓ¡!');
         talk('');
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,j,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end
      else if at(10,30) then begin
         Print(7,' ”w¯¥·¡ ·A‰©µA ”aˆa¬á¸a  ´á—¡¬åˆa ­¡Ÿ¡ˆa —i');
         Print(7,'aµÖ”a.');
         PressAnyKey;
         cPrint(7,12,' a“e ·¡ ­A‰· ¶…¡w·i ”q”wÐa“e  ','´i§¡Aµ¡·','');
         cPrint(7,12,'','·»¡','œa‰¡ Ðaµ¡. a“e ·¡ ­A¬w·¡ ¬—‹¡¡e¬á ¦Èá');
         Print(7,'“i ·¡œå ¡¡¯s·a¡ µa‹¡¬á »¡µÖ­¡. a“e ·¡¹A');
         Print(7,'Œõ ­A¬w·  g·e ¶á‹¡—i·i ¥¡´aµÖ­¡. Ða»¡ e »¡');
         Print(7,'‹q‰Á ˆ{·e ‰·ˆe·i šá´á ñ·e Ã±·³¸aµA ·Ðe ¶á');
         Print(7,'‹¡“e Àá·q·¡œa‰¡ ‹¡´â–Aµ¡.  a“e ·¡ ‰µµA¬á•¡');
         Print(7,'·¡ ­A¬w ¡¡—eˆõ·i ¥©®·¶­¡. ‹aŸ¡‰¡ µaÈŒõ ”w');
         Print(7,'¯¥· ¸aœaµ¥ ¡¡¯s‰Á µa‹¡µA ¬á ·¶“e ·¡·A•¡ ´i');
         Print(7,'‰¡ ·¶­¡. ™¡Ðe Necromancerˆa ·¡ ­A¬wµA µ¥ ·¡');
         Print(7,'Ò¡ ¦Èá· ‹a· Ð—•·•¡ ¥¡´aµÖ­¡. ‹aŸ¡‰¡ ‰i');
         Print(7,'Š‚·e ... ... ”w¯¥‰Á ‹a· £¡œ•¡ aµA‰A“e ¥¡');
         Print(7,'µa»¡‰¡ ·¶­¡.  a“e ·¡ ¸aŸ¡µA¬á  £¡œ· ·©·i');
         Print(7,' iÐi®“e ´ô­¡. ”w¯¥·¡ ‹a ‰i i·i ´i‰¡ ¯¼”a¡e');
         Print(7,'''“|· ”ŸB''µA ·¶“e Draconian ·i  ea ¥¡“e‰A');
         Print(7,'¹½·iˆá¶a. ‹a¸åµA Ancient Evil•¡ µb¯¡  ea‰A');
         Print(7,'–Iˆõ·¡µ¡. ‹aŸ¡‰¡ Ðeˆa»¡Ÿi ¡w¯±Ða¯¡µ¡.');
         Print(15,' ”w¯¥·¡ µ°”a‰¡ ¬—ˆbÐa“e‰A Ðw¬w µ°·e ˆõ·e ´a');
         Print(15,'“¡µ¡. q—i·¡ »wµ¡Ða“e ˆõ·¡ Ðw¬w ”w¯¥µA‰A ‹a');
         Print(15,'Ÿu–A‰A ¸b¶wÐa»¡“e ´g·i ˆõ·¡µ¡. ™¡Ðe, Ñe¸·');
         Print(15,'»wµ¡ˆa £¡œ· »wµ¡ˆa –A»¡•¡ ´g·i ˆõ·¡µ¡. ‹a');
         Print(15,'Ÿ¡‰¡ ‰iŠ‚µA“e NecromancerŸi ¶w¬áÐa¯¡µ¡.');
         talk('');
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,j,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end
      else if at(21,32) then begin
         Print(7,' ”w¯¥·¡ ·A‰©µA ”aˆa¬á¸a  ´á—¡¬åˆa ­¡Ÿ¡ˆa —i');
         Print(7,'aµÖ”a.');
         PressAnyKey;
         Print(7,' ´e‘wÐa¯¡µ¡. a“e Necromancer · ¶…¡w·i ‰Å¸w');
         cPrint(7,12,'Ða‰¡ ·¶“e ','Äa‘¡Î¯a· ·»¡','œa‰¡ Ðaµ¡.  ·¡ ‰·ˆe');
         Print(7,'ª… e ´a“¡œa ”aŸe ‰·ˆeµA¬á ¹¥¸Ða‰¡ ·¶“e Nec-');
         Print(7,'romancer· ¶…¡w ™¡Ðe ˆa ”q”wÐa“e ¤ñºµA —i');
         Print(7,'´áˆe”aµ¡.  Ða»¡ e ‹a“e ‹a· ¶…¡w·i ˜aŸa“e ¹¥');
         Print(7,'¸·©ª… ‹a ·¡¬w· ·£¡“e ´ô­¡.  ‹a“e ®•¡´ô“e');
         Print(7,'¸áÍe· ‰·ˆeµA¬á »¡¶¡»¥ ¶…¡w·i ”aÐˆv­¡. ‹aŸ¡');
         Print(7,'‰¡ ™¡ µa‹¡¬á  ”a¯¡ ‹a· ¶…¡w·i ¯¡¸bÐaa Ða‰¡');
         Print(7,'·¶­¡. ·¡ ‰·ˆe Ðaa ¤cµA ·¥¯¢Ða»¡ ¡µÐa“e ·¥ˆe');
         Print(7,'· ¬a‰¡¡“e ¥i ˆaÃ¡ˆa ´ô“e ·©·¡»¡ e,  ¶…¡w·i');
         Print(7,'˜aŸa‹¡ ¶áÐ ”a·q ‰·ˆeµA¬á•¡ ˆ{·e ¶…¡w·i ¤e¥¢');
         Print(7,'Ð´¡ Ðe”a“e ‹a ‹q”e· ·¡Ã¡“e  ¦…¡w ‹a•¡ ˜aŸa');
         Print(7,'‰¡ ¯¼»¡ ´g´v·i ˆõ·¡µ¡. Ða»¡ e ‹a“e ‹a ¸a¯¥•¡');
         Print(7,'‹aˆõ·¡ ¸é” ¤aŽé® ´ô“e  Ìœá•¢¯aœa“eˆé ´i‰¡');
         Print(7,'·¶·i‰A¶a.  Necromancer ‹a ¸a¯¥·e ¸÷ i ¦‰Ð—Ðe');
         Print(7,'¹¥¸œaµ¡.  ¯a¯a¡· ¶…¡w·i —wµA »¡‰¡  Ó±‰s‰A');
         Print(7,'Àa¶¥·i ½¹‹¡´á ”a“¡“e Ó±´ô“e »±¯w·© ª…·¡µ¡.');
         Print(7,' ”w¯¥·¡   a»¡ b· ‹aµA‰A  ¤h·i® ·¶“e “a±·e');
         Print(7,'»¥¸÷Ðe  a·qµA¬á ¶œáaµ¡“e •·¸÷·©ˆõ·¡µ¡.  ”w');
         Print(7,'¯¥·e  ¸á¤å ‰·ˆeµA¬á•¡ µb¯¡ ‹aˆõ·i “av­¡. Ða');
         Print(7,'»¡ e ‹a˜· ‹¡´â·e  ”w¯¥·¡ ·¡ ­A‰µA ‹aŸi ¢‰');
         Print(7,'Ÿ¡Ã¡a“e ¶…¡w·i »¡“¡‰¡ ”a¯¡ È´áv·i˜  ·¡£¡');
         Print(7,'¬aœa¹a ¤áv­¡. ”w¯¥·e  i·i ·¡ÐÐa»¡ ¡µÐa‰V');
         Print(7,'»¡ e ‹aˆõ·e ¬a¯©·¡µ¡.  »¡‹q·e  ‹aŸi »wµ¡¡¬á');
         Print(7,' x·¡Ðaa Ða‰V»¡ e ‹a »wµ¡“e ”a¯¡ ”a·q ‰·ˆe·a');
         Print(7,'¡ ·¡´á»¡aÐaµ¡.  ”w¯¥·¡ ‹aŸi ¢‰Ÿ¡ Ã¥”a‰¡ Ða');
         Print(7,'µa•¡ ”a¯¡ ”a·q ‰·ˆeµA¬á•¡ »¡‹q‰Á ˆ{·e ”Ÿ³·i');
         Print(7,'¤e¥¢Ði ª…·¡µ¡.  ”w¯¥‰Á ‹aµÁ· ”Ÿ³·e ·¡ ¶º');
         Print(7,'ˆa ¬—‹¡‹¡ ¯¡¸bÐi˜ ¦Èá »¡‹qŒa»¡ ®•¡´ô·¡ ¤e');
         Print(7,'¥¢Ð–‰¡ ‹a ·¡Ò¡•¡ ·¡ ¶ºˆa ¬aœa»©˜Œa»¡ µw');
         Print(7,'¶¥Ó¡ ¤e¥¢–I ˆõ·¡µ¡.  ‹aŸ¡‰¡   a»¡ b·a¡ ˆa');
         Print(7,'Ða‰¡ ¯¼·e  i·e ·¡œåˆõ·¡µ¡.');
         Print(15,' ”w¯¥·e ‰iŠ‚ NecromancerŸi •·¸÷ Ði»¡ ¡¡Ÿaµ¡.');
         Print(15,'Ða»¡ e ‰iÅ¡ ‹a e·¡ •·¸÷· ”¬w·¡ ´a“¡µ¡.  ‰i');
         Print(15,'Š‚·e  ‹aµÁ µe‰Å–A´á ¶…¡w·¡ ‰i¸÷»¡¶¡»¥ ”w¯¥•¡');
         Print(15,'µ¶Aˆa –I®“e ´ô­¡.');
         talk('');
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,j,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end
      else if at(21,22) then begin
         Print(7,' ”w¯¥·¡ ·A‰©µA ”aˆa¬á¸a  ´á—¡¬åˆa ­¡Ÿ¡ˆa —i');
         Print(7,'aµÖ”a.');
         PressAnyKey;
         Print(7,' ”w¯¥ ´|· ·A‰©·e ¤a¡ a·ˆõ·¡µ¡. aŸi ­¡ˆ');
         cPrint(7,12,'Ða¸a¡e ','´aÇaÊž¯a· ·»¡','œa‰¡ ¦‰Ÿ¡¶“e ¹¥¸¡');
         Print(7,'¬á Ancient Evil· ¶…¡w·i ‰Å¸wÐa‰¡ ·¶­¡. ·¡Ÿq');
         Print(7,'µA¬á ´i®·¶—u·¡  ‹aŸi ®Ñ¡Ða“e ·»¡“e ¡¢¸a·');
         Print(7,'¬÷‰b·i ˆx‰¡·¶­¡. Ða»¡ e ‹a· ·¡Ÿq·¡a ÍwÌe·a');
         Print(7,'¡ ¥©˜“e  ¸åÑa ‹aœå ¬÷‰b·i ´i»¡ ¡µÐa‰A –A‰¡');
         Print(7,' a“e‰A ¥¡É··¡µ¡. ‹a“e Lord Ahn‰Á ”Ÿ³Ða“e ¶…');
         Print(7,'¡w·i »¡“¡‰¡ ­A¬wµA ¹¥¸Ða‰A –A´ö­¡.   aÃ¡ ”w');
         Print(7,'¯¥‰Á NecromancerµÁ ˆ{·¡  i·¡µ¡. Lord Ahn‰Á·');
         Print(7,'”Ÿ³ ‰Å‰œe ¶…¡w ˜¢…µA  ‹a“e ‹a· ¡¡—e ¬÷‰b');
         Print(7,'·i Í¡‹¡ÐeÀ Lord Ahn·i ¶áÐaµa ´b· ÍeµA ¬á‰A');
         Print(7,'–A´ö”å ˆõ·¡µ¡. ‹a˜, –‰º—µA ’Š Ðaaˆa ´b·');
         Print(7,'”Îaˆa –A»¡ ´g·a¡e ´e–A´ö‰¡  Lord Ahn·e ‰iÅ¡');
         Print(7,'­A·¥· »¡Èe·i ¤h“e ´b·i ”ÎaÐaa‰¡ Ða»¡ ´g·q');
         Print(7,'·a¡ Ð¬á  ‹aˆa »¢¸ó ´b· ”Îaˆa –A‹¡¡ Ðaµv');
         Print(7,'”å ˆõ·¡µ¡. Ða»¡ e ¶¥œ ‹a·  a·q·e ‹b•¡· ¬å');
         Print(7,'µA ·¶´ö‹¡ ˜¢…µA  ‰iŠ‚ ‹a· ´b·¡œe ´b· ”Îa');
         Print(7,'¸÷•¡ ¤cµA“e –I®´ô´ö”å ˆõ·¡µ¡. Ða»¡ e ¤e”¡');
         Print(7,'Lord Ahn· ·³¸wµA¬á“e  ‹aŸi ‰­¢ §¡ÌeÐa¡a ¬a');
         Print(7,'œq—iµA‰A  ¬å· ˆ‘q·i ¯±´áºa Ðaµv·a£a¡ ‰i');
         Print(7,'Š‚·e ‹aµA ”Ðe Àé¸áÐe ¹¡¸b·a¡ ¶á¸wÐ¬á ‹aŸi');
         Print(7,'§¡Ða ¯¡Ç¡‰¡ ¸a¯¥·i ¦ˆb ¯¡Åa, ´áŸ©˜ ¦Èá ¬å');
         Print(7,'‰Á ´b· ˆ‘q·i Š¦… ¯¡Ç¡‰¡  ´b·i ¤ÀâÐa“e ¬—');
         Print(7,'ÑÉ·i Ðaµa ¬aÒAŸi ®…ÈeÐa‰A ·¡i´á aˆaa‰¡ Ða');
         Print(7,'µv­¡. ¢‰¥ Lord Ahn· ¬—ˆb·¡ Ëiv”a‰¡“e Ði®');
         Print(7,'´ô­¡.  ‹a‰A Lord Ahn· ¶…¡w·¡œa Ði® ·¶‹¡ ˜');
         Print(7,'¢…·¡µ¡. Ðw¬w Lord Ahn·  a·q•¡ ÍeÐa»¡ ´g”a“e');
         Print(7,'ˆé ´i‰¡ ·¶­¡. ¸éÃ¥Ðe •·¤e¸a·¥ ‹aŸi ¸â·a¡ •©');
         Print(7,'a ¤áŸ¥ˆõ•¡  ‹a· ¶…¡w·i ¤õ´ái ® ´ô´ö‹¡ ˜');
         Print(7,'¢…·¡µ¡. ‹aŸ¡‰¡ ‹a—i· ‰w»¡“e ¤e¯¥ ¤e·¥·¡œa“e');
         Print(7,'ÂA‰¡· ‰w»¡µA µ©œv­¡.  ”w¯¥ µb¯¡ Necromancer');
         Print(7,'µA‰A •¡¸åÐa‰¡¸a Ðe”a¡e ‹a ‰w»¡µA ”a”aœa´¡ Ða');
         Print(7,'µ¡. ¦…¡w ‹a—i –‰· “wb·a¡“e ”w¯¥‰Á ”w¯¥ ·©');
         Print(7,'Ð——i·i ¤e¯¥ ¤e·¥·a¡  e—i´á º‰® ·¶·iˆõ·¡µ¡.');
         talk('');
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,j,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end
      else if at(21,12) then begin
         Print(7,' ”w¯¥ ´|µA ·¶“e ·A‰©· ­¥µA“e ´á˜å –ž aŸ¡');
         Print(7,'ˆa ºá´á¹a ·¶´ö”a.');
         m[0] := '';
         m[1] := '‹a ¢…¬áŸi ·ª´á ¥¡‰¡ ¯¼”a';
         m[2] := '‹a· »¡a ˆa‰V”a';
         if select(125,2,2,FALSE,TRUE) <> 1 then exit;
         Clear;
         Print(15,' Durant l''estoille cheuelue apparente,');
         Print(7,'  áŸ¡Ÿi Î… ¥i·¡ aÈai˜');
         Print(15,' Les trois grand princes seront faits ennemies,');
         Print(7,' ˆá”Ðe ­A µ×¸aˆa ¬á¡Ÿi ¸â”Ðe”a');
         Print(15,' Frappez du ciel paix terre trembulente,');
         Print(7,' ÍwÑÁ“e Ða“iµA¬á ”wÐa‰¡ ”»¡“e ¶a•·Ðe”a');
         Print(15,' En son haut auge de l''exaltation,');
         Print(7,' ‹a Àe£¡Ð´¡ Ði ‘¼·e µ¡ŸA ­¢µA¬á');
         Print(15,' Neromancer sur le bord mis.');
         Print(7,' Necromancer “e Ð´e·a¡ £©aaŸ¡œa.');
         talk('');
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,j,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end
      else begin
         i := 100 + 20 * x1;
         j := 100 + 20 * y1;
         message(7,' ”w¯¥·¡ ·A‰©µA ”aˆaˆa¸a ¸¡ ¥eÐaµv”a.');
         for k := 1 to 30 do begin
            delay(k*2);
            putimage(i,100+20*y1,font^[48],CopyPut);
            delay((31-k)*2);
            putimage(i,j,font^[35],CopyPut);
         end;
         map[x+x1,y+y1] := 35;
      end;
          end;
   end;
end;

begin
end.