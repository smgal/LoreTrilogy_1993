Unit DarkEnt;

INTERFACE

Uses
   Crt, Graph, UHanX, DarkSub, DarkBatt, DarkEnd;

 Procedure EnterMode;
 Procedure Sign;


IMPLEMENTATION

Procedure EnterMode;
begin
   case party.map of
      1 : begin
             if at(20,11) then
             if wantenter('¡´á ¬÷') then begin
                with party do begin
                   map := 6; xaxis := 51; yaxis := 94;
                end;
                Load;
                for i := 49 to 53 do Putmap(i,88,44);
                if party.etc[50] and bit1 > 0 then Putmap(89,23,44);
                if party.etc[50] and bit2 > 0 then Putmap(9,64,44);
                if party.etc[50] and bit3 > 0 then Putmap(21,33,44);
                if party.etc[50] and bit4 > 0 then Putmap(88,38,44);
                if party.etc[10] = 4 then begin
                   Pause(TRUE);
                   Clear;
                   Print(7,' ”w¯¥·¡ ¡´á ¬÷µA —i´áµ¡¸a  º£¥—i· µiiÐe');
                   Print(7,'ÑÅµw·i ¤h´v”a.  Ða»¡ e º£¥—i·e ”w¯¥·¡ ¡Aá');
                   Print(7,'¯aµA¬á A—a ´eÈaA¯aˆa ´b a ¬a·Ž…µA‰A ˆá·');
                   Print(7,'Ì¤Ð–”å ”w¯¥·i •¡µÁº… ¬a¯©·i  ´i Èâ·¡ ´ô´ö');
                   Print(7,'”a. ¡Aá¯a· ¬i·¥ ¶¥·¥·i ¹Aˆá Ða“e•A ”w¯¥·¡');
                   Print(7,'Ðe ·©·e ¬a¯© ´a¢ˆõ•¡ ´ô”a“e ¸ñµA ”w¯¥·e ³s');
                   Print(7,'³iÐe ¶•·q·i »¡·i ® ¤cµA ´ô´ö”a.');
                end;
                if party.etc[10] = 16 then begin
                   Clear;
                   Print(7,' ”w¯¥·¡ ¬á–‰œá ¡´á ¬÷µA ”a”aœv»¡ e ·¡£¡ ¡');
                   Print(7,'´á ¬÷·e ÍÐáˆa –A´á ¤áv”a.');
                   Print(7,' ”w¯¥·e ´a¿©Ðe ˆq·i “a¡¡a  ´i§¡Aµ¡· µ´å');
                   Print(7,'µA Š‰¥¢Ðq·i “av”a. ·¡¹A“e ”a¯¡ •©·¡Ç© ®ˆa');
                   cPrint(7,11,'´ô“e ·©·¡ ·©´áa ¤áv”a. ','¶Ÿ¡“e ”aÇa ¡A·¡»¡','');
                   Print(11,'¯©Ÿ¡´e Äa£¡á¯aµA‰A µÅÌÐe ˆõ·¡´ö”a.');
                   with party do begin
                      map := 1; xaxis := 20; yaxis := 11;
                   end;
                   Load;
                   PressAnyKey;
                   Scroll(FALSE);
                   Print(7,' ”aÇa ¡A·¡»¡“e ˆa‰·Ði Ó±·a¡ ¸å ”ŸBµA ‰i‰');
                   Print(7,'Ÿi Ñw¬÷Ða‹¡ ¯¡¸bÐ–‰¡ ‰i‰­¢· ¢‰ÁA—i·e ¬á¬á');
                   Print(7,'Ó¡ ÑwÁAŸi ·°´áˆa‹¡ ¯¡¸bÐ–”a.  ·¡¹A“e ¯©Ÿ¡´e');
                   Print(7,'Äa£¡á¯aŸi ¹A´áÐi ®·¶“e ¡AÏ¡¯aÉ¡ÍIA¯a a¸á');
                   Print(7,'¬aœa¹a ¤áa¬á  ‹a‘a“e ·»¡· º—¯±·i ·°‰¡ Ðe');
                   Print(7,'´ô·¡ ‹a‘a· Ó±·i ¤wÂ‰Ða‹¡ ¯¡¸bÐ–”a.');
                   Print(7,' ·¡¹A“e ’Š•¡ ‹a‘a· ‹¡Ða ‹s®¸â·¥ Ó±· Í¢');
                   Print(7,'ºŸi  b·i ®ˆa ´ô´ö‰¡ ·¡£¡ ”w¯¥· ·¯¢•¡ Óa');
                   Print(7,'a¹a ˆv”a.');
                   PressAnyKey;
                   Print(7,' Ða»¡ e ·¡˜, ¯©Ÿ¡´e Äa£¡á¯a·  a¤ó ‰i‰Ÿi');
                   Print(7,'ŒËaŸ¡¡a Ó£¡Ðe ·»¡ˆa ¯a¡a—i´áµÖ”a. ‹aˆõ·e');
                   Print(7,'A—a ´eÈaA¯a·  a»¡ b ·»¡µv‰¡ ‹a“e ‹a‘a·');
                   Print(7,'‰i‰Ÿi ¤áË¡¡a  a»¡ b  i·i Ðe”a.');
                   Print(7,'');
                   Print(13,' ”aÇa ¡A·¡»¡· Ó±·e µwÑ¥·¥ a¹¡Àa•¡ ­¡¡i ¯¡');
                   Print(13,'Ç© Ó±·¡ ·¶”a“e ˆé ´i´v‘A.  »¡‹q·e a·  a¤ó');
                   Print(13,'b·a¡ a Ñ¥¸a ¸÷•¡Ÿi ¥¡Ñ¡Ði ® ·¶“e ‰i‰Ÿi');
                   Print(13,'Š¬÷Ð–»¡ e ‰¨ a· Ó±•¡ ”aÐa‰A –I ˆé­A.  a');
                   Print(13,'“e  a»¡ b·a¡ Ðeˆa»¡· ¢a´e·i ¬—ˆbÐ ´ö‘A');
                   Print(13,'. ¸a‘A“e ´i§¡Aµ¡· µ´å·i ‹¡´â Ða‰V»¡.  ‹a');
                   Print(13,'º—  a»¡ b µ´å·i ¶A¶¡¥¡‰A.  ˆá‹¡µA“e ””eÐe');
                   Print(13,'¡¡®…·¡ ·¶‘A. »¡‹q·e ‹a· ­A¤å¼ µ´å·¥ " ‘A');
                   Print(13,'Ça¡ e¬áµA‰A ·¡‹¥¸a“e ´a¢•¡ ´ô´ö”a. " œa“e');
                   Print(13,'Š¸é·¡ ¯©Ð—–A»¡ ´g·e µ´å·¡œa‰¡ ¬—ˆb–A‰¡ ·¶');
                   Print(13,'»¡.  Ða»¡ e ¤e”¡ ¬—ˆbÐ¥¡‰A.  ¸a‘Aˆa  e´¢');
                   Print(13,'»¡‹q·¡œa•¡ ‘AÇa¡ e¬áµA‰A ÌÐe”a¡e ‘A¤å¼·');
                   Print(13,'µ´å·¡ ¯©Ñe –A»¡ ´g“e µ´å·¡ –E”a‘A. ‹aœý‰A');
                   Print(13,' e –E”a¡e  ”aÇa ¡A·¡»¡“e Àá·q¦Èá ´ô´ö”å ¹¥');
                   Print(13,'¸ˆa –A´á ¤áŸ¡‰¡  ¡´á ”ŸB·e ¶¥œ· ¡¡¯s”');
                   Print(13,'¡ ¯¡ˆe·i »¥Ð—Ð aˆa‰A –E”a‘A. a· ‰i‰ˆa');
                   Print(13,'¸ñ¸ñ ´¢Ð¹a ˆa“eŠ…. a· ­¡¡i·i Ðõ–A‰A Ða»¡');
                   Print(13,'“e i‰A.  ‹aŸ¡‰¡ ¸a¯¥¥¡”a ¡´á· ¶…¡w·i  å¸á');
                   Print(13,'¬—ˆbÐa•¡¢ Ða‰A.... ‹a..‹aœñ... ”a..”a·q ­A');
                   Print(13,'¬wµA¬á......');
                   Print(7,'');
                   PressAnyKey;
                   Print(7,' ‹a· ·»¡“e ¸ñ¸ñ Ó£¡Ð »¡”á“¡ ‰iŠ‚ ´qÓb·a');
                   Print(7,'¡ ¬aœa»¡‰¡  i´v”a.');
                   Print(7,' ”w¯¥·e ´á˜ý‰A Ða‰V“eˆa ?');
                   m[0] := '';
                   m[1] := 'A—a ´eÈaA¯a·  i”¡ Ðe”a';
                   m[2] := '”aÇa ¡A·¡»¡µÁ °a¶‰¡ ¯¼”a';
                   k := Select(140,2,2,FALSE,TRUE);
                   if k < 2 then End_Demo;
                   Print(7,' ·©Ð—·e ¯a¯a¡· “wb·i £¨‹¡¡ Ða‰¡  ¯©Ÿ¡´e');
                   Print(7,'Äa£¡á¯aŸi ‰·‰bÐaaÐ–”a.');
                   PressAnyKey;
                   enemynumber := 1;
                   joinenemy(enemynumber,75);
                   enemy[enemynumber].name := '¯©Ÿ¡´e Äa£¡á¯a';
                   DisplayEnemies(TRUE);
                   Print(13,' Ça´b~~ ‘Aˆa ·¡ ‰µ·  a»¡ b ¬—¹¥¸a¡ ? ‹aœý');
                   Print(13,'”a¡e á•¡ º‚µaº»¡.');
                   PressAnyKey;
                   Print(7,' ¯©Ÿ¡´e Äa£¡á¯a“e ”a¯¡ 8 ¹¡ˆb·a¡ ¸a¯¥·i ¦…');
                   Print(7,'ÐÐ¬á ¸a¯¥·i 8 ¡w·a¡  e—i´ö”a.');
                   PressAnyKey;
                   repeat
                      enemynumber := 8;
                      for i := 1 to enemynumber do begin
                         joinenemy(i,75);
                         with enemy[i] do begin
                            name := '¯©Ÿ¡´e Äa£¡á¯a';
                            resistance := 255;
                         end;
                      end;
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then begin
                         Clear;
                         Print(13,' ÇaÇaÇa.. áÓ—i·e ¤e—a¯¡ a· ­¥µA º‚´á º¡');
                         Print(13,'´¡ ‰V”a. ÇaÇaÇa..');
                         PressAnyKey;
                      end;
                   until FALSE;
                end;
             end;
             if at(76,57) then
             if wantenter('œa¯aËa—¡Ã¡ ¬÷') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' œa¯aËa —¡Ã¡¬÷·e ¶w´q· ”»¡¡ ¥eÐ–”a.');
                   exit;
                end;
                with party do begin
                   map := 7; xaxis := 38; yaxis := 69;
                end;
                Load;
                if party.etc[50] and bit8 > 0 then PutMap(41,18,44);
                if (party.etc[51] and bit1 = 0) and (party.etc[32] and bit6 > 0)
                   and (party.etc[35] and bit5 = 0)  then PutMap(54,56,53);
             end;
             if at(17,89) then
             if wantenter('¡Aá¯a') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' ¡Aá¯a“e  ÑwÁA•¡ ´i´a ¥© ® ´ô·i ¸÷•¡¡ ¢');
                   Print(7,'á¹a ¤áv”a.');
                   exit;
                end;
                with party do begin
                   map := 10; xaxis := 26; yaxis := 44;
                end;
                Load;
                case party.etc[10] of
                   1 : for i := 25 to 26 do putmap(i,43,52);
                   3 : for i := 25 to 26 do putmap(i,43,52);
                   9 : begin
                          for i := 24 to 27 do PutMap(i,9,0);
                          for i := 23 to 28 do PutMap(i,10,0);
                          for i := 23 to 28 do PutMap(i,11,0);
                          for i := 24 to 27 do PutMap(i,12,0);
                       end;
                   12: begin
                          for i := 12 to 14 do PutMap(i,10,0);
                          for i := 11 to 15 do putMap(i,11,0);
                          for i := 12 to 14 do PutMap(i,12,0);
                       end;
                   15: begin
                          with party do begin
                             map := 4; xaxis := 10; yaxis := 92;
                          end;
                          Load;
                          Clear;
                          Print(7,'”w¯¥·¡ ¡Aá¯aµA ·³ŠµA —i´á¬á¸a  a¸a ¸áÐwÐi');
                          Print(7,'® ´ô“e ˆwÐe Ó±·¡ ·©Ð—·i ¨i´a—i·¡‹¡ ¯¡¸b Ð–');
                          Print(7,'”a. ®…ˆe ”w¯¥·e ¡Aá¯a· ·³Š ¸aÁAˆa Äá”aœe');
                          Print(7,'É·¡¡ ¥eÐ ·¶·q·i ´i´a À–”a.');
                          party.etc[9] := party.etc[9] or bit1;
                          Scroll(FALSE);
                          PressAnyKey;
                          Delete_Scroll_Screen;
                          face := 4;
                          Print(7,' ÐeÀq ÒµA ”w¯¥·e ¸÷¯¥·¡ —i´ö‰¡ µa‹¡ˆa »¡Ða');
                          Print(7,'­A‰·±·i ´i´a Àav”a.');
                       end;
                end;
             end;
             if at(84,86) then
             if wantenter('´i®´ô“e Ï¡œa£¡—a') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' ‹aœáa, Ï¡œa£¡—a“e ÌaŠA –A´ö”a.');
                   exit;
                end;
                with party do begin
                   map := 2; xaxis := 99; yaxis := 100;
                end;
                Load;
                move(Font^[48],Font^[52],294);
             end;
          end;
      2 : begin
             if at(100,100) then
             if wantexit then begin
                with party do begin
                   map := 1; xaxis := 83; yaxis := 86;
                end;
                Load;
             end;
             if at(16,16) then
             if wantenter('ÓW¬÷· »wˆá') then begin
                with party do begin
                   map := 11; xaxis := 25; yaxis := 44;
                end;
                Load;
             end;
             if at(149,65) then
             if wantenter('ÓW¬÷· ”e¬á') then begin
                with party do begin
                   map := 12; xaxis := 25; yaxis := 44;
                end;
                Load;
             end;
          end;
      3 : begin
             if at(66,78) then
             if wantenter('§¹· »¡¦—') then begin
                with party do begin
                   map := 8; xaxis := 25; yaxis := 93;
                end;
                Load;
                if party.etc[40] and bit1 > 0 then PutMap(25,61,48);
             end;
             if at(89,94) then
             if wantenter('§¹· ¬a¶¥') then begin
                with party do begin
                   map := 13; xaxis := 25; yaxis := 7;
                end;
                Load;
             end;
             if at(33,49) then
             if wantenter('Ï©¡i· ¬—¹¥') then begin
                with party do begin
                   map := 14; xaxis := 25; yaxis := 44;
                end;
                Load;
                if party.etc[40] and bit8 = 0 then begin
                   for j := 6 to 17 do
                   for i := 17 to 36 do PutMap(i,j,31);
                end
                else begin
                   PutMap(25,41,0); PutMap(26,41,0);
                end;
             end;
             if at(36,16) then
             if wantenter('¥AŸ¡´i· •·Š‰') then begin
                if party.etc[9] and bit6 = 0 then begin
                   enemynumber := 8;
                   for i := 1 to enemynumber do joinenemy(i,32);
                   Print(7,' ·©Ð—·¡ •·Š‰ ·³ŠµA ”aˆa¬á¸a  ¢´åˆa ¤e¼b·¡');
                   Print(7,'“e ’… ˆ{·e ˆõ·¡ ¥¡µv”a.');
                   PressAnyKey;
                   DisplayEnemies(TRUE);
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 0 then begin
                      with party do begin
                         map := 15; xaxis := 25; yaxis := 44;
                      end;
                      Load;
                   end;
                end
                else begin
                   Print(7,' Ða»¡ e •·Š‰· ·³Š“e  bÑa ·¶´á¬á —i´áˆi ®');
                   Print(7,'ˆa ´ô¯s“¡”a.');
                end;
             end;
             if at(93,6) then
             if wantenter('¡©¢· •·Š‰') then begin
                with party do begin
                   map := 16; xaxis := 10; yaxis := 44;
                end;
                Load;
             end;
          end;
      4 : begin
             if at(42,76) then
             if wantenter('‰·ˆe ·¡•· ‰A·¡Ëa') then begin
                x := 13; y := 72;
                Silent_Scroll;
                Clear;
                Print(7,' ·©Ð—·e ”aŸe ‰µ·a¡ ·¡•· –A´ö”a.');
                exit;
             end;
             if at(13,71) then
             if wantenter('‰·ˆe ·¡•· ‰A·¡Ëa') then begin
                x := 42; y := 77;
                Silent_Scroll;
                Clear;
                Print(7,' ·©Ð—·e ”aŸe ‰µ·a¡ ·¡•· –A´ö”a.');
                exit;
             end;
             if at(41,54) then
             if wantenter('‰·ˆe ·¡•· ‰A·¡Ëa') then begin
                x := 13; y := 72;
                Silent_Scroll;
                Clear;
                Print(7,' ·©Ð—·e ”aŸe ‰µ·a¡ ·¡•· –A´ö”a.');
                exit;
             end;
             if at(14,43) then
             if wantenter('´a¯a¡¡•A¶¯a· •·Š‰') then begin
                if (y = 44) and (party.etc[41] and bit7 = 0) then begin
                   enemynumber := 2;
                   joinenemy(1,64); joinenemy(2,65);
                   DisplayEnemies(TRUE);
                   Print(13,' áÓ—i·¡ ·¡ •·Š‰µA —i´á ˆa‰V”a‰¡ ?');
                   Print(13,' ¶Ÿ¡—i·e  ´a¯a¡¡•A¶“±· ‰wÑ¡Ÿi   {‰¡ ·¶“e');
                   Print(13,'ˆa—¡´e œa·¡ËaµÁ ˆa—¡´e AÏaËaœa‰¡ Ðe”a.  ­¡');
                   Print(13,'ˆ“e ·¡¿qµA¬á {•¡¢Ða‰¡ ¤a¡ ”‰i·i Ða•¡');
                   Print(13,'¢Ða»¡.');
                   PressAnyKey;
                   enemynumber := 8;
                   for i := 1 to 8 do joinenemy(i,55);
                   joinenemy(4,64); joinenemy(8,65);
                   DisplayEnemies(TRUE);
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 0 then begin
                      Clear;
                      Print(13,' ¶¶‚... Ða»¡ e a“e º‚”áœa•¡ Ðe¬aœq·e »¡µ¢');
                      Print(13,'·a¡ ¥¡ º‰V”a.');
                      Print(7,'');
                      Print(7,' ˆa—¡´e AÏaËa“e  º‚‹¡ »¢¸åµA ·©Ð—· –áµA¬á');
                      Print(7,'ˆá”Ðe  a¤ó •¢ÑÁ¬i·i ±¡´v”a.');
                      Print(7,'');
                      j := 1;
                      i := player[1].agility;
                      for k := 2 to 6 do begin
                         if player[i].hp > 0 then
                         if player[i].agility <= i then begin
                            j := k;
                            i := player[j].agility;
                         end;
                      end;
                      Print(12,' ˆa—¡´e AÏaËa·  a¤ó •¢ÑÁ¬i·e ·©Ð— º— ˆa¸w');
                      Print(12,'£¥Àó¬÷·¡ x·e '+player[j].name+'µA‰A ¡wº— Ð–”a.');
                      Print(12,' ‹aŸ¡‰¡, '+player[j].name+ReturnSJosa(player[j].name)+' »b¬a Ð–”a.');
                      with player[j] do begin
                         hp := 0;
                         poison := 1;
                         unconscious := endurance * level * 10 - 2;
                         if unconscious < 1 then unconscious := 1;
                         dead := 1;
                      end;
                      Display_Condition;
                      with party do begin
                         map := 17; xaxis := 25; yaxis := 44;
                      end;
                      Load;
                      party.etc[43] := 0;
                      Silent_Scroll;
                      party.etc[41] := party.etc[41] or bit7;
                   end;
                end
                else begin
                   with party do begin
                      map := 17; xaxis := 25; yaxis := 44;
                   end;
                   Load;
                   party.etc[43] := 0;
                end;
             end;
             if at(9,21) then
             if wantenter('´a¯a¡¡•A¶¯a· •·Š‰') then begin
                with party do begin
                   map := 17; xaxis := 25; yaxis := 7;
                end;
                Load;
                party.etc[43] := 0;
             end;
             if at(27,9) then
             if wantenter('¡AÏ¡¯aÉ¡ÍIA¯a· ¶a¬') then begin
                with party do begin
                   map := 18; xaxis := 25; yaxis := 44;
                end;
                Load;
                face := 5;
                move(Font^[46],Font^[55],294);
                for i := 5 to 294 do
                Font^[55][i] := (Font^[55][i] and chara^[face+28][i]) or (chara^[face][i]);
                if party.etc[1] < 10 then party.etc[1] := 10;
                Scroll(FALSE);
                PutImage(120,11*24,Font^[55],CopyPut);
                for i := 10 downto 6 do begin
                   delay(1000);
                   PutImage(120,i*24,Font^[55],CopyPut);
                   PutImage(120,(i+1)*24,Font^[46],CopyPut);
                end;
                for i := 1 to 2 do begin
                   delay(800);
                   dec(y);
                   Silent_Scroll;
                end;
                for i := 24 to 27 do PutMap(i,44,24);
                for j := 45 to 50 do
                for i := 23 to 28 do PutMap(i,j,29);
             end;
          end;
      7 : begin
             Clear;
             Print(7,' ”w¯¥·¡ •·Š‰ ·³ŠµA —i´áˆaa Ði˜ ´á˜å ‹i·i');
             Print(7,'¥¡´v”a.');
             for i := 1 to 3 do Print(7,'');
             Print(15,'   µa‹¡“e Ðe˜ Ï¡œa£¡—aœa‰¡ ¦‰Ÿ¡¶“e ´b   ');
             Print(15,'    a· •·Š‰·¡´ö»¡ e »¡‹q·e Í­á–A´á ´a   ');
             Print(15,'   ¢•¡ —i´áˆi ®ˆa ´ô¯s“¡”a.');
          end;
      11: begin
             if at(25,7) or at(26,7) then begin
                Clear;
                Print(7,' ”w¯¥·¡ ·³ŠµA —i´áˆaa Ð–»¡ e  ·¡£¡ ·³Š“e');
                Print(7,'Ðq¡© –A´á —i´á ˆi ®ˆa ´ô´ö”a.');
                if not exist(2) then exit;
                if party.etc[31] and bit8 > 0 then exit;
                PressanyKey;
                with player[2] do begin
                   Print(7,' '+name+ReturnSJosa(name)+' •·Š‰· ·³ŠŸi ¹¡¬aÐa”á“¡ ”w¯¥µA‰A  iÐ–”a');
                   Print(7,'');
                   Print(3,' ¸qŒe µa‹¡Ÿi ¥¡‰A. ·¡ ·³ŠµA ˜é´á¹a ·¶“e Ój');
                   Print(3,'·e ”aŸe ‰µ· Ój‰Á“e ”aŸa”a‘A. ·¡ ˆé ¥¡‰Aa.');
                   Print(3,'¡¡œˆa ˆá· ·AŸ¡Àáœñ ¥eÐ·¶»¡ ´g·eˆa. ·¡ ˆå');
                   Print(3,'¦…¡wÓ¡ Ð‚ Í¢¤i·¡  µa‹¡µA¬á ·©´á v´ö”a“e »w');
                   Print(3,'ˆá ·©­A.  ·¡ •·Š‰· ·³Šˆa Ðq¡©–E ·¡·A“e ¤a');
                   Print(3,'¡ Ð‚ ¢‹¡a ´a“¡¡e ˆá‹¡µA Ï©¸âÐa“e Á¡ ¸aµe');
                   Print(3,'¸â·¥   a¤óµA ·Ð¬á ·¥ˆõ ˆ{‘A.  ‹aœý”a¡e ·¡');
                   Print(3,'•·Š‰ ´e· ­A‰µA ¹¥¸Ða“e ·¥¢‰ º—µA¬á ·¡ ¸÷');
                   Print(3,'•¡· ‰¡®º…  a¤ó·i  ¬a¶wÐa“e ¬aœq·¡  ·¶”a“e');
                   Print(3,'­Q·¡œa‘A.');
                end;
                party.etc[31] := party.etc[31] or bit8;
             end;
          end;
      12: begin
             if at(25,28) or at(26,28) then begin
                Clear;
                Print(7,' ”w¯¥·e ·¡ •·Š‰µA —i´á ˆaa‰¡ Ð–»¡ e •·Š‰·');
                Print(7,'·³Š“e  ´á˜áÐe ˆwÐe Ó±µA ·Ð ¢á¹a ·¶´ö‰¡');
                Print(7,'·©Ð——i· Ó±·a¡“e •¡¸áÓ¡ —i´áˆi ¤w•¡ˆa ´ô´ö');
                Print(7,'”a. ‰iŠ‚µA ·©Ð—·e —i´áˆa‹¡Ÿi Í¡‹¡Ð–”a.');
                PutMap(25,25,52); PutMap(26,25,52);
             end;
          end;
   end;
   Silent_Scroll;
