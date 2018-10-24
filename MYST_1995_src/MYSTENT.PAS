Unit MystEnt;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, MystBatt, MystEnd, MystTalk;

 Procedure EnterMode;
 Procedure Sign;


IMPLEMENTATION

Procedure EnterMode;
begin
   if mapname = 'Ground1' then begin
      if at(20,11) then begin
         if wantenter('¡´á¬÷') then begin
            if party.year < 700 then begin
               mapname := 'Lore';
               Load;
               Scroll(TRUE);
               if getbit(35) then PutMap(41,10,44);
               if getbit(36) then PutMap(22,50,44);
               if getbit(37) then PutMap(22,54,44);
               if getbit(38) then PutMap(18,38,47);
            end else begin
               mapname := 'Dark';
               Load;
               Scroll(TRUE);
            end;
         end;
      end;
      if at(76,57) then begin
         if party.year > 699 then begin
            Clear;
            Print(7,' ”w¯¥·¡  œa¯aËa—¡Ã¡ ¬÷·a¡  —i´áˆaa Ð–»¡ e');
            Print(7,'‹a‰µ º£¥·a¡ —w¢–A»¡ ´g·e ·¡¤w·¥·¡œe ·¡·A');
            Print(7,'¡ ½¸‰av”a.');
            exit;
         end;
         if wantenter('œa¯aËa—¡Ã¡¬÷') then begin
            mapname := 'LastDtch';
            Load;
            Scroll(TRUE);
            if getbit(39) then PutMap(61,58,44);
            if getbit(41) then PutMap(34,30,47);
         end;
      end;
      if at(17,89) then begin
         if party.year > 699 then begin
            Clear;
            Print(7,' ”w¯¥·¡ ¡Aá¯a¡ —i´áˆaa Ð–»¡ e  ·¡£¡ ·¡‰µ');
            Print(7,'·e Í‰×·¡ –E•A”aˆa ·³Š a¸á Ðq¡©–A´á •¡¸áÓ¡');
            Print(7,'—i´áˆi ®ˆa ´ô´ö”a.');
            exit;
         end;
         if wantenter('¡Aá¯a') then begin
            mapname := 'Menace';
            Load;
            Scroll(TRUE);
         end;
      end;
   end;

   if mapname = 'LastDtch' then begin
      if at(38,10) or at(39,10) then begin
         if wantenter('ˆa·¡´a ‰A·¡Ëa') then begin
            if not getbit(50) then begin
               DefaultEnter;
               if getbit(40) then PutMap(17,24,27);
               if getbit(42) then PutMap(56,40,27);
            end
            else begin
               absolute_set_xy := TRUE;
               with Map_Header do begin
                  x := EnterX; y := EnterY;
                  mapname := 'Light';
               end;
               Load;
               Scroll(TRUE);
               absolute_set_xy := FALSE;
               x1 := 0; y1 := 0;
            end;
         end;
      end;
   end;

   if (mapname = 'Valiant') or (mapname = 'Light') then begin
      if at(38,10) or at(39,10) then begin
         if wantenter('¡´á ‰A·¡Ëa') then begin
            DefaultEnter;
            if getbit(39) then PutMap(61,58,44);
            if getbit(41) then PutMap(34,30,47);
         end;
      end;
   end;

   if mapname = 'Ground2' then begin
      if at(19,26) then begin
         if wantenter('¤Ÿ¡´åËa Ï¡Ïi»a¬÷') then begin
            if not getbit(50) then
               mapname := 'Valiant'
            else
               mapname := 'Light';
            Load;
            Scroll(TRUE);
            if not getbit(50) then begin
               if getbit(40) then PutMap(17,24,27);
               if getbit(42) then PutMap(56,40,27);
            end;
         end;
      end;
      if at(31,82) then begin
         if wantenter('ˆa·¡´a ÉAœa¬÷') then begin
            mapname := 'Gaea';
            Load;
            if getbit(43) then PutMap(25,9,44);
            if getbit(44) then PutMap(11,36,44);
            Scroll(TRUE);
         end;
      end;
      if at(82,47) then begin
         if wantenter('µ¡Ça  a·i') then begin
            mapname := 'OrcTown';
            Load;
            if getbit(57) then PutMap(10,39,34);
            if getbit(58) then PutMap( 9,19,34);
            if getbit(59) then PutMap(13,12,34);
            if getbit(60) then PutMap(21, 9,34);
            if getbit(61) then PutMap(43,12,34);
            if getbit(62) then PutMap(44,30,34);
            if getbit(63) then PutMap(35,29,34);
            if getbit(64) then PutMap(41,39,34);
            if getbit(53) then begin
               PutMap(25,42,43); PutMap(25,43,43);
            end;
            if getbit(54) then begin
               PutMap(24,20,43); PutMap(26,20,43);
            end;
            if getbit(55) then PutMap(23,18,43);
            if getbit(56) then begin
               PutMap(25,17,43); PutMap(26,17,43);
            end;
            Scroll(TRUE);
         end;
      end;
   end;

   if mapname = 'Ground3' then begin
      if at(69,29) and wantenter('¥A¯aÌá¬÷') then begin
         absolute_set_xy := TRUE;
         mapname := 'Vesper';
         if x1 = 1 then begin
            x := 6; y := 38;
         end;
         if x1 = -1 then begin
            x := 70; y := 38;
         end;
         if y1 = 1 then begin
            x := 38; y := 7;
         end;
         if y1 = -1 then begin
            x := 38; y := 69;
         end;
         Load;
         if getbit(65) then PutMap(30,19,43);
         if getbit(66) then PutMap(50,19,43);
         if getbit(67) then PutMap(64,26,43);
         if getbit(68) then PutMap(61,33,43);
         if getbit(69) then PutMap(40,40,43);
         if getbit(70) then PutMap(22,40,43);
         if getbit(71) then PutMap(20,26,43);
         Scroll(TRUE);
         absolute_set_xy := FALSE;
         exit;
      end;

      if at(81,15) and wantenter('Ëa©  a·i') then begin
         mapname := 'TrolTown';
         Load;
         if getbit(46) then PutMap(37,17,44);
         if getbit(72) then begin
            PutMap(25,8,44); PutMap(26,8,44);
         end;
         if getbit(73) then PutMap(17,19,44);
         if getbit(74) then PutMap(34,19,44);
         if getbit(75) then begin
            PutMap(13,32,44); PutMap(13,33,44);
         end;
         if getbit(76) then begin
            PutMap(38,32,44); PutMap(38,33,44);
         end;
         if getbit(77) then begin
            PutMap(24,67,44); PutMap(25,67,44); PutMap(26,67,44);
         end;
         if getbit(78) then PutMap( 6,31,44);
         if getbit(79) then PutMap( 9,30,44);
         if getbit(80) then PutMap( 7,33,44);
         if getbit(81) then PutMap(11,35,44);
         if getbit(82) then PutMap(40,30,44);
         if getbit(83) then PutMap(41,35,44);
         if getbit(84) then PutMap(43,32,44);
         if getbit(85) then PutMap(45,34,44);
         Scroll(TRUE);
         exit;
      end;

      if at(81,76) then begin
         Clear;
         if getbit(10) then begin
            if not getbit(9) then begin
               Print(7,' ”w¯¥·¡ ‹¡¢aÐe §¡¬â ´|µA ¬ö·i˜ ‹aˆõ·e Ëa©');
               Print(7,'‹i¡ ¸âÓ¥ º¢…·¡œeˆé ´i´v”a. ”w¯¥·e x·e ­¡');
               Print(7,'Ÿ¡¡ ‹a º¢…·i ·|¹¡v”a.  ®…ˆe §¡¬â·¡  –‰¡');
               Print(7,'½¡ˆ´á»¡¡a µAÉAŸaÁA· Ñw¬w·¡ aÈav”a. ‹aŸ¡');
               Print(7,'‰¡“e ¬á¬áÓ¡ ¬—ÁA Ïaœa»a a»©· Ëa© Ñw¬w·a¡');
               Print(7,'¥eÐˆv”a.  ‹aˆõ·¡ µÅ¸åÐe Ëa©· Ñw¬w·a¡ ¥e');
               Print(7,'Ða¸a  ‰A ¢´áœa ´i® ´ô“e  i·i »¡Œé·¡”á“¡');
               Print(7,'”a¯¡ ”w¯¥· ¡¡¯s·a¡ ”k´aˆv”a.  ”w¯¥· ¡¡¯s');
               Print(7,'·a¡ ¥eÐe Ïiœa»a aÁA· ‹¡¶…·e ¬á¬áÓ¡ ”w¯¥·');
               Print(7,'¡±­¢µA ¯a¡a —i´áˆv”a. ‹a ´i® ´ô“e ¹¥¸µÁ·');
               Print(7,'‰iÐs·¡ {v·i˜  ”w¯¥·e  ‹a ¹¥¸ˆa »¡Œéµv”å');
               Print(7,' i·¡ Ëa©¹¢·  i·¡´ö·q·i ´i‰A –A´ö”a.  ‹aŸ¡');
               Print(7,'‰¡  ·¡¹A ”w¯¥·¡  Ëa©¹¢·  i·i Ði ® ·¶”a“e');
               Print(7,'ˆé Œ”j‰A –A´ö”a.');
               setbit(9);
            end else begin
               Print(7,' ”w¯¥ ´|µA“e  ¤e·a¡ ½¡ˆ´á»¥ §¡¬â e q´a·¶');
               Print(7,'´ö”a.');
            end;
         end else begin
            Print(7,' ”w¯¥ ´|µA“e ‹¡¢aÐe •¡Ñw·¡ ¬‰a»¥ §¡¬â·¡ ¬á');
            Print(7,'·¶´ö”a.');
         end;
      end;
   end;

   if mapname = 'Ground4' then begin
      if at(82,16) then begin
         if getbit(86) then begin
            Clear;
            Print(7,' ”w¯¥·e  Å¡¥©ËaÇ··i ˆa–¡‘½‹¡ ¶áÐ  e—e ¡—a');
            Print(7,'´e· ‰i‰ ˜¢…µA ´e·a¡ —i´áˆi ® ´ô´ö”a.');
            exit;
         end;
         if wantenter('Å¡¥©Ëa  a·i') then begin
            mapname := 'Kobold';
            Load;
            Scroll(TRUE);
            if party.etc[30] = 0 then
               party.etc[30] := ((random(5)+1) shl 4) + (random(5) + 1);
            if party.etc[31] = 0 then
               party.etc[31] := random(31) + 1;
         end;
      end;
      if at(20,39) then begin
         if wantenter('µA·¥­eËa·¡§i ¯¥¸å') then begin
            absolute_set_xy := TRUE;
            mapname := 'Ancient';
            if x1 = 1 then begin
               x := 6; y := 15;
            end;
            if x1 = -1 then begin
               x := 14; y := 15;
            end;
            if y1 = 1 then begin
               x := 10; y := 7;
            end;
            if y1 = -1 then begin
               x := 10; y := 24;
            end;
            Load;
            if getbit(28) then for i := 10 to 11 do PutMap(i,17,44);
            if getbit(23) then for i := 10 to 11 do PutMap(i,13,44);
            Scroll(TRUE);
            absolute_set_xy := FALSE;
            exit;
         end;
      end;
      if at(48,57) then begin
         if wantenter('µ¡– b»³') then begin
            absolute_set_xy := TRUE;
            mapname := 'Hut';
            if x1 = 1 then begin
               x := 6; y := 15;
            end;
            if x1 = -1 then begin
               x := 25; y := 15;
            end;
            if y1 = 1 then begin
               x := 15; y := 7;
            end;
            if y1 = -1 then begin
               x := 15; y := 24;
            end;
            Load;
            if getbit(204) then PutMap(8,13,35);
            if getbit(205) then PutMap(8,14,35);
            Scroll(TRUE);
            absolute_set_xy := FALSE;
            exit;
         end;
      end;
      if at(26,16) then begin
         Clear;
         Print(12,' µa‹¡“e ''¤iÐaœa ¸å”w''.');
         Print(12,' ¯¡ˆe ‰Å‰¬w ¹A¸b·i Ða»¡ ¡µÐ–·q.');
         Print(12,'');
         Print(7,'                       ¹A¸b¸a ³q.');
     end;
   end;

   if mapname = 'Ancient' then begin
      if at(10,23) then begin
         if getbit(12) then begin
            if getbit(11) then exit;
            Clear;
            Print(7,' ”w¯¥·e Å¡¥©Ëa‹i¡ –A´á ·¶“e ‹¡–—·i ¥¡´v”a.');
            Print(7,'‹aŸ¡‰¡ ‹a‰µµA ¸âÓ¥ ‹i·i ·ª¸a  ”w¯¥·  áŸ¡­¢');
            Print(7,'·i Â À¶“e ¢´åˆaŸi “av”a.');
            setbit(11);
         end else begin
            Print(7,' ”w¯¥ ´|µA“e  Àá·q ¥¡“e ¢…¸aˆa ¸âÓ¥  ‹¡–—·¡');
            Print(7,'¬á ·¶´ö”a.');
         end;
      end;
   end;

   if mapname = 'Ground5' then begin
      if at(39,36) then
      if wantenter('—aœaÅ¡“¡´e  a·i') then begin
         mapname := 'DracTown';
         Load;
         if getbit(111) then PutMap(24,98,44);
         if getbit(112) then PutMap(24,92,44);
         if getbit(113) then PutMap(25,81,44);
         if getbit(114) then PutMap(34,100,44);
         if getbit(115) then PutMap(36,93,44);
         if getbit(116) then PutMap(42,84,44);
         if getbit(117) then PutMap(33,82,44);
         if getbit(118) then PutMap(41,70,44);
         if getbit(119) then PutMap(32,22,44);
         if getbit(120) then PutMap(40,33,44);
         if getbit(121) then PutMap(16,19,44);
         if getbit(122) then PutMap(16,35,44);
         if getbit(123) then PutMap(15,48,44);

         if getbit(47) then PutMap(15,57,44);

         if getbit(104) then PutMap(77,73,44);
         if getbit(105) then PutMap(67,66,44);
         if getbit(106) then PutMap(67,73,44);
         if getbit(107) then PutMap(62,71,44);
         if getbit(108) then PutMap(67,88,44);
         if getbit(109) then PutMap(62,79,44);
         if getbit(110) then PutMap(65,64,44);

         if getbit(103) then begin
            PutMap(14,105,44); PutMap(15,106,44);
         end;
         if getbit(102) then begin
            for j := 59 to 61 do
            for i := 47 to 48 do PutMap(i,j,44);
         end;
         if getbit(101) then begin
            for i := 24 to 27 do PutMap(i,54,44);
         end;
         if getbit(100) then begin
            for j := 59 to 61 do PutMap(84,j,44);
         end;
         if getbit( 99) then begin
            for i := 79 downto 77 do PutMap(i,88,44);
         end;
         if getbit( 98) then begin
            for i := 59 to 61 do PutMap(i,48,44);
         end;
         if getbit( 97) then begin
            for i := 73 to 75 do PutMap(i,40,44);
         end;
         if getbit( 96) then begin
            for i := 94 to 96 do PutMap(i,37,44);
         end;
         if getbit( 95) then begin
            PutMap(102,20,44); PutMap(102,21,42);
            PutMap(101,21,44); PutMap(103,21,44);
         end;

         Scroll(TRUE);
      end;
      if at(15,31) then begin
         if wantenter('·±ÍAŸ¡´ñ  a·¡á¬÷') then begin
            mapname := 'Imperium';
            Load;
            Scroll(TRUE);
         end;
      end;
   end;

   if mapname = 'Tomb' then begin
      if wantexit then begin
         DefaultExit;
         if getbit(111) then PutMap(24,98,44);
         if getbit(112) then PutMap(24,92,44);
         if getbit(113) then PutMap(25,81,44);
         if getbit(114) then PutMap(34,100,44);
         if getbit(115) then PutMap(36,93,44);
         if getbit(116) then PutMap(42,84,44);
         if getbit(117) then PutMap(33,82,44);
         if getbit(118) then PutMap(41,70,44);
         if getbit(119) then PutMap(32,22,44);
         if getbit(120) then PutMap(40,33,44);
         if getbit(121) then PutMap(16,19,44);
         if getbit(122) then PutMap(16,35,44);
         if getbit(123) then PutMap(15,48,44);

         if getbit(47) then PutMap(15,57,44);

         if getbit(104) then PutMap(77,73,44);
         if getbit(105) then PutMap(67,66,44);
         if getbit(106) then PutMap(67,73,44);
         if getbit(107) then PutMap(62,71,44);
         if getbit(108) then PutMap(67,88,44);
         if getbit(109) then PutMap(62,79,44);
         if getbit(110) then PutMap(65,64,44);

         if getbit(103) then begin
            PutMap(14,105,44); PutMap(15,106,44);
         end;
         if getbit(102) then begin
            for j := 59 to 61 do
            for i := 47 to 48 do PutMap(i,j,44);
         end;
         if getbit(101) then begin
            for i := 24 to 27 do PutMap(i,54,44);
         end;
         if getbit(100) then begin
            for j := 59 to 61 do PutMap(84,j,44);
         end;
         if getbit( 99) then begin
            for i := 79 downto 77 do PutMap(i,88,44);
         end;
         if getbit( 98) then begin
            for i := 59 to 61 do PutMap(i,48,44);
         end;
         if getbit( 97) then begin
            for i := 73 to 75 do PutMap(i,40,44);
         end;
         if getbit( 96) then begin
            for i := 94 to 96 do PutMap(i,37,44);
         end;
         if getbit( 95) then begin
            PutMap(102,20,44); PutMap(102,21,42);
            PutMap(101,21,44); PutMap(103,21,44);
         end;

         for i := 2 to 5 do begin
            for j := 0 to 8 do player[i].name[j] := player[i].name[j+9];
         end;
         Display_Condition;
      end;
   end;

   if mapname = 'HdsGate' then begin
      if at(21,33) then begin
         if party.etc[25] = 2 then begin
            if wantenter('Ða•A¯a ÉAœa') then begin
               DefaultEnter;
            end;
         end
         else begin
            Clear;
            Print(13,' »¡Ða ­A‰· ·³ŠµA¬á ¢´åˆa ˆwÐe Ó±·¡ ª‘´á');
            Print(13,'¹a aµÁ ”w¯¥·i £©Áa ¤áv”a.');
         end;
      end;
   end;

   if mapname = 'Vesper' then TalkMode;
   if mapname = 'TrolTown' then TalkMode;

