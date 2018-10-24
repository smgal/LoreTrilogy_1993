Unit LoreSpec;

INTERFACE

Uses
   Crt, Graph, UHanX, LoreSub, Voice, LoreBatt, LoreEnd;

 Procedure specialevent;


IMPLEMENTATION

Procedure specialevent_part1;

 function sgn(eq : integer) : integer;
 begin
    if eq > 0 then sgn := 1
    else if eq < 0 then sgn := -1
    else sgn := 0;
 end;

begin
   scroll(TRUE);
   case party.map of
      1 : begin
             Clear;
             if party.etc[32] and bit8 = 0 then begin
                talk('·©Ð——i·e 100 ·¥¦…· ¯¢œ··i ¤i‰eÐ–”a.');
                if party.food > 155 then party.food := 255
                else party.food := party.food + 100;
                party.etc[32] := party.etc[32] or bit8;
             end
             else talk('¶Ÿ¡—i·e ´a¢ˆõ•¡ ¤i‰eÐi® ´ô´ö”a.');
             x := x - x1; y := y - y1;
             scroll(TRUE);
          end;
      4 : begin
             Clear;
             if on(40,18) then begin
                message(7,' ·©Ð—·e ‰·ˆe ·¡•··¡ –A´ö”a');
                x := 46; y := 41;
                Silent_Scroll;
             end;
             if on(26,16) then begin
                Print(15,' µa‹¡“e ·¥ˆe‰Á —aœ‰¥· º—ˆe ¹·¹¢·¡¡a  Ñ¥œe');
                Print(15,'¯aœå ­A¬w·i Ï¡Ð ·e–…Ða‰¡·¶“e Draconian·¡œe');
                Print(15,'¸aˆa ¬i‰¡·¶“e Ï¡œa£µ·¡´ö”a.');
                PressAnyKey;
                if party.etc[16] and bit2 > 0 then begin
                   message(7,' ‹aœáa, ´a¢•¡ ¬i‰¡ ·¶»¡ ´g´v”a.');
                   exit;
                end;
                if party.etc[5] = 0 then begin
                   Print(7,' a“e Draconian·¡œa‰¡ Ðaµ¡. ·¡œå‰µŒa»¡ ¬aœq');
                   Print(7,'·¡ Àx´aµ¡Ÿ¡œa‰¡“e ¬—ˆbÐa»¡ ¡µÐ–“e•A Àq ·¶A');
                   Print(7,'¡Š…¶a. a“e ®‘´á »¡“e µ¡œ… ­A¶©•·´eµA µa');
                   Print(7,'œáˆa»¡ Ðb¢…·i µeŠÐa‰¡ ·¶´ö­¡.  ËbÓ¡ Àå¢…Ðb');
                   Print(7,'µA ”Ð¬á“e Ëb¥iÓ¡ ¸åµqÐaµa ”až´ö­¡.  ˆa');
                   Print(7,'‹a•·´e ´i´a… »¡¯¢—i·e ”a·q‰Á ˆ{·e ˆõ·¡µ¡.');
                   Print(7,' »¡‹q ¶Ÿ¡ˆa ¬i‰¡·¶“e »¡Š“e È´·‰µA¬á  ­A');
                   Print(7,'¤å¼¡ ¶áÃ¡Ðe Ð—¬÷·¥•A ·¡¬wÐa‰A•¡ ¶á¬÷·¥ ”i');
                   Print(7,'·¡ »¡Š¥¡”a•¡ ”á µ¡œ–A´ö”a“e ¬a¯©·¡ µeŠ–A');
                   Print(7,'´ö­¡. ™¡Ðe ·¡ »¡Šˆa ­AÀa¶…•·µA ·Ð 2 —w¬÷');
                   Print(7,'·¡´ö”å ¦‚‹b¬÷·¡ ”aŸe ¥i¡ ¤aŽå”a“eˆé ´i´v­¡');
                   Print(7,' ¢‰Ÿ¡ÐbµA¬á ´i´a…ˆõ·e, º—®¤e·wµA¬á  »©·');
                   Print(7,'Àa·¡¡ §¹·¡ ­¢•¡ˆa “aa»¥ Ëq·i ·¡¶wÐ §¹ ¥¡');
                   Print(7,'”a ¨aŸe ·³¸aˆa ¬—‰av­¡. Ða»¡ e ¸é”¸â·¥ §¹');
                   Print(7,'· ­¢•¡µA“e £¡Ã¡»¡ ¡µÐ–»¡ e  i·¡µ¡.  ·¡ˆõ·i');
                   Print(7,'¸i e ·¡¶wÐa¡e £¡œ¡· Èa·± á¯¥·¡  ˆa“wÐa”a');
                   Print(7,'“e ˆé ·³»wÐi ®ˆa ·¶­¡.');
                   Print(7,' ¬a¯© ·¡œåˆõ·e ”w¯¥µA‰A“e ¥i ·£¡ˆa ´ô“e ˆõ');
                   Print(7,'·©»¡•¡ ¡¡Ÿaµ¡. Ða»¡ e  a»¡ b·a¡ ´i´a…ˆõ·e');
                   Print(7,'¤a¡ ”w¯¥·¡ ·w»·Ða‰¡¸a Ða“e  Necromancer ·');
                   Print(7,'Â‰ÀáµA ‰ÅÐe ˆõ·¡µ¡. ”w¯¥·e ¯¡‹aá¯a X1‰Á ˆ{');
                   Print(7,'·e §iœ‚Ñ©µA ”Ð¬á ´i‰¡·¶·i ˆõ·¡µ¡. ·¡œå ¢‰');
                   Print(7,'Ÿ¡Ðb¸â·¥ Ìaœa•¢¯aµA ·Ð ‹a“e ¬—‰av”åˆõ·¡µ¡.');
                   PressAnyKey;
                   Print(7,' »¡‹q ¶Ÿ¡ˆa ·¶“e 3Àa¶¥ ¶áµA ™¡ ”aŸe Àa¶¥·¡');
                   Print(7,'·¶”a‰¡ ¬—ˆbÐaµ¡?  ¬—ˆb·e Ða”áœa•¡ ’…·a¡ ÑÂ');
                   Print(7,'·¥·e ¡µÐ¥Ö·iˆõ·¡µ¡. ¶Ÿ¡“e 2Àa¶¥·i ·¥¯¢ Ði');
                   Print(7,'®ˆa ·¶­¡.  Ða»¡ e ¯©¹A¡ 2Àa¶¥µA  ¬i‰¡·¶“e');
                   Print(7,'¬—¢‰·e ¸a¯¥· Àa¶¥·e ·¥¯¢Ð•¡ ¶Ÿ¡ˆa ¬i‰¡·¶');
                   Print(7,'“e 3Àa¶¥·e ·¥¯¢Ði ®ˆa ´ô“e ˆõ·¡µ¡. ‹a· Àa');
                   Print(7,'¶¥µA“e ¶Ÿ¡· Àa¶¥·¡  ¹¥¸Ða»¡ ´g‹¡  ˜¢…µA');
                   Print(7,'ˆ‘q·i ¸s·i®ˆa ´ô“e ˆõ·¡µ¡.   aÀeˆa»¡¡ ¶');
                   Print(7,'Ÿ¡ ™¡Ðe »¡‹q· Àa¶¥¥¡”a Ðe Àa¶¥ ‘¼·e 4 Àa¶¥');
                   Print(7,'·i ˆ‘q·i ¸s‹¡ˆa ´áa¶… ˆõ·¡µ¡.');
                   Print(7,' ´á˜å·¡“e 4Àa¶¥·e ¯¡ˆe· Â‚·¡ ¥¡È´á »¥”a‰¡');
                   Print(7,'Ða“e ·¡¥·i ­A¶”áŠ…¶a.  Ða»¡ e a· ·¡¥·e');
                   Print(7,'¯¡ˆe·e ¡¡—e Àa¶¥· ‹¡º…·¡¡a 4Àa¶¥µA Š‚Ðe –A');
                   Print(7,'»¡“e ´g“e”a“e ¬—ˆb·¡µ¡. 3Àa¶¥µA¬á“e •· ¯¡ˆe');
                   Print(7,'”µA ¢ÐeÐe 2Àa¶¥·i Í¡Ðq Ða—u·¡ 4Àa¶¥µA¬á“e');
                   Print(7,'•· ¯¡ˆe”µA  ¢ÐeÐe 3Àa¶¥·i Í¡ÐqÐa‰¡ ·¶”a“e');
                   Print(7,'·¡¥·¡ ¬÷Ÿ³–Aµ¡.  i·¡ ¹¡‹q·e §µaˆv»¡ e  ·¡');
                   Print(7,'·¡¥·a¡ Necromancer· Â‰ÀáŸi Ð¡wÐ ¥¡‰V­¡');
                   Print(7,' ¤w‹q  iÐ–—u·¡ 3Àa¶¥·e ·¡ ‰·ˆe e·¡ ¹¥¸Ða“e');
                   Print(7,'ˆõ·e ´a“¡µ¡. •· ¯¡”Ÿi ¬i´aˆa“e ”aŸe ‰·ˆe•¡');
                   Print(7,'·¥¸÷Ð´¡ Ðe”a“e  i·¡µ¡.  ‹a ‰·ˆe—i·i ·¡´áº');
                   Print(7,'“e ˆõ·¡ ¤a¡ §iœ‚ Ñ©·¡œe ˆõ·¡»¡¶a.  ‹a“e ¶¥');
                   Print(7,'œ ‹aˆa ·¶”å ‰·ˆeµA¬á §iœ‚ Ñ©·i É·Ð¬á ”aŸe');
                   Print(7,'‰·ˆe·a¡ ˆaa‰¡ ¯¡•¡Ÿi Ð–‰¡ ¶± Ñ©·i É·Ð ¯¡');
                   Print(7,'‰·ˆe·i ˆa¡»©œá µ¡œ¸å ¶Ÿ¡· ‰·ˆeµA ÑÁ·¡Ëa');
                   Print(7,'Ñ©·¡ ¬—‹¡“e Ëq·i ·¡¶wÐaµa aµÖ”å ˆõ·¡µ¡.');
                   Print(7,' Ða»¡ e 3Àa¶¥µA ¬a“e a¡¬á“e ‹aˆa ¸åµA  ·¶');
                   Print(7,'”å ‰·ˆeµA¬á µá ·¡½¢·a¡ µÖ“e»¡  ´i®ˆa ´ô´ö');
                   Print(7,'»¡¶a. ‹aœ¬á ‹aµÁ ˆ{·¡ ·¡ ‰·ˆe·a¡ —i´áµÖ”å');
                   Print(7,'¯±¥¢—i·i É·Ð ‹a ¬a¸÷·i ´i‰A –A´ö­¡.');
                   Print(7,' Necromacer“e ¸á½¢· ‰·ˆeµA¬á•¡ »¡‹q‰Á  aÀe');
                   Print(7,'ˆa»¡¡ Àa¶¥·i É·Ð ‹a ‰·ˆeµA •¡”iÐ–­¡. µb¯¡');
                   Print(7,'ˆá‹¡¬á•¡ ´b·i ªŸ¡¡a ˆá‹¡· ¬—¡wÁA—i·i ¶áÑs');
                   Print(7,'Ð–­¡. Ða»¡ e ´á˜å ¬åÈ‚–A´á»¥ 6·¥· ¶w¬a—iµA');
                   Print(7,'·Ð ½¸‰aa¬á µa‹¡¡ µ¥ˆõ·¡µ¡.  »¡‹q· ”w¯¥');
                   Print(7,'—i‰Á §¡¯uÐa”a‰¡ ¬—ˆb–A»¡ ´g­¡? ‹aœý­¡. ”aŸe');
                   Print(7,'‰·ˆe· ”w¯¥—iµA‰A ½¸‰aeÒ ”a¯¡ µa‹¡¬á ”w¯¥');
                   Print(7,'—i·i ™¡  ea‰A –Eˆõ·¡µ¡. NecromancerµÁ ”w¯¥');
                   Print(7,'—i· ¶…¡w·e ´å¹AŒa»¡a ½¸‰¡ ½¸‹¡¡a ”Ÿ³Ðaµa');
                   Print(7,'´¡Ða“e ¶…¡w·a¡ Èe¬—–A´ö”å ˆõ·¡µ¡. ·¡œå  ·¡');
                   Print(7,'·AµA¬á ”w¯¥·e ‹aŸi ¤e—a¯¡ ¢¿¡Ÿi ®ˆa  ·¶”a');
                   Print(7,'“e ‹eˆáˆa –A“e ˆõ·¡µ¡.');
                   Print(7,' ”w¯¥—i· ˆåÊŸi §©´áº‰V­¡.');
                   talk('');
                end
                else begin
                   Print(7,' a· ¶…¡w·i ¬—ˆbÐ ¥¡“¡  a µb¯¡  ”w¯¥—i·i');
                   Print(7,'Ï©µe¸â·a¡  ea NecromancerŸi ¢‰Ÿ¡Áa´¡ Ðe”a');
                   Print(7,'“eˆé Œ”j´v­¡. ”w¯¥—i ·©Ð—· ¹A·© –áµA¬á •¡');
                   Print(7,'µÁº‰¡ ¯¼­¡. ´á˜ý­¡.');
                   m[0] := '';
                   m[1] := '¸á•¡ ¤aœa”å Àa·³“¡”a';
                   m[2] := '¥i¡ ¹½»¡“e ´gŠ…¶a';
                   k := select(140,2,2,FALSE,TRUE);
                   if k = 0 then exit;
                   if k = 1 then begin
                      enemydata[62].level := 17;
                      join(62,6);
                      enemydata[62].level := 19;
                      Display_Condition;
                      party.etc[16] := party.etc[16] or bit2;
                   end;
                   if k = 2 then begin
                      Print(7,' ”a¯¡ ¬—ˆbÐ¥¡“¡ a“e ”w¯¥—i‰Á ˆ{·¡ °a¶‰ ¶…');
                      Print(7,'¡w·¡ ´a“¥ˆõ ˆ{­¡.');
                      PressAnyKey;
                   end;
                end;
             end;
             if on(20,39) then begin
                if party.etc[16] and bit1 > 0 then begin
                   x := 46; y := 41;
                   scroll(TRUE);
                   Print(7,' ·¡¹A“e ”á ·¡¬w Ði i·¡ ´ô­¡.');
                   PressAnyKey;
                   exit;
                end;
                aux := SoundOn; SoundOn := false;
                Print(7,' a“e Ancient Evil ·¡œe ¹¥¸·¡µ¡. ·¡¹A a“e');
                Print(7,'·B¯¥·e ´ô“e µw·¡µ¡. ”w¯¥·e Lord Ahn ·i  ea');
                Print(7,'¥¡´v‰VŠ…¶a. ‹aŸ¡‰¡ ¶Ÿ¡—i· ¶…¡w¸â·¥  eq•¡');
                Print(7,'µb¯¡ µ¯¡ ¤h´v‰VŠ…¶a.');
                Print(7,' ¬a¯©·¡´¡ ´á˜ý—e ”w¯¥µA‰A ·¡ ”ŸBµA¬á·  Ði');
                Print(7,'·©·i  iÐ º‰V­¡.');
                PressAnyKey;
                x := 48; y := 57;
                scroll(FALSE);
                Print(7,' µa‹¡“e EVIL GOD œa“e •·Š‰·¡µ¡. µa‹¡· ¥¡¯a');
                Print(7,'“e Crab God·¥•A ¸â ¸aÁA“e ¥iˆá ´a“¡»¡ e  ™A');
                Print(7,'Ÿi »¡´á¬á ”a“¡‹¡ ˜¢…µA ´¢ˆe· ´Ÿi  â·i ˆõ');
                Print(7,'·¡µ¡. 7ˆiœ· ‹©º—µA¬á Ðe‰µµA ¥··¥·¡ ®‘‰a¹a');
                Print(7,'·¶·i ˆõ·¡µ¡.');
                PressAnyKey;
                x := 82; y := 16;
                scroll(FALSE);
                Print(7,' µa‹¡“e Muddy œa“e •·Š‰·¡µ¡.  µa‹¡· ¥¡¯a“e');
                Print(7,'Astral Mudœa“e ¸a·¥•A  ‹aŸ¡ ¯©b·¡ ·¶”a‰¡“e');
                Print(7,'¥©®ˆa ´ô­¡. ”a e •·Š‰ ¸aÁAˆa ´áa¶… £¡¡œa');
                Print(7,'“e ˆõ‰Á ¯¡´¡ˆa ¹³´a»¡“e ¦‰Íe—w·e ˆq®Ð´¡ e');
                Print(7,'Ði ˆõ·¡µ¡. ‹aŸ¡‰¡  a»¡ bµA 3 aŸ¡· Dragon‰Á');
                Print(7,'7 aŸ¡· Mud-Man·i ˆáÁa´¡ e ‹aˆa aÈaa‹¡ ˜');
                Print(7,'¢…µA ´¢ˆe Œa”a¡¶‰ ˆõ·¡µ¡.');
                PressAnyKey;
                x := 16; y := 15;
                soundon := aux;
                scroll(TRUE);
                Print(7,' µa‹¡“e ·¡ ”ŸB· ¶A»¥‰µ·¡µ¡. µa‹¡¬á“e ´á˜å');
                Print(7,' eq·¡ ‹¡”aŸ¡‰¡ ·¶·i ˆõ·¡µ¡.');
                PressAnyKey;
                party.etc[16] := party.etc[16] or bit1;
             end;
          end;
      6 : if on(62,82) then begin
             Clear;
             message(7,'·©Ð—·e ¬w¸a ­¢µA¬á ´¢ˆe· ‹q·i ¤i‰eÐ–”a.');
             party.gold := party.gold + 1000;
             map[62,82] := 44;
          end
          else if on(51,12) or on(52,12) then begin
             if party.etc[50] and bit2 > 0 then begin
                Clear;
                if party.etc[50] and bit3 > 0 then begin
                   Print(7,' ”a¯¡ •©´aµ¡”a“¡, '+player[1].name);
                   Print(7,' ·¡¤åµA“e ‹¡´á·¡ ‘A‘±—i·i ÐÃ¡¶‰¡´¡  i‰V”a');
                   talk('. a· Ã¥Š—i•¡ ·¡¤åµA ˆá—iˆõ·¡”a.');
                   enemynumber := 7;
                end
                else begin
                   Print(7,' ´a“¡! ”w¯¥·¡ ¶Ÿ¡—i·i ¤¯¥Ða‰¡ ºA®Ÿi Î‰´á');
                   Print(7,'º”a“¡... ‹aœý”a¡e ¶Ÿ¡—i·e ‰iÊ¡¬á ”w¯¥—i');
                   talk('‰Á ¯w¦Ði® ¤cµA ´ôŠ…¶a.');
                   party.etc[50] := party.etc[50] or bit3;
                   enemynumber := 2;
                end;
                for i := 1 to enemynumber do begin
                   joinenemy(i,26);
                   with enemy[i] do begin
                      name := 'Soldier'+chr(48+i);
                      special := 0;
                      castlevel := 0;
                      E_number := 1;
                   end;
                end;
                Displayenemies(TRUE);
                if player[6].name = 'Mad Joe' then begin
                   Clear;
                   Print(7,' ¶Ÿ¡—i –áµA ·¶”å  Mad Joeˆa ¸åÊˆa ·©´áa');
                   Print(7,'¸a a¸a •¡ w·i ˆa¤áv”a.');
                   player[6].name := '';
                   Display_Condition;
                   Pressanykey;
                end;
                BattleMode(FALSE);
                if party.etc[6] = 255 then exit;
                if party.etc[6] = 0 then begin
                   Clear;
                   Print(15,'”w¯¥—i·e ®ˆq­¡ ¥w¬a—i·i ¢‰Ÿ¡Áv”a.');
                   PressAnyKey;
                   party.etc[50] := party.etc[50] or bit3;
                   map[51,12] := 44; map[52,12] := 44;
                   map[50,11] := 44; map[53,11] := 44;
                   Silent_Scroll;
                end;
             end;
          end
          else if on(41,79) then begin
             if party.etc[50] and bit4 = 0 then begin
                party.etc[50] := party.etc[50] or bit4;
                for i := 1 to 3 do begin
                   delay(500);
                   dec(x);
                   Scroll(TRUE);
                end;
                map[41,79] := 44;
                Print(7,' ·©Ð—·e ˆa¸w ‹¡¥¥¸â·¥ ¢‹¡¡  ¡¡–  ¢¸w·i');
                talk('Ðaµv”a.');
                for i := 1 to 6 do
                with player[i] do
                if (name <> '') and (weapon = 0) and (class <> 5) then begin
                   weapon := 1;
                   wea_power := 5;
                end;
             end;
          end
          else if wantexit then begin
             if party.etc[31] and bit1 = 0 then begin
                Clear;
                Print(7,' ”w¯¥·¡ LORE ¬÷·i ˜áaa“e ®…ˆe ’Š…ˆaˆa ”w¯¥·i ¦‰œö”a.');
                PressAnyKey;
                aux := soundon;
                soundon := FALSE;
                for i := y - 4 to y - 1 do begin
                   map[x,pred(i)] := 44;
                   map[x,i] := 48;
                   scroll(TRUE);
                end;
                soundon := aux;
                Print(7,' a“e Skeleton·¡œa ¦‰Ÿ¡“e ¹·¹¢· ¬aœq·¡µ¡.');
                Print(7,' ¶Ÿ¡ ¹·¹¢· ¬aœq—i·e aŸi ¹A¶AÐa‰¡“e  ¡¡–');
                Print(7,'NecromancerµA‰A Š‰¥¢Ðaµa ‹a· ¦Ðaˆa –A´ö»¡');
                Print(7,' e a“e ‹aœý»¡ ´g­¡. a“e Necromancer · µw');
                Print(7,'Ð··i Ï¡Ð¬á ·¡‰µ LORE ¬÷·a¡ µÖ»¡ e a· Ñq');
                Print(7,'µ¡¯aœå ¬—‹±¬ ˜¢…µA ·¡‰µ ¬aœq—iµA‰A ¤Àâ–A');
                Print(7,'´á¬á »¡‹q·e ´á—¡¡•¡ ˆi ® ´ô“e ¹¥¸ˆa –A´ö');
                Print(7,'­¡. ·¡¹A aµA‰A q·e ˆõ·e Necromancer · Èa');
                Print(7,'•¡ ¤cµA ´ô­¡.  ‹aœ¬á  ”w¯¥—i· ·©Ð—µA ¡‰¡');
                Print(7,'¯¼­¡.');
                Print(7,''); Print(7,''); Print(7,''); Print(7,''); Print(7,'');
                m[0] := '';
                m[1] := '”w¯¥·i ÑÅµwÐaµ¡.';
                m[2] := '£¡´eÐa»¡ e ´e–A‰V­¡.';
                k := select(125,2,2,FALSE,TRUE);
                if k = 1 then begin
                   join(19,6);
                   Display_Condition;
                end
                else asyouwish;
                PressAnyKey;
                party.etc[31] := party.etc[31] or bit1;
             end;
             with party do begin
                xaxis := 20; yaxis := 12; map := 1;
             end;
             load;
          end
          else begin
             dec(y); scroll(TRUE);
          end;
      7 : begin
             Clear;
             if x = 50 then
             if wantenter('GROUND GATE') then begin
                with party do begin
                   xaxis := 50; yaxis := 10; map := 8;
                end;
                load;
                scroll(TRUE);
             end;
             if (x = 30) or (x = 32) then begin
                map[31,y] := 45;
                putimage(100+(31-x)*20,100,Font^[45],CopyPut);
             end;
             if y = 71 then begin
                if wantexit then begin
                   with party do begin
                      xaxis := 77; yaxis := 57; map := 1;
                   end;
                   load;
                end
                else begin
                   dec(y); scroll(TRUE);
                end;
             end;
          end;
      8 : begin
             Clear;
             if x = 50 then
             if wantenter('GROUND GATE') then begin
                with party do begin
                   xaxis := 50; yaxis := 10; map := 7;
                end;
                load;
                scroll(TRUE);
             end;
             if y = 71 then begin
                if wantexit then begin
                   with party do begin
                      xaxis := 19; yaxis := 27; map := 2;
                   end;
                   load;
                end
                else begin
                   dec(y); scroll(TRUE);
                end;
             end;
          end;
      9 : begin
             Clear;
             if (on(10,24)) and (party.etc[35] and bit1 = 0) then begin
                findgold(5000);
                party.etc[35] := party.etc[35] or bit1;
             end;
             if (on(12,26)) and (party.etc[35] and bit2 = 0) then begin
                findgold(5000);
                party.etc[35] := party.etc[35] or bit2;
             end;
             if (on(15,25)) and (party.etc[35] and bit3 = 0) then begin
                findgold(5000);
                party.etc[35] := party.etc[35] or bit3;
             end;
             if (on(16,23)) and (party.etc[35] and bit4 = 0) then begin
                findgold(5000);
                party.etc[35] := party.etc[35] or bit4;
             end;
             if (on(18,27)) and (party.etc[35] and bit5 = 0) then begin
                findgold(5000);
                party.etc[35] := party.etc[35] or bit5;
             end;
             if (y=10) and (party.etc[15]<5) then begin
                Message(13,'´i®´ô“e Ó±·¡ ”w¯¥·i ¤ÀâÐs“¡”a.');
                inc(y);
                scroll(TRUE);
             end;
             if y = 5 then
             if wantenter('SWAMP GATE') then begin
                face := 1;
                for i := 4 downto 0 do begin
                   delay(1000);
                   putimage(100,20*(i+1),font^[44],copyput);
                   if i > 0 then begin
                      PutImage(100,20*i,chara^[face+28],andPut);
                      PutImage(100,20*i,chara^[face],orPut);
                   end;
                end;
                if party.etc[35] and bit6 = 0 then begin
                   Print(15,' SWAMP GATE ¡ —i´áˆa‰¡ ·¶“e ”w¯¥µA‰A  Ðá‰·');
                   Print(15,'µA¬á ˆs¸aˆa ’Š…ˆaˆa  i·i Œá…”a');
                   PressAnyKey;
                   cPrint(7,11,' a“e LORE ¬÷· ¬÷º ','Lord Ahn',' ·¡µ¡.');
                   Print(7,' µb¯¡ ˆa µ¬wÐe ”¡ ”w¯¥—i·e Ò‰ŸWÐe ¶w¬a');
                   Print(7,'¡ ¬÷¸wÐ aˆa‰¡ ·¶­¡. µaÈŒa»¡“e ¡¡Ðñ·¡ ®…');
                   Print(7,'¹¡³‰A »¥Ð— –A´ö»¡ e ·¡¹A¦Èá“e µÅ¸åÐe ¸â—i');
                   Print(7,'· ­¡Š‰·¡µ¡. ‹aœ¬á a•¡ »¢¸ó¸â·¥ •¡¶‘·e ¡µ');
                   Print(7,'º”áœa•¡ µaœáˆa»¡ ¹¡´å·i Ðº‰V­¡.');
                   PressAnyKey;
                   Print(7,' ”w¯¥—i·e ¯¢œ··i  g·¡ ˆa»¡‰¡ ·¶­¡?  ·¡ ¯¢œ·');
                   Print(7,'·e ”w¯¥—i·i ÒA¥¢¯¡Ç¡‹¡  ¶áÐ  Ï©¶aÐe ˆõ·¡“¡');
                   Print(7,'¸é” ¤a”ba‰A Ð¬á“e ´e–Aµ¡. µá¡Ða¡e ·¡ ·¡');
                   Print(7,'ÒµA ¸åˆ–A“e ¡¡ÐñµA¬á“e ¯¢œ··i Ìa“e‰µ·¡ ˆá');
                   Print(7,'· ´ô”a‰¡ ¬—ˆbÐ•¡ –I eÇq ¯¢œ··¡ Šáº—Ða£a¡');
                   Print(7,'wÌŸi ¥¡“e·©·¡ ´ô•¡¢ Ða¯¡µ¡.');
                   PressAnyKey;
                   Print(7,' SWAMP· ”ŸBµA¬á· Ði·©·i ¶a´¢Ða¡e ·¡œý­¡.');
                   Print(7,' ¯aµÑÏa ‰A·¡ËaµÁ É·Ða“e SWAMP KEEPµA“e  g·e');
                   Print(7,'ˆwÐe ŠA¢‰—i·¡ ¤áË¡‰¡ ·¶­¡. Ða»¡ e ·¡¸åµA ‹a');
                   Print(7,'”ŸBµA ·¶“e 2 ˆ· •·Š‰ ¶a¬Ÿi ¸ñwÐe–áµA´¡');
                   Print(7,'SWAMP KEEP· º—´wµA ·¶“e œa¤a ‰A·¡ËaŸi ¸b•·');
                   Print(7,'¯¡Ç©® ·¶·i ˆõ·¡µ¡. ‹a‰µ· ŠA¢‰—i·e  ¶ Ó±');
                   Print(7,'—e ¬w”·© ˆõ·¡µ¡. Ða»¡ e  ”w¯¥—i· “wb·¡œa');
                   Print(7,'¡e Â—¦…Ó¡ ˆa“wÐi ˆõ·¡µ¡. a“e ”w¯¥—i·¡ œa¤a');
                   Print(7,'‰A·¡ËaŸi É·‰ÁÐaa Ði˜ ”a¯¡ ¹¡´å·i Ðº‰V­¡.');
                   Print(7,' ‹a˜Œa»¡ ˆåÊŸi §¡“e ¤a·¡µ¡.');
                   talk('');
                   party.etc[35] := party.etc[35] or bit6;
                end;
                with party do begin
                   xaxis := 81; yaxis := 95; map := 13;
                end;
                load;
                scroll(TRUE);
             end
             else begin
                inc(y); scroll(TRUE);
             end;
             if y = 46 then begin
                if wantexit then begin
                   with party do begin
                      xaxis := 32; yaxis := 82; map := 2;
                   end;
                   load;
                end
                else begin
                   dec(y); scroll(TRUE);
                end;
             end;
          end;
      10 : begin
              if y = 46 then begin
                 y := 50;
                 scroll(TRUE);
              end;
              if y = 49 then begin
                 y := 45;
                 scroll(TRUE);
              end;
              if y = 71 then begin
                 if wantexit then begin
                    with party do begin
                       xaxis := 74; yaxis := 20; map := 3;
                    end;
                    load;
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end;
           end;
      11 : begin
              if (on(20,30)) and (party.etc[33] and bit1 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit1;
              end;
              if (on(18,36)) and (party.etc[33] and bit2 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit2;
              end;
              if (on(35,32)) and (party.etc[33] and bit3 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit3;
              end;
              if (on(33,36)) and (party.etc[33] and bit4 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit4;
              end;
              if (on(35,14)) and (party.etc[33] and bit5 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit5;
              end;
              if (on(14,16)) and (party.etc[33] and bit6 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit6;
              end;
              if (on(37,12)) and (party.etc[33] and bit7 = 0) then begin
                 findgold(5000);
                 party.etc[33] := party.etc[33] or bit7;
              end;
              if (y = 44) and (party.etc[33] and bit8 = 0) then begin
                 Clear;
                 Print(7,'”w¯¥·e ´á˜å Àw·i ¤i‰eÐ–”a.');
                 PressAnyKey;
                 Print(7,'‹a Àw· ­¥¸s·¡µA ³a·¥ ¢…ŠŸi ˜aŸa¡e..');
                 Print(7,'');
                 Print(11,'        ·¡ˆõ·e µ¡·¡—¡Î¯a· Àw');
                 Print(11,'   ·¡ˆõ·a¡ ¸åµA Sphinx Ÿi ¢¿¡Ÿa”a');
                 PressAnyKey;
                 Print(11,'’ˆa µ¡·¡—¡Î¯a· Àw·i ”až‰V¯s“¡Œa ?');
                 k := choosewhom(FALSE);
                 if k = 0 then begin
                    asyouwish;
                    exit;
                 end;
                 if player[k].class = 5 then begin
                    message(7,'¸åÊ¯w·e ·¡ ¢‹¡ˆa Ï©¶a´ô¯s“¡”a.');
                    exit;
                 end;
                 with player[k] do begin
                    weapon := 3;
                    wea_power := 12;
                    if class = 1 then wea_power := wea_power + round(wea_power * 0.5);
                    message(15,name+' ˆa µ¡·¡—¡Î¯a· Àw·i ¸wÀbÐ–”a.');
                 end;
                 party.etc[33] := party.etc[33] or bit8;
              end;
              if y = 46 then
              if wantexit then begin
                 with party do begin
                    xaxis := 38; yaxis := 7; map := 7;
                 end;
                 load; scroll(TRUE);
                 for i := 1 to 6 do if player[i].name = 'Polaris' then map[37,41] := 44;
              end;
              if (y=24) and (party.etc[13]=1) then begin
                 Clear;
                 Print(11,'”w¯¥·e £¡·¡œa· ¤w·i ¤i‰eÐ–”a.');
                 PressAnyKey;
                 enemynumber := 3;
                 for i := 1 to 2 do begin
                    joinenemy(i,35);
                    with enemy[i] do begin
                       name := 'Sphinx';
                       level := 4;
                       special := 0;
                       E_number := 20;
                    end;
                 end;
                 joinenemy(3,26);
                 with enemy[3] do begin
                    name := 'Major Mummy';
                    ac := 1;
                 end;
                 Displayenemies(TRUE);
                 BattleMode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if (party.etc[6]=0) or (enemy[3].hp<=0) then begin
                    Clear;
                    Print(15,'”w¯¥—i·e Major Mummy ¢‰Ÿ¡Áv”a.');
                    Print(11,'‹aŸ¡‰¡ ”w¯¥·e ·¡ ·±¢µA ¬÷‰·Ð–”a.');
                    PressAnyKey;
                    inc(party.etc[13]);
                 end;    
              end;
           end;
      12 : begin
              Clear;
              if y = 71 then begin
                 if wantexit then begin
                    with party do begin
                       xaxis := 39; yaxis := 7; map := 8;
                    end;
                    load; scroll(TRUE);
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end
              else if (y=50) and (y1<>1) then begin
                 if x = 33 then begin
                    Message(7,'µa‹¡“e µ°·e ¢…·¡´ö”a.');
                    map[33,49] := 0;
                    scroll(TRUE);
                 end
                 else begin
                    Message(7,'”w¯¥·e ¤a¥¡Š…¶a, ”a¯¡ ¬—ˆbÐa¯³¯¡µ¡.');
                    x := 25; y := 70;
                    scroll(TRUE);
                 end;
              end
              else if (y=10) and (party.etc[14]<2) then begin
                 if x = 18 then begin
                    map[18,9] := 0;
                    scroll(TRUE);
                    party.etc[14] := 2;
                    Print(14,'”w¯¥·e Ñ×‹q· ¥··¥·i Àx´v”a !!');
                    Print(15,'‹aœá£a¡ ”w¯¥· ·±¢“e ¬÷‰·Ð–”a.');
                    Print(15,'·¡¹A“e GAIA TERRA¡ •©´aˆaœa.');
                    PressAnyKey;
                 end
                 else begin
                    for i := 10 to 23 do map[x,i] := 49;
                    scroll(TRUE);
                 end;
              end
              else if on(12,48) and (party.etc[31] and bit2 = 0) then begin
                 Print(7,' ·©Ð——i·e ¯±Ðe ¦¬w ˜¢…µA ˆá· ¡±·i ˆa’»¡');
                 Print(7,'¡µÐa“e Ðe q¸aµÁ  aºÁv”a.');
                 PressAnyKey;
                 hany := 20;
                 cPrint(7,11,' a“e VALIANT PEOPLES · ¶w¬aµv”å  ','Rigel',' ·¡');
                 Print(7,'µ¡. ˆa •·Š‰­¢µA¬á ¸â—i·i  b´a“e •·´e »¡');
                 Print(7,'ˆb¥e•··a¡ ·¥Ð  ·¡œå ¸é¥b·¡ Š…•A Š…•A ¬—‰v');
                 Print(7,'­¡.  a“e ·¡¹A á¢ »¡Ã¡‰¡  g·e ¬wÀáŸi ·³´á');
                 Print(7,'¬á Ñ¥¸a Ó±·a¡“e ·¡‰µ·i ¨a¹a aˆi®ˆa ´ô­¡.');
                 Print(7,' aŸi •¡µÁ º¯¡µ¡.');
                 m[0] := '';
                 m[1] := '¹½­¡, ˆ{·¡ ¡¡Ðñ·i Ðs¯¡”a';
                 m[2] := '¯¢œ·‰Á Ã¡ža“e Ð‰iÐ º‰V­¡';
                 m[3] := '”w¯¥·i •¡µÁº‰ ¯¡ˆe·¡ ´ô­¡';
                 k := select(140,3,3,FALSE,TRUE);
                 case k of
                    0 : begin
                           dec(y); scroll(TRUE);
                        end;
                    1 : begin
                           k := ReturnJoinMember;
                           if k = 1 then begin
                              dec(y); scroll(TRUE); exit;
                           end;
                           join(14,k);
                           with player[k] do begin
                              name := 'Rigel';
                              class := 7;
                              weapon := 4;
                              shield := 1;
                              armor := 1;
                              wea_power := 10;
                              shi_power := 1;
                              arm_power := 2;
                              ac := 3;
                              hp := 1;
                           end;
                           Display_Condition;
                           party.etc[31] := party.etc[31] or bit2;
                        end;
                    2 : begin
                           clear;
                           print(7,' ·©Ð—·e ‹aµA‰A Ã¡ža  a¤ó·i ¬a¶wÐaµa  ¬wÀáŸi');
                           print(7,'¡¡– Ã¡žaÐeÒ  ‹aˆa ·¡‰µ·i ¨a¹a aˆi® ·¶·i');
                           print(7,'¸÷•¡· ¯¢œ··i a’´á º´ö”a. ‹aœá¸a Rigel·¡');
                           print(7,'œe ‹a ¶w¬a“e ¶Ÿ¡· ¢‹¡µA ¯¥· Â‚¥¢·i a');
                           print(7,'º‰¡“e ¸a¯¥· ‹©·i ˜áv”a.');
                           if party.food > 4 then party.food := party.food - 5
                           else party.food := 0;
                           player[1].sp := 0;
                           for i := 1 to 6 do
                           with player[i] do
                           if name <> '' then
                           if (random(20)<luck) and (random(20)<luck) then
                              wea_power := round(wea_power * 1.2);
                           Display_Condition;
                           party.etc[31] := party.etc[31] or bit2;
                           PressAnyKey;
                        end;
                    3 : party.etc[31] := party.etc[31] or bit2;
                 end;
              end
              else if (party.etc[4] = 0) and not on(12,48) then begin
                 x := x - x1; y := y - y1;
                 message(7,'·©Ð——i·e ¸é¥b·a¡ ˜é´á»©¨å Ð–”a.');
                 scroll(TRUE);
              end;
           end;
      13 : begin
              Clear;
              if y = 96 then
              if wantexit then begin
                 with party do begin
                    xaxis := 26; yaxis := 6; map := 9;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if (x in [76..86]) and (y in [71..81]) then begin
                 message(15,'´i®´ô“e Ó±·¡ ”w¯¥·i ”w‹¡“eˆé “av”a');
                 for j := 71 to 81 do
                 for i := 76 to 86 do begin
                    if map[i,j] = 52 then map[i,j] := 44;
                    if map[i,j] in [40,51] then map[i,j] := 42;
                 end;
                 allright := FALSE;
                 repeat
                    x1 := sgn(81-x);
                    if x1 = 0 then allright := TRUE
                    else begin
                       delay(1500);
                       if x1 = 1 then face := 6 else face := 7;
                       x := x + x1;
                       scroll(TRUE);
                    end;
                 until allright;
                 allright := FALSE;
                 repeat
                    y1 := sgn(77-y);
                    if y1 = 0 then allright := TRUE
                    else begin
                       delay(1500);
                       if y1 = 1 then face := 4 else face := 5;
                       y := y + y1;
                       scroll(TRUE);
                    end;
                 until allright;
                 for j := 71 to 81 do
                 for i := 76 to 86 do begin
                    if map[i,j] = 42 then map[i,j] := 51;
                 end;
                 face := 5;
                 aux := soundon;
                 soundon := FALSE;
                 scroll(TRUE);
                 PressAnyKey;
                 Print(11,' µa‹¡µA“e ‹¡¢aÐe Ï¡œa£µ·¡ ·¶´ö”a');
                 delay(2000);
                 map[81,76] := 48;
                 scroll(TRUE);
                 Print(11,' ˆs¸a‹¡ Ï¡œa£µ·¡ ´aœ¡ ˆaœa´f‹¡ ¯¡¸bÐ–”a');
                 PressAnyKey;
                 soundon := aux;
                 Print(15,' ‹a ¢‰­¢µA¬á ”w¯¥·e Ðe ¯¡”· ¶…¡w·i ¤aœa”a');
                 Print(15,'¥¡‰¡·¶´ö”a');
                 Print(15,' ”w¯¥·e µá ÐaÏ©·¡¡e ”w¯¥·¡ ·¡ ­A‰µA šá´á—i');
                 Print(15,'´á ”e¯¥·a¡ ´b‰Á °a¶¡´¡Ða“e ·¡·AŸi ´a“eˆa ?');
                 Print(15,' µa‹¡¬á ”w¯¥·e Lord Ahn, Ancient Evil, Nec-');
                 Print(15,'romancer · ‰Å‰Ÿi ‹¡®‰Ðe µ´å¬áŸi ¤i‰eÐaµa');
                 Print(15,'·ª‹¡ ¯¡¸bÐ–”a.');
                 PressAnyKey;
                 Print(15,'CHAPTER 1');
                 Print(7,'');
                 Print(7,' ·¡ ­A¬wµA“e –ˆ· ˆ‘q·¡ Ï©¶aÐa”a.');
                 Print(7,' ‹aˆõ·e ¤a¡ ¬å‰Á ´b·¡”a.');
                 Print(7,' ¸å¸a· ¬w»··e Lord Ahn ·¡‰¡, Ò¸a· ¬w»··e');
                 talk('Ancient Evil ·¡”a.');
                 Print(15,'CHAPTER 2');
                 Print(7,'');
                 Print(7,'  e´¢ ”w¯¥·¡ Ñ×´¡µA¬á Ancient Evil·i  ea”á');
                 Print(7,'œa•¡ –a¶¡Ða»¡  iœa. ‹a“e §¡¢ ´b· Îa¬w·¡');
                 Print(7,'»¡ e Necromancer ˆa Ð—Ða“e ´b‰Á“e ”aŸe ÎaÑe');
                 Print(7,'·±·i ¡w¯±Ðaœa.  e´¢ ­A¬w·¡ "¬å" e·¡ ·¶‰¡ ·¡');
                 Print(7,'œå "´b"·e ¹¥¸Ða»¡ ´g“e”a¡e  ’Š•¡ ¬å· º—');
                 Print(7,'¶a¬÷·i ·¥¯¢Ða»¡ ¡µÐeÀ ¥¡Íe¸â·¥ »¥Ÿ¡¡ e ·¥');
                 Print(7,'¯¢–A´áˆa“e ¯¡”ˆa µ©ˆõ·¡¡a ¬å·a¡ –‰œá °}µa');
                 Print(7,'»¥ ¬—ÑÉµA ”Ðe ‰¡ a¶‘·i  wˆbÐa“e ¯¡”ˆa  ¶');
                 Print(7,'Ÿ¡ ´|µA •¡œÐa“e ˜ˆa ‰iŠ‚ µ©ˆõ·¡”a. ‹aœå˜');
                 Print(7,'ˆa µ¡‹¡¸åµA ¬aœq—i·¡  ·¡œå ¬å· ­¡º—Ðq·i “a');
                 Print(7,'¡‰¡ ¯a¯a¡ »¡Ç¡a‰¡ ‘¡bÐa‰A   e—i  Ðaa·');
                 Print(7,'ˆ‘q·¡ Ï©¶aÐa‰A –A´ö“e•A ·¡ˆõ·¡ ¤a¡ ÈÁ¡µA');
                 Print(7,'¬—‰ae ´b· ˆ‘q·¡´ö”a. Ða»¡ e ·©¦œá ¢• ¬a');
                 Print(7,'œq—iµA‰A §¡e·i ¬a¡e¬á Œa»¡ ´b·i ”ÎaÐº‰ e');
                 Print(7,'Ðe ¸a“e aÈaa»¡ ´g´v”a. ·¡µA ¯a¯a¡Ÿi ´b·');
                 Print(7,'»³”¬÷·a¡ ¦‰œáº‹¡Ÿi ¶aŠÐa“e Ðe Ñe¸aˆa ·¶');
                 Print(7,'´ö·a“¡ ¥¥¡w·e ´i® ´ô»¡ e ‹aˆa ¤a¡ Ancient');
                 Print(7,'Evil·¡œa‰¡ Ã·Ða“e ¸aµv”a.  ¬åµA ·Ð ¥¡Ñ¡–A');
                 Print(7,'´á á¢a•¡ ÍwÑÁ¡¶… ¬—ÑÉ·i ÐµÖ”å ¬aœq—i·e');
                 Print(7,'·¡¹A ¬¡¶…  a·q·i ˆx‰¡ ‹aµA‰A ”ÐwÐa“e  ¸a');
                 Print(7,'­AŸi ÂáÐa‰A –A´ö”a. Ða»¡ e ‹a“e ¯©»¡¡ ¬aœq');
                 Print(7,'—iµA‰A ÐŸi ·³Ó¡»¡ ´g´v·a¡a  ‹a· ¥¥¯±·e ¬å');
                 Print(7,'µA ·¶”a“eˆé ´i´a–‹¡ ¤aœe”a.');
                 talk('');
                 Print(15,'CHAPTER 3');
                 Print(7,'');
                 Print(7,' ¶áµA¬á ‹¡®‰Ðe Ancient Evil·¡ ·£¡Ða“e ´b‰Á');
                 Print(7,'“e ”iŸ¡ Neromancer “e »¥¸÷Ðe ´b· ·£¡Ÿi ´i');
                 Print(7,'»¡ ¡µÐe”a. ‹aˆõ·a¡ ·¥Ð Ancient Evil ·e ‹a');
                 Print(7,'Ÿi ¤éÐaa Ða“e ˆõ·¡”a. Ða»¡ e ·BÁAˆa ´ô´á»¥');
                 Print(7,'Ancient Evil· “wb·a¡“e ‹aµA‰A ”ÐwÐa‹¡ˆa');
                 Print(7,'´ás”a‰¡ ”e¸÷Ða‰¡“e ‹a· ˆwbÐe  ab·a¡ £¡');
                 Print(7,'œ· µb¬aŸi –áËi´á ¶…¡w¸â·a¡ NecromancerµA');
                 Print(7,'”ÐwÐaµa´¡ Ða“e Ðe Ó¬—¢‰·i Àw¹¡Ð –·a“¡..');
                 Print(7,'..‹a“e ¤a¡ ”w¯¥·¥ˆõ·¡”a.');
                 talk('');
                 Print(15,'CHAPTER 4');
                 Print(7,'');
                 Print(7,' Necromancer µA‰A ”Ðw Ði ® ·¶“e ”e –¡w·');
                 Print(7,'¹¥¸“e ¤a¡ Lord Ahn‰Á ‹a· ”Ÿ³¸a·¡¡a ‹¼·e');
                 Print(7,'‰Å‰Ÿi ˆa»¥ Ancient Evil·¡”a.');
                 Print(7,' ‹a—i·e ¡¡– Semi-Godœa“e ‰‹s· ·¥¢‰—i·¡¡a');
                 Print(7,'¥¡É·· ¬aœq—i·e  ¬w”Ða‹¡¹¡Àa ´áa¶… ·¥¢‰—i');
                 Print(7,'·¡¡a “wb™¡Ðe ·¥ˆe·i Á¡¶©Ða“e ˆõª…·¡”a.  ‹a');
                 Print(7,'œá£a¡  e´¢ ”w¯¥·¡ NecromancerŸi ·w»·Ðaa‰¡');
                 Print(7,'Ðe”a¡e  å¸á ”w¯¥ ¸a¯¥·¡ Semi-Godˆa –A´á´¡ e');
                 Print(7,'–Iˆõ·¡”a.');
                 talk('');
              end;
              if (y = 68) and (party.etc[38] and bit5 = 0) then begin
                 enemynumber := 3;
                 for i := 1 to 3 do begin
                    joinenemy(i,i+49);
                    enemy[i].E_number := 1;
                 end;
                 DisplayEnemies(TRUE);
                 Print(13,'¶Ÿ¡—i· µwµb·i Ã±¤ñÐa“e ¸a“e ˆa e–»¡ ´g‰V”a !!!');
                 PressAnyKey;
                 BattleMode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if party.etc[6] = 0 then begin
                    Clear;
                    Print(15,'”w¯¥—i·e Gorgon·i ¢‰Ÿ¡Áv”a.');
                    party.etc[38] := party.etc[38] or bit5;
                    PressAnyKey;
                    scroll(TRUE);
                 end
                 else if not enemy[3].dead then begin
                    inc(y); scroll(TRUE);
                 end;
              end;
           end;
      14 : begin
              Clear;
              if y = 46 then
              if wantexit then begin
                 with party do begin
                    xaxis := 18; yaxis := 89; map := 1;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if (on(25,8) or on(26,8)) and (party.etc[10]=3) then begin
                 Clear;
                 Print(7,'µa‹¡ˆa `MENACE''· º—¯±·¡”a.');
                 Print(15,'”w¯¥· ÈqÐñ·e ¬÷‰·¸â·¡´ö”a.');
                 Print(15,'·¡¹A Lord Ahn µA‰A •©´aˆa“e ·© e q´v”a.');
                 PressAnyKey;
                 inc(party.etc[10]);
              end;
              if (on(6,6)) and (party.etc[32] and bit1 = 0) then begin
                 findgold(1000);
                 party.etc[32] := party.etc[32] or bit1;
              end;
              if (on(18,10)) and (party.etc[32] and bit2 = 0) then begin
                 findgold(2500);
                 party.etc[32] := party.etc[32] or bit2;
              end;
              if (on(6,44)) and (party.etc[32] and bit3 = 0) then begin
                 findgold(400);
                 party.etc[32] := party.etc[32] or bit3;
              end;
              if (on(31,30)) and (party.etc[32] and bit4 = 0) then begin
                 findgold(600);
                 party.etc[32] := party.etc[32] or bit4;
              end;
              if (on(31,8)) and (party.etc[32] and bit5 = 0) then begin
                 findgold(1500);
                 party.etc[32] := party.etc[32] or bit5;
              end;
              if (on(14,28)) and (party.etc[32] and bit6 = 0) then begin
                 findgold(1000);
                 party.etc[32] := party.etc[32] or bit6;
              end;
              if (on(16,20)) and (party.etc[32] and bit7 = 0) then begin
                 Print(15,'”w¯¥·e Ñ×‹q· ¤wÌŸi ¤i‰eÐ–”a.');
                 PressAnyKey;
                 Print(11,'’ˆa ·¡ Ñ×‹q· ¤wÌŸi ¸wÀb Ða‰V¯s“¡Œa ?');
                 k := choosewhom(FALSE);
                 if k = 0 then begin
                    asyouwish;
                    exit;
                 end;
                 with player[k] do begin
                    shield := 5;
                    shi_power := 5;
                    ac := shi_power + arm_power;
                    if class = 1 then inc(ac);
                    if ac > 10 then ac := 10;
                    message(15,name+'ˆa Ñ×‹q· ¤wÌŸi ¸wÀbÐ–”a.');
                 end;
                 Display_Condition;
                 party.etc[32] := party.etc[32] or bit7;
              end;
           end;
      15 : begin
              Clear;
              if y = 71 then
              if wantexit then begin
                 with party do begin
                    xaxis := 82; yaxis := 48; map := 2;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if (y=48) and ((x in [10,11]) or (x in [40,41])) then
              if (party.etc[36] and bit2 = 0) then begin
                 if party.etc[36] and bit1 = 0 then begin
                    party.etc[36] := party.etc[36] or bit1;
                    findgold(6000);
                 end
                 else begin
                    party.etc[36] := party.etc[36] or bit2;
                    findgold(4000);
                 end;
                 map[x,48] := 44;
                 map[x,47] := 44;
                 Silent_Scroll;
              end;
              if (on(14,7)) and (party.etc[36] and bit3 = 0) then begin
                 Print(15,'”w¯¥·e Ñ×‹q· ¤wÌŸi ¤i‰eÐ–”a.');
                 PressAnyKey;
                 Print(11,'’ˆa ·¡ Ñ×‹q· ¤wÌŸi ¸wÀb Ða‰V¯s“¡Œa ?');
                 k := choosewhom(FALSE);
                 if k = 0 then begin
                    asyouwish;
                    exit;
                 end;
                 with player[k] do begin
                    shield := 5;
                    shi_power := 5;
                    ac := shi_power + arm_power;
                    if class = 1 then inc(ac);
                    if ac > 10 then ac := 10;
                    message(15,name+'ˆa Ñ×‹q· ¤wÌŸi ¸wÀbÐ–”a.');
                 end;
                 Display_Condition;
                 party.etc[36] := party.etc[36] or bit3;
              end;
              if (on(45,19)) and (party.etc[36] and bit4 = 0) then begin
                 Print(15,'”w¯¥·e Ñ×‹q· ˆsµµ·i ¤i‰eÐ–”a.');
                 PressAnyKey;
                 Print(11,'’ˆa ·¡ Ñ×‹q· ˆsµµ·i ¸wÀb Ða‰V¯s“¡Œa ?');
                 k := choosewhom(FALSE);
                 if k = 0 then begin
                    asyouwish;
                    exit;
                 end;
                 with player[k] do begin
                    armor := 5;
                    arm_power := 6;
                    ac := shi_power + arm_power;
                    if class = 1 then inc(ac);
                    if ac > 10 then ac := 10;
                    message(15,name+'ˆa Ñ×‹q· ˆsµµ·i ¸wÀbÐ–”a.');
                 end;
                 Display_Condition;
                 party.etc[36] := party.etc[36] or bit4;
              end;
              if (y=27) and (party.etc[14]=4) then begin
                 Print(11,'”w¯¥·e ArchiGagoyle‰Á – aŸ¡· ZombieŸi ¤i‰eÐ–”a.');
                 PressAnyKey;
                 enemynumber := 3;
                 for i := 1 to 2 do begin
                    joinenemy(i,36);
                    enemy[i].name := 'Zombie';
                 end;
                 joinenemy(3,42);
                 enemy[3].name := 'ArchiGagoyle';
                 Displayenemies(TRUE);
                 BattleMode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if (party.etc[6]=0) or (enemy[3].hp<=0) then begin
                    Clear;
                    Print(15,'”w¯¥·e ArchiGagoyle·i ¢‰Ÿ¡Áv”a.');
                    PressAnyKey;
                    inc(party.etc[14]);
                 end;    
              end;
           end;
      16 : begin
              Clear;
              if y = 36 then
              if wantexit then begin
                 with party do begin
                    xaxis := 44; yaxis := 8; map := 2;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if y = 10 then
              if party.etc[37] < 3 then begin
                 s := '';
                 case party.etc[37] of
                    2 : s := 'Ðe';
                    1 : s := '–';
                    0 : s := '­A';
                 end;
                 Print(11,'”w¯¥·e '+s+' aŸ¡· Wivern‰Á  aºÁv”a.');
                 PressAnyKey;
                 enemynumber := 3 - party.etc[37];
                 for i := 1 to enemynumber do joinenemy(i,43);
                 Displayenemies(TRUE);
                 BattleMode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if party.etc[6] = 0 then party.etc[37] := 3
                 else begin
                    j := 0;
                    for i := 1 to enemynumber do if not enemy[i].dead then inc(j);
                    party.etc[37] := 3 - j;
                 end;
                 Clear;
              end
              else message(15,'µa‹¡µA“e Wivern· ¯¡ÁA e·¡ ·¶”a.');
           end;
   end;
end;

Procedure specialevent_part2;
begin
   scroll(TRUE);
   case party.map of
      17 : begin
              Clear;
              if y = 95 then
              if wantexit then begin
                 with party do begin
                    xaxis := 23; yaxis := 63; map := 3;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if y = 80 then y := 6;
              if y = 44 then for i := 67 to 69 do begin
                 map[i,44] := 44; map[i,38] := 52;
              end;
              if on(75,52) and (party.etc[38] and bit2 = 1) then exit;
              if on(75,52) and (party.etc[38] and bit1 = 1)
              and (party.etc[5]>0) then begin
                 Print(7,' ”a¯¡ ¬—ˆbÐ¥¡“¡ a•¡ »¢¸ó NecromancerµA •¡');
                 Print(7,'¸åÐa‰¡Ïe  a·q·¡ ¬—‰v­¡.  §¡¢ ·BÁA¸â·¥ Ó±·e');
                 Print(7,'¸åÑa´ô“e µw·¡»¡ e ”w¯¥—i‰Á ˆ{·¡ ¡¡Ðñ·i Ða‰¡');
                 Print(7,'¯¼­¡. ”w¯¥—i· ¬—ˆb·e ´á˜ý­¡.');
                 m[0] := '';
                 m[1] := '”w¯¥· ¹A··i ¤h´a —i·¡‰V­¡';
                 m[2] := '”w¯¥·¡ ¸åÐº…  a¤ó e·a¡•¡ ¹¢Ðaµ¡';
                 k := select(140,2,2,FALSE,TRUE);
                 if k = 0 then exit;
                 if k = 2 then begin
                    asyouwish; exit;
                 end;
                 if k = 1 then begin
                    k := ReturnJoinMember;
                    if k = 1 then begin
                       asyouwish; exit;
                    end;
                    join(55,k);
                    with player[k] do begin
                       name := 'Red Antares';
                       class := 9;
                       weapon := 0;
                       shield := 0;
                       armor := 0;
                       wea_power := 0;
                       shi_power := 0;
                       arm_power := 0;
                       ac := 0;
                       hp := 0;
                       resistance := 15;
                       endurance := 10;
                    end;
                    Display_Condition;
                 end;
                 party.etc[38] := party.etc[38] or bit2;
                 exit;
              end;
              if on(75,52) and (party.etc[38] and bit1 = 1)
              and (party.etc[38] and bit2 = 0) then
                 talk('a“e ”a¯¡ µwÑ¥· ­A‰¡ •©´aˆa´¡ ‰V­¡.');
              if on(75,52) and (party.etc[38] and bit1 = 0) then begin
                 for j := 47 to 57 do
                 for i := 71 to 82 do
                 if map[i,j] = 40 then map[i,j] := 50;
                 Silent_Scroll;
                 talk('ˆs¸a‹¡ º¶áˆa ¶w´q·a¡ ¥eÐa¡e¬á Ðe µwÑ¥·¡ ”w¯¥´|µA aÈav”a.');
                 cPrint(7,11,' a“e ‰¡”· ˆwbÐe  a¤ó¬a µv”å ','Red Antares','');
                 cPrint(7,11,'','· µw','·¡µ¡.');
                 Print(7,' Ðe˜,  a“e ·¡ ­A‰· ¡¡—e »¡µb·i É·‰ÉÐa“e');
                 Print(7,' a¤ó·i ˆa»¡‰¡ ·¡ ­A‰Ÿi É·Ã¡Ð–»¡ e  ˆa º‚');
                 Print(7,'‰¡e –á¡“e µaœá »¡µb·a¡  a·  a¤ó·¡ ¦…¬e');
                 Print(7,'–A´á ¹A”¡ Ó±·i ¤iÒáÐa»¡ ¡µÐa“eˆõ ˆ{­¡. ”w');
                 Print(7,'¯¥—i·¡ NecromancerµA ”ÐwÐaa Ðe”a“eˆé ´i‰¡');
                 Print(7,'·¶­¡. a“e ‹aˆa ·¡ •·Š‰·i ¶a¬ÑÁ  ¯¡Ç©˜ ·¡');
                 Print(7,'£¡ ‹a·  a¤ó “wb·i »¡Åa ¥¡´v‹¡ ˜¢…µA ‹a·');
                 Print(7,'“wb·i ´i® ·¶´ö­¡. ‹aœáa ‹a· “wbµA §¡Ša');
                 Print(7,'Ð¥©˜ ”w¯¥—i·  a¤ó “wb·e ¬w”wÓ¡ ¸á¹¡Ðaµ¡');
                 Print(7,'. ‹aœ¬á ”w¯¥—i·i ¶áÐ a·  a¤óº— "ˆe¸ó ‰·');
                 Print(7,'‰b"·¡œe ‹¡¤ó·i ¸åÐ º‰V­¡.');
                 Print(7,'  e´¢ ”w¯¥—i·  a¤ó “wb·¡ •¡”iÐe”a¡e  ”a·q');
                 Print(7,'·  a¤ó·i ¬a¶wÐi® ·¶·i ˆõ·¡µ¡.');
                 Print(7,''); talk('');
                 Print(15,'1.     •¢      - ¸â·i º—•¢ ¯¡Ç±');
                 Print(15,'2. ‹¡®‰ ¢bÑÁ - ¸â· Ëb® ‰·‰b “wb ¹Aˆá');
                 Print(15,'3. ¤w´á ¢bÑÁ - ¸â· ¤w´áb ˆq­¡');
                 Print(15,'4. “wb   ¸áÐa - ¸â· ¡¡—e “wb ˆq­¡');
                 Print(15,'5.  a¤ó   ¦‰“w - ¸â·  a¤ó “wb ¹Aˆá');
                 Print(15,'6. Èi   Á¡·¥ÑÁ - ¸â· Á¡¸aµeb ¹Aˆá');
                 PressAnyKey;
                 Print(7,' ·¡ µa¬õˆa»¡·  a¤ó·e ¬a¶wÐa‹¡ Œa”a³‰¡  »¢');
                 Print(7,'¸ó¸â·¥ ‰·‰b·e ´a“¡»¡ e Çe •¡¶‘·i º‰ˆõ·¡µ¡.');
                 Print(7,'Ða»¡ e, ¬a¯©  ·¡  a¤ó—i·i ¡¡– •·¶¥Ða”áœa•¡');
                 Print(7,'NecromancerŸi  ea‹¡ ¹¡Àa ´áa¶‰ ˆõ·¡µ¡. ‹a');
                 Print(7,'œ¬á ”w¯¥—i·e Á¡¸aµeb ™¡Ðe ·¢Ña´¡ e ‹aµA‰A');
                 talk('”ÐwÐi® ·¶·i ˆõ·¡µ¡.');
                 party.etc[38] := party.etc[38] or bit1;
              end;
              if x = 72 then begin
                 for j := 19 to 21 do map[72,j] := 44;
                 y := y - 7;
              end;
              if y = 38 then begin
                 for i := 67 to 69 do begin
                    map[i,38] := 44; map[i,44] := 52;
                 end;
                 x := 56; y := 93;
              end;
              if (x = 22) and (party.etc[15] < 2) then begin
                 if party.etc[1] = 0 then begin
                    party.etc[1] := 1;
                    scroll(true);
                 end;
                 Print(11,'”w¯¥·e ¥¡¯a·¥ HidraŸi  ev”a.');
                 for i := 2 to 3 do begin
                    putimage(i*20-20,100,chara^[36],andput);
                    putimage(i*20-20,100,chara^[8],orput);
                    putimage(i*20,100,chara^[40],andput);
                    putimage(i*20,100,chara^[12],orput);
                    delay(1000);
                 end;
                 for i := 2 to 4 do begin
                    putimage(i*20-20,80,chara^[36],andput);
                    putimage(i*20-20,80,chara^[8],orput);
                    putimage(i*20,80,chara^[40],andput);
                    putimage(i*20,80,chara^[12],orput);
                    putimage(i*20-20,120,chara^[36],andput);
                    putimage(i*20-20,120,chara^[8],orput);
                    putimage(i*20,120,chara^[40],andput);
                    putimage(i*20,120,chara^[12],orput);
                    delay(700);
                 end;
                 putimage(60,100,chara^[36],andput);
                 putimage(60,100,chara^[8],orput);
                 putimage(80,100,chara^[40],andput);
                 putimage(80,100,chara^[12],orput);
                 PressAnyKey;
                 enemynumber := 3;
                 for i := 1 to 3 do begin
                    joinenemy(i,49);
                    with enemy[i] do begin
                       name := 'Hidra''s Head '+chr(48+i);
                       level := 8;
                       E_number := 34;
                    end;
                    enemy[2].level := 10;
                    enemy[2].E_number := 39;
                 end;
                 Displayenemies(TRUE);
                 BattleMode(TRUE);
                 if party.etc[6] = 255 then exit;
                 if party.etc[6] = 0 then begin
                    Clear;
                    Print(15,'”w¯¥—i·e HidraŸi ¢‰Ÿ¡Áv”a.');
                    Print(11,'‹aŸ¡‰¡ ”w¯¥·e ·¡ ·±¢µA ¬÷‰·Ð–”a.');
                    Print(15,'”a¯¡ WATER FIELD · Š…ºµA‰A¡ •©´aˆaœa.');
                    PressAnyKey;
                    party.etc[15] := 2;
                    x := 56; y := 93;
                    scroll(TRUE);
                 end
                 else begin
                    inc(x); scroll(TRUE);
                 end;
              end;
           end;
      18 : begin
              Clear;
              if y = 95 then
              if wantexit then begin
                 with party do begin
                    xaxis := 96; yaxis := 43; map := 3;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if on(22,41) then begin
                 map[22,41] := 44; map[21,41] := 52;
              end;
              if on(21,41) and (party.etc[39] and bit3 = 0) then begin
                 if party.etc[1] = 0 then begin
                    party.etc[1] := 1;
                    scroll(true);
                 end;
                 Print(11,'£¡¡­¢µA¬á ­¡Ÿi ”k·e ŠA¢‰·¡ aÈav”a');
                 for i := 1 to 4 do begin
                    if i > 1 then putimage(100,(i-1)*20,font^[map[x,y-(6-i)]],copyput);
                    putimage(100,i*20,chara^[37],andput);
                    putimage(100,i*20,chara^[9],orput);
                    if i < 4 then delay(1000);
                 end;
                 PressAnyKey;
                 enemynumber := 1;
                 joinenemy(1,53);
                 Displayenemies(TRUE);
                 BattleMode(FALSE);
                 party.etc[39] := party.etc[39] or bit3;
              end;
              if on(37,31) then begin
                 if party.etc[39] and bit2 > 0 then exit;
                 if party.etc[39] and bit1 > 0 then begin
                    if party.etc[5] > 0 then begin
                       j := player[1].level[3];
                       for i := 2 to 6 do
                       if player[i].name <> '' then begin
                          if player[i].level[3] > j then j := player[i].level[3];
                       end;
                       if j < 5 then begin
                          Print(7,' ”w¯¥·¡ a·  a·q·i ·ª·aa Ða»¡ e ´a»¢ ”w¯¥');
                          Print(7,'· “wb·a¡“e a·  a·q·i i´á‰®“e ´ô¯s“¡');
                          talk('”a.');
                       end
                       else begin
                          Print(7,' ˆs¸a‹¡ NecromancerµA‰A ”Ðw Ða‰¡Ïe  ‰i·ˆa');
                          Print(7,'¬—‹¡“e Š…¶a. a•¡ ”w¯¥—i·i •¡µÁ ‹aŸi ¢¿¡Ÿa');
                          Print(7,'‰V¯s“¡”a.');
                          m[0] := '';
                          m[1] := '¸á•¡ ¶¥Ð–”å ¤a·³“¡”a';
                          m[2] := ' i³q·e ‰¡ s»¡ e ¬a´·Ða‰V¯s“¡”a';
                          k := select(140,2,2,FALSE,TRUE);
                          if k = 0 then exit;
                          party.etc[39] := party.etc[39] or bit2;
                          if k = 2 then exit;
                          k := ReturnJoinMember;
                          if k = 1 then exit;
                          join(43,k);
                          with player[k] do begin
                             name := 'Spica';
                             sex := female;
                             class := 3;
                             strength := 10;
                             mentality := 17;
                             concentration := 20;;
                             endurance := 9;
                             resistance := 15;
                             agility := 7;
                             accuracy[1] := 8;
                             accuracy[2] := 15;
                             accuracy[3] := 20;
                             luck := 10;
                             poison := 0;
                             unconscious := 0;
                             dead := 0;
                             level[1] := 11;
                             level[2] := 6;
                             level[3] := 11;
                             hp := endurance * level[1];
                             sp := mentality * level[2];
                             esp := concentration * level[3];
                             ac := 3;
                             weapon := 1;
                             shield := 1;
                             armor := 1;
                             wea_power := 5;
                             shi_power := 1;
                             arm_power := 2;
                          end;
                          Display_Condition;
                       end;
                    end
                    else begin
                       Print(7,' »¡ÁAÐi ¯¡ˆe·¡ ´ô¯s“¡”a. ¯¥­¢Ó¡ Ð—•··i ÂáÐa');
                       talk('¯³¯¡µ¡.');
                    end;
                 end;
                 if party.etc[39] and bit1 = 0 then begin
                    Print(11,'µa‹¡µA“e ´á˜å µa¸aˆa ®•¡Ða‰¡ ·¶´ö”a');
                    PressAnyKey;
                    Print(7,' a“e ·¡‰µ LOCKUP·¡ ¸â—iµA‰A ¸ñw–A‹¡¸å  ¦');
                    Print(7,'Èá µa‹¡¬á ®•¡Ða‰¡ ·¶“e Spicaœe ¬aœq·³“¡”a');
                    Print(7,' µ¡œ… ®•¡ {µA a“e Á¡¸aµeb· ¹¥¸µÁ ¬a¶w');
                    Print(7,'¤ó·i ´i‰A –A´ö¯s“¡”a.  ”Â— ¶a´¢Ða¡e ·¡œý¯s');
                    Print(7,'“¡”a.');
                    PressAnyKey;
                    Print(7,'');
                    Print(15,'Ê  ¯¡ : ¥eÑÁ· µa»¡ˆa ·¶“e »¡µb·i Èq»¡');
                    Print(15,'µ  ´å : ”a·q· Ði ·©·i ´i´a‘');
                    Print(15,'•¢  ¯± : q·  a·q·i ¸a‹¡½¢·a¡ i´á—i·±');
                    Print(15,'ÀåŸ¡´e : “wbµA ˜aœa  å‰µ· ‰×‰w·i ¥±');
                    Print(15,'µq  b : º¶á ÑÅ‰w ¹¡¸éµA ·Ðe ‰·‰b');
                    PressAnyKey;
                    Print(7,' ·¡ˆõ·a¡ NecromancerµA‰A •¡¸å Ða¯³¯¡µ¡. ™¡');
                    Print(7,'Ðe,  ‹a•¡ Á¡¸aµeb· ¹¥¸Ÿi ´i‰¡·¶‰¡ ¬a¶wÐi');
                    Print(7,'º‰ ´e”a“eˆé µq–µA –‰¡ ¬a¶wÐa¯³¯¡µ¡.');
                    PressAnyKey;
                    party.etc[39] := party.etc[39] or bit1;
                 end;
              end;
              if (x = 31) and (party.etc[15] < 4) then begin
                 if party.etc[1] = 0 then begin
                    party.etc[1] := 1;
                    scroll(true);
                 end;
                 message(11,'”w¯¥·e µa‹¡ˆa Huge Dragon· ˆáÀá·±·i “av”a');
                 face := 6;
                 for i := 1 to 6 do begin
                    inc(x);
                    scroll(TRUE);
                    delay(200);
                 end;
                 face := 4;
                 for i := y+1 to 13 do begin
                    y := i;
                    scroll(TRUE);
                    delay(200);
                 end;
                 face := 5;
                 Silent_Scroll;
                 for i := 4 to 6 do begin
                    putimage(20*i,20,chara^[4*(i-4)+39],andput);
                    putimage(20*i,20,chara^[4*(i-4)+11],orput);
                 end;
                 delay(2000);
                 for j := 1 to 3 do begin
                    for i := 4 to 6 do begin
                       putimage(20*i,20*(j+1),font^[43],copyput);
                       putimage(20*i,20*(j+1),chara^[4*(i-4)+39],andput);
                       putimage(20*i,20*(j+1),chara^[4*(i-4)+11],orput);
                    end;
                    for i := 4 to 6 do begin
                       putimage(20*i,20*j,font^[43],copyput);
                       putimage(20*i,20*j,chara^[4*(i-4)+38],andput);
                       putimage(20*i,20*j,chara^[4*(i-4)+10],orput);
                    end;
                    if j > 1 then
                    for i := 4 to 6 do putimage(20*i,20*(j-1),font^[43],copyput);
                    if j < 3 then delay(2000);
                 end;
                 PressAnyKey;
                 enemynumber := 7;
                 joinenemy(1,54);
                 enemy[1].name := 'Huge Dragon';
                 joinenemy(2,39);
                 with enemy[2] do begin
                    name := 'Dragon''s tail';
                    ac := 8;
                 end;
                 for i := 3 to 7 do joinenemy(i,random(3)+30);
                 Displayenemies(TRUE);
                 BattleMode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if party.etc[6] = 0 then begin
                    Clear;
                    Print(15,'”w¯¥—i·e Huge Dragon·i ¢‰Ÿ¡Áv”a.');
                    Print(11,'‹aŸ¡‰¡ ”w¯¥·e ·¡ ·±¢µA ¬÷‰·Ð–”a.');
                    Print(15,'”a¯¡ WATER FIELD · Š…ºµA‰A¡ •©´aˆaœa.');
                    PressAnyKey;
                    party.etc[15] := 4;
                    scroll(TRUE);
                 end
                 else begin
                    x := 25; y := 94;
                    scroll(TRUE);
                 end;
              end;
           end;
      19 : begin
              Clear;
              if y = 46 then
              if wantexit then begin
                 with party do begin
                    xaxis := 48; yaxis := 58; map := 4;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if on(11,40) then begin
                 if party.etc[3] > 0 then begin
                    Print(7,' “| ´aœŸi ¥¡“¡ ¢´åˆa ¤e¼b·¡“e ¢‰ÁAˆa ·¶´ö');
                    Print(7,'”a. Ða»¡ e “|¶áŸi ˆè“e  a¤ó ˜¢…µA “|­¢·a¡');
                    Print(7,'—i´áˆi®ˆa ´ô”a.');
                    PressAnyKey;
                 end
                 else begin
                    Print(7,' ·©Ð—·e •¢·i ¢Ÿs³a‰¡  “|­¢µA ¨a¹a·¶“e A¤á');
                    Print(7,'Ÿi ”w‰v”a. ®…ˆe •·Š‰ º—¯±¦µA¬á ŠW·q·¡ —iv');
                    Print(7,'”a.');
                    PressAnyKey;
                    map[11,40] := 49;
                    map[41,39] := 0;
                 end;
              end;
              if on(41,39) then begin
                 if party.etc[3] > 0 then begin
                    Print(7,' “| ´aœŸi ¥¡“¡ ¢´åˆa ¤e¼b·¡“e ¢‰ÁAˆa ·¶´ö');
                    Print(7,'”a. Ða»¡ e “|¶áŸi ˆè“e  a¤ó ˜¢…µA “|­¢·a¡');
                    Print(7,'—i´áˆi®ˆa ´ô”a.');
                    PressAnyKey;
                 end
                 else begin
                    Print(7,' ·©Ð—·e •¢·i ¢Ÿs³a‰¡  “|­¢µA ¨a¹a·¶“e A¤á');
                    Print(7,'Ÿi ”w‰v”a. ®…ˆe •·Š‰ º—¯±¦µA¬á ¹¡‹q¸å ¥¡”a');
                    Print(7,'”á Çe ŠW·q·¡ —iv”a.');
                    PressAnyKey;
                    map[41,39] := 49;
                    if not odd(party.etc[40]) then begin
                       for j := 27 to 36 do begin
                          map[24,j] := 25;
                          map[28,j] := 23;
                       end;
                       map[24,37] := 17; map[28,37] := 19;
                       for j := 27 to 37 do
                       for i := 25 to 27 do map[i,j] := 44;
                       party.etc[40] := (random(7)+1) shl 1;
                    end;
                 end;
              end;
              if (y in [8..12]) and not odd(party.etc[40]) then begin
                 enemynumber := random(3) + 3;
                 for i := 1 to enemynumber do begin
                    joinenemy(i,59);
                    with enemy[i] do begin
                       E_number := 25;
                       hp := 210;
                       level := 7;
                    end;
                 end;
                 DisplayEnemies(TRUE);
                 BattleMode(TRUE);
                 map[x,y] := 49;
              end;
              if (y = 6) and not odd(party.etc[40]) then begin
                 map[x,y-1] := 49;
                 Silent_Scroll;
                 j := party.etc[40] shr 1;
                 if j <> (x-10) div 4 then begin
                    Print(7,' µa‹¡µA“e ¥··¥·¡ ¤i‰e–A»¡ ´g´v”a');
                    map[x,y] := 49;
                    PressAnyKey;
                 end
                 else begin
                    enemynumber := 7;
                    for i := 1 to 3 do joinenemy(i,59);
                    for i := 4 to enemynumber do begin
                       joinenemy(i,59);
                       with enemy[i] do begin
                          E_number := 25;
                          hp := 210;
                          level := 7;
                       end;
                    end;
                    DisplayEnemies(TRUE);
                    Print(13,'a“e EVIL GOD· ¥··¥·i »¡Ç¡‰¡ ·¶“e CRAB GOD');
                    Print(13,'· µ×·¡”a. CRAB GOD ¹¢· ¡wµŸi ˆé‰¡ ¸é”¡');
                    Print(13,'áÓ ˆ{·e ¸a—iµA‰A ¥··¥·i ñ‰aº»¡ ´g‰V”a!!');
                    PressAnyKey;
                    BattleMode(FALSE);
                    if party.etc[6] = 255 then exit;
                    Clear;
                    if party.etc[6] = 0 then begin
                       Print(15,' ”w¯¥·e ·¡ •·Š‰µA ¥¡‰Å–A´á ·¶“e ¥··¥·i ¤i‰e');
                       Print(15,'Ð–”a.  ‹aŸ¡‰¡“e ¥·­á –A´ö”å ¥··¥·i Î‰´á¤áv');
                       Print(15,'”a.');
                       party.etc[40] := party.etc[40] or bit1;
                       PressAnyKey;
                    end
                    else begin
                       inc(y);
                       scroll(TRUE);
                    end;
                 end;
              end;
           end;
      20 : begin
              Clear;
              if y = 96 then
              if wantexit then begin
                 with party do begin
                    xaxis := 82; yaxis := 17; map := 4;
                 end;
                 load; scroll(TRUE);
              end
              else begin
                 dec(y); scroll(TRUE);
              end;
              if y = 88 then begin
                 if map[x,y] = 0 then y := 80
                 else begin
                    with party do begin
                       xaxis := 82; yaxis := 17; map := 4;
                    end;
                    load; scroll(TRUE);
                    exit;
                 end;
              end;
              if y = 71 then begin
                 if map[x,y] = 0 then y := 63
                 else begin
                    with party do begin
                       xaxis := 82; yaxis := 17; map := 4;
                    end;
                    load; scroll(TRUE);
                    exit;
                 end;
              end;
              if y = 91 then begin
                 Print(15,' ”a·q ¢‰·q·¡  x”a¡e ¶E½¢‹©¡, ´a“¡¡e µ¡Ÿe½¢');
                 Print(15,'‹©¡ ˆa¯¡µ¡.');
                 Print(7,'');
                 i := random(8);
                 case i of
                    0 : Print(7,'¢…> CONFIG.SYSˆa ´ô·a¡e ¦Ë··¡ ´e–E”a');
                    1 : Print(7,'¢…> Quick-BASIC·e ·¥ÈáÏaŸ¡Èá´á ·¡”a');
                    2 : Print(7,'¢…> Super VGA“e Ñ¡ÑÅ·¡ ¸i–E”a');
                    3 : Print(7,'¢…> 8-bit APPLE· CPU“e Z - 80 ·¡”a');
                    4 : Print(7,'¢…> COMMAND.COM ´eµA •¡¯a ¡ww·¡ —i´á·¶”a');
                    5 : Print(7,'¢…> AdLib Äa—a“e 9 Àé·¡”a');
                    6 : Print(7,'¢…> Ultima· ¹A¸b¸a“e Ÿ¡Àa—a ‰AŸ¡µ¡Ëa·¡”a');
                    7 : Print(7,'¢…> ”w¯¥· ÄñÏAÈá“e IBM ‰µi·¡”a');
                 end;
                 for j := 23 to 26 do map[j,y] := 44;
                 if i < 4 then begin
                    map[8,88] := 52; map[43,88] := 0;
                 end
                 else begin
                    map[8,88] := 0; map[43,88] := 52;
                 end;
                 delay(3000);
                 PressAnyKey;
              end;
              if y = 75 then begin
                 Print(15,' ”a·q ¢‰·q·¡  x”a¡e ¶E½¢‹©¡, ´a“¡¡e µ¡Ÿe½¢');
                 Print(15,'‹©¡ ˆa¯¡µ¡.');
                 Print(7,'');
                 i := random(8);
                 case i of
                    0 : Print(7,'¢…> È´·‰· ¹A 4 Ñ¢¬÷·e »¡Š·¡”a');
                    1 : Print(7,'¢…> ¦‚‹b¬÷·¡ ˆa¸w ¤j·e ¥i·¡”a');
                    2 : Print(7,'¢…> 1¶©· ®Ñ¡¬÷¹Á“e 1¶©µA ¥©®·¶”a');
                    3 : Print(7,'¢…> §¹¥¡”a ¨aŸe ·³¸a“e ¯©Ðñ¬w ´ô´ö”a');
                    4 : Print(7,'¢…> ”i·¡ »¡Š¥¡”a  å¸á ¬—‰av”a');
                    5 : Print(7,'¢…> ¯¡‹aá¯a X1·e §iœ‚Ñ©·¡”a');
                    6 : Print(7,'¢…> ‰Áˆá¡· Èa·± á¯¥·e ¦‰ˆa“wÐa”a');
                    7 : Print(7,'¢…> ¦‚‹b¬÷·e º‹¡¸â·a¡ ”iœa»¥”a');
                 end;
                 for j := 23 to 26 do map[j,y] := 44;
                 if i < 4 then begin
                    map[8,71] := 52; map[43,71] := 0;
                 end
                 else begin
                    map[8,71] := 0; map[43,71] := 52;
                 end;
                 delay(3000);
                 PressAnyKey;
              end;
              if y = 54 then begin
                 Print(15,'<< ”a·q· µ°‰¡ ‹aŸq·i ˆaŸ¡¯¡µ¡ >>');
                 Print(7,'');
                 i := random(8);
                 case i of
                    0 : Print(7,'¢…> ·¡ ‰A·±· ¤‰w·e 4ˆ· ”ŸB·¡”a');
                    1 : Print(7,'¢…> Ancient Evil·e ·w»·–A´á´¡ Ðe”a');
                    2 : Print(7,'¢…> Lord Ahn e·¡ ·A·©Ðe Semi-God·¡”a');
                    3 : Print(7,'¢…> ·¡ ­A‰· ¡¡—e ´b·e ·w»·–A´á´¡ Ðe”a');
                    4 : Print(7,'¢…> ·¡ ‰A·±· ¹A¸b¸a“e ´e µw‹¡·¡”a');
                    5 : Print(7,'¢…> ‰A·±­¢· ·¥¢‰·e ˆá· ¥i· ·¡Ÿq·i ˆa¹v”a');
                    6 : Print(7,'¢…> Necromancer“e ¯¥· ‰w»¡µA ·¡Ÿaœö”a');
                    7 : Print(7,'¢…> Necromancer“e ·¡ ­A‰· ¹¥¸ˆa ´a“¡´ö”a');
                 end;
                 m[0] := '';
                 m[1] := '¶á·  i·e µ°”a';
                 m[2] := '¶á·  i·e ¸i¡µ–A´ö”a';
                 k := select(120,2,2,FALSE,TRUE);
                 if k = 0 then begin
                    inc(y);
                    scroll(TRUE);
                    exit;
                 end;
                 for j := 23 to 25 do map[j,y] := 44;
                 if ((k=1) and (i>3)) or ((k=2) and (i<4)) then begin
                    for j := 49 to 52 do begin
                       map[22,j] := 25;
                       map[26,j] := 23;
                       for i := 23 to 25 do map[i,j] := 44;
                    end;
                 end
                 else begin
                    with party do begin
                       xaxis := 82; yaxis := 17; map := 4;
                    end;
                    load; scroll(TRUE);
                    exit;
                 end;
                 scroll(TRUE);
              end;
              if (x in [8..42]) and (y in [19..43]) then begin
                 if party.etc[1] > 0 then dec(party.etc[1]);
                 Silent_Scroll;
              end;
              if y = 18 then party.etc[1] := 1;
              if (y = 48) and (party.etc[41] and bit4 = 0) then begin
                 if party.etc[1] = 0 then begin
                    party.etc[1] := 1;
                    scroll(true);
                 end;
                 Print(11,'£¡¡­¢µA¬á ­¡Ÿi ”k·e ŠA¢‰·¡ aÈav”a');
                 for i := 1 to 4 do begin
                    if i > 1 then putimage(100,(i-1)*20,font^[map[x,y-(6-i)]],copyput);
                    putimage(100,i*20,chara^[37],andput);
                    putimage(100,i*20,chara^[9],orput);
                    if i < 4 then delay(1000);
                 end;
                 PressAnyKey;
                 enemynumber := 1;
                 joinenemy(1,53);
                 Displayenemies(TRUE);
                 BattleMode(FALSE);
                 party.etc[41] := party.etc[41] or bit4;
              end;
              if y = 13 then begin
                 if party.etc[1] = 0 then begin
                    party.etc[1] := 1;
                    scroll(true);
                 end;
                 if party.etc[41] and bit2 = 0 then begin
                    for i := 4 to 6 do begin
                       for j := 0 to 1 do begin
                          putimage(20*i-j*80+40,20,chara^[4*(i-4)+39],andput);
                          putimage(20*i-j*80+40,20,chara^[4*(i-4)+11],orput);
                       end;
                    end;
                    delay(2000);
                    for j := 1 to 3 do begin
                       for i := 4 to 6 do
                       for k := 0 to 1 do begin
                          putimage(20*i-k*80+40,20*(j+1),font^[44],copyput);
                          putimage(20*i-k*80+40,20*(j+1),chara^[4*(i-4)+39],andput);
                          putimage(20*i-k*80+40,20*(j+1),chara^[4*(i-4)+11],orput);
                       end;
                       for i := 4 to 6 do
                       for k := 0 to 1 do begin
                          putimage(20*i-k*80+40,20*j,font^[44],copyput);
                          putimage(20*i-k*80+40,20*j,chara^[4*(i-4)+38],andput);
                          putimage(20*i-k*80+40,20*j,chara^[4*(i-4)+10],orput);
                       end;
                       if j > 1 then
                       for i := 4 to 6 do
                       for k := 0 to 1 do
                          putimage(20*i-k*80+40,20*(j-1),font^[44],copyput);
                       if j < 3 then delay(2000);
                    end;
                    for i := 4 to 6 do begin
                       putimage(20*i,20,chara^[4*(i-4)+39],andput);
                       putimage(20*i,20,chara^[4*(i-4)+11],orput);
                    end;
                    delay(1000);
                    for i := 4 to 6 do begin
                       putimage(20*i,40,font^[44],copyput);
                       putimage(20*i,40,chara^[4*(i-4)+39],andput);
                       putimage(20*i,40,chara^[4*(i-4)+11],orput);
                    end;
                    for i := 4 to 6 do begin
                       putimage(20*i,20,font^[44],copyput);
                       putimage(20*i,20,chara^[4*(i-4)+38],andput);
                       putimage(20*i,20,chara^[4*(i-4)+10],orput);
                    end;
                    delay(1000);
                    for i := 4 to 6 do begin
                       putimage(20*i,20,font^[44],copyput);
                       putimage(20*i,60,font^[44],copyput);
                       putimage(20*i,60,chara^[4*(i-4)+39],andput);
                       putimage(20*i,60,chara^[4*(i-4)+11],orput);
                    end;
                    putimage(80,60,chara^[46],andput);
                    putimage(80,60,chara^[18],orput);
                    putimage(120,60,chara^[38],andput);
                    putimage(120,60,chara^[10],orput);
                    for i := 4 to 6 do begin
                       putimage(20*i,40,font^[44],copyput);
                       putimage(20*i,40,chara^[4*(i-4)+38],andput);
                       putimage(20*i,40,chara^[4*(i-4)+10],orput);
                    end;
                    PressAnyKey;
                    enemynumber := 3;
                    for i := 1 to enemynumber do joinenemy(i,54);
                    Displayenemies(TRUE);
                    BattleMode(FALSE);
                    if party.etc[6] = 255 then exit;
                    if party.etc[6] = 0 then party.etc[41] := party.etc[41] or bit2
                    else begin
                       inc(y); scroll(TRUE);
                       exit;
                    end;
                 end;
                 if party.etc[41] and bit3 = 0 then begin
                    Clear;
                    enemynumber := 7;
                    for i := 1 to enemynumber do joinenemy(i,31);
                    DisplayEnemies(TRUE);
                    BattleMode(FALSE);
                    if party.etc[6] = 255 then exit;
                    if party.etc[6] = 0 then party.etc[41] := party.etc[41] or bit3
                    else begin
                       inc(y); scroll(TRUE);
                       exit;
                    end;
                 end;
                 if party.etc[41] and bit1 = 0 then begin
                    Clear;
                    Silent_Scroll;
                    for i := 1 to 4 do begin
                       putimage(20*i,20*i,chara^[13],copyput);
                       putimage(20*(i+1),20*i,chara^[41],copyput);
                       if i > 1 then begin
                          putimage(20*(i-1),20*(i-1),font^[44],copyput);
                          putimage(20*i,20*(i-1),font^[44],copyput);
                       end;
                       if i < 4 then delay(1500);
                    end;
                    Print(13,' a“e Necromacer µÁ ÐqA ”aŸe Àa¶¥µA¬á a');
                    Print(13,'µ¥ Astral Mud ·¡”a. µa‹¡“e ‹aˆa ­A¶… ÂA‰¡·');
                    Print(13,'•·Š‰·¡¸a áˆa  a»¡ b·a¡ ˆáÃ© •·Š‰·¡”a.  a');
                    Print(13,'Ÿi  e eÐa‰A ¥¡»¡ aœa.  ”aŸe Àa¶¥· “wb—i·i');
                    Print(13,'áˆa  u¥© ‹¡ÒAŸi ˆa»¥”a“e ˆõµA ”Ð  ‰¡ s‰A');
                    Print(13,'¬—ˆbÐa‹¡ ¤aœe”a. ÐaÐaÐa ...');
                    PressAnyKey;
                    enemynumber := 7;
                    for i := 1 to 6 do joinenemy(i,31);
                    joinenemy(7,57);
                    displayenemies(TRUE);
                    battlemode(FALSE);
                    if enemy[7].dead then begin
                       party.etc[41] := party.etc[41] or bit1;
                       Clear;
                       Print(15,' ”w¯¥·e ·¡ •·Š‰µA ¥¡‰Å–A´á ·¶“e ¥··¥·i ¤i‰e');
                       Print(15,'Ð–”a.  ‹aŸ¡‰¡“e ¥·­á –A´ö”å ¥··¥·i Î‰´á¤áv');
                       Print(15,'”a.');
                       with party do begin
                          xaxis := 82; yaxis := 17; map := 4;
                       end;
                       load;
                       PressAnyKey;
                       scroll(TRUE);
                       exit;
                    end
                    else begin
                       inc(y); scroll(TRUE);
                       exit;
                    end;
                 end
                 else begin
                    with party do begin
                       xaxis := 82; yaxis := 17; map := 4;
                    end;
                    load; scroll(TRUE);
                 end;
              end;
           end;
      21 : begin
              Clear;
              if y = 46 then begin
                 if wantexit then begin
                    if party.etc[42] and bit1 = 0 then begin
                       j := 1;
                       if party.etc[42] and bit3 = 0 then begin
                          joinenemy(j,55);
                          inc(j);
                       end;
                       if party.etc[42] and bit4 = 0 then begin
                          joinenemy(j,56);
                          inc(j);
                       end;
                       if j = 1 then begin
                          party.etc[42] := party.etc[42] or bit1;
                          exit;
                       end;
                       enemynumber := j+4;
                       for i := j to j+4 do joinenemy(i,35);
                       DisplayEnemies(TRUE);
                       BattleMode(FALSE);
                       if enemy[1].dead then party.etc[42] := party.etc[42] or bit3;
                       if enemy[2].dead then party.etc[42] := party.etc[42] or bit4;
                       if enemy[1].dead and enemy[2].dead then
                          party.etc[42] := party.etc[42] or bit1;
                    end;
                    with party do begin
                       xaxis := 48; yaxis := 36; map := 4;
                    end;
                    load; scroll(TRUE);
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end
              else if on(25,20) then begin
                 if not (odd(party.etc[40]) and odd(party.etc[41])) then begin
                    Print(13,' ”w¯¥·e ´a»¢ œa¤a ‰A·¡ËaŸi µi®ˆa ´ô”a');
                    Print(7,'');
                    Print(7,' ´a»¢ ”w¯¥·e ·¡ ”ŸB· •·Š‰­¢µA  ¹¥¸Ða');
                    Print(7,' “e 2ˆ· ¥··¥·i Î‰»¡ ¡µÐ–‹¡ ˜¢…·¡”a.');
                    PressAnyKey;
                    inc(y);
                    scroll(TRUE);
                 end;
              end
              else begin
                 enemynumber := random(4)+3;
                 for i := 1 to enemynumber do joinenemy(i,58);
                 DisplayEnemies(TRUE);
                 BattleMode(FALSE);
                 j := map[x,y];
                 if j = 0 then map[x,y] := 40 else map[x,y] := 46;
              end;
           end;
      22 : begin
              Clear;
              if y = 46 then begin
                 if wantexit then begin
                    if party.etc[43] and bit3 = 0 then begin
                       enemynumber := 7;
                       j := random(5) + 42;
                       if j = 42 then j := 35;
                       for i := 1 to 6 do joinenemy(i,j);
                       joinenemy(7,66);
                       displayenemies(TRUE);
                       Print(13,player[1].name+', a· Ó±·i ¥¡µaº‰V”a.');
                       PressAnyKey;
                       battlemode(FALSE);
                       if enemy[7].dead then party.etc[43] := party.etc[43] or bit3;
                    end;
                    with party do begin
                       xaxis := 15; yaxis := 32; map := 5;
                    end;
                    load; scroll(TRUE);
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end
              else if on(25,18) then begin
                 if party.etc[43] and bit2 = 0 then begin
                    enemynumber := 5;
                    for i := 1 to 5 do joinenemy(i,60);
                    joinenemy(random(5)+1,63);
                    displayenemies(TRUE);
                    Print(13,' a“e ·¡ ¶a¬· WraithŸi ¹¡¹·Ða“e º‚·q· ‹¡');
                    Print(13,'¬a Death Knight·¡”a. aµA‰A •¡¸åÐa”a“¡ ˆa­¡');
                    Print(13,'¡¶… ˆõ—i. ·aÐaÐa....');
                    PressAnyKey;
                    battlemode(FALSE);
                    if party.etc[6] = 255 then exit;
                    if party.etc[6] = 0 then party.etc[43] := party.etc[43] or bit2;
                 end;
              end
              else if (y=25) and (x in [24..26]) then begin
                 if party.etc[43] and bit1 = 0 then begin
                    enemynumber := 5;
                    joinenemy(1,61);
                    joinenemy(2,58);
                    joinenemy(3,56);
                    joinenemy(4,55);
                    joinenemy(5,60);
                    displayenemies(TRUE);
                    battlemode(TRUE);
                    if party.etc[6] = 255 then exit;
                    if party.etc[6] = 0 then party.etc[43] := party.etc[43] or bit1;
                 end;
              end
              else begin
                 if party.etc[43] and bit2 = 0 then begin
                    enemynumber := 5;
                    for i := 1 to enemynumber do joinenemy(i,60);
                    displayenemies(TRUE);
                    battlemode(FALSE);
                    map[x,y] := 40;
                 end;
              end;
           end;
      23 : begin
              if map[x,y] = 0 then exit;
              Clear;
              if y = 46 then begin
                 if wantexit then begin
                    with party do begin
                       xaxis := 34; yaxis := 15; map := 5;
                    end;
                    load;
                    scroll(TRUE);
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end;
              if y = 26 then begin
                 enemynumber := 1;
                 joinenemy(1,70);
                 with enemy[1] do begin
                    name := 'Necromancer';
                    E_number := 1;
                 end;
                 displayenemies(TRUE);
                 Print(13,' ¸i•¡ µa‹¡Œa»¡ Àx´aµÖŠa '+player[1].name+'.');
                 Print(13,' ‘Aˆa Àx”å ‹a Necromancerˆa ¤a¡ a”a. —a—¡');
                 Print(13,'´á á· ¯©b·i ¥¡‰A –A‰VŠa. Ða»¡ e ¦…¡wÓ¡');
                 Print(13,'a¥¡”a“e ˜é´á»¡‰V»¡ e. ·aÐaÐaÐa.');
                 PressAnyKey;
                 Print(13,' áÓ—i·e ‰¨ ÑÅ¬wµA ¨a¹a—i‰A –I ˆõ·¡”a.');
                 Print(13,' a“e ¤é°á áÓ—i· ´¢¸ñ·i Ìa´b Ð–»¡.  áÓ');
                 Print(13,'·©Ð——i·e Ðw¬w ¸a¯¥·i  á¢ ¯¥žAÐa‰¡ £¨‰¡ ·¶');
                 Print(13,'”áŠ…. ‹aœáa ‹a Àbˆb·e ‰¨ Œ´á»© ˆõ·¡”a.');
                 Print(15,' ´á–‘· ¯¥·¡µa, ”w¯¥· Ó±·a¡ ·¡—i·i ÑÅ¬wµA');
                 Print(15,'¨a¹a —i‰A Ða­¡¬á. ·¥ Æ´a¯a ¹E ~~');
                 enemynumber := 6;
                 for i := 1 to 6 do begin
                    if player[i].name = '' then joinenemy(i,60)
                    else turn_mind(i,i);
                    enemy[i].E_number := 1;
                 end;
                 displayenemies(TRUE);
                 PressAnyKey;
                 aux := FALSE;
                 repeat
                    displayenemies(TRUE);
                    battlemode(FALSE);
                    if party.etc[6] = 255 then exit;
                    if party.etc[6] > 0 then begin
                       Clear;
                       Print(7,' Ða»¡ e ”w¯¥·e ÑÅ¬wµA¬á ¤õ´áa»¡ ¡µÐ–”a.');
                       PressAnyKey;
                    end
                    else aux := TRUE;
                 until aux;
                 Clear;
                 enemynumber := 1;
                 joinenemy(1,70);
                 with enemy[1] do begin
                    name := 'Necromancer';
                    E_number := 1;
                 end;
                 displayenemies(TRUE);
                 Print(13,' ÑÅ¬wµA¬á ¤õ´áa”a“¡ ””eÐe ·»¡b·¡Š….');
                 Print(13,' Ða»¡ e »¥¼a ¸â·e ¤a¡ a”a. ¤h´aœa !!');
                 PressAnyKey;
                 battlemode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if party.etc[6] > 0 then begin
                    inc(y);
                    scroll(TRUE);
                    exit;
                 end;
                 Clear;
                 Print(13,' ¶‚! á· Ó±·e ””eÐaŠa. a“e áµA‰A ¹v”a');
                 Print(13,'‰¡ ·¥¸÷Ða‰V”a.  ÓaÓa, ‹aœáa ¬a¯© a“e áÓ');
                 Print(13,'Àx”å Necromancer“±·¡ ´a“¡”a.   e´¢ ‹a¦…·¡œa');
                 Print(13,'·¡œý‰A ®ó‰A ”wÐa»¡“e ´g´v·i‰A“¡Œa.   ¬—¡w');
                 Print(13,'·¡ ´é a ´eq´vŠa. Necromancer“±  e­A !!');
                 PressAnyKey;
                 Print(7,' ‹a“e ®‘·¡ g´á¹v‰¡ º¶á· ‹¡–—•¡ ‹aµÁ ÐqA');
                 Print(7,'¬aœa¹a ¤áv”a.');
                 map[29,43] := 53;
                 for j := 25 to 27 do
                 for i := 24 to 27 do map[i,j] := 46;
                 PressAnyKey;
                 scroll(TRUE);
              end;
              if on(25,27) then begin
                 map[25,27] := 46;
                 map[29,43] := 44;
                 for j := 7 to 34 do
                 for i := 12 to 39 do
                 if map[i,j] = 0 then map[i,j] := 39;
                 for i := 25 to 26 do map[i,12] := 54;
                 Print(7,' Îu iµA ³aµa ·¶“e ”¡ ·¡ ‰µ· A¤áŸi ”w‰v ');
                 Print(7,'”á“¡ ŠW·q‰Á ÐqA ˆqÂ´á¹a ·¶´ö”å ¬÷·¡ »¡Ða ');
                 Print(7,'¡¦Èá ˜á µ©œv”a.');
                 PressAnyKey;
              end;
           end;
      24 : begin
              Clear;
              if y = 46 then begin
                 if wantexit then begin
                    with party do begin
                       xaxis := 25; yaxis := 24; map := 22;
                    end;
                    load;
                    scroll(TRUE);
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end;
           end;
      25 : begin
              Clear;
              if y = 46 then begin
                 if wantexit then begin
                    with party do begin
                       xaxis := 25; yaxis := 45; map := 23;
                    end;
                    load;
                    scroll(TRUE);
                 end
                 else begin
                    dec(y); scroll(TRUE);
                 end;
              end;
              if y = 43 then begin
                 if party.etc[1] = 0 then begin
                    party.etc[1] := 1;
                    Silent_Scroll;
                 end;
                 Print(15,' ‹q­¢·a¡–E ´á˜å ¸â·¡ aÈav”a.');
                 putimage(100,20,chara^[51],andput);
                 putimage(100,20,chara^[23],orput);
                 for j := 1 to 3 do begin
                    delay(2000);
                    for i := 0 to 9 do begin
                       if (i = 0) and (j > 1) then
                          putimage(100,(j-1)*20,font^[map[x,y+j-5]],copyput);
                       putimage(100,j*20,font^[map[x,y+j-5]],copyput);
                       putimage(100,(j+1)*20,font^[map[x,y+j-4]],copyput);
                       putimage(100,j*20+i*2,chara^[51],andput);
                       putimage(100,j*20+i*2,chara^[23],orput);
                    end;
                 end;
                 Clear;
                 Print(13,' µa‹¡Œa»¡ ¸i•¡µÖŠa. a· ·±¢“e áÓ ˆ{·e');
                 Print(13,'³aA‹¡—i ˜¢…µA Necromancer “±·¡ ®‰¡Ða¯¡»¡');
                 Print(13,'´g•¡¢ £¡Ÿ¡ Àá”eÐ ¤áŸ¡“e ˆõ·¡”a.');
                 PressAnyKey;
                 enemynumber := 5;
                 for i := 1 to 4 do joinenemy(i,66);
                 joinenemy(5,71);
                 displayenemies(TRUE);
                 battlemode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if party.etc[6] > 0 then begin
                    inc(y);
                    scroll(TRUE);
                    exit;
                 end;
                 for i := 24 to 27 do map[i,y] := 41;
                 Clear;
                 Print(15,' ”w¯¥·¡ ¸â·i ¢‰Ÿ¡Ã¡¸a ¹¡‹qÒµA ·¡¬wÐaŸ¡ eÇq');
                 Print(15,'Íe´eÐe ‹¡¶…·¡ ·©Ð—·i ˆq°v”a.');
                 PressAnyKey;
                 enemynumber := 2;
                 joinenemy(1,68); joinenemy(2,67);
                 displayenemies(TRUE);
                 Print(7,'  ¶ ®‰¡Ða¯¡“eŠ…¶a. '+player[1].name);
                 Print(7,' ”w¯¥·¡ NecromancerµA‰A ˆa‹¡¸åµA Ðe ˆa»¡ ·©');
                 Print(7,'œá –‰¡¸a Ðaµ¡.');
                 Print(7,' ·¡‰µµA“e §¡£©¯aœå ¢…·¡ –Š…•A ·¶­¡. »¡‹q·e');
                 Print(7,'¥¡·¡»¡ˆa ´g»¡ e ´·½¢· ¥b·i ¬iÏ¡”a ¥¡¡e  ®‘');
                 Print(7,'‰a»¥ ¢… ´eµA A¤áˆa ˆbˆb Ðaa³¢ ·¶­¡.  ‹aˆé');
                 Print(7,'¡¡– ¸b•·¯¡Ç¡¡e ¶w´q· º—´wµA¬á Necromancer');
                 Print(7,'· ¤w·a¡ É·Ða“e ·³Šˆa ¥¡·© ˆõ·¡µ¡. µa‹¡Œa');
                 Print(7,'»¡ e ˆa ´iaº‰ ®ˆa ·¶“e ¦¦…·¡µ¡.  a»¡ b');
                 Print(7,'·a¡ ”w¯¥· ˆåÊŸi §©‰V­¡.');
                 talk('');
                 for i := 1 to 6 do
                 if player[i].name <> '' then player[i].class := 10;
                 scroll(TRUE);
              end;
              if on(15,34) then begin
                 map[15,34] := 41;
                 for i := 11 to 14 do begin
                    map[i,33] := 24; map[i,35] := 26; map[i,34] := 42;
                 end;
                 map[14,33] := 17; map[14,35] := 18;
              end;
              if on(36,34) then begin
                 map[36,34] := 41;
                 for i := 37 to 40 do begin
                    map[i,33] := 24; map[i,35] := 26; map[i,34] := 42;
                 end;
                 map[37,33] := 19; map[37,35] := 22;
              end;
              if on(5,34) then begin
                 party.etc[45] := party.etc[45] or bit7;
                 Print(7,' ”w¯¥·¡ A¤áŸi ”w‹¡¸a  ÀéÄâÐa“e ­¡Ÿ¡ˆa •·Š‰');
                 Print(7,'µA ¶‰a Ìá¹v”a.');
                 if (party.etc[45] and bit7 > 0) and (party.etc[45] and bit8 > 0)
                 then begin
                    map[25,27] := 54; map[26,27] := 54;
                    Print(7,' ‰¨ ·¡´á ‹¡‰ ¸b•·Ða“e Çe ­¡Ÿ¡ˆa —iv”a.');
                 end;
                 PressAnyKey;
              end;
              if on(46,34) then begin
                 party.etc[45] := party.etc[45] or bit8;
                 Print(7,' ”w¯¥·¡ A¤áŸi ”w‹¡¸a  ÀéÄâÐa“e ­¡Ÿ¡ˆa •·Š‰');
                 Print(7,'µA ¶‰a Ìá¹v”a.');
                 if (party.etc[45] and bit7 > 0) and (party.etc[45] and bit8 > 0)
                 then begin
                    map[25,27] := 54; map[26,27] := 54;
                    Print(7,' ‰¨ ·¡´á ‹¡‰ ¸b•·Ða“e Çe ­¡Ÿ¡ˆa —iv”a.');
                 end;
                 PressAnyKey;
              end;
           end;
      26 : begin
              Clear;
              face := 5;
              delay(1500);
              for i := 1 to 3 do begin
                 dec(y);
                 scroll(TRUE);
                 delay(1500);
              end;
              face := 6;
              while x < 26 do begin
                 inc(x); scroll(TRUE);
                 delay(1500);
              end;
              face := 5;
              scroll(TRUE);
              for j := 4 downto 2 do begin
                 if j < 4 then
                    putimage(140,80-j*20,font^[map[x+2,y-j-1]],copyput);
                 putimage(140,100-j*20,chara^[54],andput);
                 putimage(140,100-j*20,chara^[26],orput);
                 delay(1000);
              end;
              for j := 4 downto 2 do begin
                 if j < 4 then
                    putimage(100,80-j*20,font^[map[x,y-j-1]],copyput);
                 putimage(100,100-j*20,chara^[53],andput);
                 putimage(100,100-j*20,chara^[25],orput);
                 delay(1000);
              end;
              for j := 1 to 3 do begin
                 if j > 1 then begin
                    putimage((j-1)*20,40,font^[map[x+j-6,y-3]],copyput);
                    putimage((j-1)*20,60,font^[map[x+j-6,y-2]],copyput);
                 end;
                 putimage(j*20,40,chara^[44],andput);
                 putimage(j*20,40,chara^[16],orput);
                 putimage(j*20,60,chara^[45],andput);
                 putimage(j*20,60,chara^[17],orput);
                 delay(2000);
              end;
              for j := 3 to 4 do begin
                 putimage(60,(j-1)*20,font^[map[x-2,y+j-6]],copyput);
                 putimage(60,j*20,font^[map[x-2,y+j-5]],copyput);
                 putimage(60,j*20,chara^[44],andput);
                 putimage(60,j*20,chara^[16],orput);
                 putimage(60,(j+1)*20,chara^[45],andput);
                 putimage(60,(j+1)*20,chara^[17],orput);
                 delay(2000);
              end;
              Print(13,' ”w¯¥—i·¡ aŸi ´ôµA‰V”a‰¡ µ¥¸a—i·¥ˆa?');
              Print(13,' ‹aœñ µ·Ÿi ˆxÂ‰¡ ­¡ˆŸi Ða»¡.  ”w¯¥· µ¡');
              Print(13,'Ÿe½¢· ¬aœq·e  ArchiMonkœa‰¡ Ða¡a  …­¥·i ¬a');
              Print(13,'¶wÐa“e ¢µ· ·©·¥¸a¡ É·Ða»¡.  ‹aŸ¡‰¡ ”w¯¥');
              Print(13,'· ¸÷¡e· ¬aœq·e ArchiMage œa‰¡ Ða“e  a¤ó¬a');
              Print(13,'º—·  a¤ó¬a·¡œa‘A.  ”w¯¥—i·e ¶Ÿ¡ ­U ¥¡”a•¡');
              Print(13,'®•¸aˆa  gŠ…. ‹aœý”a¡e a•¡ ‹aˆõµA ”§¡Ÿi Ð');
              Print(13,'´¡‰V»¡.  ˆa µa‹¡¬á ´¢ˆe· ·¥¶¥·i “i·¥”a‰¡');
              Print(13,'á¢ ¬ó¬óÐa‰A ¬—ˆb i‰A.  ‹aœý”a¡e ·¡¹A ¬á¡');
              Print(13,'· ¯©b·i ‰až¡¥© ¯¡ˆe·¡ ”a –A´öa¥¡Š…. ”w¯¥');
              Print(13,'· Ð—¶…·i §©‰V‘A.');
              talk('');
              enemynumber := 7;
              for i := 1 to enemynumber do joinenemy(i,68+i);
              aux := FALSE;
              repeat
                 displayenemies(TRUE);
                 battlemode(FALSE);
                 if party.etc[6] = 255 then exit;
                 if (party.etc[6] > 0) and (not enemy[7].dead) then begin
                    Clear;
                    Print(13,' Ða»¡ e aµA‰A •¡¸åÐe ·¡¬w •¡º“e Ðá¶wÐi ®');
                    Print(13,'´ô”a“e ¸ñ·¡ ´eÈaŒsŠ….');
                    PressAnyKey;
                 end
                 else aux := TRUE;
              until aux;
              Clear;
              Print(13,' ¶‚!!! µb¯¡ áÓ—i· “wb·a¡ µa‹¡Œa»¡ š‰¡');
              Print(13,'—i´áµÖ”a“e‰A £¨´á»¡“eŠa. ””eÐe Ó±·¡”a.');
              Print(13,' ˆa ¹v”a“eˆé ·¥¸÷Ða a. Ða»¡ e a“e µÅ¸åÓ¡');
              Print(13,'áµA‰A »¥ˆõ·e ´a“¡´¡.  aµA‰A“e ÈiÂ‰Ði ®”e');
              Print(13,'·¡ ·¶‹¡ ˜¢…·¡»¡. ´e¯±Ðœa. ‹aœý»¡ e ”a¯¡“e');
              Print(13,'aµÁ  ei ·¥µe·e ´ô·a“¡Œa.  §iœ‚Ñ©·¡ ¬—‹¡‹¡');
              Print(13,'¯¡¸bÐa“eŠa.  ”a·q ‰·ˆeµA¬á ™¡”a¯¡ Ó±·i ‹©');
              Print(13,'œá´¡ ‰VŠ…. ˆa ·¡ §iœ‚Ñ©¡ —i´áˆe”a¡e ”a¯¡');
              Print(13,'·¡ ‰·ˆe·a¡ µ© ÑÂŸI·¡ ˆá· ¹A¡·¡»¡. Óq,  õ');
              Print(13,'»¥ a· •¡¸å¸aµa ´e‘w.  a“e ·¡œå ‰·ˆe· Ì');
              Print(13,'œá•¢¯aŸi ¶…¡w¸â·a¡ ¤e¥¢Ða“e ¬—¡wÁA¡  È´á');
              Print(13,'e ˆa Àq·a¡ §¡ÀqÐa»¡. ¢ÐeÓ¡  g·e 3 Àa¶¥');
              Print(13,'· ‰·ˆeº—µA¬á ˆa µa‹¡¡ µ¥ˆõ•¡  ·¡ ‰·ˆe·');
              Print(13,'¬—¡w·¡ {i˜Œa»¡•¡ Ðe¤å ·¶·iŒa  iŒaÐe ÓŠá');
              Print(13,'Ðe ·©·¡´ö”a‰¡ ‹¡´âÐ”aµ¡.  ·¡¹A §iœ‚Ñ©·¡ µÅ');
              Print(13,'¸åÓ¡ ¬—‰vŠ…. ¸a! a·  õ»¥ •¡¸å¸a Ã¥Šµa µw');
              Print(13,'¶¥Ó¡ ´e‘w ! !');
              talk('');
              End_Demo;
           end;
      27 : if wantexit then begin
              with party do begin
                 xaxis := 20; yaxis := 8; map := 1;
              end;
              load;
              scroll(TRUE);
           end
           else begin
              if y < 25 then inc(y) else dec(y);
              scroll(TRUE);
           end;
   end;
end;
 
Procedure specialevent;
begin
   if party.map < 17 then specialevent_part1 else specialevent_part2;
end;

begin
end.