end;

Procedure Sign;
begin
   while keypressed do c := readkey;
   Clear;
   yline := 30; hany := 16;
   Print(7,'Îu iµA ³aµa·¶‹¡¡ ...');
   Print(7,''); Print(7,'');
   case party.map of
      2 : begin
             if at(82,101) then begin
                Print(15,'     Ï¡œa£¡—a· ´qÓb·¡ Ñ¡® ¶áŸi §¡');
                Print(15,'     Â‰˜,  ‰¡” ÐµÖ”å ·¸Ña»¥ ·A¸â');
                Print(15,'     ·e ”w¯¥ ´|µA¬á  ‹a »¥ˆaŸi ¤iÐa');
                Print(15,'     ¡a ¦‰¡i· ¬—¡w·i ´e‰a º‰ˆõ·¡”a');
             end;
             if at(143,116) then begin
                Print(15,'     ´á¬áµ¡‰A, Ã¥Šµa.  ¸a‘Aˆa µa‹¡');
                Print(15,'     µA ·¶“e 6 ˆa»¡· ¯¡Ðñ·i É·‰ÁÐe');
                Print(15,'     ”a¡e µw¶¥ ¦‰¡i· ¬—¡w·i µw¶áÐa');
                Print(15,'     ‰A –I ˆé­A.');
             end;
             if at(30,100) then begin
                Print(15,'     µ¡!! Ñe¡wÐe¸aµa. ”w¯¥·e µw¶¥Ðe');
                Print(15,'     ¬—¡w·i ´è·i ¸a‰b·¡ ·¶­¡.  ·¡¹A');
                Print(15,'     ·¸Ña»¥ ·A¸â·e ”w¯¥· ·»¡µA ®…');
                Print(15,'     ·wÐi ˆõ·¡µ¡.');
                party.etc[44] := party.etc[44] or bit1;
             end;
          end;
      6 : begin
             if at(51,84) then begin
                cPrint(15,11,'         µa‹¡“e ','¡´á¬÷','·³“¡”a');
                Print(15,'         µaœá¦…·i ÑÅµwÐs“¡”a');
                for i := 1 to 3 do Print(7,'');
                Print(13,'               ¡—a ´e');
             end;
             if at(24,31) then begin
                Print(7,'');
                Print(15,'             µa‹¡“e ¡´á º¸ñ');
                Print(15,'       µaœá¦… ¡¡–Ÿi ÑÅµwÐs“¡”a !!');
             end;
             if at(51,18) or at(52,18) then begin
                Print(7,'');
                Print(15,'          ¡´á µ×Ÿ³  ºA® ®¶w­¡');
             end;
             if at(77,48) then
                Print(15,'          µa‹¡“e ¡´á ·eÐ—·³“¡”a');
             if at(77,42) then
                Print(15,'       Ðáœb ´ô·¡ —i´áˆa»¡  a¯¡µ¡ !!');
             if at(77,36) then
                Print(15,'            a¤ó¬a ¥AÉI‹A¯a· »³');
             if at(77,30) then begin
                Print(15,'   »¡‹q »³ º·¥·¥ ¸á AŠ‰ž¯a“e µaÐ—·i');
                Print(15,'   ˜áa‰¡ ´ô¯s“¡”a. ¸áµA‰A ¶wˆå·¡ ·¶·a');
                Print(15,'   ¯¥¦…·e ¦‚½¢ Ð´e·a¡ µ¡¯³¯¡µ¡.');
             end;
             if at(77,24) then
                Print(15,'         µa‹¡“e ÑAœaÇiA¯a· »³');
          end;
      7 : begin
             if at(39,68) then begin
                cPrint(15,11,'       µa‹¡“e ','œa¯aËa—¡Ã¡¬÷','·³“¡”a');
                Print(15,    '          µaœá¦…·i ÑÅµwÐs“¡”a');
             end;
             if at(39,8) then Print(12,'        µa‹¡“e µ• Ï¡œa£¡—a · ·³Š');
             if at(54,9) then Print(10,'       µa‹¡“e ‹aœa¶…—a ‰A·¡Ëa· ·³Š');
          end;
      12: begin
             if at(25,41) then begin
                Print(15,'   ”w¯¥·¡ »¡Ða ­A‰¡ É·Ða“e ·³ŠŸi');
                Print(15,'   µi‰¡ ¯¼”a¡e •·Š‰ ­¢· 4ˆ· A¤á');
                Print(15,'   Ÿi ¡¡– ”w‰a º¯³¯¡µ¡.');
             end;
          end;
      18: begin
             if at(24,40) then begin
                Print(10,'   ¤e—a¯¡ ¡AÏ¡¯aÉ¡ÍIA¯aŸi ¢¿©œá º');
                Print(10,'   ¯¡µ¡. ˆåÊŸi §©‰V­¡.');
                for i := 1 to 7 do Print(7,'');
                Print(14,'      ¡—a ´e‰Á µA·¥­eËa ·¡§i¡ ¦Èá');
             end;
             if at(27,40) then begin
                Print(10,'   µb¯¡ a· ‰A·±·e Ò‰ŸWÐa»¡ ´g­¡ ?');
                Print(10,'   ·¡¹A a· 16 ¤å¼ ¸a¸b ‰A·±· ‰i');
                Print(10,'    i·¡ ”aˆaµ¡‰¡ ·¶­¡. ˆá· Ðe”i ˆa');
                Print(10,'   Œa·¡  e—i´ö´ö“e•A...');
                Print(7,'');
                Print(7, '   ¹A¸b ‹¡ˆe :  93/12/08 - 94/01/04');
                Print(7,'');
                Print(15,'    •·´a ”ÐbŠa ¸å‹¡ ‰·Ðb‰Á 92 Ðb¤å');
                Print(15,'        ¸aÃ· ¬a¬w ÂA‰¡· Ïa¡‹aœ á');
                Print(14,'                      ´e µw‹¡¡¦Èá');
             end;
          end;
   end;
end;

end.