end;

Procedure Sign;
begin
   while keypressed do c := readkey;
   Clear;
   if mapname = 'OrcTown' then begin
      TalkMode;
      exit;
   end;
   if mapname = 'Vesper' then begin
      TalkMode;
      exit;
   end;
   if mapname = 'TrolTown' then begin
      TalkMode;
      exit;
   end;
   if mapname = 'Tomb' then begin
      TalkMode;
      exit;
   end;

   yline := 30; hany := 16;
   Print(7,'Îu iµA ³aµa·¶‹¡¡ ...');
   Print(7,''); Print(7,'');

   if mapname = 'Lore' then begin
      if at(51,84) then begin
         Print(15,'          ·¡‰µ·e ¡´á¬÷·³“¡”a.');
         Print(15,'          µaœá¦…·i ÑÅµwÐs“¡”a.');
         Print(7,'');
         Print(7,'');
         Print(10,'         ·¡‰µ· ¬÷º ¡—a´e ³q');
      end;
      if at(51,15) then Print(15,'      ¡´á µ×Ÿ³ ºA® ®¶w­¡');
      if at(24,31) then begin
         Print(15,'             ¡´á º¸ñ');
         Print(15,'');
         Print(15,'      ( Å¡Ÿ¡´a ¶á¯aÇ¡ ¸å¢…¸ñ )');
      end;
      if at(51,58) then
      if getbit(50) then begin
         Print(15,'     ·¡¹A ¶Ÿ¡Ÿi ¶áÑsÐa”å ‘A ¹·¹¢·e');
         Print(15,'     ¸÷·· ¯±ÌeµA ·Ð ¢Ÿ|·i Ž‰¡');
         Print(15,'      i´v”a. ·¡¹A¦Èá“e ¬¡¶… ·¥ŸA');
         Print(15,'     · µb¬aˆa ¯¡¸b –I ˆõ·¡”a.');
      end
      else begin
         Print(15,'   674‘e 1¶© 17·©. ´aÏa¡—¡ÉA· ¥A¯aÌá¬÷·¡');
         Print(15,'   Ñ¡¸å¸â·¥  Ëa©¹¢µA ·Ð  Àq¥e·i ”wÐ–”a.');
         Print(15,'   ·¡Ÿi ‰‹¡¡  ¡´á¬÷‰Á  ‹a ·¡¶A· ¬÷—i·e');
         Print(15,'   µ¡Ça¹¢, Ëa©¹¢, Å¡¥©Ëa¹¢,  —aœaÅ¡“¡´e¹¢');
         Print(15,'   µA ”Ðe ¢Àa¥i ¸÷¤é·i ¬åÍ¡Ða“e ¤a·¡”a.');
         Print(15,'   ·¡¡ ·¥Ð  ·¥ˆe ·¡¶A· ”aŸe ¹·¹¢µA ”Ðe');
         Print(15,'   Ñ¡·Ÿi ·©ÁA º—»¡Ða¡a ·¡¹A“e ¸â” ‰Å‰¡');
         Print(15,'   ‹a—i·i ”Ði ˆõ·¡”a.');
      end;
   end;

   if mapname = 'Dark' then begin
      if at(51,84) then begin
         Print(15,'          ·¡‰µ·e ¡´á¬÷·³“¡”a.');
         Print(15,'          µaœá¦…·i ÑÅµwÐs“¡”a.');
         Print(7,'');
         Print(7,'');
         Print(10,'         ·¡‰µ· ¬÷º ¡—a´e ³q');
      end;
      if at(51,18) or at(52,18) then
         Print(15,'      ¡´á µ×Ÿ³ ºA® ®¶w­¡');
      if at(24,31) then begin
         Print(15,'             ¡´á º¸ñ');
         Print(15,'');
         Print(15,'( Å¡Ÿ¡´a ¶á¯aÇ¡ˆa ¸i ÌiŸ¥”a“e  i ´g‰V·q )');
      end;
   end;

   if (mapname = 'LastDtch')  then begin
      if at(39,8) then begin
         Print(15,' ·¡‰µ·e ˆa·¡´a ÉAœa¡ É·Ða“e ‰A·¡Ëa ·³“¡”a.');
      end;
      if at(39,68) then begin
         Print(7,'');
         Print(15,' ¬å·i ¶áÐ¬áœa¡e ´á˜å ¶áÐñ·¡a ´áa¶‘µA•¡');
         Print(15,'Š‰Ða»¡ ´g“e ¬aœq—i·¡ ·¶“e ‰µ, œa¯aËa —¡Ã¡.');
         Print(7,'');
         Print(15,'           µaœá¦…·i ÑÅµwÐs“¡”a.');
         Print(7,'');
         Print(7,'');
         Print(13,'            ·¡‰µ· ¬÷º¡¦Èá');
      end;
   end;

   if mapname = 'HdsGate' then begin
      if at(13,22) then begin
         Print(15,'      »¥¸÷Ðe ‹©·e  a·q·a¡ ¥¡´a´¡Ðe”a');
         Print(15,'              ”w¯¥ º¶áµA ·¶“e       ');
         Print(15,'       ·¥¶á¸â·¥ ¯¡ˆb ¶a­¡Ÿi ¤¹AÐaœa');
         Print(15,'          ‹aŸ¡‰¡ ”a¯¡ ’…·i ˜ö·i˜');
         Print(15,'            ·¡£¡ ‹©·e ”w¯¥ ´|µA');
         Print(15,'             ÍiÁa¹a ·¶·i ˆõ·¡”a');
      end;
   end;

   if (mapname = 'Valiant') or (mapname = 'Light') then begin
      if at(39,8) then begin
         Print(15,' ·¡‰µ·e ¡´á ”ŸB·a¡ É·Ða“e ‰A·¡Ëa ·³“¡”a.');
      end;
      if at(39,68) then begin
         Print(7,'');
         Print(15,'   µa‹¡“e ˆa·¡´a ÉAœa· ¤Ÿ¡´åËa Ï¡Ïi»a');
         Print(15,'  ¦‰·µA ”Ð ˆa¸w ˆwbÐe ¸áÐw·i Ða“e ‰µ');
         Print(7,'');
         Print(15,'           µaœá¦…·i ÑÅµwÐs“¡”a.');
         Print(7,'');
         Print(7,'');
         Print(13,'            ·¡‰µ· ¬÷º¡¦Èá');
      end;
   end;

   if mapname = 'Gaea' then begin
      if at(24,26) then begin
         Print(7,'');
         Print(15,'        ˆa·¡´a ÉAœa¬÷· ¥¡¢‰Àw‰¡');
         Print(15,'            Ò‘Áaˆa¡e º‚´á ~~~');
      end;
      if at(29,26) then begin
         Print(7,'');
         Print(15,'   ˆa·¡´a ÉAœa¬÷µA µ¡¯¥ ˆõ·i ÑÅµwÐs“¡”a');
         Print(15,'    ·¡‰µ·e ³aA‹¡ ¹·œ·¹A ¯¡¤ñ ¬÷·³“¡”a');
         Print(7,'');
         Print(15,'           µaœá¦…·i ÑÅµwÐs“¡”a.');
         Print(7,'');
         Print(7,'');
         Print(13,'            ·¡‰µ· ¬÷º¡¦Èá');
      end;
   end;

   if mapname = 'Ground3' then begin
      Print(7,'');
      Print(7,'');
      Print(15,'   ·¡ ‰×¬e·e ´a»¢ ˆ¤i º—·¡œa ¶áÐñÐa£a¡');
      Print(15,'              Â‰·³·i ‹q»¡Ðq');
   end;

   if mapname = 'Kobold' then begin
      if at(9,30) then begin
         Print(7,'');
         Print(7,'');
         cPrint(10,11,' µa‹¡¬á“e £¨·i eÐe ‹¡®‰·¡ ','Ê¯¡',' ¤cµA“e ´ô­¡');
         Print(10,'    ¬w”wÓ¡ eÐÐe ‰µ·¡  g·a“¡ º·Ða¯¡µ¡');
         Print(7,'');
         Print(7,'');
         Print(7,'');
         Print(13,'                  ¡—a´e');
      end;
      if at(54,63) then begin
         Print(7,'');
         Print(7,'  ”w¯¥·¡ ¶¥Ðe”a¡e');
         Print(7,'         ”w¯¥ ´|· ¶w´q·i ˆåá‰A Ðº‰V­¡');
         m[0] := '';
         m[1] := '     ¶w´q·i ˆåá‰V”a';
         m[2] := '     ˆåé Ï©¶a“e ´ô”a';
         k := Select(180,2,2,FALSE,TRUE);
         if k = 1 then begin
            x := 58; y := 63;
            Silent_Scroll;
         end else PutMap(48,73,0);
      end;
   end;

   if mapname = 'DracTown' then begin
      if at(92,94) then begin
         Print(7,'');
         Print(7,'');
         Print(15,'     ·¡‰µ·e ¯¥¬÷Ðe —aœaÅ¡“¡´e ¢a»¡·¡£a¡');
         Print(15,'          Ðq¦¡ ÒA­¥ ¯¡Ç¡»¡  a¯¡µ¡');
      end;
   end;

   if mapname = 'Imperium' then begin
      if at(24,19) or at(26,19) then begin
         Print(7,'');
         Print(7,'');
         Print(11,'                ÇaŸ¡¯aÈi ˆa‰A');
         Print(15,'                Crystal  Shop');
         Print(7,'      ( Š‚¹AÑÁ¯¡”µA ¦·wÐa‹¡ ¶áÐ °ö·q )  ');
      end;
      if at(34,23) then begin
         Print(7,'');
         Print(7,'');
         Print(11,'                •¡¬á‰Å');
      end;
   end;

end;

end.