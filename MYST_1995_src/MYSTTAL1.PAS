Unit MystTal1;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystBatt, MystEnd;

 Procedure TalkMode_Sub2;


IMPLEMENTATION

Procedure TalkMode_Sub2;
begin

   Clear;

   if mapname = 'Menace' then begin
      if at(27,32) then begin
         Print(7,' µ¡, '+player[1].name+'.');
         Print(7,' µ¡“i ·©•¡ ”a {–Š…¶a. ¸a, µa‹¡ ·©”w ¤h·a');
         Print(7,'¯¡µ¡.');
         Print(7,'');
         Print(11,' [ Ñ×‹q + 4 ]');
         inc(party.gold,4);
         j := 43;
         for i := 33 to 38 do begin
            PutMap(27,i-1,j);
            j := map^[27,i];
            PutMap(27,i,21);
            delay(1000);
            Silent_Scroll;
         end;
         PutMap(27,38,j);
      end;
      if at(24,34) then begin
         Print(7,' ”w¯¥·¡ µa‹¡ aÈaa”a“¡ ¸÷ i ¨å¨å¯aœóŠ….');
         Print(7,'¬aœq·i º‚µa ‘½‰¡•¡ ÈµeÐeÀâ Ða”a“¡...');
      end;
      if at(35,41) then begin
         Print(7,' ¡y ˆ¶© ¸å· ¬aˆå·e ·¸´á¤áŸ¡‰A. ·¡‰µµA ·¶');
         Print(7,'“e ”¦¦…· ‰×¦—i·e  ¸a‘Aˆa ¬i·¥·i Ð–”a‰¡');
         Print(7,'“e £¨»¡ ´g‘A. ”e»¡ ¸a‘Aˆa ´¢ˆe ¶…·¡ a¨v”å');
         Print(7,'ˆá»¡');
      end;
      if at(15,36) then begin
         Print(7,' ˆa ¸åÐ—i·e ¸å¬éµA ·Ða¡e  ¡´á ”ŸB »¡');
         Print(7,'ÐaµA Ða•A¯a ÉAœaœa“e »¡Ða ”ŸB·¡ ·¶”a‰¡ —i');
         Print(7,'´ö”a‘A. Ða»¡ e ¸å¬é·¥•A ¢¡.');
      end;
      if at(27,26) then begin
         Print(7,' ¸a‘A ·¡ˆõ ¹± ¥Á. ·¡ˆå ˆa µ¡œ ¸åµA ‰×¬e');
         Print(7,'·©·i Ða¡e¬á ¤i‰eÐe ˆå•A ·¡¬wÐe ¸ñ·¡ ·¶´á.');
         Print(7,'·¡ˆå ´á˜å Ñw¯¢· Îa·q ¢…¸aˆa ¸âÓ¥ ¬âÌe·¥•A');
         Print(7,'‰·Ša³‰A•¡ 30 e‘e ¸å »¡ÃwµA¬á aµÖ”a‘A. ‹a');
         Print(7,'Ÿ¡‰¡  ·¡ˆå ”á µ¡œ–E »¡ÃwµA¬á aµ¥  ‰·žw·');
         Print(7,' áŸ¡©a·¥•A   a¤ó·a¡ ‰ÅÉ· ”wÐe Š ÷·¡ ¬å¡w');
         Print(7,'Ða‰A aÈaa ·¶”a‘A.  ‰·žw‰Á ·¥ŸA“e ¬á¡ ”a');
         Print(7,'Ÿe ¯¡”Ÿi ¬i´v“e•A ·¡ˆå ¸÷ i ·¡¬wÐa»¡ ´g·e');
         Print(7,'ˆa ?');
      end;
   end;

   if mapname = 'OrcTown' then begin
      h := 0;
      if at(10,39) then begin
         h := 1;
         if getbit(7) then begin
            Print(7,' ¹A¤i ¬ia º¯³¯¡¶a.  ¸á“e µaÈŒõ qµA‰A Ð');
            Print(7,'Ðe ¤å ´e·³Ó¡‰¡ ¬i´aµÖ¯s“¡”a.');
         end else begin
            Print(7,' ”w¯¥ ´|· µ¡Ça º£¥·¡ ¢´áœa ”w¯¥µA‰A ´¶¥');
            Print(7,'Ða“e—u Ð–»¡ e ´i´a—i·i ®“e ´ô´ö”a.');
         end;
         PressAnyKey;
     end;
      if at(9,19) then begin
         h := 2;
         if getbit(7) then begin
            Print(7,' ¶Ÿ¡“e  ”w¯¥‘A ·¥ˆe—iµA‰A  ´a¢œå a«e»µ•¡');
            Print(7,'´eÐ–“e•A µá ”w¯¥—i·e ¶Ÿ¡Ÿi ¡µ ¬i‰A Š“e ˆó');
            Print(7,'“¡Œa ?');
            PressAnyKey;
         end;
      end;
      if at(13,12) then begin
         h := 3;
         if getbit(7) then begin
            Print(7,' a“e ·¡‰µµA¬á 50‘e ˆaŒa·¡ ‘·¬a e »¡·a¡a ¬i');
            Print(7,'´aµÖ­¡.  ·¡‰µ ¤c·a¡ aˆa¥¥ ¸â•¡ ˆá· ´ô‰¡,');
            Print(7,'”á¶‹¡ ·¥ˆeµA‰A £»¥¡·© »µ•¡ Ða»¡ ´g´v­¡. ‹a');
            Print(7,'œå•A µá ”w¯¥—i·e ¶Ÿ¡  a·i·i »µ¤l‰¡ ¶Ÿ¡ •·');
            Print(7,'¹¢·i º‚·¡aÐaµ¡?');
         end else begin
            Print(7,' ”w¯¥ ´|µA ·¶“e “j·e µ¡Çaˆa ”w¯¥µA‰A ¢´áœa');
            Print(7,'»©À‚Ða“e—u Ðaµv·aa •¡¢»¡  i·i ´i´a—i·i ®');
            Print(7,'ˆa ´ô´ö”a.');
         end;
         PressAnyKey;
      end;
      if at(21,9) then begin
         h := 4;
         if getbit(7) then begin
            Print(7,' ¦…¡w µ¡Ça¹¢ º—µA¬á•¡ a«e¸aˆa ·¶´á¬á  »¡a');
            Print(7,'ˆa“e µaÐ—¸a—i·i ¶áÑsÐa‹¡•¡ Ð–”å‰A ¬a¯©·¡µ¡.');
            Print(7,'Ða»¡ e  ”¦¦…·e ¬åœ·Ðe µ¡Ça—i·¡œeˆé ´i´a–');
            Print(7,'¯¡µ¡.');
            PressAnyKey;
         end;
      end;
      if at(43,12) then begin
         h := 5;
         if getbit(7) then begin
            Print(7,' ”w¯¥‘A—i·¡  ·¡œý‰A ¶Ÿ¡—i·i  ¡µ¬i‰A Š…”a¡e');
            Print(7,'µ¡ÇaÇ·“±·¡ ˆa e ·¶»¡ ´g·i ˆõ·³“¡”a.');
            PressAnyKey;
         end;
      end;
      if at(44,30) then begin
         h := 6;
         if getbit(7) then begin
            Print(7,' ¶Ÿ¡—i·e µA·¥­eËa ·¡§i“±·i ¸÷¯¥¸â·¥ »¡•¡¸a');
            Print(7,'¡ ¬—ˆbÐa‰¡ ·¶¯s“¡”a.');
            PressAnyKey;
         end;
      end;
      if at(35,29) then begin
         h := 7;
         if getbit(7) then begin
            Print(7,' ¡—a´e·e ·¡ ­A‰· ¸â·³“¡”a.  ‹aŸ¡‰¡  ‹aŸi');
            Print(7,'˜aŸa“e ”w¯¥•¡ ¸â·³“¡”a.');
         end else begin
            Print(7,' ”w¯¥´|µA ·¶“e µ¡Ça À÷‘e·e  ”w¸w·¡œa•¡ ”ia');
            Print(7,'—i—u·¡ ”w¯¥µA‰A ¢´áœa ­¡Ÿ¡Áa”–”a.');
         end;
         PressAnyKey;
      end;
      if at(41,39) then begin
         h := 8;
         if getbit(7) then begin
            Print(7,' ¶Ÿ¡ ¦¹¢· ´aÇ¡¡A·¡»¡“e Å¡¥©Ëa¹¢· µ×µA‰A');
            Print(7,'¬á  a¤ó·i ¤¶¶¯s“¡”a.  ‹aœa¡e Â—¦…Ó¡ ”w¯¥·i');
            Print(7,' ½¸·i ˆó“¡”a.');
            PressAnyKey;
         end;
      end;
      if h > 0 then begin
         Print(7,' ”w¯¥ ´|µA ·¶“e µ¡Ça¹¢·i  ”w¯¥·e  ´á˜ý‰A Ði');
         Print(7,'ˆõ·¥ˆaŸi ¬åÈ‚Ða¯¡µ¡.');
         m[0] := '';
         m[1] := 'º‚µa ¤áŸ¥”a';
         m[2] := '‹a· ¬ia º…”a';
         k := Select(110,2,2,FALSE,TRUE);
         if k = 1 then begin
            enemynumber := 1;
            joinenemy(1,18);
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            PutMap(x+x1,y+y1,34);
            Scroll(TRUE);
            setbit(57+(h-1));
         end;
         exit;
      end;
      if at(25,42) or at(25,43) then begin
         Print(7,'  a·i· ¢… ´|·i »¡Ç¡‰¡ ·¶“e µ¡Çaˆa ”w¯¥µA‰A');
         Print(7,'·¥ˆe·  i¡ ·¡œý‰A  iÐ–”a.');
         Print(7,'');
         Print(7,'');
         Print(13,' ·¥ˆe·e µ¡Ça  a·iµA —i´á µ© ® ´ô­¡.');
         Print(13,' °â ¢‰œáa¯¡µ¡ !!');
         m[0] := '';
         m[1] := '´i´v­¡, aˆa¡e –Iˆá ´a“¡µ¡';
         m[2] := '”w¯¥—i·i ³aœá›aŸ¡‰¡ »¡aˆa´¡‰V­¡';
         k := Select(180,2,2,FALSE,TRUE);
         if k = 2 then begin
            enemynumber := 7;
            for i := 1 to 7 do joinenemy(i,19);
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            PutMap(25,42,43); PutMap(25,43,43);
            setbit(53);
         end;
      end;
      if at(24,20) or at(26,20) then begin
         enemynumber := 6;
         for i := 1 to 3 do joinenemy(i,19);
         joinenemy(4,20);
         for i := 5 to 6 do joinenemy(i,21);
         DisplayEnemies(TRUE);
         if getbit(7) then begin
            Print(13,' ·¥ˆe·e ¸é” ·¡‰µ·a¡ —iµa ¥¡»¡ ´g‰V”a.');
            Print(13,'¸a! ”ñ¥aœa.');
         end else begin
            Print(7,' ¢¸w·i ¹A¤ó ˆxÂ… 2¡w· µ¡Ça ¸å¬aµÁ ”aŸe ¸å');
            Print(7,'Ê¬a—i·¡ ”w¯¥·i ‰·‰bÐa‹¡ ¯¡¸bÐ–”a.');
         end;
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         PutMap(24,20,43); PutMap(26,20,43);
         setbit(54);
      end;
      Scroll(TRUE);
      exit;
   end;

   if mapname = 'Vesper' then
   if Real_Map(x+x1,y+y1) = 53 then begin
      if getbit(9) then begin
         Print(13,' ´a»¢•¡ q·e ·¥ˆe·¡ ·¶´ö”a“¡... á•¡ aµA‰A');
         Print(13,'º‚´áº¡´¡‰V”a.');
      end else begin
         Print(7,' ”w¯¥ ´|· Ëa©·¡ ¢´áœa  iÐ–»¡ e ´i´a —i·i');
         Print(7,'®ˆa ´ô´ö”a.');
      end;
      PressAnyKey;
      if at(30,19) then begin
         enemynumber := 7;
         joinenemy(1,28);
         for i := 2 to 7 do joinenemy(i,27);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' ”w¯¥·¡ ¸â—i·i ¢‰Ÿ¡Ã¡¸a •·Š‰­¢µA¬á isÐa‰A');
         Print(7,'¬—‹¥ Ëa©·¡ ˆé´á aµÖ”a.');
         Print(7,'');
         if getbit(9) then begin
            Print(13,' ·q... a· ¦Ða—i·i ¢‰Ÿ¡Ã¡”a“¡ ¹A¤ó ¯©b·¡');
            Print(13,'·¶“e ˆõˆ{Š….  Ða»¡ e  ‘Aˆa ·¡ •·Š‰µA —i´áµ¥');
            Print(13,'ˆõ·e ¸÷ i Çe ¦‰¶…·¡œeˆé ¡w¯±Ðœa. ¤a¡ ¥A¯a');
            Print(13,'Ìá ¸ñw”· ”¸w·¥ Ëa© ´q¬i¸a“±·¡  ¤a¡ a');
            Print(13,'·¡“¡Œa.');
         end else begin
            Print(7,' ‹aŸ¡‰¡“e •¡¸áÓ¡ ´i´a—i·i® ´ô“e  i·i ¡y  a');
            Print(7,'—¡ »¡Œé·¡”á“¡ ”w¯¥µA‰A ”ia —i´ö”a.');
         end;
         PressAnyKey;
         enemynumber := 8;
         for i := 1 to 2 do joinenemy(i,28);
         for i := 3 to 6 do joinenemy(i,27);
         joinenemy(7,30);
         joinenemy(8,29);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(14,' ”w¯¥·e Ëa© ´q¬i¸aŸi ÀáÃ¡Ð–”a.');
         Print(11,'[ ”aÇa ÇaŸ¡¯aÈi + 1]');
         inc(party.crystal[3]);
         PutMap(30,19,43);
         setbit(65);
         setbit(1);
      end;
      if at(50,19) then begin
         enemynumber := 7;
         for i := 1 to 3 do joinenemy(i,28);
         for i := 4 to 6 do joinenemy(i,27);
         joinenemy(7,29);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ £¥Àó¬÷ + 1 ]');
         for i := 1 to 6 do
         with player[i] do
         if name <> '' then begin
            if agility < 20 then inc(agility);
         end;
         PutMap(50,19,43);
         setbit(66);
      end;
      if at(64,26) then begin
         enemynumber := 7;
         joinenemy(1,26);
         for i := 2 to 6 do joinenemy(i,27);
         joinenemy(7,28);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ‹qÑÁ + 20000 ]');
         party.gold := party.gold + 20000;
         PutMap(64,26,43);
         setbit(67);
      end;
      if at(61,38) then begin
         enemynumber := 6;
         for i := 1 to 4 do joinenemy(i,27);
         for i := 5 to 6 do joinenemy(i,26);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ¯¢œ· + 50 ]');
         if party.food + 50 < 256 then inc(party.food,50)
         else party.food := 255;
         PutMap(61,38,43);
         setbit(68);
      end;
      if at(40,40) then begin
         enemynumber := 7;
         for i := 1 to 5 do joinenemy(i,26);
         for i := 6 to 7 do joinenemy(i,28);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ‰¥¥· + 5 ]');
         if party.BackPack[2,1] + 5 < 256 then inc(party.BackPack[2,1],5)
         else party.BackPack[2,1] := 255;
         PutMap(40,40,43);
         setbit(69);
      end;
      if at(22,40) then begin
         enemynumber := 7;
         for i := 1 to 6 do joinenemy(i,27);
         joinenemy(7,28);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ÑÁ¬i + 30 ]');
         if party.arrow + 30 < 65536 then inc(party.arrow,30)
         else party.arrow := 65535;
         PutMap(22,40,43);
         setbit(70);
      end;
      if at(20,26) then begin
         enemynumber := 5;
         for i := 1 to 5 do joinenemy(i,27);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            x := Map_Header.StartX;
            y := Map_Header.StartY;
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(11,' [ ‹qÑÁ + 1000 ]');
         party.gold := party.gold + 1000;
         PutMap(20,26,43);
         setbit(71);
      end;
      Silent_Scroll;
      exit;
   end else begin
      if not at(47,55) then begin
         Print(7,' ”w¯¥ ´|µA“e ÑwÁA•¡ ´i´a¥¡‹¡ Ó±—i ¸÷•¡¡ Àá');
         Print(7,'ÀqÓ¡ ¬iÐ–E ·¥ˆe· ¯¡ÁAˆa ·¶´ö”a.');
      end else begin
         Print(7,' ”w¯¥ ´|· ¯¡ÁA“e ”aŸe ¯¡ÁA—i¥¡”a “x‰A ¬iÐ');
         Print(7,'”wÐ–“e»¡ ¦Ì· ¸÷•¡ˆa ”éÐ–”a.  §¡Ša¸â ÑwÈ');
         Print(7,'Ÿi ´i´a ¥© ® ·¶´ö‹¡µA  ”w¯¥·e ‹a· ¡±·i ¹¡');
         Print(7,'¬aÐa‹¡ ¯¡¸bÐ–”a.');
         Print(7,'');
         if getbit(15) then begin
            Print(7,' Ða»¡ e ”á ·¡¬w ¤i‰e–A»¡ ´g´v”a.');
            exit;
         end;
         delay(1000);
         Print(7,' ‰¨·¡´á ”w¯¥·e ‹a ¯¡ÁA· µ¡Ÿe ­¥µA ¢´åˆaˆa');
         Print(7,'Â ºá´á¹a ·¶·q·i ´i´aÀav‰¡ ‹aˆõ·¡ ¡A­A»¡Ÿi');
         Print(7,'¸åÐa‹¡ ¶áÐe ¡A¡¡ ½¢»¡œa“e ˆõ·i ´i‰A –A´ö”a.');
         Print(7,'”w¯¥·e ‹a· ­¥·i Ía¥¡a Ð–»¡ e ‹a· ¡±·e ¨u');
         Print(7,'¨uÐa‰A Šˆ´á ·¶´ö‰¡ ¹±Àáœñ Íi ®ˆa ´ô´ö”a.');
         if party.item[5] = 0 then exit;
         dec(party.item[5]);
         delay(1500);
         Print(7,'');
         Print(7,' ¢…—b ”w¯¥·e »¡‹q ˆa»¡‰¡ ·¶“e ¦ÑÉ· ´¢Á¡ˆa');
         Print(7,'¬—ˆb·¡ v”a.  §¡¢ »¡‹q· ‹a ¯¡ÁA“e ¬iŸ© ®');
         Print(7,'´ô·i ¸÷•¡¡ ¦ÌÐ–‹¡ ˜¢…µA ¬ia‹¡“e ¦‰ˆa');
         Print(7,'“wÐ–»¡ e  ÂA­¡Ðe º‚·e»¡ ´é a´e–E ¬wÈŒa»¡“e');
         Print(7,' e—i ® ·¶·iˆáœa ¬—ˆbÐ–”a. ”w¯¥·e ‹a ¯¡ÁAµA');
         Print(7,'‰A ¦ÑÉ· ´¢Á¡Ÿi ¬a¶wÐ–‰¡  µ¬w”¡ ‹a· ¡±');
         Print(7,'·e ´¢ˆe· Ïµ‹¡ˆa •©‰A –A´ö‰¡  ´ás»¡´g‰A ‹a');
         Print(7,'· ­¥µA ºáµa»¥  ¹··¡ ½¢»¡Ÿi  ¨‰ ®ˆa ·¶´ö');
         Print(7,'”a. ¶w·e ·¡œáÐ–”a.');
         Print(7,'');
         PressAnyKey;
         Print(15,' Ñ¢¯¡a ·¡ ‹i·i ’ˆa ·ª‹¡Ÿi ¤aœa¡a ...');
         Print(7,'');
         Print(15,' Ëa©¹¢µA ·Ðe ¥A¯aÌá¬÷· ŠA¡i·e µ‰e–A´ö”å');
         Print(15,'ˆáa ”aŸq´ô´ö”a.  ¶Ÿ¡“e ·¥ˆe·¡‹¡µA  ·¥ˆe·');
         Print(15,'Íe·i —i®¤cµA ´ô´ö‰¡  ™¡Ðe ¶Ÿ¡· ‰eÐµÁ ·³');
         Print(15,'¸w·a¡°á ·¡ ¬a¯©·i ”aŸe ”ŸB·a¡ ´iv”a. Ða');
         Print(15,'»¡ e ‹aˆõ·e ¸i¡µ–A´ö”a“e ˆõ·i  ·¡ ´i´v”a.');
         Print(15,'´a a ˆa º‚‰¡ e ¬wÑ×µA¬á· ·¡‰µ·e  ·¥ŸAµÁ');
         Print(15,'Ëa© ¡¡–ˆa ¸a¯¥—i· ¸÷·µA ˜aœa  ¬á¡Ÿi ¸á');
         Print(15,'ºÐa¡a ”Ÿ³Ða‰¡ ·¶·i ˆõ·¡”a. ´á˜ý‰A ¥¡¡e ¬á');
         Print(15,'¡· ·¡·¢·i Àx‹¡¶áÐ  ¡w¦…·i ­A¶‰¡  Ã±œ¢·i');
         Print(15,'¸÷”wÑÁ ¯¡Ç¥”a‰¡ Ði ® ·¶”a. ¶Ÿ¡“e ·¥ˆe·¡‹¡');
         Print(15,'µA ¶Ÿ¡½¢· ¸i¡µ·e ˆqÂa‰¡Ðe”a.  Ðw¬w ”aŸe');
         Print(15,'¹·¹¢· ¸i¡µ·i —iÂ´á¡a ¶Ÿ¡Ÿi ”á¶‚ ˆt»¡‰A');
         Print(15,'ÐµÖ”å‰A ¬a¯©·¡”a. ·¡¤å· ‰w¶•¡ ‹aœý”a. À‚');
         Print(15,'·±·¡ ·¶”a¡e  ¬a¯©¬w ·¡¤å·©·e  ·¥ˆe· À‚·±·¡');
         Print(15,'”á Ça”a.  ¸aÁ¡»¡¹··i  iÐa¸a¡e  ”a·q‰Á ˆ{”a.');
         Print(15,'¶¥œ  ´aÏa¡—¡ÉA ÉAœa“e  Ëa©¹¢· ˜w·¡´ö”a.');
         Print(15,'Ða»¡ e ·¥ˆe· µwµb·i ”á¶‚ ÑÂ¥¡Ðaa“e ´¡¯±µA');
         Print(15,'¬á ¡w¦…·i ­A¶‰¡  ‹a—i· ˜w·i Ã±¤ñÐaµa ¬÷·i');
         Print(15,'ŠÂ‚Ðe ‰µ·¡ ¤a¡ ·¡‰µ ¥A¯aÌá¬÷·¡´ö”a.  ‹aŸ¡');
         Print(15,'‰¡ ‹a ·©·i Á·»¡ÒáÐe ¸a“e ¤a¡ .............');
         Print(7,'');
         PressAnyKey;
         Print(7,' ”w¯¥·¡ µa‹¡Œa»¡ ·ª´áa ˆv·i˜ ‹a ¹··¡ ½¢');
         Print(7,'»¡“e ¬eÑÁÐaµa ‰·º—·a¡ Ó{´á¹a ¤áv”a.  ”w¯¥');
         Print(7,'·e  »¡‹q ·¡ ½¢»¡µA¬á  iÐaa‰¡ Ð–”å ¸a¡¦Èá');
         Print(7,'ÀåŸ¡´e·a¡ ˆq¯¡Ÿi ”wÐa‰¡ ·¶”a“e ¬a¯©·i ®…ˆe');
         Print(7,'Œ”j´v”a.  ”w¯¥·¡ ´i»¡ ¡µÐa“e ¹A 3· ·¥¢‰·¡');
         Print(7,'·¶”a“e ÑÂ¯¥·¡ ˆwÐ»±µA ˜aœa ”á¶‚ ”á ‹¥¸w Ði');
         Print(7,'® ¤cµA ´ô´ö”a.  Ða»¡ e ”á ·¡¬w· ¥eÑÁ“e ·©');
         Print(7,'´áa»¡ ´g´v”a.');
         PressAnyKey;
         setbit(15);
      end;
   end;

   if mapname = 'TrolTown' then
   if Real_Map(x+x1,y+y1) = 54 then begin
      if at(25,8) or at(26,8) then begin
         if (not getbit(16)) and getbit(9) then begin
            Print(13,' ´a“¡! ·¡‰µŒa»¡ ·¡¤w·¥·¡ Áa—i´á µ¡”a“¡.... ');
            Print(13,'a“e ·¡‰µ· µ×·¥  Ëa©Ç··¡œa‰¡ Ða“e•A  ¶Ÿ¡');
            Print(13,'Ñs¬w·a¡ Ð‰iÐa“e‰A ´á˜ý‰V“eˆa?');
            m[0] := '';
            m[1] := '‹aœñ ¹¡ˆå¦Èá —i´á¥¡‰V­¡';
            m[2] := 'Ñs¬w·e Ï©¶a´ô­¡';
            k := Select(140,2,2,FALSE,TRUE);
            if k = 1 then begin
               Print(13,' ”w¯¥·¡ ¢¯e ¡¢¸â·a¡  a· ¤wŒa»¡ Áa—i´áµÁ');
               Print(13,'¬á aŸi º‚·¡a Ða“e»¡ ¡¡Ÿa‰V»¡ e  ´á¼–—e ”w');
               Print(13,'¯¥·¡ µa‹¡¬á ¢‰œáa º…”a¡e »¡‹q ·¡ ¬w¸a ´eµA');
               Print(13,'·¶“e ‹q· ¸é¤e·i ”w¯¥µA‰A º‰V”a. ·¡ ¸÷•¡¡e');
               Print(13,'Â—¦…Ðeˆa?');
               m[0] := '';
               m[1] := '¹½­¡, ·¡ˆé ¤h‰¡ ¢‰œá a»¡¶a';
               m[2] := '‹a ¬w¸a ´e· ‹q·i ¡¡– º¯¡µ¡';
               k := Select(150,2,2,FALSE,TRUE);
               if k = 1 then begin
                  Print(7,' ”w¯¥·e Ëa©Ç·µA‰A ‹q·i ¤h‰¡“e  •·Š‰ ¤c·a¡');
                  Print(7,'aµÖ”a.');
                  setbit(16);
                  DefaultExit;
                  exit;
               end;
            end;
         end;
         Print(7,' ®…ˆe ¬as‰A ¬—‹¥ – ¡w· Ëa© ¸å¬aµÁ   a¤ó');
         Print(7,'¬a ¥¢¸w· Ðe ¡w·¡ aÈav”a.');
         if getbit(9) then begin
            Print(7,'');
            Print(13,' ¶Ÿ¡“e Ëa©Ç·“±· ¯¥¥e ¥¡Ñ¡Ÿi  {‰¡ ·¶“e Ëa');
            Print(13,'©· ‰×¸å¬a—i‰Á ¶á¸á—a·¡”a. ¶Ÿ¡—i·e ¡¢®‘·i');
            Print(13,'ˆé‰¡ ”w¯¥—i¡¦Èá ¶Ÿ¡· µ×·i »¡Ç© ˆõ·¡”a.');
         end;
         enemynumber := 7;
         for i := 1 to 4 do joinenemy(i,32);
         for i := 5 to 6 do joinenemy(i,33);
         joinenemy(7,34);
         DisplayEnemies(TRUE);
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' ”w¯¥·e ‰wÑ¡”¶¥—i·i ¢‰Ÿ¡Ã¡‰¡“e –áµA¬á ¤é¤é');
         Print(7,'˜é‰¡ ·¶“e Ëa©Ç·µA‰A ˆñ·i ‰a’´ö”a. ‹a“e ˆó');
         Print(7,'µA »©Ÿ¥À º¸á ´g´v‰¡ ”w¯¥·e ‹aŸi ”e®‘µA ¥A');
         Print(7,'´á¤áv”a.');
         Print(7,'');
         Print(14,' ·¡¹A ”w¯¥·e ¸å‰Á¸a ¯¥¦…·¡œa‹¡¥¡”a“e µw¶—·a');
         Print(14,'¡°á ¡´á¬÷µA ŠáÑÅ Ði ® ·¶‰A –A´ö”a.');
         party.etc[20] := 4;
         setbit(4);
         setbit(72);
         PutMap(25,8,44); PutMap(26,8,44);
         Scroll(TRUE);
         exit;
      end;
      if at(17,19) then begin
         enemynumber := 7;
         for i := 1 to 3 do begin
            joinenemy(i,20);
            enemy[i].name := 'Ëa© »¢·A¸á';
            enemy[i].level := 6;
         end;
         for i := 4 to 6 do joinenemy(i,28);
         joinenemy(7,34);
         DisplayEnemies(TRUE);
         if getbit(9) then begin
            Print(13,' ˆqÓ¡ Ëa©· ¥¡¢‰·i ÈiÂáÐaa‰¡  ·¡‰µµA µ¡”a');
            Print(13,'“¡! a“e ·¡ ¥¡¢‰Àw‰¡· ‰w§¡”¸w·a¡°á  ¡¢®‘');
            Print(13,'·i ˆé‰¡ ¥¡¢‰·i »¡Ç©ÉA”a.');
            PressAnyKey;
         end;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(73);
         PutMap(17,19,44);
         Scroll(TRUE);
         exit;
      end;
      if at(34,19) then begin
         enemynumber := 7;
         for i := 1 to 4 do joinenemy(i,31);
         for i := 5 to 6 do joinenemy(i,32);
         joinenemy(7,33);
         DisplayEnemies(TRUE);
         if getbit(9) then begin
            Print(13,' ¤a¡ áÓ—i·¡ ¶Ÿ¡ •·Š‰µA ¸sÑa ·¶“e ·¥ˆe—i');
            Print(13,'·i ŠÐaœáµ¥ ¸a—i·¥ˆa? Ða»¡ e a· ÌaŠA  a¤ó');
            Print(13,'´|µA¬á“e áÓ—i· ¤¼w•¡ ¬e¬eÓ¡ ¦­a¹a ¤áŸ©');
            Print(13,'ˆõ·¡”a.');
            PressAnyKey;
         end;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(74);
         PutMap(34,19,44);
         Scroll(TRUE);
         exit;
      end;
      if at(13,32) or at(13,33) then begin
         enemynumber := 8;
         for i := 1 to 4 do joinenemy(i,31);
         for i := 5 to 8 do joinenemy(i,28);
         DisplayEnemies(TRUE);
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(75);
         PutMap(13,32,44); PutMap(13,33,44);
         Scroll(TRUE);
         exit;
      end;
      if at(38,32) or at(38,33) then begin
         enemynumber := 8;
         for i := 1 to 2 do joinenemy(i,26);
         for i := 3 to 5 do joinenemy(i,31);
         for i := 6 to 8 do joinenemy(i,28);
         DisplayEnemies(TRUE);
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(76);
         PutMap(38,32,44); PutMap(38,33,44);
         Scroll(TRUE);
         exit;
      end;
      if at(24,67) or at(25,67) or at(26,67) then begin
         enemynumber := 8;
         for i := 1 to 8 do begin
            joinenemy(i,20);
            enemy[i].name := 'Ëa© »¢·A¸á';
            enemy[i].level := 5;
         end;
         DisplayEnemies(TRUE);
         if getbit(9) then begin
            Print(13,' áÓ—i·i ¸é” ·¡ ´e·a¡ —iµa ¥¡‰® ´ô”a!!');
            PressAnyKey;
         end;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(77);
         PutMap(24,67,44); PutMap(25,67,44); PutMap(26,67,44);
         Scroll(TRUE);
         exit;
      end;
      h := 0;
      if at(6,31) then begin
         h := 1;
         if getbit(9) then begin
            Print(7,' i ¹A¤i ¬ia º¯¡µ¡.  a“e ·¡‰µ· ¢‰Ÿ¡Ðb¸a');
            Print(7,'·¥•A  ”w¯¥µA‰A º—¶aÐe ¤i‰eÐaaŸi ´iaº‰ÉA“¡');
            Print(7,'¹A¤i ¡¢®‘ e·e ¬iaº¯¡µ¡.');
            m[0] := '';
            m[1] := '¹½­¡, Ðe¤å —i´á¥³¯¡”a';
            m[2] := 'i ­¢·¡a‰¡ —a“eŠ…, ¸a º‚´áœu!';
            k := Select(120,2,2,FALSE,TRUE);
            if k = 1 then begin
               Print(7,' µ¡, ¸÷ i ˆq¬aÐaµ¡. a“e —aœaÅ¡“¡´e¹¢µA‰A¬á');
               Print(7,'¢‰Ÿ¡Ðb·i ¤¶‰¡ ·¡‰µµA µÖ”å Àq·¡œaµ¡.  a“e');
               Print(7,'Àa¶¥µA ‰ÅÐe µaœáˆa»¡ µeŠŸi Ð–´ö­¡.  ‹aœá”å');
               Print(7,'º—µA  a“e ¡´á ­A‰µA¬á•¡ ”aŸe Àa¶¥·a¡ ˆa');
               Print(7,'“e ‹©·¡ ·¶”a“eˆé ´i´a–­¡. ‹a‰µ· º—b·e ¢');
               Print(7,'¯e ·¡·AµA¬á·¥»¡ ¬w”wÓ¡ £©•¡ˆa ‘¼‰A ´sÂ‚–A´á');
               Print(7,'·¶´ö‰¡ È´·· ·¥b·¡ ¤e”¡ ¸b¶wÐa“e ¸a¸÷¢');
               Print(7,'sµA“e ‹a »¡µb· ‰·ˆe·¡ ·©‹aœá¹a  ”aŸe ­A‰');
               Print(7,'¡· ¢…·¡ µiŸ¡“e ˆõ·i  ¡¢‰bÐ–­¡.  ‹a ‰·ˆe·');
               Print(7,'Àw·i É·Ð ˆa ¥¥ˆõ·e  ÐáÐá ¤éÌe·¡a º‚´áˆa');
               Print(7,'“e Ð—¬÷·  ÂAÒ· ¡¡¯sˆ{·e ˆõ—i•¡  ·¶´ö»¡ e');
               Print(7,'˜˜¡  ¬—¡wÁAˆa ¬a“e ¥i—i‰Á µe‰i –A“e ˆõ•¡');
               Print(7,'ÑÂ·¥Ð–­¡.  ˆá”Ðe ÌaÂ—ŸAˆa  ¬a“e ‰µ•¡ ·¶‰¡,');
               Print(7,'‹A»©· ¡±š—·¡Ÿi ˆa»¡‰¡ »©­¡Ÿi  a¯¡¡a ¬—ÑÉÐa');
               Print(7,'“e ¬—¢‰•¡ ¥¡´v­¡. ‹aº—µA¬á•¡ ˆa ˆa¸w ‰Å¯±');
               Print(7,'·¶‰A ¥¥ ˆõ·e, ¶Ÿ¡µÁ ˆ{·¡ C,H,O,N ·a¡ Š¬÷');
               Print(7,'–E Ï¡¦Ÿi ˆa»¡‰¡  ¬eÑÁ¸b¶w·a¡ ATPŸi Ðs¬÷Ða');
               Print(7,'“e ¬—¢‰·¡ ¬a“e ‰µ·¡´ö­¡. ‹a—i·e  a¤ó•¡ ¬a¶w');
               Print(7,'Ði º‰ ¡¡Ÿa‰¡ ¬—ÑÉÐa‰¡ ·¶»¡ e  ””eÐe ¬i¬w¢');
               Print(7,'‹¡Ÿi  g·¡ ¥¡·AÐa‰¡ ·¶´ö­¡.  ™¡Ðe ''“A¶b''·¡œe');
               Print(7,'•¡¯¡Ÿi ¥¡´v·i˜ ¸÷ i ‹a—i· ‰ÁÐbb‰Á ˆåÂ‚‹¡');
               Print(7,'®‰µA Èe¥¢Ða‰¡  i´v­¡. ”w¯¥•¡   i·i £¨·i®');
               Print(7,'·¶‰V­¡?');
               Print(7,'');
               PressAnyKey;
               k := 0;
               for i := 5 downto 2 do
               if exist(i) then k := i;
               if k > 0 then begin
                  s := player[k].name + ReturnBJosa(player[k].name);
                  Print(7,' ‹a˜ ”w¯¥ µ|µA ·¶”å '+s+' ˆñ·i —i´á ‹aŸi Ÿ¡Áv”a.');
                  Print(7,' ®…ˆe¸â·a¡ ·©´áe ·©·¡œa ´a¢•¡ ­¥·i ³i ®');
                  Print(7,'ˆa ´ô´ö”a. ‹aŸ¡‰¡ ·©Ð——iµA‰A  iÐ–”a.');
                  Print(7,'');
                  Print(10,' ÁU, ·¡œå ˆó¸w·¡ˆa »¡´á“e  i·i  £¨‰¡ ·¶”a');
                  Print(10,'“¡... ¸a‘A—i ´á¬áˆa‰A. ·¡œå•A¬á ¯¡ˆe·i w§¡');
                  Print(10,'Ð ¤áŸ¡¡e ¶Ÿ¡ e ¦‰Ÿ¡Ð»¥”a‘A.');
                  PutMap(6,31,44);
                  Silent_Scroll;
                  setbit(78);
                  PressAnyKey;
                  Print(7,' ”w¯¥·e ‹aœ•¡ ´a®á¶…  a·qµA Ðe  a—¡Ÿi ”å¹v');
                  Print(7,'”a.');
                  Print(7,'');
                  Print(9,' ·¡ˆå ¸a‘Aˆa ¹± ¯±Ð–‘A.  ‹a·  i·¡ Ñ×”wÐa‹¡');
                  Print(9,'“e Ð–»¡ e  ˆá»µ·¥ˆõ ˆ{»¡“e ´g´v”a‰¡  ¬—ˆbÐa');
                  Print(9,'‘A. ·¡µ× —i·eˆå•A ‹a ¸w­¡Œa»¡ ´i´v·a¡e ¹½´v');
                  Print(9,'·iˆé...');
                  exit;
               end;
            end;
         end;
      end;
      if at(9,30) then begin
         h := 2;
         if getbit(9) then begin
            Print(7,' ·a´b! ·¥ˆe·¡”a ¡¡– •¡ wÁaœa!  ·¥ˆe·¡ ¶Ÿ¡');
            Print(7,'•·Š‰µA Ã±·³Ð–”a.');
            PressAnyKey;
         end;
      end;
      if at(7,33) then begin
         h := 3;
         if getbit(9) then begin
            Print(7,' ¸÷ i ”w¯¥—i·e »³¶aÐaŠ…¶a. ™¡ ¶Ÿ¡µA‰A ÐŸi');
            Print(7,'·³Ó¡a Áa—i´áµ¡”a“¡...');
            PressAnyKey;
         end;
      end;
      if at(11,35) then begin
         h := 4;
         if getbit(9) then begin
            Print(7,' ”w¯¥—i·¡ aŸi º‚·¡”áœa•¡ a· ¯¥·¥  µA·¥­e');
            Print(7,'Ëa ·¡§i“±·¡ ¥¢®Ÿi Ð º¯© ˆó“¡”a.');
            PressAnyKey;
         end;
      end;
      if at(40,30) then begin
         h := 5;
         if getbit(9) then begin
           Print(7,' Ã±œ¢¸a !!');
            PressAnyKey;
         end;
      end;
      if at(41,35) then begin
         h := 6;
         if getbit(9) then begin
            Print(7,' ´a·¡‰¡, ¶á”Ða¯¥ ¶w¬a“±—i.  ¹A¤i ¸áµA‰A ÑA');
            Print(7,'¡·¥ º¬aŸi ¹± ‘Á º¯³¯¡¶a. ¦ÈbÐs“¡”a.  »¡');
            Print(7,'‹q ÑA¡·¥·i  x»¡ ´g·a¡e º‚·i ˆõ ˆ{¯s“¡”a.');
            PressAnyKey;
         end;
      end;
      if at(43,32) then begin
         h := 7;
         if getbit(9) then begin
            Print(7,' ”w¯¥‘A ·¥ˆe—i·e  ¶Ÿ¡ Ëa©¹¢µA‰A¬á ‹q·i ¨•');
            Print(7,'‹¡¶áÐ,  »¥É·‰Á ¬é¬aµA ¹½”a“e ¡w¡¢·a¡ ÑA¡');
            Print(7,'·¥·i º¬aÐa‹¡ ¯¡¸bÐ–­¡.  ‹a ˜¢…µA ¬w”w®·');
            Print(7,'Ëa© º£¥—i·¡ ÑA¡·¥ º—•¢µA ‰¡¬—Ða¡a,  ™¡Ðe');
            Print(7,'ÑA¡·¥·i ŠÐa‹¡ ¶áÐ  ·¥ˆe—iµA‰A   g·e ‹q·i');
            Print(7,'»¡¦‰Ða‰¡ ·¶­¡.');
            PressAnyKey;
         end;
      end;
      if at(45,34) then begin
         h := 8;
         if getbit(9) then begin
            Print(7,' ·a·b, ¹A¤i ÑA¡·¥ ¹± ‘Á º¯³¯¡µ¡. ‹q ·©  e');
            Print(7,'ˆŸi —aŸ¡Ÿ¡”a.');
            PressAnyKey;
         end;
      end;
      if h > 0 then begin
         if not getbit(9) then begin
            Print(7,' ”w¯¥ ´|· Ëa©¹¢·¡ ”w¯¥µA‰A ¢´áœa  i·i Ð–');
            Print(7,'»¡ e ´i´a —i·i ®ˆa ´ô´ö”a.');
            PressAnyKey;
         end;
         Print(7,' ”w¯¥ ´|µA ·¶“e Ëa©¹¢·i  ”w¯¥·e  ´á˜ý‰A Ði');
         Print(7,'ˆõ·¥ˆaŸi ¬åÈ‚Ða¯¡µ¡.');
         m[0] := '';
         m[1] := 'º‚µa ¤áŸ¥”a';
         m[2] := '‹a· ¬ia º…”a';
         k := Select(110,2,2,FALSE,TRUE);
         if k = 1 then begin
            enemynumber := 1;
            joinenemy(1,25);
            DisplayEnemies(TRUE);
            BattleMode(TRUE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            PutMap(x+x1,y+y1,44);
            Scroll(TRUE);
            setbit(78+(h-1));
         end;
         exit;
      end;
   end else begin
      if at(37,17) then begin
         Print(7,' ”w¯¥—i·¡ ¶Ÿ¡Ÿi ŠÐaœá µ¥ ¬aœq—i·¡µ¡? ¸÷ i');
         Print(7,'ˆq¬aÐaµ¡.  ­¡¢…µA ·Ða¡e ¥A¯aÌá¬÷·¡  µÅ¸åÓ¡');
         Print(7,'¸å¡i ”wÐ–”a“e•A ‹a  i·¡ ¬a¯©·¡µ¡?  ‹aœý”a¡e');
         Print(7,'¸÷ i ·Aˆq·¡Š…¶a.');
         PressAnyKey;
         Print(7,' a“e ¥A¯aÌá¬÷µA¬á ¥AÇaž‚¯aœa‰¡ ¦‰Ÿ¡”å ¬aœq');
         Print(7,'·¡µ¡.  a“e ”e•¢·a¡ Ëa©Ç··i ¸s‹¡¶áÐ µa‹¡');
         Print(7,'¡ ¸q·³Ð–”aˆa  ¸â· ®•¸aµA £©a¬á Í¡¡¡ ¸s');
         Print(7,'Ña¤áv­¡. ·©”·©· ”‰i·¡œa¡e ¸a¯¥·¡ ·¶´ö“e');
         Print(7,'•A ¸â· ®ˆa ¶¡b  g´a¬á ·¡œå ‰µŒa»¡ ¸sÑaµ¡');
         Print(7,'‰A –A´ö”åˆá¶a.  a“e ·¡ ·©¡  ”á¶‚ Èa¹·¹¢µA');
         Print(7,'”Ðe £¡¶‘·¡ Äá¹a ¤áv­¡. a“e ”w¯¥—iµA‰A »¥');
         Print(7,'¸÷·a¡ ¦ÈbÐaa Ða‰V­¡.  aŸi ”w¯¥· ·©Ð—µA');
         Print(7,'ý´á º¯¡µ¡.');
         m[0] := '';
         m[1] := '”w¯¥· ¦Èb·i —i´áº‰V­¡';
         m[2] := '£¡´eÐa»¡ e ‹aœå ´ás‰V­¡';
         if Select(220,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := '¥AÇaž‚¯a';
                  sex := male;
                  class := 1;
                  classtype := magic;
                  level := 9;
                  strength := 10;
                  mentality := 17;
                  concentration := 18;
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
                  weapon := 0;
                  shield := 0;
                  armor := 1;
                  potential_ac := 1;
                  sword_skill := 40;
                  axe_skill := 40;
                  spear_skill := 40;
                  bow_skill := 0;
                  shield_skill := 30;
                  fist_skill := 20;
                  Modify_Item(k);
                  PutMap(37,17,44);
                  setbit(46);
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
      if at(42,16) then begin
            Print(7,' ÑA¡·¥·i  e—a“eˆå ®á¶¡¶a. ¬é·¢·e ´·Šá§¡ µi');
            Print(7,'  ¡ÊŸ¡µA Óq»³·i¡e aµ¡“e ¶·Aˆ{·e ®´‚');
            Print(7,'·i  ˆi¬‚ ‰¡¢»©¡ ˆå¹¡ ¯¡Ç¡¡e –A“eˆá“¡Œa¶a.');
            Print(7,'‹aˆå ·©¹·· º—Â ¯¥‰w µÅÑÁ¹A· µbÐi·i Ðaºa.');
            Print(7,'‹aˆé Ëa©µA‰A Ìi´a¬á á •¥·i ¤é´ö“e•A  Ðei');
            Print(7,'Ëa©¹¢—i·¡ —i‰¡ ·©´áa“e ¤aœqµA ±¼b´ô·¡ ¸s');
            Print(7,'Ña¬á µa‹¡µA ·¶“eˆáºa.');
      end;
      if at(42,21) then begin
            Print(7,' ¥A¯aÌá¬÷· ¬aœq—i·e  ·¡ ”ŸB·i ÑÂ¯©Ðe ·¥ˆe');
            Print(7,'· µwÉ¡¡ ŠˆÓ¡‹¡ ¶áÐ  ¤å¤åÓ¡ Ëa©¹¢· •·Š‰');
            Print(7,'·i ‰·‰bÐ–­¡.  ˜¡“e Ñs¤b·iÐa‰¡ ˜¡“e ÒA·A');
            Print(7,'À‚·i ³a¡e¬á  ‹a—i·i ”ŸB· Š¬â·a¡ ¡©´a ¦›');
            Print(7,'·¡a Ð–»¡ e µb¦¹¢·¡´ö­¡.  ‹aœ¬á ¥A¯aÌá ¬÷');
            Print(7,'ºŸi º—¯±·a¡ Ëa©· •·Š‰µA ””¸â·¥ ‰·‰b·i');
            Print(7,'ˆqÐ—Ð–´ö­¡.  ‹a˜ º‚ˆáa ¸sÓ¥ Ëa©—i·e ¡¡–');
            Print(7,'¬a»¡ˆa ¸é”e–EÀ  ®A ¡À—·¡µA ŽÁ´á  ”ia ·¶');
            Print(7,'´ö­¡. ‹a—iµA‰A ˆó·i º´á ”a¯¡“e ·¥ˆeµA‰A ”');
            Print(7,'ÐwÐa»¡ ¡µÐa‰A Ða¸a“e ­¢­Q·¡´ö”å ˆá¶a.  Ða»¡');
            Print(7,' e µ¬w·e §µaˆv´ö­¡. ‹a ‰×‰w—i·i ¥¥ Ëa©—i');
            Print(7,'·e Ã¡£©´á µ¡Ÿa“e ¦…‘¡µA »³”e¸â·a¡ ¥A¯aÌá¬÷');
            Print(7,'µA ”Ðe ´¡¯s·i ˆ¯¡Ð–”å ˆá¶a. µa»¡Œõ ”wÐa‰¡');
            Print(7,' e ¬i´aµÖ”å Ðe·i  ·¡˜ ¡¡– Í¢¤i¯¡Åv”å ˆáœa');
            Print(7,'µ¡. ‹aœ¬á µ¬wÐa»¡•¡ ¡µÐ–”å ‹¡¯s·i ¤h·e ¥A');
            Print(7,'¯aÌá¬÷·e ®…¯¢ˆeµA ¸å¡i–A´ö”å ˆõ·¡´ö­¡. ¡¡–');
            Print(7,'ˆa ”a  ¶Ÿ¡ˆa ¸aÀ÷Ðe ·©·¡a ”aŸq´ô´ö”å ˆá»¡');
            Print(7,'¶a.');
            Print(7,'');
            PressAnyKey;
      end;
   end;

   if mapname = 'Tomb' then begin
      if at(89,20) or at(88,21) then begin
         Clear;
         Print(7,' ”w¯¥·e µa‹¡¬á ©a e q·e ·¥ˆe· Ð‰©·i ¥¡´v');
         Print(7,'”a.  ´a a•¡ µ¡œ¸åµA µa‹¡Ÿi •¡Š‰Ðaa”aˆa ˆh');
         Print(7,'Ñv”å ˆõˆ{”a.');
      end;
   end;

end;

end.

