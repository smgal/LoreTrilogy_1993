Unit DarkTalk;

INTERFACE

Uses
   Crt, Graph, UHanX, DarkSub, DarkBatt;

 Procedure talkmode;


IMPLEMENTATION

Procedure talkmode_sub1;
begin
   Clear;
   case party.map of
      6 : begin
             if at(21,12) or at(25,13) then About_Class;
             if at(86,12) or at(87,14) then Hospital;
             if at(14,73) or at(8,71) or at(14,69) then Weapon_Shop;
             if at(87,73) or at(91,65) or at(94,68) then Grocery;
             if at(24,50) then begin
                if party.etc[10] = 0 then begin
                   Print(7,' ´á¬á ¡—a ´e “±µA‰A ˆa¥¡•¡¢ Ða‰A.');
                end
                else begin
                   Print(7,' ·¡¤åµA•¡ Çe·©·i  x‰A •öŠ…,'+player[1].name+'.');
                   Print(7,' ·¡¤åµA•¡ ¦…¡w ”w¯¥·e Ð‰ ® ·¶·aŸ¡œa‰¡ £¨');
                   Print(7,'‘A.  ‰Áˆá· µw¶—·e  ·¡¹A ·¸Ña¹a ˆa»¡ e ”a¯¡');
                   Print(7,'·©´á¬á“e i·¡ ¤a¡ »¡‹q·¥ˆõ ˆ{‘A. ·¡¤å ·© e');
                   Print(7,'¬÷‰·Ða¡e  ”a¯¡ ‹a˜· µw‰×·i Àx·i® ·¶·i ˆé');
                   Print(7,'­A. ¸a‘A· ¬÷‰··i §©´á º‰V‘A.');
                end;
             end;
             if at(24,54) then begin
                Print(7,' ¡—a ´e “±·¡ ”w¯¥·i ¦Ÿa­v”a¡e¬á¶a. ¯¡”·');
                Print(7,'µw¶—·¡´ö”å  ”w¯¥Àáœñ –A‹¡ ¶áÐ  ¸á•¡ µi¯±Ó¡');
                Print(7,'®e·i Ða‰¡ ·¶¯s“¡”a.');
             end;
             if at(19,53) then begin
                cPrint(7,10,' ·¡ ­A‰· Àw¯¡¸a“e ','´e µw‹¡','“± ·¡¯¡¡a, ‹a“e');
                Print(7,'¶á”Ðe Ïa¡‹aœ á ·³“¡”a.');
             end;
             if at(13,55) then begin
                Print(7,' »¡‹q ´á˜å µ´å¬áˆa ¤i‰e–A´á  º£¥—i· ‰Å¯±');
                Print(7,'·i i‰¡ ·¶”áŠ…¶a.');
             end;

             {  ¡´á º¸ñ  }

             if at(13,27) or at(18,27) then begin
                s := ReturnSex(1);
                Print(7,' ´á¬á µ¡¯³¯¡µ¡. µa‹¡“e ¡´á º¸ñ·³“¡”a.');
                if random(2) = 0 then
                   Print(7,' ˆá‹¡ '+s+'¦… ´á¬á µ¡¯³¯¡µ¡.')
                else
                   Print(7,' ¶á¯aÇ¡µA¬á ÄbÉA·©Œa»¡  a·qŒõ ¬åÈ‚Ða¯³¯¡µ¡.');
             end;
             if at(21,36) then begin
                Print(7,' ·a~~~ ÂáÐe”a.');
             end;
             if at(18,38) then begin
                Print(7,' µ´å¬á ?  ¢¡ˆa µ´å¬á´¡ ! ‹aœåˆé £¨”a“¡ ¶');
                Print(7,'Ÿ¡ˆa ¢¯e ´áŸ¥´ ·¥ˆa.');
             end;
             if at(15,35) then begin
                Print(7,' Çe·©vŠ…. ¤é°á  Ã¥Š•¡ –¡w·¡a ¡Aá¯aµA');
                Print(7,'¬á Ó¬—–A´ö“e•A...');
             end;
             if at(13,32) then begin
                Print(7,' Èa·± ¶¡Äá·¥ ´i§¡Aµ¡Ÿi ¸åµA Ðe¤å ¥¥¸â·¡ ·¶');
                Print(7,'»¡.  ‹a“e µ´å¬á Ðaa e q‰a ‘½‰¡“e ”a¯¡ ¯¡');
                Print(7,'ˆe ­¢·a¡ µaÐ—·i ˜áv”a‘A. ´a¢•¡ ‹aˆa ´á“a');
                Print(7,'¯¡”· ¬aœq·¥»¡ ´a“¡¡e ·¡ Àa¶¥· ¬aœq·¥»¡•¡');
                Print(7,'¡¡Ÿe”a‘A.  a•¡ ‹aˆa µ´å¬áŸi ¸åÐº‹¡ ¶áÐ');
                Print(7,'¡´á ”ŸBµA µÖ·i˜ ¸q¯¡ ¥¥ ¸â·¡ ·¶´ö“e•A ¸÷');
                Print(7,' i ””eÐe ¦…·¡­v»¡. ´a a•¡ ‰¡”·  a¤ó¬a A');
                Print(7,'—a ´eÈaA¯aµA Ï©¸âÐa“e ¯©b·¡”áŠ…');
             end;
             if at(18,33) then begin
                Print(7,' ÓbÓbÓb~~~ ¸á· µ¡¨aˆa ¡Aá¯aµA¬á º‚´ö´á¶a.');
                Print(7,'Ða»¡ e ´a¢•¡ ¶¥·¥ ¹¡Àa ´i ® ´ô”a‰¡ Ða”áŠ…');
                Print(7,'¶a.');
             end;
             if at(10,30) then begin
                Print(7,' ”w¯¥A¬á  ™¡ ¬¡¶… ¡¡Ðñ·i Ða¯¥”a‰¡ —i´ö“e');
                Print(7,'•A  µ•i· •·ža—i·e ¡¡– Ó{´á¹a ·¶´á¬á ”a¯¡');
                Print(7,'¡¡·a­a´¡ –A‰VŠ…¶a.');
             end;

             {  ¢”ñ  }

             if at(72,78) then begin
                Print(7,' ‰Áˆá· µw¶—·¡´ö”å '+player[1].name+'“±.');
                Print(7,' µ¡“i•¡ µb¯¡  ¥AœaËaŸ¢¯a“±· ¢”ñµA  µ¡­vŠ…');
                Print(7,'¶a. ´aÀq !  ¸åµA ´á˜å ¸å¬a¦…A¬á ¥AœaËaŸ¢¯a');
                Print(7,'“±· ¢”ñµA —iŸ¡‰¡“e  ˆá‹¡µA ¡A¡¡Ÿi q‰a –');
                Print(7,'´ö”áŠ…¶a. ·¡Ÿq·e »¡“¡´á¯a ‹¡œa‰¡ Ða”å•A, µ•');
                Print(7,'iµA —i´á¥¥ ·¡Ÿq ˆ{‹¡•¡ Ða‰¡...');
             end;
             if at(67,76) then begin
                Print(7,'¢a§¡µA ³aµa ·¶‹¡Ÿi ...');
                Print(7,''); Print(7,''); Print(7,'');
                Print(11,'          µa‹¡“e ¥AœaËaŸ¢¯a· ¢a');
                Print(15,'     772 ‘e 11 ¶© 27 ·© µa‹¡µA ¸q—i”a.');
                for i := 1 to 5 do Print(7,'');
                Print(7,' ¸a­AÓ¡ ¬iÍa ¥¡“¡  ¢a§¡ £»µA ´á˜å ½¢»¡ˆa ·¶');
                Print(7,'´ö”a.');
                PressAnyKey;
                Print(7,player[1].name+' µA‰A.');
                Print(7,'');
                Print(7,'');
                Print(7,' ¸a‘Aœa¡e µa‹¡µA µ© ˆáœa‰¡ £¨‰¡  ·¡ ‹i·i ³e');
                Print(7,'”a‘A. a“e »¡‹q ·e¯¥ º—·¡œa  ˆa ·¶“e ‰µ·i');
                Print(7,'¤jÓ©®… ´ô»¡ e a“e »¡‹q ¢¬aÐa”a‘A.  ¸a‘AµÁ');
                Print(7,'· ‹¡a ‹¥ ¡¡Ðñ·i { aÃ¡‰¡ •©´a µ¡”åº— a“e');
                Print(7,'aŸq”¡· ›u·¡ ·¶´á ¡´á¬÷µA •©´aµ¡»¡ ´g´v');
                Print(7,'”a‘A.  ¸a¯¥· ·»¡µv”a¡e µwµw ¡´á¬÷µA •©');
                Print(7,'´aµ¡»¡ ´g´v‰V»¡ e  ‰¨ ¤i¬—Ði  ¬¡¶… ¶áÑs·i');
                Print(7,'a“e “a¡‰¡ ·¶‹¡ ˜¢…µA  ¸a‘AµA‰A ·¡œå ½¢»¡');
                Print(7,'Ÿi ¥¡‰A –A´ö‘A.');
                PressAnyKey;
                Print(7,' ¡´á¬÷Œa»¡“e ­¡¢…·¡ £¡Ã¡»¡ ´g´v“e»¡“e ¡¡Ÿa');
                Print(7,'‰V»¡ e ¡´á ”ŸB· q•·½¢µA“e ´i ® ´ô“e Ï¡');
                Print(7,'œa£¡—aˆa ˜w ­¢·a¡ ¦Èá ­µ´a µ©œv”a‘A. aµÁ');
                Print(7,'¡´á ÐåÈá –‰·¡¬á ‹a ‰µ·i ÈqÐñ Ð–´ö»¡. ‹a ‰µ');
                Print(7,'µA“e ”a¯¡ –ˆ· •·Š‰·¡ ·¶´ö‰¡ ‹a –‰µ·e »¡');
                Print(7,'Ða ­A‰µÁ µe‰i –A´á ·¶´ö”a‘A.  ‹a ‰µµA ”Ð');
                Print(7,'¬á“e »¡‹q ·¡ ¡A¡¡· µa¤‚·¡ ¹³´a¬á  iÐa‹¡ ´á');
                Print(7,'s”a‘A. a“e »¡‹q ·¡ ‰µ,¸á ‰µ ˜á•©´a ”a“¡»¡');
                Print(7,' e  ¦‚•·½¢ Ð´e· µ¡– bµA ¬i‰¡ ·¶“e ¸åÊ¯w');
                Print(7,'AŠ‰ž¯aµA‰A ¢‰´á ¥¡¡e  ˆa ·¶“e ‰µ·i ¸a­A');
                Print(7,'Ó¡ ´i ® ·¶·i ˆé­A.');
                Print(7,'');
                Print(7,'');
                Print(7,'                          »¡“¡´á¯a ‹¡¡¦Èá');
             end;

             {  ºA®  ®ˆq­¡  }

             if at(50,11) then begin
                Print(7,' ·¡ ´eµA ˆhÑa·¶“e ¬aœq—iµA‰A“e ·©ÁA ¡eÒAˆa');
                Print(7,'Ðá¶w–A»¡ ´g¯s“¡”a. aˆa º¯³¯¡µ¡.');
             end;
             if at(53,11) then begin
                Print(7,' µa‹¡“e ¡—a ´e· ÁA¹AµA ”Ð¬á  ‹¼·e ¤eˆq');
                Print(7,'·i ˆa»¡‰¡ ·¶“e ¸a—i·i ®¶wÐa‰¡ ·¶¯s“¡”a.');
                Print(7,' ´a a ‹a—i·e º‚‹¡¸åµA“e ·¡‰µ·i aµ©® ´ô·i');
                Print(7,'ˆó“¡”a.');
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
                Print(7,'');
                PressAnyKey;
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
                      name := '£¡Ã¥ ¹¡';
                      sex := male;
                      class := 0;
                      classtype := unknown;
                      level := 2;
                      strength := 10;
                      mentality := 5;
                      concentration := 6;
                      endurance := 9;
                      resistance := 5;
                      agility := 7;
                      accuracy := 5;
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
                      armor := 0;
                      potential_ac := 1;
                      sword_skill := 5;
                      axe_skill := 5;
                      spear_skill := 0;
                      bow_skill := 0;
                      shield_skill := 0;
                      fist_skill := 20;
                      Modify_Item(k);
                   end;
                   Display_Condition;
                   PutMap(40,15,47);
                   Silent_Scroll;
                   party.etc[50] := party.etc[50] or bit5;
                end
                else asyouwish;
             end;
             if at(63,10) and (party.etc[50] and bit6 = 0) then begin
                Print(7,' ˆa ¡y‘e ¸åµA Ñ×‹q ¤wÌŸi ®‘‰a ‘½´v”å  ¡A');
                Print(7,'á¯aµA ¬¡¶… ·©—i·¡ ¬—‰v”a“e‰A ¬a¯©·¡µ¡ ?');
                Print(7,' ˆa ¸á¤åµA“e ¶w‹¡ˆa ´ô´á¬á ”w¯¥‰Á ÐqA •·');
                Print(7,'Ð—Ða¸a“e  i·i ¡µÐ–»¡ e ·¡¤åµA“e Ðe¤å ¦ÈbÐa');
                Print(7,'‰V­¡. a“e §¡¢ •¡–‚»©·i Ð¬á µa‹¡µA —i´áµÖ');
                Print(7,'»¡ e ´q¬i¸a¡¬á· ·±¢•¡ ¸i Ð‰ˆá¶a.');
                m[0] := '';
                m[1] := '¯wœbÐa‰V­¡, ‹aœñ ¸i ¦ÈbÐaµ¡';
                m[2] := 'ºA®Ÿi ÈiÂ‰ ¯¡Ç¡¡e a µb¯¡ Ó±—i‰A –Aµ¡';
                if Select(170,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := ' áÇAŸ¡';
                         sex := male;
                         class := 6;
                         classtype := sword;
                         level := 2;
                         strength := 12;
                         mentality := 5;
                         concentration := 6;
                         endurance := 11;
                         resistance := 18;
                         agility := 19;
                         accuracy := 16;
                         luck := 19;
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
                         potential_ac := 2;
                         sword_skill := 10;
                         axe_skill := 0;
                         spear_skill := 0;
                         bow_skill := 20;
                         shield_skill := 0;
                         fist_skill := 20;
                         Modify_Item(k);
                         PutMap(63,10,47);
                         party.etc[50] := party.etc[50] or bit6;
                         Silent_Scroll;
                         Display_Condition;
                         Clear;
                         Print(7,' ‰¡ s­¡. ‹aŸ¡‰¡ ¥w¬a—iµA‰A —iÇ¡»¡ ´g‰A µa‹¡');
                         Print(7,'Ÿi aˆa´¡ –E”a“e ˆõ ¸÷•¡“e ´i‰¡ ·¶‰V»¡¶a.');
                      end;
                   end
                   else begin
                      Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š…¶a.  ”a·q ‹¡ÒA');
                      Print(7,'Ÿi ‹¡”aŸ¡»¡¶a.');
                      exit;
                   end;
                end;
             end;
             if at(60,15) then begin
                Print(7,' ”w¯¥—iµA‰A ‰w‰¡Ð –‰V“e•A ˆåáÍe ¤wµA ·¶');
                Print(7,'“e ¹¡“e µ¡œ… ®ˆq¬—ÑÉ {µA  £¡Áa ¤áŸ¡‰¡  i');
                Print(7,'´v­¡.  ‹a·  iµA ­¢´a¬á ”w¯¥‘A ·©Ð—µA Àqˆa');
                Print(7,'¯¡Ç¡“e ‹aœå ¯©®“e Ða»¡ a¯¡µ¡.');
             end;

             {  ¢‹¡  Àw‰¡  }

             if at(42,78) or at(42,80) then begin
                if (party.etc[30] and bit4) = 0 then begin
                   Print(7,' ¡—a ´e “±· ¡wwµA ·Ð¬á  ”w¯¥—iµA‰A Ðe');
                   Print(7,'ˆa»¡· ¢‹¡Ÿi —aŸ¡‰V¯s“¡”a.  —i´áˆa­a¬á ¢');
                   Print(7,'‹¡Ÿi ¬åÈ‚Ð º¯³¯¡µ¡.');
                end
                else begin
                   Print(7,' µa‹¡¬á ˆa¹aˆa¯¥ ¢‹¡Ÿi ¸i ¬a¶wÐa­a¬á ·±¢');
                   Print(7,'Ÿi ®Ð—Ða“e•A ¸i ÑÉ¶w Ða¯³¯¡µ¡.');
                end;
             end;

             {  ¡´á  ·eÐ—  }

             if at(79,47) then begin
                Print(7,' ¶Ÿ¡ ·eÐ—·e Àé¸áÐa‰A ¥¡´e –A‰¡ ·¶¯s“¡”a.');
             end;
             if at(79,49) then begin
                Print(7,' ­¥“±A¬á“e µ‹q ÀwŠ· ´e½¢·a¡“e —i´áˆa');
                Print(7,'¯¡¡e ´e–S“¡”a. ‹a ˜· ·©·e À‚·± »© ® ´ô');
                Print(7,'¯s“¡”a.');
             end;
             if at(85,48) then begin
                Print(7,' »¡‹q·e £¥¯±·¡ ´á®¬åÐ¬á ·eÐ—· ·³Â‰‹q·i');
                Print(7,'‹q»¡Ða‰¡ ·¶¯s“¡”a. ´·ÐÐaµa º¯³¯¡µ¡.');
             end;
             if at(90,47) then begin
                Print(7,' ’Š¡ !  ´u ·eÐ— ˆw•¡”a.');
                Print(7,' ‰w§¡¥w !  ‰w§¡¥w !');
                PressAnyKey;
                enemynumber := 3;
                for i := 1 to enemynumber do begin
                   joinenemy(i,26);
                   with enemy[i] do begin
                      if i < enemynumber then name := '‰w§¡¥w '+chr(48+i)
                      else name := '·eÐ— ‰w§¡¶¥';
                      special := 0;
                      castlevel := 0;
                      E_number := 1;
                   end;
                end;
                Displayenemies(TRUE);
                Print(7,'  e´¢ ”w¯¥·¡ ¶Ÿ¡µÁ °a¶…”a¡e  ”w¯¥·e ¤ñºA¸a');
                Print(7,'¡¬á  µwµw ¡´á ¬÷µA —i´á µ© ® ´ô”a“e ˆõ·i');
                Print(7,'´i´a´¡ Ðe”a. Ðw¥¢Ðaœa !');
                m[0] := '';
                m[1] := 'Ðw¥¢Ðe”a';
                m[2] := '‹aœ•¡ °a¶…”a';
                k := Select(120,2,2,FALSE,TRUE);
                if k = 1 then begin
                   for i := 1 to 5 do begin
                      player[i].weapon := 0;
                      player[i].shield := 0;
                      player[i].armor := 0;
                      Modify_Item(i);
                   end;
                   x := 41; y := 16;
                   Silent_Scroll;
                   exit;
                end;
                enemynumber := 4;
                joinenemy(1,68);
                for i := 2 to enemynumber do begin
                   joinenemy(i,26);
                   with enemy[i] do begin
                      if i < enemynumber then name := '‰w§¡¥w '+chr(48+i)
                      else name := '·eÐ— ‰w§¡¶¥';
                      special := 0;
                      castlevel := 0;
                      E_number := 1;
                   end;
                end;
                Displayenemies(TRUE);
                Print(7,' ”w¯¥·¡ ·eÐ—µA Ã±·³Ða”a“¡ ·¶A¡Š…¶a.  Ða»¡');
                Print(7,' e ¶Ÿ¡· £¨·q·i ¹a¤áŸ¡‰¡  ´bÐe·©·i Ðe ”•ˆa');
                Print(7,'Ÿi ¤h·a¯¡µ¡. ¸a, ‹aœñ.');
                PressAnyKey;
                Print(13,' ¡—a ´e·e ¸åÁAµA‰A ''Ï©¡i º¢…''·i ¬a¶wÐ–”a');
                Print(7,'');
                for i := 1 to 6 do
                if exist(i) then begin
                   Print(4,player[i].name+ReturnSJosa(player[i].name)+' º‚´ö”a !!');
                   player[i].hp := -9999;
                   player[i].unconscious := 9999;
                   player[i].dead := 9999;
                end;
                Display_Condition;
                PressAnyKey;
                party.etc[6] := 1;
                GameOver;
             end;

             {  ÐsŸAÐi ”¶¥  }

             if at(89,23) and (party.etc[50] and bit1 = 0) then begin
                Print(7,' µ¡, '+player[1].name+'!');
                Print(7,' ¸a‘A“e i ‹¡´âÐa‰V»¡. a“e ÑAœaÇiA¯a·©­A.');
                Print(7,'¸a‘AµÁ ‘AÇa¡ e¬áŸi ¢‰Ÿ¡Ã¡”å ˜ˆa  ¬—ˆba“e');
                Print(7,'Š…. ‹aœ, ·¡¤åµA•¡ º—”Ðe ·©·¡ ¤i¬—Ð–”a‰¡—i');
                Print(7,'Ða”å•A ‹a‰A ¬a¯©·¥ˆa ?  ¬a¯©·¡œa¡e ·¡¤åµA•¡');
                Print(7,'aŸi ¡¡ÐñµA Àqˆa ¯¡Åaº‰A.');
                m[0] := '';
                m[1] := 'a µb¯¡ ¸a‘A· •¡¶‘·¡ Ï©¶aÐ–”a‘A';
                m[2] := '¸a‘AŒa»¡ a¬é ¸÷•¡¡ ¯±ˆbÐe·©·e ´a“¡‘A';
                if Select(170,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := 'ÑAœaÇiA¯a';
                         sex := male;
                         class := 2;
                         classtype := sword;
                         level := 2;
                         strength := 18;
                         mentality := 5;
                         concentration := 6;
                         endurance := 15;
                         resistance := 12;
                         agility := 14;
                         accuracy := 14;
                         luck := 12;
                         poison := 0;
                         unconscious := 0;
                         dead := 0;
                         hp := endurance * level * 10;
                         sp := 0;
                         experience := 0;
                         potential_experience := ReturnEXP(level);
                         weapon := 3;
                         shield := 1;
                         armor := 1;
                         potential_ac := 2;
                         sword_skill := 10;
                         axe_skill := 10;
                         spear_skill := 5;
                         bow_skill := 0;
                         shield_skill := 20;
                         fist_skill := 5;
                         Modify_Item(k);
                         Putmap(89,23,44);
                         party.etc[50] := party.etc[50] or bit1;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;
             if at(21,33) and (party.etc[50] and bit3 = 0) then begin
                Print(7,' ´e‘wÐa¯¥ˆa ? '+player[1].name+'.');
                Print(7,' ¬é a i ·¸´ö”a‰¡“e Ða»¡ ´g‰V»¡.  »¡‹q·e ¬a');
                Print(7,'ˆå·¡ ´ô´á¬á  ÐeˆaÐa‰A ·¡œå ·©·i Ða‰¡ ·¶»¡ e');
                Print(7,'ˆeÑ¢ µa‹¡Ÿi —iŸ¡“e ¬aœqº—µA“e ·¡ Èa·¡Èe“±·i');
                Print(7,'‹¡´âÐa“e ¬aœq·¡ ·¶”a‘A.  ¶a¬“e ­A¬w·¡ á¢');
                Print(7,'¹¡¶wÐ¬á ·¡œå·©·e aÐa‰¡“e ¸÷ i ´e ´á¶‰Ÿ¥”a');
                Print(7,'‘A.  ¸a‘A ¡¡¯s·i ¥¡“¡ ¡¡Ðñ·i ˜áaa“e ˆõ ˆ{');
                Print(7,'·e•A a•¡ ¡·¡¡e ´e –A‰Va ?');
                m[0] := '';
                m[1] := '¢‰¥ a“e ÑÅµwÐa»¡';
                m[2] := '¥i·© ´a“¡œa¬á ¸a‘A“e ¸£¡ ´ô·i ˆé­A';
                if Select(202,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := 'Èa·¡Èe';
                         sex := male;
                         class := 1;
                         classtype := sword;
                         level := 2;
                         strength := 19;
                         mentality := 3;
                         concentration := 4;
                         endurance := 17;
                         resistance := 10;
                         agility := 13;
                         accuracy := 11;
                         luck := 14;
                         poison := 0;
                         unconscious := 0;
                         dead := 0;
                         hp := endurance * level * 10;
                         sp := 0;
                         experience := 0;
                         potential_experience := ReturnEXP(level);
                         weapon := 2;
                         shield := 0;
                         armor := 2;
                         potential_ac := 2;
                         sword_skill := 10;
                         axe_skill := 10;
                         spear_skill := 10;
                         bow_skill := 10;
                         shield_skill := 10;
                         fist_skill := 10;
                         Modify_Item(k);
                         Putmap(21,33,44);
                         party.etc[50] := party.etc[50] or bit3;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;
             if at(9,64) and (party.etc[50] and bit2 = 0) then begin
                Print(7,' µ¡œˆe  e·¡Š… '+player[1].name+'.');
                Print(7,' 2-3 ‘e¸åµA ¸a‘AµÁ ÐqA  ¡¡Ðñ·i ˜áv”å ˆõ·¡');
                Print(7,'´ø‹a¹A ˆ{·e•A ¤é°á ­A¶©·e ·¡œý‰A »¡vŠ…. ‹a');
                Print(7,'ˆe ¬—ÑÉ·¡ ´á˜áÐ–a ?  ‹aˆå ‹aœý‰¡, ™¡ ·¡ ‰µ');
                Print(7,'µA ¢¯e·©·¡ ¬—‰v”a»¡ ? ·¡¤åµA•¡ ¸a‘AµA‰A a');
                Print(7,'·  a¤ó· Ó±·i §©a º‰¡ ¯¼·e•A ¸a‘A“e ´á˜ý');
                Print(7,'‰A ¬—ˆbÐaa ?');
                m[0] := '';
                m[1] := ' áŸ¥, ¸a‘A· Ó±·¡ Ï©¶aÐa‘A';
                m[2] := '‹i±A.. ¢ ‹aœéˆõ Œa»¡“e ´ô»¡';
                if Select(186,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := ' áŸ¥';
                         sex := male;
                         class := 1;
                         classtype := magic;
                         level := 2;
                         strength := 5;
                         mentality := 15;
                         concentration := 16;
                         endurance := 10;
                         resistance := 14;
                         agility := 8;
                         accuracy := 13;
                         luck := 17;
                         poison := 0;
                         unconscious := 0;
                         dead := 0;
                         hp := endurance * level * 10;
                         sp := mentality * level * 10;
                         experience := 0;
                         potential_experience := ReturnEXP(level);
                         weapon := 0;
                         shield := 0;
                         armor := 1;
                         potential_ac := 0;
                         attack_magic := 20;
                         pheno_magic := 10;
                         cure_magic := 10;
                         special_magic := 0;
                         esp_magic := 10;
                         summon_magic := 0;
                         Modify_Item(k);
                         Putmap(9,64,44);
                         party.etc[50] := party.etc[50] or bit2;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;
             if at(88,38) and (party.etc[50] and bit4 = 0) then begin
                Print(7,' ¶a¬“e ¹±Àáœñ ¥© ‹¡ÒAˆa ´ôŠ…¶a.'+player[1].name+'.');
                Print(7,' a“e ‘AÇa¡ e¬áµÁ· ‰i¸å·¡ {eÒµA Äå¹aœá');
                Print(7,'· ®´ó·i °}‰¡ ·¶´öºa. »¡‹q·e Á¡¥¡¸â·¥ ®º…');
                Print(7,'¤cµA“e ´e–A»¡ e. ”w¯¥·¡ ™¡ ¬¡¶… ·±¢Ÿi ¤h');
                Print(7,'´v”a‰¡—i Ða”å•A ¬a¯©·¥ˆa¶a ?  ‹aœý”a¡e ¸á•¡');
                Print(7,'‹a ·±¢µA ¨a»©®ˆa ´ô»¡¶a.  ¡y‘e¸å ‹a˜Àáœñ');
                Print(7,'”w¯¥‰Á ÐqA °a¶‰¡ ¯¼Š…¶a.');
                m[0] := '';
                m[1] := '¥AÉI‹A¯a, ¸a‘Aœa¡e ÑÅµwÐa»¡';
                m[2] := '‹i±A.. ·±¢ˆa ÐaÀg·e ˆáœa¬á..';
                if Select(202,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := '¥AÉI‹A¯a';
                         sex := male;
                         class := 2;
                         classtype := magic;
                         level := 2;
                         strength := 7;
                         mentality := 17;
                         concentration := 15;
                         endurance := 8;
                         resistance := 12;
                         agility := 10;
                         accuracy := 15;
                         luck := 10;
                         poison := 0;
                         unconscious := 0;
                         dead := 0;
                         hp := endurance * level * 10;
                         sp := mentality * level * 10;
                         experience := 0;
                         potential_experience := ReturnEXP(level);
                         weapon := 0;
                         shield := 0;
                         armor := 1;
                         potential_ac := 0;
                         attack_magic := 10;
                         pheno_magic := 20;
                         cure_magic := 10;
                         special_magic := 0;
                         esp_magic := 0;
                         summon_magic := 10;
                         Modify_Item(k);
                         Putmap(88,38,44);
                         party.etc[50] := party.etc[50] or bit4;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;

             if at(51,87) then
             if party.etc[30] and bit2 = 0 then begin
                for i := 49 to 53 do Putmap(i,88,44);
                Print(7,'e ”w¯¥·i £¨­¡, '+player[1].name+'.');
                party.etc[30] := party.etc[30] or bit2;
                Silent_Scroll;
             end
             else Print(7,'Ó±¯¡µ¡, '+player[1].name+'.');

             {  º£¥—i  }

             if at(85,55) then begin
                Print(7,' ¬ia º¯³¯¡µ¡. '+player[1].name+'“±.');
                Print(7,' ´a a ¹¡‹q e ·¶·a¡e ”aÇa ¡A·¡»¡ˆa ·¡‰µ·i Í');
                Print(7,'Ðá¡  e—iˆó“¡”a.');
             end;
             if at(72,73) then begin
                Print(7,' a“e ´áŸ©¸âµA  Ði´a¤á»¡¡ ¦Èá »¡Ða ­A‰·');
                Print(7,'¬aœq—iµA ”Ð —i·e ¸â·¡ ·¶“e•A  »¡‹q·e ‹¡´â');
                Print(7,'·¡ ¸i a»¡ ´g“eŠ…¶a.');
             end;
             if at(51,14) then begin
                Print(7,' ”w¯¥·¡ ·¡ ­A‰Ÿi ‘AÇa¡ e¬á¡ ¦Èá ŠÐe Ò');
                Print(7,'µA“e ”aŸe ”ŸB•¡ ¶¥œ· ¡¡¯s·i Àx´v¯s“¡”a.');
             end;
             if at(90,59) then begin
                Print(7,' '+player[1].name+'“±.');
                Print(7,'  ea‰A –A´á¬á ‹¡«s“¡”a. ·¡¤å ¡¡Ðñ·i Ða“e•A');
                Print(7,'´¢ˆe· •¡¶‘·¡ –A´ö·a¡e Ðs“¡”a. ·¡ ¤{µA ·¶“e');
                Print(7,'À­¡Ÿi ¹¡‹q —aŸ©ÉA“¡ ¯¢œ··a¡ ¬a¶wÐ º¯³¯¡');
                Print(7,'µ¡.');
                if (party.etc[30] and bit3) = 0 then begin
                   Print(7,'');
                   Print(11,' ”w¯¥·e ‹a‘aµA‰A ´¢ˆe· ¯¢œ··i ¤h´v”a.');
                   if party.food + 20 < 256 then
                      party.food := party.food + 20
                   else
                      party.food := 255;
                   party.etc[30] := party.etc[30] or bit3;
                end;
             end;
             if at(92,80) then begin
                Print(7,' ´i§¡Aµ¡“±· µ´å¬áµA ·Ða¡e ”aÇa ¡A·¡»¡ˆa');
                Print(7,'·¡ ­A‰Ÿi ¡i w ¯¡Ç¥”a‰¡ Ða”å•A ¸÷ i Çe ·©·¡');
                Print(7,'Š…¶a.');
             end;
             if at(91,81) then begin
                Print(7,' ´é a ¸åµA µ|»³µA ¬i”å ¦…·¡ ¡Aá¯a ‰×¬eµA¬á');
                Print(7,'·©Ða”å º— ·¢…· ¬i·¥·i ”wÐ–´á¶a. ¯¡ÁAŸi ¥¥');
                Print(7,'¬aœqµA ·Ða¡e  iÄa¡¶… •¢ ÑÁ¬iµA  x´a¬á »b');
                Print(7,'¬aÐ–”a‰¡ Ða”å•A¶a.');
             end;
             if at(58,74) then begin
                Print(7,' ·¡¤åµA•¡ ¶Ÿ¡—i·e ”w¯¥ e £¨‰¡ ·¶¯s“¡”a.');
             end;

             if at(63,27) then begin
                Print(7,' ”w¯¥‰Á ÐqA °a¶¶”å  ¸åÊ¯w AŠ‰ž¯a“e ¡´á');
                Print(7,'¬÷·i ˜áa  ”ŸB· ¦‚•·½¢ ¬ñ· µ¡– bµA ¬e”a');
                Print(7,'‰¡ Ðs“¡”a.');
             end;
             if at(51,72) then begin
                Print(7,' ”w¯¥‰Á ÐqA °a¶¶”å Í©œaŸ¡¯a“e œa¯aËa—¡Ã¡¬÷');
                Print(7,'Š…º· ®¬â Ñ¡¶á‰Å·¡ –A´á ·¶”áŠ…¶a.');
             end;
             if at(50,51) then begin
                Print(7,' Èa·¡Èe“±·e ”w¯¥‰Á· ¡¡Ðñ·¡ {eÒ  ¡´á º');
                Print(7,'¸ñ· ‰w§¡µÁ Ã¡´e·i  {‰¡ ·¶”áŠ…¶a.');
             end;
             if at(52,51) then begin
                Print(7,' ·¡¤å· ¡¡Ðñ•¡ µb¯¡ ¬÷‰·Ða‹¡Ÿi §³“¡”a.');
             end;
             if (x in [47..55]) and (y in [30..38]) then begin
                if party.etc[10] = 0 then
                   Print(7,' ¬÷º“±A¬á ”w¯¥·i Àx·a¯³“¡”a.')
                else
                   Print(7,' ·¡¤å· ¡¡Ðñ•¡ µb¯¡ ¬÷‰·Ða‹¡Ÿi §³“¡”a.');
             end;

             if at(51,28) then
             case party.etc[10] of
                0 : begin
                       Print(7,' '+player[1].name+'.');
                       Print(7,' ‘AÇa¡ e¬áŸi ¢‰Ÿ¡Ã¥Ò ¸i ®á´ö“eˆa ?  ™¡ ¸a');
                       Print(7,'‘AŸi ¦Ÿi·©·¡ ·¶”a“e ‹a ¸aÁA“e ‹a  eÇq ­A¬w');
                       Print(7,'·¡ Ñ¥œe¯aœá¶¡ ¹v”a“e »wˆá·©­A. ‹aœñ  i·i ‰');
                       Print(7,'­¢ Ð ¥¡•¡¢ Ða‰V‘A.');
                       PressAnyKey;
                       Print(7,' ™¡ ¸a‘A· Ó±·i §©Ÿ© ˜ˆa µ¥ˆõ ˆ{‘A. ¬¡¶…');
                       Print(7,' ab·¡ µ¥É· ·¡ ­A‰Ÿi Òáˆq‰¡ ·¶”a‘A. ‹aˆõ·i');
                       Print(7,'ˆa Œ”j´v·i˜“e  ·¡£¡ ‹a ¬¡¶… ¹¥¸ˆa £¥');
                       cPrint(7,11,'¯±·i ¬å•·Ða‰¡ ·¶´ö”a‘A.  º£¥—i·e ','”aÇa ¡A·¡','');
                       cPrint(7,11,'','»¡','ˆa ·¶´á¬á ‰¨ µa‹¡Ÿi Ã±‰·Ði ˆáœa‰¡ Ða¡a a');
                       Print(7,'µA‰A ¤w´áŸi ¶aÀ÷Ð–”a‘A.  Ða»¡ e ”aÇa ¡A·¡»¡');
                       Print(7,'œe ¹¥¸“e ˆa ´i‹¡¡•¡ ¹¥¸Ða»¡ ´g·a¡a  a');
                       Print(7,'µÁ µe” ‰Å‰µA ·¶“e µA·¥­eËa ·¡§i•¡ µb¯¡ ‹a');
                       Print(7,'œå ¹¥¸Ÿi ¡¡Ÿa‰¡ ·¶´ö”a‘A.  Ða»¡ e º£¥—i·e');
                       Print(7,'´á˜ý‰A ´i´v“e»¡ ‹a ¹¥¸Ÿi  iÐa‰¡ ·¶”a‘A. ‹a');
                       Print(7,'œñ ·¡¤åµA Ð´¡Ði ·±¢Ÿi  iÐ º‰V‘A.');
                       PressAnyKey;
                       Print(7,' ¸a‘A“e ¡Aá¯aœe •·Š‰·i ‹¡´âÐi ˆé­A. ‹a‰µ·e');
                       Print(7,'‘AÇa¡ e¬áˆa ¬aœa»¥Ò ÌaŠA–A´ö‰¡  »¡‹q·e ”a');
                       Print(7,'¯¡ ¶¥œ”¡ ‰×¬e·¡ –A´ö”a‘A.  Ða»¡ e ´å¹A¦');
                       Print(7,'Èåˆa ‹a‰µ·e ·µ”i·e ·¢…· ¬i·¥ ˜¢…µA  »¡‹q');
                       Print(7,'·e ˆá· Í‰×·¡ –A”a¯¡Ï¡ Ðe ‰µ·¡œa‘A. º£¥—i');
                       Print(7,'·e ‹a ¬i·¥·¡  ¡¡– ”aÇa ¡A·¡»¡· »µ·¡œa‰¡—i');
                       Print(7,'Ða‰¡·¶‘A. a•¡ ”aÇa ¡A·¡»¡· ¹¥¸Ÿi £¨‰¡ ¯¼');
                       Print(7,'»¡“e ´g»¡ e  ·©·¡ ·¡œý‰A –A´ö·a“¡ ´á¼é® ´ô');
                       Print(7,'”a‘A.');
                       Print(7,' »¡‹q »b¯¡ ¡Aá¯a¡ ˆa¬á  »¥¬w·i ¤jÑa º‰A.');
                       Print(7,'‹aŸ¡‰¡ ”aÇa ¡A·¡»¡µA ”Ðe ¸÷¥¡•¡  ´i´a µ¡•¡');
                       Print(7,'¢ Ða‰A.  ¢‹¡“e ¢‹¡‰¡µA¬á ˆa¹aˆa•¡¢ Ðáœb');
                       Print(7,'Ða»¡. ¦ÈbÐa‘A.');
                       Print(11,' [ ‰wÐñÃ¡ + 10000 ] [ Ñ×‹q + 1000 ]');
                       player[1].experience := player[1].experience + 10000;
                       party.gold := party.gold + 1000;
                       inc(party.etc[10]);
                    end;
                1 : begin
                       Print(7,' ¡Aá¯aµA¬á ·©´áe  ·¢…· ¬i·¥µA ”Ðe ¶¥·¥');
                       Print(7,'‰Á ”aÇa ¡A·¡»¡· ¸÷¥¡•¡ ´i´aµ¡‰A. ¸a‘A e £¨');
                       Print(7,'‰V‘A.');
                    end;
                2 : begin
                       Print(7,' •©´aµÖŠ…, '+player[1].name+'.');
                       Print(7,' ¡Aá¯aµA¬á ´i´a…ˆõ·¡ ´ô”a‰¡ ? ·¡ˆá Çe·©·¡');
                       Print(7,'‘A. ¸a‘Aˆa ·¡‰µ·a¡ •©´aµ¡”å ¯¡ˆeµA ™¡ Ðe¡w');
                       Print(7,'·¡ ¡Aá¯aµA¬á ¬iÐ ”wÐ–”a‘A.  ‹aŸ¡‰¡ º£¥—i');
                       Print(7,'· µa¥·e ”á¶‚ ´bÑÁ –A´ö”a“e ˆõ·e ¸a¡wÐe ¬a');
                       Print(7,'¯© ·¡‘A. ¸a¯¡ ¸a‘AµA‰A ¦ÈbÐa‰V‘A.  ”a¯¡ ‹a');
                       Print(7,'‰µ·a¡ ˆa¬á ¬i·¥µA ”Ðe ”e¬áŸi Àx´aµ¡‰A.');
                       Print(7,' ¢, ¦ÈbÐa‘A.');
                       inc(party.etc[10]);
                    end;
                3 : begin
                       Print(7,' ”a¯¡ ¡Aá¯a¡ ˆa¬á ¬i·¥µA ”Ðe ”e¬áŸi Àx´a');
                       Print(7,'µ¡•¡¢ Ða‰A. ¦ÈbÐa‘A.');
                    end;
                4 : begin
                       Print(7,' ¸÷ i ¸iÐ–Š… '+player[1].name+'.');
                       Print(7,' µb¯¡ ‰Áˆá· µw¶—·e Ñe¸· µw¶—·¡Š…. £¡Š—µA');
                       Print(7,'¨a¹v”å  ¬i·¥ ¬aˆå· ¶¥·¥·i ´i´a‰¡  ‹a—i·i');
                       Print(7,'¹Aˆá Ð”a“¡. ”w¯¥µA‰A ‹a ”•ˆa¡ ´¢ˆe· ¬w');
                       Print(7,'‹q·i º•¡¢ Ða‰V‘A.');
                       Print(11,' [ ‰wÐñÃ¡ + 0 ] [ Ñ×‹q + 5000 ]');
                       party.gold := party.gold + 5000;
                       PressAnyKey;
                       Print(7,' ‹aŸ¡‰¡ ˆa ”aÇa ¡A·¡»¡· ‹¡¶¥·i µaœá ¤w¡e');
                       Print(7,'·a¡ ´i´a ¥¡”å º—µA ·¡ À‚·i Àx´a ´ö‘A.');
                       cPrint(7,11,' ·¡ À‚·e ”w¯¥•¡ ´i”a¯¡Ï¡  ','´i§¡Aµ¡','œa‰¡ Ða“e');
                       Print(7,'Èa·± ¶¡Äáˆa ·¡ ”ŸBµA q‹¡‰¡ ˆe µ´å¬á·¡»¡.');
                       Print(7,'º—¶aÐe ¦¦… e Ð¬âÐa¡e ”a·q‰Á ˆ{‘A.');
                       PressanyKey;
                       Print(15,'Àõ¤å¼ ÓW¬÷·¡ aÈaa“e i, ÍwÑÁ“e ¡´á· ¯¥');
                       Print(15,'‰Á ÐqA ”»¡¡ ÂœbÐi ˆõ·¡¡a  ‰·ˆe·¡ ´á‹ua');
                       Print(15,'‰¡ ”ŸB·¡ »¥•·Ða¡a  ¬¡¶… ¹¥¸ˆa aÈae”a.');
                       Print(7,'');
                       Print(7,' ·¡ ‹i·e ¸á¤åµA ‘AÇa¡ e¬áˆa aÈai ˜· ‹a');
                       Print(7,'‰×‰w·i ¢a¬aÐe Š¸é·¡œeˆõ·i ‹q¤w ´i ® ·¶‘A.');
                       Print(7,'');
                       Print(15,'–¤å¼ ÓW¬÷·¡ aÈaa“e i, ‹a“e ¶w´q· ”ŸB');
                       Print(15,'·a¡¦Èá ­A¬w·i –áÓe—i‰A –A¡a ‹a“e ‘AÇa¡ e');
                       Print(15,'¬áœa ¦‰Ÿ¡´á »¥”a.');
                       Print(7,'');
                       Print(7,' ·¡ ‹i ™¡Ðe ¡y‘e ¸å· ·©‰Á ·©Ã¡ Ða‘A.');
                       Print(7,'');
                       Print(15,'­A¤å¼ ÓW¬÷·¡ aÈaa“e i, ‘AÇa¡ e¬áŸi  ·¡');
                       Print(15,'‹¡“e ¸a“e ´a¢•¡ ´ô‰A –E”a.');
                       Print(7,'');
                       Print(7,' Ða»¡ e ·¡ ‹i·e ¬a¯©‰Á ”aŸa”a‘A.  ¸a‘Aˆa ‘A');
                       Print(7,'Ça¡ e¬áŸi ¢‰Ÿ¡Áv‹¡ ˜¢…µA  i·©­A.');
                       Print(7,'');
                       Print(15,'‘A¤å¼ ÓW¬÷·¡ aÈaa“e i, ¡Aá¯a· ”i·¡ ¦Š');
                       Print(15,'‰A ¢‰—i˜ ´á–‘· µwÑ¥·¡ aÈaa  ­A‰· ¹· i');
                       Print(15,'·i µ‰¡Ðe”a.');
                       Print(7,'');
                       Print(7,' ·¡ ‹i·¡ ˆa¸w º—¶aÐe ¶a»¡œa‘A. ''¡Aá¯a· ”i');
                       Print(7,'·¡ ¦Š‰A ¢‰—i˜'' œe ¡Aá¯aµA¬á ·©´áe »¡‹qŒa');
                       Print(7,'»¡· ¬i·¥ ¬aˆå·i  iÐa“e ˆõ·¡‰¡, ''µwÑ¥'' ·¡œe');
                       Print(7,'µ• ¦Èá ¸å¯w–A“e Š¸åµA ·Ða¡e  µwÑ¥· Ó±·i');
                       Print(7,'·¡¶wÐi ® ·¶“e ¬aœq,  »b  a¤ó¬aŸi  »¡Ã·Ða“e');
                       Print(7,' i·¡ –E”a‘A.  ‹aœá£a¡ ''´á–‘· µwÑ¥''·e ¤a¡');
                       Print(7,'´á–‘·  a¤ó¬aŸi ›uÐa“e  i·¡ –A‘A. ”a¯¡ Î‰·¡');
                       Print(7,'Ða¡e ‹a ›u·e ''¡Aá¯aµA¬á ¬i·¥ ¬aˆå·¡ ·©´ái');
                       Print(7,'˜ ”aÇa ¡A·¡»¡ˆa ­A‰· ¹· i·i µ‰¡ Ðe”a''œa');
                       Print(7,'“e  i·¡ –E”a‘A.');
                       Print(7,'');
                       Print(15,'”a¬õ¤å¼ ÓW¬÷·¡ aÈaa“e i, ˆa ¥¥ ”a¬õ¤å');
                       Print(15,'· ÓW¬÷ º—µA Ðaaˆa  aÈaa»¡ ´g´v·q·i ´i´a');
                       Print(15,'…”a.');
                       Print(7,'');
                       Print(7,' ¶áµA¬á· µ´å·i ¥¡¡e Ðaaˆa Ëia ·¶»¡.  ¤a');
                       Print(7,'¡ ­A¤å¼ ÓW¬÷·¡ ˜é´á»© ˜· ·©  i·©­A.  ‹a');
                       Print(7,'ˆõ·¡ Ëiv”a“e ‹a  i·©­A. ´i§¡Aµ¡ ‹a ¸a¯¥•¡');
                       Print(7,'¸a‘Aˆa ‘AÇa¡ e¬áŸi ¢‰Ÿ¡Ã¡Ÿ¡œa‰¡“e ¬—ˆbÐa»¡');
                       Print(7,'¡µÐ–“e•A ¸a‘A Ð ´ö‹¡ ˜¢…µA ·¡œå  i·i ¸â');
                       Print(7,'´ö”åˆõ ˆ{‘A.');
                       Print(7,'');
                       PressAnyKey;
                       Print(7,' ·¡ µ´åµA ·Ða¡e ¤e—a¯¡ ”aÇa ¡A·¡»¡ˆa ­A¬w');
                       Print(7,'·i  ¡i w ¯¡Ç¡‰A –E”a‘A.  ´i§¡Aµ¡ ‹a ¸a¯¥•¡');
                       Print(7,'‹a ˆõ·i ´ia ºa Ð–”å ˆõ·¡‰¡.  ‹aœý”a¡e ¶');
                       Print(7,'Ÿ¡“e ·¡¤åµA•¡ ¸á¤å· ‘AÇa¡ e¬á˜ Àáœñ ¯a¯a');
                       Print(7,'¡· ¶…¡w·i ¤aŽ‹¡ ¶áÐ  •¡¸å ¥¡´a´¡ Ðe”a“e');
                       Print(7,'‰i¥·i ´è·i ® ·¶‰A –A‘A.');
                       Print(7,' ‹aœñ ¸a‘AµA‰A ™¡ Ðaa· Ði ·©·i º‰V‘A. ¸a');
                       Print(7,'‘A“e »¡‹q »b¯¡ œa¯aËa —¡Ã¡¬÷µA ˆa•¡¢ Ða‰A.');
                       Print(7,'‹a‰µµA¬á•¡  ¶Ÿ¡µÁ ˆ{·e ¶á‹¡Ÿi  “a¡‰¡ ·¶·i');
                       Print(7,'ˆõ·¡‰¡  ·¡ ¥¡”a ”á  g·e ¸÷¥¡ˆa ·¶·i ®•¡ ·¶');
                       Print(7,'·i ÉA“¡ Ðe¯¡ ¤a«¡ ‹a ‰µ·a¡ ˆa¥¡•¡¢ Ða‰A.');
                       inc(party.etc[10]);
                    end;
                5 : begin
                       Print(7,' ¸a‘A“e œa¯aËa —¡Ã¡¬÷µA¬á· ·©·i  ¡¡– {');
                       Print(7,'‰¡ ”a¯¡ •©´a µ¡•¡¢ Ða‰A.');
                    end;
                6 : begin
                       Print(7,' œa¯aËa —¡Ã¡µA¬á· ·±¢Ÿi  ¸i ®Ð—Ð–”a‰¡ —i');
                       Print(7,'´ö‘A. ´á—¡, ¸a‘Aˆa »¡‹q —i‰¡ ·¶“e ¬âÌe·i ¹±');
                       Print(7,'¥©Œa ? ·q.......');
                       cPrint(7,15,' ‹aœá¡e ','ÓW¬÷· »wˆá','µA¬á ˆa¹aµ¥ ˆõ ¦Èá Ð•¢');
                       Print(7,'Ð ¥¡•¡¢Ða»¡.');
                       PressanyKey;
                       Print(7,' ·¡ ¬âÌe· ¶w·i ·ª´á ¥¡‰V‘A.');
                       Print(7,'');
                       Print(15,' ´á–‘·e ”i·¡¡a ”i·e µa¬÷·¡œa.  ·¡ ­A‰ˆa ´a');
                       Print(15,'ŸaÉA£¡¯aŸi 3 ¤å ¤ñÐi˜ ´á–‘·e Œ´áa‰¡ ”aÇa');
                       cPrint(15,14,'¡A·¡»¡“e ','¯©Ÿ¡´e Äa£¡á¯a( Cyllian Cominus )','');
                       Print(15,'œa‰¡ ¦‰Ÿ¡¶…”a.  ‹aŸ¡‰¡ ‹a‘a“e ’Š•¡ ”wÐ‰');
                       Print(15,'® ´ô“e  ab·a¡ ­A‰Ÿi ¹· i¡ ·¡a‘¡“¡....');
                       Print(7,'');
                       Print(7,' ·¡‹i· Ð¬â·e ”a·q‰Á ˆ{”a‘A.');
                       Print(7,' "´á–‘·  a¤ó¬a"“e µa¸a  a¤ó¬aŸi ›uÐa¡a, "­A');
                       Print(7,'‰ˆa ´aŸaÉA£¡¯aŸi ¤ñÐe”a"œa“e Š¸é·e  »¡Šˆa');
                       Print(7,'”i(´aŸaÉA£¡¯a)·i ˆaŸ¡“e Ñe¬w, »b ¶©¯¢·i  iÐa');
                       Print(7,'“e ˆõ·¡¡a ‹a ¶©¯¢·¡ 3¤å ·©´áe Ò "´á–‘·¡ Œ');
                       Print(7,'´áe”a" »b ¯©Ÿ¡´e Äa£¡á¯aœa“e ¹¥¸ˆa ¬—‰ae');
                       Print(7,'”a“e ˆõ·¡‘A.  ‹aŸ¡‰¡“e ‹a‘aˆa ·¡ ­A‰Ÿi ¡i w');
                       Print(7,'¯¡Ç¥”a“e ˆõ·¡‘A.');
                       Print(7,'');
                       PressanyKey;
                       Print(7,' ·¡ ‹i·¡ ¸÷ i·¡œa¡e ´i§¡Aµ¡· µ´å·e ¯©Ñe–A');
                       Print(7,'‰¡ ¤e—a¯¡ ­A‰“e ¡i wÐa‰A –I ˆé­A. Ða»¡ e ¸a');
                       Print(7,'‘A“e ´å¹Aa ¶…¡wµA ”ÐwµA µÖ·a“¡ ·¡œå ¶…¡w¸â');
                       Print(7,'·¥ ˆõµA“e ·¢®‚Ða‰V»¡ ? ‘AÇa¡ e¬áµÁ °a¶‰˜•¡');
                       Print(7,'‹aœ–·a“¡Œa.');
                       cPrint(7,15,' ‹aŸ¡‰¡ ','ÓW¬÷· ”e¬á','µA¬á ˆa¹aµ¥  ·¡ ¬âÌe·e •¡');
                       Print(7,'¸áÓ¡ a· Ó±·a¡“e Ð•¢·¡ ´e–A“eŠ….  ·¡ ­A‰');
                       Print(7,'· ¶…¡w·¡ ”iŸ¥ ·©·¡“¡  »¡‹q ”w¸w µA·¥­eËa ·¡');
                       Print(7,'§i‰Á ÐqA ¬w· Ð¥Á´¡ ‰V‘A.');
                       Print(7,' ‹aœñ ·© ´aÃ±µA ¥¡•¡¢Ða­A.');
                       PressAnyKey;
                       inc(party.etc[10]);
                       Delete_Scroll_Screen;
                       face := 3;
                       y := 50;
                       for x := 16 downto 11 do begin
                          Scroll(TRUE);
                          delay(500);
                       end;
                       face := 1;
                       Scroll(TRUE);
                       delay(1000);
                       dec(y);
                       Scroll(FALSE);
                       party.etc[1] := 0;
                       Scroll(FALSE);
                       delay(1000);
                       ok := FALSE;
                       party.min := 0;
                       Print(7,' ”w¯¥·e ”a·qi ´aÃ±Œa»¡ µa‹¡¬á ¸a‹¡¡ Ð–”a.');
                       with party do
                       repeat
                          min := min + 20;
                          if min > 59 then begin
                             hour := hour + 1;
                             min := 0;
                          end;
                          if hour > 23 then begin
                             day := day + 1;
                             hour := 0;
                          end;
                          if day > 360 then begin
                             year := year + 1;
                             day := 1;
                          end;
                          if hour = 9 then ok := TRUE;
                          Scroll(FALSE);
                          for i := 1 to 6 do
                          with player[i] do
                          if name <> '' then begin
                             if (dead = 0) and (unconscious = 0) then begin
                                if poison = 0 then begin
                                   hp := hp + level;
                                   if hp > endurance * level * 10 then hp := endurance * level * 10;
                                end
                                else begin
                                   hp := hp - 1;
                                   if hp <= 0 then unconscious := 1;
                                end;
                             end
                             else if (dead = 0) and (unconscious > 0) then begin
                                if poison = 0 then begin
                                   if unconscious - level > 0 then unconscious := unconscious + level
                                   else begin
                                      unconscious := 0; hp := 1;
                                   end;
                                end
                                else begin
                                   unconscious := unconscious + 1;
                                   if unconscious > endurance * level then dead := 1;
                                end;
                             end;
                          end;
                          Display_Condition;
                          delay(500);
                       until ok;
                       inc(x);
                       face := 2;
                       Scroll(TRUE);
                       Print(7,'');
                       Print(15,' ´aÃ±·¡ ¤j´v”a.');
                    end;
                7 : begin
                       Print(7,' ´á¬áµ¡‰A, '+player[1].name+'.');
                       Print(7,' ´á¹A Ð•¢Ða»¡ ¡µ Ð–”å ¬âÌeµA¬á ´aº º—¶aÐe');
                       Print(7,'ˆõ·i ´i´a ´ö”a‘A. µA·¥­eËa ·¡§i·¡ ¢‰¥ Ð');
                       Print(7,'•¢Ð º´ö”a‘A.');
                       i := party.day + 20;
                       j := party.year;
                       if i > 360 then begin
                          j := j + 1;
                          i := 1;
                       end;
                       str(j : 3,m[1]);
                       str((i div 30)+1 : 2,m[2]);
                       str((i mod 30)+1 : 2,m[3]);
                       Print(7,' ·¡ ¬âÌe·e ´á¹A Ð•¢Ðe ¯©Ÿ¡´e Äa£¡á¯aœe ¹¥');
                       Print(7,'¸ˆa aÈaa ·¶“e ¬âÌe· ¶w·i  ”á¶‚ ¥¡ˆwÐ');
                       Print(7,'º”áŠ…. ‹aŸ¡‰¡ ¬¡¶… ¬a¯©·i ´i´v”a‘A. ¤a¡');
                       Print(7,'»¡Ða ­A‰µÁ »¡¬w ­A‰ˆa µe‰i–A“e ¯¡‹¡Ÿi  ´i');
                       Print(7,'a º”áŠ…. ‹aˆõ·e ¤a¡ ¶©¯¢·¡ ·©´áa“e ¯¡‹¡');
                       Print(7,'Ÿi ´i¡e –E”a‘A. ¬âÌe· ‰¡”´áµA ·Ða¡e ¶©¯¢');
                       Print(7,'·¡ ·©´áe Ò ¶áÑs· •·Š‰µA »¡Ða ­A‰µÁ· É·');
                       Print(7,'¡ˆa ¬—‹¡‰A –E”a‘A. µa‹¡¬á "¶áÑs· •·Š‰" ·¡');
                       Print(7,'œe ¤a¡ ¡Aá¯a(MENACE)Ÿi ›uÐa“e  i·¡–E”a‘A.');
                       Print(7,'‹aŸ¡‰¡, ¸ñ¬÷ˆaŸi É·Ð¬á  ”a·q ¶©¯¢·¡ ·©´ái');
                       Print(7,'˜Ÿi ´i´a¥¡“¡  ¤a¡ 20·© Ò·¥ '+m[1]+'‘e '+m[2]+'¶© '+m[3]);
                       Print(7,'·©·¡ –Iˆáœa‰¡ Ða”áŠ…. ‹a˜ ¡Aá¯aµA ˆa¥¡‰A.');
                       Print(7,'‹aŸ¡‰¡ ¹¡¯±Ða‰A. ´a»¢ q·e 20·© •·´e ÁAb•¡');
                       Print(7,'¥¡ˆw ¯¡Ç¡•¡¢Ða‰A. ‹aœñ Ð—¶…·i §©‰V‘A.');
                       Print(11,' [ ‰wÐñÃ¡ + 0 ] [ Ñ×‹q + 100000 ]');
                       party.gold := party.gold + 100000;
                       party.etc[37] := (i div 256);
                       party.etc[36] := i - party.etc[37]*256;
                       party.etc[39] := (j div 256);
                       party.etc[38] := j - party.etc[39]*256;
                       inc(party.etc[10]);
                    end;
                8 : begin
                       i := party.etc[37]*256 + party.etc[36];
                       j := party.etc[39]*256 + party.etc[38];
                       if (party.year >= j) and (party.day > i) then begin
                          inc(party.etc[10]);
                          talkmode;
                          exit;
                       end;
                       str(j : 3,m[1]);
                       str((i div 30)+1 : 2,m[2]);
                       str((i mod 30)+1 : 2,m[3]);
                       Print(7,' ¡Aá¯aµA »¡Ða ­A‰¡· É·¡ˆa  µiŸ¡‰A –A“e');
                       Print(7,'Àõ¤å¼ ¶©¯¢˜ Œa»¡ ‹¡”aŸ¡‰A.');
                       Print(7,' i¼a“e ¸åµA•¡  iÐ–—u·¡  '+m[1]+'‘e '+m[2]+'¶© '+m[3]+'·© ¤q');
                       Print(7,'·©­A. ‹a˜Ÿi ¶áÐ µi¯±Ó¡ Ò…eÐa•¡¢ Ða‰Aa.');
                    end;
                9 : begin
                       Print(7,' —a—¡´á ¶Ÿ¡ˆa ‹¡”aŸ¡”å ¶©¯¢·e ·©´áv‘A. ¸a');
                       Print(7,'‘A“e Ðe¯¡¤a«¡ ¡Aá¯aŸi É·Ð »¡Ða­A‰¡ ˆa•¡');
                       Print(7,'¢ Ða‰A. ·¡¹A ·¡ ­A‰· ¶…¡w·e ¸a‘A· – ­¥');
                       Print(7,'µA ”ia·¶”a‘A.');
                    end;
                10: begin
                       Print(7,' ¸a‘A —a—¡´á •©´aµÖŠ…. ‹aœ, »¡Ða ­A‰µA ”');
                       Print(7,'Ð¬á ¹±  i Ðº‰Aa.');
                       Print(7,'');
                       Print(11,' [ ‰wÐñÃ¡ + 500000 ] [ Ñ×‹q + 100000 ]');
                       for i := 1 to 5 do
                       if player[i].name <> '' then player[i].experience := player[i].experience + 500000;
                       party.gold := party.gold + 100000;
                       PressAnyKey;
                       Delete_Scroll_Screen;
                       Print(7,' ÐeÀqÒ ...');
                       PressAnyKey;
                       Silent_Scroll;
                       Print(7,' ¸a‘A  i·i —i´á ¥¡“¡ ¸÷ i Çe·©·¡Š….  ·¡œá”a');
                       Print(7,'ˆe ¸÷ i ´i§¡Aµ¡· µ´åÀáœñ –A´á ¤áŸ¡‰V“e•A');
                       Print(7,'. ¸a‘Aˆa »¡Ða ­A‰µA aˆe Ò ·¡ ‰µµA•¡  g');
                       Print(7,'·e ¥eÑÁˆa ·¶´ö‘A.  ˆs¸a‹¡ ”i· ¶…Ð—·¡  ¨iœa');
                       Print(7,'¹v”a‘A. ¶¥œ“e ¶©¯¢·¡ ·©´ái ® ·¶“e ¥¡Ÿq”i');
                       Print(7,'·¡ 29.5·©µA Ðe¤å·¡´ö“e•A. ·¡¹A“e Ò©³¥ ”á ¨i');
                       Print(7,'œa¹v”a‘A.  ”i· ¶…Ð—·¡ ¨iœa¹a¬á ”i·e ¶¥¯±b');
                       Print(7,'·¡ »wˆaÐ–‰¡  ”i·i ¦›¸s´a –‹¡ ¶áÐ¬á »¡Š·');
                       Print(7,'º—b¸w·¡ »wˆa Ð–”a‘A. »¡‹q·e ˆá· ¢…¹Aˆa ´e');
                       Print(7,'–I ¸÷•¡·¡»¡ e ·¡ ¬wÑ×·¡ ¸ñ¸ñ ´bÑÁ –E”a¡e »¡');
                       Print(7,'Š“e ¤‚¬‚ µá¬÷·¡a §iœ‚Ñ©Àáœñ ¯a¯a¡· º—b');
                       Print(7,'µA ·Ð ÌaŠA–I »¡•¡ ¡¡Ÿe”a‘A.');
                       i := party.day + 15;
                       j := party.year;
                       if i > 3680 then begin
                          j := j + 1;
                          i := 1;
                       end;
                       str(j : 3,m[1]);
                       str((i div 30)+1 : 2,m[2]);
                       str((i mod 30)+1 : 2,m[3]);
                       Print(7,' ‹aŸ¡‰¡ ”a·q ¶©¯¢·¡ ·©´ái i¼aˆa ‰¬e –A´ö');
                       Print(7,'”a‘A. i¼a“e 15·© –á·¥ '+m[1]+'‘e '+m[2]+'¶© '+m[3]+'·©¡ µ');
                       Print(7,'¸÷ –A´á ·¶”a‘A. ‹a˜Œa»¡ ¯a¯a¡Ÿi ”ee ¯¡Ç¡');
                       Print(7,'‰A. ‹a˜ µb¯¡ ¸i ¦ÈbÐa‘A.');
                       Print(7,'');
                       party.etc[37] := (i div 256);
                       party.etc[36] := i - party.etc[37]*256;
                       party.etc[39] := (j div 256);
                       party.etc[38] := j - party.etc[39]*256;
                       inc(party.etc[10]);
                    end;
                11: begin
                       i := party.etc[37]*256 + party.etc[36];
                       j := party.etc[39]*256 + party.etc[38];
                       if (party.year >= j) and (party.day > i) then begin
                          inc(party.etc[10]);
                          talkmode;
                          exit;
                       end;
                       str(j : 3,m[1]);
                       str((i div 30)+1 : 2,m[2]);
                       str((i mod 30)+1 : 2,m[3]);
                       Print(7,' ¡Aá¯aµA »¡Ða ­A‰¡· É·¡ˆa  µiŸ¡‰A –A“e');
                       Print(7,'–¤å¼ ¶©¯¢˜ Œa»¡ ‹¡”aŸ¡‰A.');
                       Print(7,' i¼a“e ¸åµA•¡  iÐ–—u·¡  '+m[1]+'‘e '+m[2]+'¶© '+m[3]+'·© ¤q');
                       Print(7,'·©­A. ·¡¤åµA“e Ã¡µiÐe ¸åÊ•¡ ˆbµ¡Ð´¡ Ði ˆé');
                       Print(7,'­A. µi¯±Ó¡ ”eeÐa‰Aa.');
                    end;
                12: begin
                       Print(7,' —a—¡´á ¶Ÿ¡ˆa ‹¡”aŸ¡”å ¶©¯¢·e ·©´áv‘A. ¸a');
                       Print(7,'‘A“e Ðe¯¡¤a«¡ ¡Aá¯aŸi É·Ð »¡Ða­A‰¡ ˆa•¡');
                       Print(7,'¢ Ða‰A. ·¡¹A ·¡ ­A‰· ¶…¡w·e ¸a‘A· – ­¥');
                       Print(7,'µA ”ia·¶”a‘A.  ´å¹Aa ¸a‘AµA‰A ·¡œå·©·i ¯¡');
                       Print(7,'Åa¬á £¡´eÐa‰A •ö‘A. ¸a‘A ´|µA ´å¹Aa Ð—¶…·¡');
                       Print(7,'˜aŸa‹¡Ÿi §©´á º‰V‘A.');
                    end;
                13: begin
                       Print(7,' •©´aµÖŠ…. ¸÷ i ®‰¡ Ð–‘A. ‹a•·´e ·¶´ö”å ·©');
                       Print(7,'·i aµA‰A ¡¡– ·¡´¡‹¡ Ðº‰A.');
                       Print(7,'');
                       Print(11,' [ ‰wÐñÃ¡ + 1000000 ] [ Ñ×‹q + 500000 ]');
                       for i := 1 to 5 do
                       if player[i].name <> '' then player[i].experience := player[i].experience + 1000000;
                       party.gold := party.gold + 500000;
                       PressAnyKey;
                       Delete_Scroll_Screen;
                       Print(7,' ÐeÀqÒ ...');
                       PressAnyKey;
                       Silent_Scroll;
                       Print(7,' ·q... ¸a‘A  i·i —i´á¥¡“¡  ¸÷ i ‰¡¬—·¡  g´v');
                       Print(7,'´öŠ…. ‹aŸ¡‰¡ ´b· Â¹·¸a –¡w·i Àá”eÐe ·©•¡');
                       Print(7,'¸÷ i ®‰¡Ð–‘A. Ða»¡ e ¤é°á  a»¡ b ­A¤å¼ ¶©');
                       Print(7,'¯¢ i¼aˆa ·±¤bÐ–‘A. ¬a¯© ˆâ¸÷·e ¤a¡ ·¡ˆõ·¡');
                       Print(7,'‘A. ´i§¡Aµ¡· µ´åµA aµ¡“e ”aÇa ¡A·¡»¡ ¯©');
                       Print(7,'Ÿ¡´e Äa£¡á¯aˆa  ¦ÑÉÐa‰A –A“e ¯¡ˆe·e  ¤a¡');
                       Print(7,'·¡¤å ¶©¯¢·¡ ·©´áa“e ˜œa‘A. ´a a ·¡¤å·¡  a');
                       Print(7,'»¡ b Ìa‰e·¥ˆõ ˆ{Š…. ‹aœñ i¼aŸi ´iaº»¡.');
                       i := party.day + 5;
                       j := party.year;
                       if i > 360 then begin
                          j := j + 1;
                          i := 1;
                       end;
                       str(j : 3,m[1]);
                       str((i div 30)+1 : 2,m[2]);
                       str((i mod 30)+1 : 2,m[3]);
                       Print(7,'  a»¡ b ­A¤å¼ ¶©¯¢·e  ¤a¡ 5 ·© –á·¥ '+m[1]+'‘e');
                       Print(7,m[2]+'¶© '+m[3]+'·© ·¡œa‘A. ¸a‘Aˆa  e´¢ ¬÷‰·Ðe”a¡e ”a');
                       Print(7,'¯¡ ¡´á· ­A‰“e ÍwÑÁˆa µ© ˆõ·¡»¡ e  e´¢ ¯©');
                       Print(7,'ÌÐe”a¡e ¶Ÿ¡ˆa ·¡œý‰A  ea“e ˆõ•¡  a»¡ b·¡');
                       Print(7,'–E”a‘A.');
                       Print(7,'');
                       party.etc[37] := (i div 256);
                       party.etc[36] := i - party.etc[37]*256;
                       party.etc[39] := (j div 256);
                       party.etc[38] := j - party.etc[39]*256;
                       inc(party.etc[10]);
                    end;
                14: begin
                       i := party.etc[37]*256 + party.etc[36];
                       j := party.etc[39]*256 + party.etc[38];
                       if (party.year >= j) and (party.day > i) then begin
                          inc(party.etc[10]);
                          talkmode;
                          exit;
                       end;
                       str(j : 3,m[1]);
                       str((i div 30)+1 : 2,m[2]);
                       str((i mod 30)+1 : 2,m[3]);
                       Print(7,' ¶…¡w· ­A¤å¼ ¶©¯¢·¡  ¤a¡ '+m[1]+'‘e '+m[2]+'¶© '+m[3]+'·©');
                       Print(7,'¤qµA ·©´áa‰A –E”a‘A. ´a a ¸a‘A·  a»¡ b ‰i');
                       Print(7,'¸å·¡ –I ˆé­A. ˆbµ¡Ÿi ”e”eÓ¡ Ða‰A. ¶…¡w· ¯¡');
                       Print(7,'ˆe·e ¸ñ¸ñ ¶Ÿ¡µA‰A ”aˆaµ¡‰¡ ·¶”a‘A.');
                       party.etc[9] := 0;
                    end;
                15: begin
                       Print(7,' —a—¡´á ¶Ÿ¡ˆa ‹¡”aŸ¡”å   a»¡ b ­A¤å¼ ¶©¯¢');
                       Print(7,'·¡ ·©´áv‘A. ¸÷ i ·¡¤åµA“e ”e”eÐe ˆbµ¡Ÿi Ð');
                       Print(7,'´¡ Ði ˆé­A.  ¶©¯¢·¡ ·©´áa”å ¤qµA ¡Aá¯a ½¢');
                       Print(7,'µA¬á Çe »¡»¥·¡ ·¶´ö”a‘A.  ´a a ·¡ˆå ”aÇa ¡A');
                       Print(7,'·¡»¡ˆa ¦ÑÉ·¡ ˆá· ”a {aˆe”a“e ˆõ·i   iÐ');
                       Print(7,'º‰¡ ·¶“e ˆõ ˆ{‘A.');
                    end;
             end;
          end;
   end;
end;

Procedure talkmode_sub2;
begin
   Clear;
   case party.map of
      7 : begin
             if at(16,24) or at(21,21) or at(24,19) then About_Class;
             if at(18,19) then Sell_EXP;
             if at(17,56) then Medicine;
             if at(17,58) or at(17,60) then Hospital;
             if at(59,60) or at(59,58) or at(59,56) then Weapon_Shop;
             if at(57,17) or at(54,20) then Sell_Item;
             if at(58,22) or at(59,25) then Grocery;

             {  ¬÷ ´e· ‹¡¬a  }

             if at(37,41) then begin
                Print(7,' ¹Aˆa Í©œaŸ¡¯a“±· Ò·±·a¡  ·¡ ¬÷¢…·i »¡Ç¡');
                Print(7,'‰¡ ·¶¯s“¡”a.');
             end;
             if at(40,41) then begin
                Print(7,' ´a~~~ ”w¯¥·¡ ¤a¡ Í©œaŸ¡¯a“±·¡  i³q Ða¯¡”å');
                Print(7,'¤a¡ ‹a '+player[1].name+'“±·¡¯¡Š…¶a.');
                Print(7,' Í©œaŸ¡¯a“±A  i³q  g·¡ —i´ö¯s“¡”a.');
             end;
             if at(36,19) then begin
                Print(7,' ·¡ ¬÷· ¥w¶¥µA“e  ÓŠáÐe ´¢Á¡Ÿi  Ìa“e ‰µ·¡');
                Print(7,'·¶¯s“¡”a. ÁAb·¡a  a¤ó·i µ©a º“e ‹aœå ´¢');
                Print(7,'¢‰·¡a •¢·i Ð•¢Ðaˆáa ¯±»¡´á º‚·e ¬aœq a¸á');
                Print(7,'•¡ ¬iŸ© ® ·¶“e ´¢Á¡•¡ ·¶”áŠ…¶a.');
             end;
             if at(36,21) then begin
                Print(7,' ¸á“e »¢¸ó  Èa·± ¶¡Äá ´i§¡Aµ¡“±·i ¥¡´v“e•A');
                Print(7,'ˆ{·e  a¤ó¬a¡¬á ¹¥‰wÐa»¡ ´g·i ® ´ô”áŠ…¶a.');
                Print(7,'‹a ¦…· µ´å·e ËiŸ±´ô”a‰¡ ÑÂ¯¥ Ði ® ·¶¯s“¡');
                Print(7,'”a.');
             end;
             if at(41,20) then begin
                Print(7,' ˆa —h‹¡¡“e »¡Ða ­A‰Ÿi ¤i‰eÐa‹¡ ¶áÐ ´i');
                Print(7,'® ´ô“e Ï¡œa£¡—a¡ —i´áˆe ¬aœq·¡ ¡y ¡w ·¶”á');
                Print(7,'Š…¶a.');
             end;
             if at(41,22) then begin
                Print(7,' ¸á“e ”w¯¥· “wb·i £¨¯s“¡”a.  ¢ ·¡ ­A‰Ÿi');
                Print(7,'ŠÐ º¯³¯¡µ¡.');
             end;
             if at(41,18) and (party.etc[50] and bit8 = 0) then begin
                Print(7,' µ¡œˆe  e·¡Š… !! ·¡ Í©œaŸ¡¯a· ·¡Ÿq·i ˆé‰¡');
                Print(7,player[1].name+' ¸a‘AŸi ÑÅµwÐa‘A.');
                Print(7,' ·¡¤åµA“e ˆa Àqµa Ði  eÐe ¡¡Ðñ·¡ ´ôa ?');
                Print(7,' ¦…¡wÓ¡ ·¶“e ˆõ ˆ{·e•A  ´e ‹aœåˆa ?  ·¡¤å·');
                Print(7,'·©µA•¡ aŸi Àqˆa ¯¡Åa º‰A.');
                Print(7,' ¢ ¦ÈbÐa‘A.');
                m[0] := '';
                m[1] := '¶¥Ðe”a¡e ÐáœbÐa»¡';
                m[2] := '¸a‘A“e ·¡ ‰µµA¬á ”á Ði·©·¡  g”a‘A';
                if Select(170,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := 'Í©œaŸ¡¯a';
                         sex := male;
                         class := 7;
                         classtype := sword;
                         level := 4;
                         strength := 18;
                         mentality := 10;
                         concentration := 6;
                         endurance := 12;
                         resistance := 16;
                         agility := 14;
                         accuracy := 17;
                         luck := 12;
                         poison := 0;
                         unconscious := 0;
                         dead := 0;
                         hp := endurance * level * 10;
                         sp := mentality * level * 5;
                         experience := 0;
                         potential_experience := ReturnEXP(level);
                         weapon := 4;
                         shield := 3;
                         armor := 4;
                         potential_ac := 2;
                         sword_skill := 25;
                         axe_skill := 10;
                         spear_skill := 5;
                         bow_skill := 0;
                         shield_skill := 25;
                         fist_skill := 10;
                         Modify_Item(k);
                         Putmap(41,18,44);
                         party.etc[50] := party.etc[50] or bit8;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;

             {  º£¥—i‰Á ”ÑÁ  }

             if at(21,61) then begin
                Print(7,' ¸á“e ·¡ ¬÷· q½¢µA ·¶“e Ï¡œa£¡—aµA —i´áˆv');
                Print(7,'”aˆa ¬wÀáŸi ·³´á¬á  µa‹¡¬á Ã¡žaŸi ¤h‰¡ ·¶¯s');
                Print(7,'“¡”a.  ‹a‰µµA“e ¡y‘e ¸åµA ´ô´á»¥º‰¡ e ´i‰¡');
                Print(7,'·¶´ö”å ŠA¢‰—i·¡ —b¯© ˆáŸ¡”áŠ…¶a.');
             end;
             if at(56,59) then begin
                Print(7,' ¸á“e ·¡ ‰µ· ¸ñ¬÷ˆa·¥•A  ‹eœ —i´á ”i· ¶…');
                Print(7,'Ð—·¡ ¸ñ¸ñ ·¡¬wÐ»¡‰¡ ·¶¯s“¡”a. ¦…¡w Çe ¸´w');
                Print(7,'·¡ ”bÃ© »wˆá ˆ{¯s“¡”a.');
             end;
             if at(60,42) then begin
                Print(7,' ·¡ ¶á· ¬w·¥—i·e ¡´á¬÷· ¬w·¥‰Á“e ”iŸ¡  a');
                Print(7,'¤ó ¢‰Î‘—i·i Ìe Ða‰¡ ·¶”áŠ…¶a.');
             end;
             if at(61,46) then begin
                Print(7,' ´i§¡Aµ¡· µ´å·e ¸÷ i·©Œa¶a ?  »¡‹q ·¡ ”');
                Print(7,'ŸBµA“e  ‹a· µ´å¬áˆa ´e ´ia»¥ ‰µ·¡ ´ô¯s“¡');
                Print(7,'”a. ˜¢…µA £¥¯±•¡  g·¡ •·¶a –A‰¡ ·¶¯s“¡”a.');
             end;
             if at(47,36) then begin
                Print(7,'  e´¢ ”w¯¥·¡ •¥·e  g·e•A  ‰wÐñÃ¡ˆa ¡¡¸aœe”a');
                Print(7,'¡e ¬á½¢µA ·¶“e Š…¬a Ò…e­¡· ´á˜å ¸aµA‰A ¦');
                Print(7,'Èb Ða¯¡µ¡.  ‹a“e ‹q´‚  eÇq· ¸åÊ ¤w¤ó·i ˆa');
                Print(7,'ŸaÁa¬á ‰wÐñÃ¡Ÿi µ©a º…”a”áŠ…¶a.');
             end;
             if at(54,56) and (party.etc[51] and bit1 = 0) then
             if party.etc[5] = 0 then begin
                Print(7,' ¶wÐa‰A•¡ aŸi Àx´a –Š…. ˆa ¡´á ¬÷µA q');
                Print(7,'‹¥ ¡A¡¡ ½¢»¡Ÿi ¥¡´v‰V»¡. ‹aˆõµA ‰ÅÐe ·¡´¡‹¥');
                Print(7,'•A  i·¡´¡...  a“e ¡y ˆ¶© ¸åµA ¡´á ÐåÈáµÁ');
                Print(7,'·¡ ¬÷· q½¢µA ·¶“e Ï¡œa£¡—aµA —i´á ˆv´ö»¡.');
                Print(7,'¶Ÿ¡ˆa ‹a ‰µµA¬á ¥¥ ˆõ·e ¥¢¸sÐe £¡¡µÁ ÐqA');
                Print(7,'–ˆ· •·Š‰·¡´ö»¡. ‹a –ˆ· •·Š‰·e ¡¡– »¡');
                Print(7,'Ða· ¯¥­A‰µÁ ·¡´á¹a ·¶´ö‰¡  ‹a »¡Ða ­A‰“e');
                Print(7,'µÅ¸åÐe Ðaa· ™¡ ”aŸe ­A‰Ÿi ·¡ž‰¡ ·¶´ö»¡.');
                cPrint(7,11,'‹a ‰µ·e ','§¹· »¡¦—','·¡œa‰¡ ¦‰Ÿ¡“e   a·i•¡ ·¶´ö');
                Print(7,'‰¡ •·Š‰•¡ ¡yˆˆa ·¶´ö”a‰¡ ‹¡´â –E”a‘A. Ða»¡');
                Print(7,' e ¶Ÿ¡ˆa ˆv·i ˜“e ¬¡¶… ¥eÑÁˆa ·©´á a‰¡');
                Print(7,'·¶´ö‘A.  ‹a ‰µ·e ‘AÇa¡ e¬áµÁ“e ”aŸe ¹¥¸ˆa');
                Print(7,'¤eœe·i ŽAÐa‰¡ ·¶´ö‰¡  ‹aµÁ ‹a ·©”w—i· Ó±·e');
                Print(7,'¸÷ i ””eÐaµv»¡. ‹a· Ó±µA ·Ð »¡Ða ­A‰·');
                Print(7,'Ï¡œa£¡—aˆa Ê÷‰a¹a aµÖ”a“e  ¬a¯©·i ´i´v·i˜');
                Print(7,'“e ¸÷ i ‘©œ–”a‘A.  •¡¸áÓ¡ ¶Ÿ¡—i· Ó±·a¡“e');
                Print(7,'‹a—i·i ”wÐi ®ˆa ´ô´á¬á ½¹‰a ”a“¡”å º— ”a¯¡');
                Print(7,'Ï¡œa£¡—aŸi É·Ð aµ¡‰A –A´ö”å ˆõ·¡‘A. ‹a ·©');
                Print(7,'”w·e ¡¡– 4¡w· ¥¡¯a¡ Š¬÷–A´á ·¶´ö“e•A ¡¡');
                cPrint(7,11,'– ÂAˆw·  a¤ó¬a—i·¡´ö‘A.  ¶Ÿ¡ˆa ','ÓW¬÷· »w','');
                cPrint(11,7,'ˆá','œa“e •·Š‰·i aµ© ˜ ‹a º—· ¶– áŸ¡·¥ ','¡A');
                cPrint(7,11,'','Ï¡¯aÉ¡ÍIA¯a','ˆa  ‰·‹¡º—· ®­¡Ÿi ·¡¶wÐe Ð—·W');
                Print(7,'Ðs  a¤ó·i ¬a¶wÐaµa  •·Š‰ ·³ŠŸi Í¢Ìa ¯¡Åv”a');
                Print(7,'‘A.  ¸÷ i ‹a Ó±·e A—a ´eÈaA¯a·  a¤ó·i “w');
                Print(7,'ˆaÐa“e Ó±·¡ ´ö”a‘A. ‹a 4 ¡w· ¥¡¯a· ·¡Ÿq•¡');
                Print(7,'Àq‰¡¡ ´i´a –‰Aa. ‹a ·©”w· ·©·¥¸aˆa ¤w‹q');
                Print(7,' iÐe ¡AÏ¡¯aÉ¡ÍIA¯aœa‰¡Ða‰¡,  ·¡·¥¸aˆa ´a¯a');
                Print(7,'¡¡•A¶¯a·¡‰¡, ‹a ”a·q·¡ ¡©¢·¡¡a,   a»¡ b·¡');
                Print(7,'¥AŸ¡´i·¡œa‰¡ Ða”áŠ….  »¡‹q·e ‰iŠ‚ ‹a—i·i ¡¡');
                Print(7,'– ˜a•©v»¡ e  ‹a—i•¡ ‹a—i· ¹¥¸ˆa  ´ia»¥');
                Print(7,'·¡¬w ˆa eÓ¡ ·¶»¡ ´g·iˆé­A.  e´¢ ¸a‘Aˆa »¡Ða');
                Print(7,'­A‰Ÿi ÈqÐñÐaa Ðe”a¡e ´á¬á ¨iŸ¡ ˆa¥¡•¡¢Ða');
                Print(7,'‰A ¦…¡w ‹a—i·e ·³ŠŸi ¥·­áÐaa Ði ˆé­A.  ´a');
                Print(7,'“¡¡e ¤é°á ·³ŠŸi  b´a ¤áv“e»¡•¡ ¡¡Ÿa‰V»¡ e');
                Print(7,'. »¡‹q »¡Ða ­A‰µA¬á ·©´áa“e ¥eÑÁ“e ¦…¡wÓ¡');
                Print(7,'´i§¡Aµ¡· µ´å‰Á ‰Åe·¡ ·¶”a‘A.  ´a a ¸a‘A');
                Print(7,'ˆa Ð´¡Ði ·©•¡ ˆá‹¡µÁ ‰Åe–E ˆõ·© ˆé­A.');
                Print(7,'');
                PressAnyKey;
                Print(7,' a“e ·¡‰µµA¬á á¢  g·¡  á¢‰œö”a‘A.');
                Print(7,' ¸a‘A•¡  ev·a“¡ a· Ði ·©·e ”a {v”a‘A.');
                Print(7,' ¹¡‹q e ·¶”aˆa a•¡ ¬¡¶… µaÐ—·i ˜áa´¡ Ða');
                Print(7,'»¡. ‹aœñ ”a·qµA ¥¡•¡¢ Ða»¡');
                party.etc[35] := party.etc[35] or bit5;
             end
             else begin
                Print(7,' ”a¯¡ ¬—ˆbÐ ¥¡“¡ a•¡ ¸a‘A· ·©Ð—µA ÀqˆaÐ');
                Print(7,'´¡Ði ˆõˆ{‘A.  a“e ´é a ¸åµA »¡Ða ­A‰µA ”a');
                Print(7,'‘a µÖ‹¡ ˜¢…µA  ¸åÊ ˆqˆb·¡ ´a»¢ ¬i´a´v“e•A');
                Print(7,'”aˆa ¸å¬aœa“e ‰‹s ˜¢…µA  ¸a‘AµA‰A  g·e •¡');
                Print(7,'¶‘·¡ –I ˆé­A.');
                Print(7,' ¸a‘AµA‰A Ðe¤å ¦ÈbÐa‘A.');
                m[0] := '';
                m[1] := '¸a‘Aœa¡e Çe •¡¶‘·¡ –Iˆé­A';
                m[2] := '»¡‹q·e ¹± ‰¥œeÐaŠ…';
                if Select(170,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := '»¡“¡´á¯a ‹¡';
                         sex := male;
                         class := 7;
                         classtype := sword;
                         level := 10;
                         strength := 19;
                         mentality := 15;
                         concentration := 10;
                         endurance := 14;
                         resistance := 18;
                         agility := 16;
                         accuracy := 18;
                         luck := 17;
                         poison := 0;
                         unconscious := 0;
                         dead := 0;
                         hp := endurance * level * 10;
                         sp := mentality * level * 5;
                         experience := 0;
                         potential_experience := ReturnEXP(level);
                         weapon := 19;
                         shield := 4;
                         armor := 6;
                         potential_ac := 3;
                         sword_skill := 25;
                         axe_skill := 30;
                         spear_skill := 30;
                         bow_skill := 10;
                         shield_skill := 40;
                         fist_skill := 15;
                         Modify_Item(k);
                         Putmap(54,56,44);
                         party.etc[51] := party.etc[51] or bit1;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;

             if at(38,17) then
             case party.etc[11] of
                0 : begin
                       Print(7,' ¸iµÖ­¡, '+player[1].name+'‰·.');
                       Print(7,' ‰· e·¡ ·¡ ·©·i Ð‰iÐi ® ·¶·iˆõ ˆ{´a¬á  Ðe');
                       Print(7,'ˆa»¡ ¦Èb·i Ða‰V­¡. ¤é°á ¤i‰eÐ–“e »¡“e ¡¡Ÿa');
                       Print(7,'‰V»¡ e ·¡ ¬÷· q½¢µA“e ´i ® ´ô“e Ï¡œa£¡—a');
                       Print(7,'ˆa ˜w­¢ ‹¼·e ‰µ·a¡ ¦Èá ­µ´a µ©œv­¡. ‹a ‰µ');
                       Print(7,'·i ·¡£¡ ¡´á ÐåÈáˆa »¡“¡´á¯a ‹¡œe ¶w¬aµÁ ˆ{');
                       Print(7,'·¡ ÈqÐñ·i Ð–´ö­¡. ˆá‹¡µA¬á ¡´á ÐåÈá“e »¡Ða');
                       Print(7,'­A‰Ÿi ¤i‰eÐa‰¡“e  Š¬a·©¬—·a¡ ¬i´a¬á •©´a');
                       Print(7,'µÖ”aµ¡.  Ða»¡ e ‹a“e »¡Ða ­A‰µA ”Ðe ”á ¸a');
                       Print(7,'­AÐe ¸÷¥¡Ÿi ´è‹¡ ¶áÐ  ”e¯¥·a¡ ”a¯¡ Ï¡œa£¡');
                       Print(7,'—aµA —i´áˆv”aµ¡. »¡‹q ‹a· ¬—¬a“e •¡¸áÓ¡ ´i');
                       Print(7,'®ˆa ´ô´á¬á ‰·µA‰A ‹aŸi •¡µÁ ”iœa‰¡ ¦Èb Ða');
                       Print(7,'“e ˆõ·¡µ¡.  Ï¡œa£¡—aµA“e ŠA¢‰—i·¡  g·¡ ·¶·a');
                       Print(7,'“¡ º·Ð´¡ Ðiˆõ·¡µ¡. ¢ ‹aŸi Àx´a¯¡µ¡.');
                       inc(party.etc[11]);
                    end;
                1 : begin
                       Print(7,' Ï¡œa£¡—a ­¢µA¬á ­¡¯¢·¡ g´á»¥  ¡´á ÐåÈá·');
                       Print(7,'¬—¬aŸi ´i´a º¯¡µ¡.');
                    end;
                2 : begin
                       Print(7,' ¡´á ÐåÈáˆa ¬i´a ·¶´ö”a“¡ ¸÷ i ”aÐ—·¡Š…¶a.');
                       Print(7,' ‰·µA‰A ·¡ ·©·i  {‹¡‹¡Ÿi  ¸÷ i ¸i ¬åÈ‚Ðe ˆõ');
                       Print(7,'ˆ{­¡.');
                       Print(7,'');
                       Print(11,' [ ‰wÐñÃ¡ + 50000 ] [ Ñ×‹q + 10000 ]');
                       for i := 1 to 5 do begin
                          if player[i].name <> '' then
                          player[i].experience := player[i].experience + 50000;
                       end;
                       party.gold := party.gold + 10000;
                       inc(party.etc[11]);
                    end;
                3 : begin
                       if (party.etc[31] and bit6 > 0) and (party.etc[32] and bit8 > 0) then begin
                          inc(party.etc[11]);
                          talkmode;
                          exit;
                       end;
                       Print(7,' ·¡¤åµA ‰··¡ Ði ·©·e  Ï¡œa£¡—a ­¢· – •·Š‰');
                       Print(7,'·i ÈqÐñÐa‰¡ »¡Ða ­A‰µA ”Ðe ¸÷¥¡Ÿi ´i´a µ¡');
                       Print(7,'“e ·©·¡µ¡.');
                       Print(7,' ·¡¤å ·©•¡ ¦ÈbÐaµ¡.');
                    end;
                4 : begin
                       Print(7,' ‰··¡ Ï¡œa£¡—a ´e· – •·Š‰µA¬á ¤i‰eÐe ˆõ·¡');
                       Print(7,'·¡ –ˆ· ¬âÌe·¡µ¡ ?  ·Aˆq¯aœó‰A•¡ aµA‰A“e');
                       Print(7,'·¡ ‰¡”´áŸi Ð¬âÐi  eÐe “wb·¡ ´ô­¡. ¦…¡wÓ¡');
                       Print(7,'¡—a ´e·¡œa¡e Ð¬âÐi ® ·¶·i ˆõ·¡µ¡.');
                       Print(7,'');
                       Print(11,' [ ‰wÐñÃ¡ + 100000 ] [ Ñ×‹q + 15000 ]');
                       for i := 1 to 5 do begin
                          if player[i].name <> '' then
                          player[i].experience := player[i].experience + 100000;
                       end;
                       party.gold := party.gold + 15000;
                       inc(party.etc[11]);
                    end;
                5 : begin
                       Print(7,' ·¡¹A ‰··¡ ·¡ ‰µµA¬á Ði ·©·e ”a {v­¡.');
                       if party.etc[10] = 5 then inc(party.etc[10]);
                    end;
             end;
          end;
      8 : begin
             Clear;
             if at(25,12) then begin
                Print(7,' ·¡ ¯¡ÁA“e  ´á˜å Ó±µA ·Ð ¬i¸ñ·e µÅ¸åÓ¡ ˜é');
                Print(7,'´á¹a aˆa‰¡ ©a e·¡ q´a ·¶´ö”a. ‹a· µ¡Ÿe­¥');
                Print(7,'µ|µA“e –Œá¶… s·a¡  e—i´á»¥ ¬w¸aˆa ·¶´ö”a');
                Print(7,'.  ·©Ð—·e  a¤ó·a¡ ¸q‹¥ ¬w¸aŸi µi‰¡ ‹a ´e·i');
                Print(7,'¥¡“¡ ÌaÏ¡ž¯a¡  e—i´á»¥ ¹··¡ ¹¡ˆb·¡ ·¶´ö‰¡');
                Print(7,'ˆá‹¡µA“e ¨‚¨‚Ða‰A ¢´åˆa ³aµa¹a ·¶´ö”a.');
                Print(7,' ‹a ¹··¡· ‹i·i ·ª´á ¥¡¡e ”a·q‰Á ˆ{”a.');
                PressAnyKey;
                cPrint(15,11,' ','´b· Â¹·¸a—i','·¡  ¯©Ÿ¡´e Äa£¡á¯aŸi  •Aaˆa');
                Print(15,'¤áv”a.   e´¢ ·¡ ‹i·i ’ˆa ¥¥”a¡e ‹a—i·i ·w');
                Print(15,'»·Ðº‹¡Ÿi ¤aœe”a.  ¯©Ÿ¡´e Äa£¡á¯a“e ·¡ ‰µ');
                Print(15,'È¬—· 6 ¬ie µa¸a ´a·¡¡a ‹a‘a“e ¶…¡w¸â·a¡');
                Print(15,'¦‰¡i· Ó±·i ˆa»¡‰¡ È´áv”a.  ´a»¢·e ‹a‘a·');
                Print(15,'Ó±·¡ ˆwÐa‰A ¥··¥ –A´á ·¶´á¬á  ˆâ¸÷·¡ ´ô»¡ e');
                cPrint(15,11,' e´¢  ','´b· Â¹·¸a—i','·¡ ¥··¥ –A´á ·¶“e ‹a‘a·');
                Print(15,'®‘·e Ó±·i ·¡i´á …”a¡e ‹a Ó±µA ·Ð¬á ­A¬w');
                Print(15,'·e  ˆõ¸s·i® ´ô“e ÌaŠ‚·a¡ Ã¡”h‰A –A´á ¡i w');
                Print(15,'·¡ •¡œÐa‰A –I ˆõ·¡”a. ¤e—a¯¡ ‹a—i·i ·w»·Ð');
                Print(15,'º‹¡Ÿi ¤aœe”a. ­A¬w· ÍwÑÁŸi ¶áÐaµa....');
                if party.etc[9] and bit2 = 0 then begin
                   Print(7,'');
                   Print(11,' [ ‰wÐñÃ¡ + 100000 ]');
                   party.etc[9] := party.etc[9] or bit2;
                   for i := 1 to 5 do
                   if player[i].name <> '' then player[i].experience := player[i].experience + 100000;
                end;
             end;
             if at(21,13) then begin
                Print(7,' ·¡ ¯¡ÁA“e ´á˜å ˆwbÐe Ó±·i ¸÷¡e·a¡ ¤h´a¬á');
                Print(7,'ˆá· ÑwÁAŸi ´i´a¥© ® ´ô´ö”a.  ‹a ¯¡ÁAŸi µa');
                Print(7,'œá¡¡¡ ¬iÍa¥¡“¡ ·¡ ‰µ· ¸w¡·±·i ´i´v‰¡, ‹a');
                Print(7,'¯¡ÁAµA“e ˆwÐe ¤w¬a“w·¡ ·¶´á¬á  ·¡ ‰µ· ¯¡ÁA');
                Print(7,'—i· ¬a·¥·¡ Ð‚¢‹¡µA ·Ðe ˆõ·±·i ´i´v”a.');
                Print(7,' ·¡ ®¤ó·e Ï¡œa£¡—a ­¢·  – •·Š‰·i Ðq¡© ¯¡');
                Print(7,'Ç¥ ˆõ‰Á ˆ{·e ¤w¤ó·¡´ö”a.');
             end;
             if at(23,15) then begin
                Print(7,' ·¡ ¯¡ÁA“e º‚·e»¡ˆa ‰a¶ Ðažˆa »¡eˆõ ˆ{´v');
                Print(7,'”a.  ‹a ¸a“e ¢´åˆa ¡A­A»¡Ÿi q‹¡‹¡ ¶áÐ ¤a');
                Print(7,'”bµA Ï¡¡ ¢´åˆaŸi °ö“e•A ‹a ˆõ·i ·ª´á ¥¡¡e');
                Print(7,'”a·q‰Á ˆ{”a.');
                Print(7,'');
                Print(12,' Ï©¡i· ¬—¹¥ .. 33 .. 49 ..');
             end;
             if at(38,40) or at(39,43) then begin
                Print(7,' ·¡ ¯¡ÁA“e º‚·e Ðaž ¤cµA ´e–Eˆõ ˆ{´v”a.');
             end;
             if at(25,61) and (party.etc[40] and bit1 = 0) then begin
                Print(7,' ·a~~·b~~ —a—¡´á ¬aœq·i  evŠ…¶a. ´á¹A ´á˜å');
                Print(7,'¸a—iµA ·Ð¬á  a·i·¡ µÅ¸åÓ¡ ¸å¡iÐ–”aµ¡.  ‹a');
                Print(7,'—i·e 4 ¡w·  a•¡¬a µv“e•A  ‹a—i·e ´ñÀ÷e Ó±');
                Print(7,'·a¡  a·i·i Í¢Ìa ¯¡Ç¡‰¡“e ¬aœa¹v­¡.  ‹a—i·');
                Print(7,'¡¢¸â·¡ ¢´õ·¥»¡ ¸á“e ´i ®ˆa ´ô´ö»¡ e  ‹a—i');
                Print(7,'·e ·¡  a·i· •·½¢µA ·¶“e §¹· ¬a¶¥½¢·a¡ ¬a');
                Print(7,'œa¹v­¡. ‹aœñ –õ·©·i ¦ÈbÐaµ¡ ...');
                Print(7,'');
                Print(7,' ‹a“e  i·i {‰¡“e ®‘·¡ g´á¹v”a.');
                PutMap(25,61,48);
                party.etc[40] := party.etc[40] or bit1;
                Silent_Scroll;
             end;
          end;
      9 : begin
             Clear;
             if party.etc[32] and bit6 = 0 then begin
                Print(7,' ´a“¡! '+player[1].name+'.');
                Print(7,' ¸÷ i µ¡œˆe  e·¡Š…. µa‹¡µA“e ¢¯e·©·¥ˆa ? ');
                Print(7,'');
                Print(3,' a“e »¡“¡´á¯a ‹¡ˆa q‹¥ ½¢»¡Ÿi ¥¡‰¡ ”w¯¥·i');
                Print(3,'Àx´a µÖ”a‘A. ‹aˆa  iÐa‹¡¡ ¸a‘Aˆa ‹aˆa ·¶“e');
                Print(3,'¶áÃ¡Ÿi ´e”a‰¡ Ð¬á  i·©­A.');
                Print(7,'');
                Print(7,' »¡“¡´á¯a ‹¡ˆa ·¶“e ‰µ·i ´i‰¡ ¯¼”a“e ˆõ·¡Š…');
                Print(7,'. ˆa ·¡¤åµA ´¢Á¡Ÿi ŠÐµÖ·i˜ ¸q¯¡ œa¯aËa');
                Print(7,'—¡Ã¡µA ´¢Á¡Ÿi Ìi‹¡ ¶áÐ —iv´ö»¡. ‹a˜ ¢‹¡');
                Print(7,'¬w¸ñ ‹eÀáµA ·¶“e »¡“¡´á¯a ‹¡Ÿi  ev´ö”a‘A.');
                Print(7,' ‹a“e ´é aÒµA ‹¥ µaÐ—·i ˜áe”a‰¡ Ða”å•A ¨i');
                Print(7,'Ÿ¡ ˆa¥¡¡e  ei ® ·¶·i ˆé­A.');
                PressAnyKey;
                Print(7,' ´aÀq ‹aŸ¡‰¡ ˆa ·¡¤åµA“e Ð•¢ ´¢Á¡Ÿi  g·¡');
                Print(7,'Ä–”a‘A. ¸a‘AµA‰A•¡ ¡yˆ º»¡. µaÐ—µA •¡¶‘·¡');
                Print(7,'–Iˆé­A.');
                Print(7,'');
                Print(11,' ·©Ð—·e ´¢ˆe· Ð•¢ ´¢Á¡Ÿi ‹aµA‰A ¤h´v”a.');
                if party.item[3] + 5 < 256 then party.item[3] := party.item[3] + 5
                else party.item[3] := 255;
                party.etc[32] := party.etc[32] or bit6;
                exit;
             end;
             if party.etc[5] = 0 then begin
                Print(7,' ¸a‘Aˆa ´¢Á¡Ÿi ”á ¶¥Ðe”a¡e œa¯aËa —¡Ã¡· ¥w');
                Print(7,'¶¥µA ˆa¥¡‰A. ‹a ‰µµA ˆa ´¢Á¡Ÿi Ìi´v”a‘A.');
             end
             else begin
                Print(7,' ¸qŒe ! '+player[1].name+' !');
                Print(7,' ¸a‘A· ¡¡¯s·i ¥¡“¡ ˆs¸a‹¡ µ¸å· ‹a ˜Àáœñ');
                Print(7,'¸÷·Ÿi ¶áÐ °a¶¡¥¡‰¡ ¯¼Š…. ¬a¯© ·¡œå ´¢Á¡a');
                Print(7,'Äœá ”a“¡“e ·©·e aµA‰A  x»¡ ´g”a‘A. ·¡¹A“e');
                Print(7,'·¡ ·©µA•¡ »¡Áa ¤áv‰¡...');
                Print(7, 'aŸi ¡¡ÐñµA Àqˆa ¯¡Åaº‰A.');
                m[0] := '';
                m[1] := 'a µb¯¡ ¸a‘A· •¡¶‘·¡ Ï©¶aÐ–”a‘A';
                m[2] := '¸a‘Aˆa ·©¦œá a¬á»¡ ´g´a•¡ –I ·©·¡‘A';
                if Select(170,2,2,FALSE,TRUE) = 1 then begin
                   k := 0;
                   repeat
                      inc(k);
                   until (player[k].name = '') or (k = 6);
                   if k < 6 then begin
                      with player[k] do begin
                         name := 'AŠ‰ž¯a';
                         sex := male;
                         class := 5;
                         classtype := sword;
                         level := 4;
                         strength := 19;
                         mentality := 5;
                         concentration := 6;
                         endurance := 15;
                         resistance := 10;
                         agility := 10;
                         accuracy := 17;
                         luck := 7;
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
                         potential_ac := 2;
                         sword_skill := 0;
                         axe_skill := 0;
                         spear_skill := 0;
                         bow_skill := 0;
                         shield_skill := 0;
                         fist_skill := 50;
                         Modify_Item(k);
                         Putmap(40,13,47);
                         party.etc[50] := party.etc[50] or bit7;
                         Silent_Scroll;
                         Display_Condition;
                      end;
                   end
                   else begin
                      Print(7,' a•¡ ”w¯¥· ·©Ð—µA ÀqˆaÐa‰¡ ¯¼»¡ e ¤é°á ¬a');
                      Print(7,'œq·¡ ¡¡– À¶¡¹a ·¶Š…. £¡´eÐa‰A •ö‘A.');
                      exit;
                   end;
                end;
             end;
          end;
   end;
end;

Procedure talkmode;
begin
   if party.map <= 6 then talkmode_sub1 else talkmode_sub2;
end;

end.