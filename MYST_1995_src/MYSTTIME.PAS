Unit MystTime;
{$X+}
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, Voice, MystBatt, MystEnd;

 Procedure Time_Event(event_no : byte);

IMPLEMENTATION

Procedure ViewMap(Map_no : string; _x, _y : integer);
var
   i,j : integer;
   seek_point : word;
   X_len, Y_len : byte;
   _FILE : file;
   Dark : boolean;
   Aux_Map_Header : ^Map_Header_Type;
   map_buf : array[1..11,1..9] of byte;
begin
   assign(_FILE,Map_no+'.m');
   reset(_FILE,1);
   new(Aux_Map_Header);
   BlockRead(_FILE,Aux_Map_Header^,sizeof(Aux_Map_Header^));
   X_len := Aux_Map_Header^.xmax;
   Y_len := Aux_Map_Header^.ymax;
   dispose(Aux_Map_Header);
   _x := _x - 4; _y := _y - 5;
   seek_point := sizeof(Aux_Map_Header^) + (_y - 1) * X_len + (_x - 1);
   seek(_FILE,seek_point);
   for j := 1 to 11 do begin
      BlockRead(_File,map_buf[j],9);
      seek_point := seek_point + X_len;
      seek(_FILE,seek_point);
   end;
   close(_FILE);
   if party.hour in [7..17] then Dark := FALSE
   else begin
      Dark := TRUE;
      if not((party.day mod 30 + 1) in [10..20]) then fillchar(map_buf,sizeof(map_buf),chr(55));
   end;
   _IMAGE_DIRECTION := _STORE;
   for j := 1 to 11 do for i := 1 to 9 do Image(i,j,Font^[map_buf[j,i] and $7F],Dark);
   Screen_Fade_In(600);
   _IMAGE_DIRECTION := _DIRECT;
   for j := 1 to 11 do for i := 1 to 9 do Image(i,j,Font^[map_buf[j,i] and $7F],Dark);
   Clear;
   Print(7,' ”w¯¥·e ®¸÷Š¯i·i É·Ð y¬å Î—‰w·i ¥¡´v”a.');
   PressAnyKey;
   OverLap(600,TRUE);
   Silent_Scroll;
end;

Procedure Time_Event(event_no : byte);
label
   JUMP_TO_THE_FUTURE;
var
   battle_number : byte;
begin
   case event_no of
      0 : begin
             Clear;
             Print(7,' ˆs¸a‹¡ Ðá‰· ­¢µA¬á  µA·¥­eËa ·¡§i· ·q¬÷·¡');
             Print(7,'—iaµÖ”a.');
             delay(1000);
             PressAnyKey;
             Print(9,' '+player[1].name+', ¸÷ i ‹sÐe ·©·¡ ¬—‰v¯s“¡”a.');
             Print(9,' ¤w‹q ”w¯¥·¡ ¡—a´eµA ”Ð ¤eœe·i ‰i¯±Ðe ˆõ');
             Print(9,'·i ¡—a´e·¡ ´i´aÀ–¯s“¡”a.  ´a a ‹a“e ÀåŸ¡´e');
             Print(9,'‰Á •¢¯±·a¡  ”w¯¥·i ‰­¢  ‰ÅÀiÐ–”åˆõ ˆ{¯s“¡');
             Print(9,'”a.  »¡‹q ¡´á¬÷µA¬á“e ”w¯¥‰Á ¤Ÿ¡´åËa Ï¡Ïi');
             Print(9,'»a· ¬aœq—i·i ¹AˆáÐi ¶w¬a—i·i ¡¡·a‹¡ ¯¡¸bÐ–');
             Print(9,'¯s“¡”a.  ‹aŸ¡‰¡ ¸â´á•¡ ¡y·©Ò¡e ·¡‰µ·a¡ »¥');
             Print(9,'‰bÐe”a‰¡ Ðs“¡”a.  ”w¯¥· “wb·¡œa¡e  Â—¦…Ó¡');
             Print(9,'¸a¯¥·i ¤w´áÐi ® ·¶‰V»¡ e  ¡¡—e ¤Ÿ¡´åËa Ï¡');
             Print(9,'Ïi»a· ¬aœq—i·i ¥¡Ñ¡Ð º‹¡œe µb¦¹¢ ·©ˆõ·³');
             Print(9,'“¡”a.  ‹aœ¬á Ðe¯¡¤a«¡ ·¡‰µ ¬aœq—i·i ´e¸åÐe');
             Print(9,'‰µ·a¡ ·¡•· ¯¡Åa º´ö·a¡e Ðs“¡”a. ”w¯¥·e ‹a');
             Print(9,'—i·¡ ¬i‹¡ ¹½·i eÐa‰¡ ¸é”¡ ¡—a´e· Ê¯¡“w');
             Print(9,'b·¡ £¡Ã¡»¡ ´g·i ‰µ·i Àx´a º¯³¯¡¶a. ‹aŸ¡‰¡');
             Print(9,'‹a ¶áÃ¡Ÿi ´iaº¯¡¡e a á»¡“e ¹Aˆa ”q”wÐa‰V');
             Print(9,'¯s“¡”a.');
             Print(9,'');
             PressAnyKey;
             mapname := 'HdsGate';
             Load;
             Silent_Scroll;
             Print(9,' »¡‹q ”w¯¥·¡ ¬á·¶“e ‰µ·e  ''Ða•A¯a ‰A·¡Ëa''œa');
             Print(9,'“e ‰µ·³“¡”a. ·¡‰µ·e ¡´á­A‰· 6¤å¼ ÉAœa·¥');
             Print(9,'Ða•A¯a ÉAœa¡  ·¡•·Ða“e ¢…·¡  ·¶“e ‰µ·¡‹¡•¡');
             Print(9,'Ðs“¡”a. Ða•A¯a ÉAœa“e ¡´á ”ŸB· »¡ÐaµA ·¶');
             Print(9,'·a¡a  ¡—a´e‰Á a· Ê¯¡“wb·¡  ¸åÑa É·Ða»¡');
             Print(9,'¡µÐa“e ‰µ·³“¡”a.  ”w¯¥·e ·¡‰µ·i É·Ð Ða•A¯a');
             Print(9,'ÉAœa¡ ˆeÒ ¤Ÿ¡´åËa Ï¡Ïi»a· º£¥—i·¡ ´e¸å');
             Print(9,'Ða‰A  ¬i ® ·¶“e ‰µ·i  Àx´a¡e –A“e ˆõ·³“¡');
             Print(9,'”a. ´a a ”w¯¥· Ê¯¡“wb·¡ Çe •¡¶‘·i º‰ˆõ·³');
             Print(9,'“¡”a.  ¹Aˆa ”w¯¥µA‰A Ça¡ Ë¢ ÇaŸ¡¯aÈi·i —a');
             Print(9,'Ÿ¡‰V¯s“¡”a.  ”w¯¥·¡ ˆa¸w ¹½·e ¸w­¡Ÿi Àx´v·i');
             Print(9,'˜ ·¡ ÇaŸ¡¯aÈi·i ¬a¶wÐa¯³¯¡¶a.  ‹aŸ¡¡e ¸á·');
             Print(9,'Ê¯¡b‰Á  ‹a ÇaŸ¡¯aÈi·¡ ¬á¡ ŠaˆqÐaµa  a·');
             Print(9,'Ê¯¡b·¡ ‹a‰µ·a¡ ¸b¶wÐi ˆõ·³“¡”a.');
             Print(9,' ”w¯¥· ¬÷‰··i §©‰V¯s“¡”a.');
             Print(9,'');
             inc(party.crystal[8]);
             PressAnyKey;
          end;
      1 : begin
             mapname := 'Dome';
             Load;
             for j := 1 to Map_Header.ymax do
             for i := 1 to Map_Header.xmax do
             if Real_Map(i,j) = 0 then PutMap(i,j,47);
             PutMap(26,14,35);
             PutMap(13,27,44);
             PutMap(22,35,47);
             PutMap(39,29,31);
             PutMap(19,54,44);
             PutMap(30,63,47);
             PutMap(19,73,47);
             PutMap(38,41,31);
             x := 25;
             y := 50;
             Silent_Scroll;
             Clear;
             Print(9,' ÓA...  ¸á· µqb·i Á·•·¶¥Ðaµa ´á“a ¸÷•¡ ¬a');
             Print(9,'œq·¡ ¬i ® ·¶“e •¡¯¡Ÿi  ˆå¬éÐ  ¥¡´v¯s“¡”a.');
             Print(9,'·¡¹A“e ¤Ÿ¡´åËa Ï¡Ïi»a· ¬aœq—i·i µa‹¡¡ ‰·');
             Print(9,'ˆe·¡•· ¯¡Åa ¥¡‰V¯s“¡”a.  ·¡¤åµA•¡ ¹¡‹q ‹¡”a');
             Print(9,'a´¡ Ði ˆõ·³“¡”a');
             with party do begin
                watch_year := year;
                watch_day := day;
                watch_hour := hour;
                watch_min := min;
                watch_sec := sec;
             end;
             Time_Watch := TRUE;
             Time_Event_No := 2;
             watch_min := watch_min + 30;
             if watch_min > 59 then begin
                watch_min := watch_min - 60;
                watch_hour := watch_hour + 1;
                if watch_hour > 23 then begin
                   watch_hour := watch_hour - 24;
                   watch_day := watch_day + 1;
                   if watch_day > 359 then begin
                      watch_day := watch_day - 360;
                      watch_year := watch_year + 1;
                   end;
                end;
             end;
          end;
      2 : begin
             mapname := 'Dome';
             i := x; j := y;
             Load;
             x := i; y := j;
             while not (Real_Map(x,y) in [27..47]) do inc(x);
             Silent_Scroll;
             Clear;
             Print(9,' ·¡‰µ·a¡ µ¡‹¡ ¶¥Ða“e  ¡¡—e ¤Ÿ¡´åËa Ï¡Ïi»a');
             Print(9,'· ¬aœq—i·i ·¡‰µ·a¡ ¦‰œö¯s“¡”a.  µa‹¡· ¬a');
             Print(9,'œq—i‰Á ·¡´¡‹¡Ÿi a’…Ò ¬÷¤c·a¡ aµ©˜ ”w¯¥');
             Print(9,'·i »¡¬w­A‰¡ ·¡•· ¯¡Åa º‰V¯s“¡”a. ¹½·e ·¡');
             Print(9,'´¡‹¡  g·¡ a’¯¡‹¡ ¤aœs“¡”a.');
             setbit(32);
          end;
      3 : begin
             Clear;
             Print(7,' ”w¯¥·¡ ‹©·i ˆa”åº— ”w¯¥· •·žaµv”å ‹a ¬aœq');
             Print(7,'—i·i  ea‰A –A´ö”a.');
             delay(1000);
             PressAnyKey;
             Print(6,' —a—¡´á  evŠ…, '+player[1].name+'.');
             Print(6,' ¡—a´e·i ¤¯¥Ða‰V”a“e ¸a‘A· ¬—ˆb·¡ µ°´v”a');
             Print(6,'‘A.  ¶Ÿ¡ˆa ¸a‘AµÁ ÑA´á»¥Ò ¡—a´eµA‰A ˆv·i');
             Print(6,'˜  ¡—a´e·e ¶Ÿ¡µA‰A ¡i w”wÐe ‘A ¹·¹¢· ¶¥');
             Print(6,'Ñ¥·i ¥··¥Ða“e ·©·i ¯¡Åv”a‘A. ¶Ÿ¡“e ÅáÓ¡ ¯w');
             Print(6,'œbÐa¡a ‹a ·©·i Ðº´ö»¡. Ða»¡ e ¶Ÿ¡· •¡¶‘');
             Print(6,'·¡ ”á ·¡¬w Ï©¶a´ô‰A –A¸a ¡—a´e·e ‹a ¸a¯¥·i');
             Print(6,'¶áÐ  ¶Ÿ¡· •·žaµv”å Äa‘¡Î¯aŸi  ´b· ¸å¬a');
             Print(6,'‘AÇa¡ e¬á¡ ˆ¹¡Ðaµa ”aŸe Àa¶¥·a¡ ¥¡ ¤á');
             Print(6,'v”a‘A.  ¶Ÿ¡“e ‹a ¬a¯©·i ´i´aÀ¸a ¡´á¬÷·i');
             Print(6,'ÈiÂ‰Ðaµa ¸a‘AŸi Àx´a µa‹¡Œa»¡ µÖ”a‘A.  ¸a‘A');
             Print(6,'µÁ ”a¯¡ ÐsŸAÐaµa ¡—a´e‰Á °a¶‰¡ ¯¼‘A.');
             for i := 1 to 5 do Print(6,'');
             m[0] := '';
             m[1] := 'ÅáÓ¡ ¯wœbÐa‰V‘A';
             m[2] := 'Ða»¡ e ·¡£¡ “x´ö‘A';
             if Select(230,2,2,FALSE,TRUE) <> 2 then begin
                for i := 2 to 5 do begin
                   for j := 0 to 8 do player[i].name[j] := player[i].name[j+9];
                end;
                Display_Condition;
                setbit(49);
             end;
             with party do begin
                watch_year := year;
                watch_day := day;
                watch_hour := hour;
                watch_min := min;
                watch_sec := sec;
             end;
             Time_Watch := TRUE;
             Time_Event_No := 4;
             watch_min := watch_min + 30;
             if watch_min > 59 then begin
                watch_min := watch_min - 60;
                watch_hour := watch_hour + 1;
                if watch_hour > 23 then begin
                   watch_hour := watch_hour - 24;
                   watch_day := watch_day + 1;
                   if watch_day > 359 then begin
                      watch_day := watch_day - 360;
                      watch_year := watch_year + 1;
                   end;
                end;
             end;
          end;
      4 : begin
             Clear;
             Print(7,' ”w¯¥·¡ ‹©·i ˆa”åº— ˆs¸a‹¡ ˆwÐe ‹¡¶…·¡ –‰œá');
             Print(7,'°a‰¡ ·¶·q·i ´i´aÀ–”a.  ‹¡Àâ·i ´ôµA‰¡ Ê¯¡¡');
             Print(7,'º¶áŸi ¥¡´v·i˜ ¬a¤w·i Í¡¶áÐa‰¡ ·¶“e ¡´á¬÷');
             Print(7,'· ¥w¬a—i·i ¥© ® ·¶´ö”a. ¡—a´e·¡ ÀåŸ¡´e·a');
             Print(7,'¡  ¶Ÿ¡—i·i Àx´a´á  ·¡‰µ·a¡ ”Š…·i ¥¡…');
             Print(7,'ˆõ·±µA ËiŸ±´ô´ö”a.  ¶Ÿ¡—i·e ‰¨ ¤é´á»© ¸åÊ');
             Print(7,'Ÿi ¶áÐ È­AŸi ˆxÂ´ö”a. ”w¯¥·¡ Ê¯¡¡ º¶á');
             Print(7,'Ÿi ‰w‰Ða”åº— ‘©œs‰A•¡ ”Š…·i »¢¸ó »¡ÒáÐa“e');
             Print(7,'¡—a´e·i ¥¡´v”a.  ‹aˆa »¢¸ó a¬ö”a¡e ‹a eÇq');
             Print(7,'a· ¯w¬e•¡ º‰´á—e”a“eˆé  ´i‰¡·¶´ö”a.  ·¡¹A');
             Print(7,'‰i¥·e ”e Ðeˆa»¡µv”a.  ¤a¡ ¡—a´e·¡ ·¶“e½¢');
             Print(7,'·a¡ š‰¡ —i´áˆa ‹aµÁ ¬w”Ða“e ˆõ·¡´ö”a. ‹a');
             Print(7,'Ÿ¡‰¡ ˆa ‹aŸi Œâ´á¤áŸ¥”a¡e ”¦¦…· ¥w¬a—i');
             Print(7,'·e ¬a‹¡Ÿi ·°‰¡  •¡ wˆa¤áŸ© ˆõ·¡‹¡ ˜¢…·¡”a.');
             Print(7,'·©Ð—·e  ¬á¡µA‰A ¯¥Ñ¡Ÿi ¥¡¡a  a· ¬—ˆbµA');
             Print(7,'•··Ÿi ÎaÐ–”a. ·¡¹A“e »¡ÁAÐi ¯¡ˆe·¡ ´ô´ö”a.');
             Print(7,'¶Ÿ¡—i·e  ‰¨¤a¡ ¡—a´e·¡ ·¶“e ½¢·i Ð·Ð š');
             Print(7,'‰¡ —i´áˆa‹¡ ¯¡¸bÐ–”a.');
             Print(7,'');
             PressAnyKey;
             for battle_number := 1 to 5 do begin
                Clear;
                enemynumber := 8;
                for i := 1 to 8 do joinenemy(i,67);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(TRUE,FALSE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] = 2 then begin
                      Clear;
                      Print(7,' ·©Ð—·e á¢  g·e ¸â—iµA‰A Í¡¶á–A´á¬á •¡ w');
                      Print(7,'ˆi ®ˆa ´ô´ö”a.');
                      PressAnyKey;
                   end;
                until party.etc[6] = 0;
                EndBattle(i);
                if i = 1 then goto JUMP_TO_THE_FUTURE;
             end;
             for battle_number := 1 to 4 do begin
                Clear;
                enemynumber := 8;
                for i := 1 to 6 do joinenemy(i,67);
                joinenemy(7,68);
                joinenemy(8,69);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(TRUE,FALSE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] = 2 then begin
                      Clear;
                      Print(7,' ·©Ð—·e á¢  g·e ¸â—iµA‰A Í¡¶á–A´á¬á •¡ w');
                      Print(7,'ˆi ®ˆa ´ô´ö”a.');
                      PressAnyKey;
                   end;
                until party.etc[6] = 0;
                EndBattle(i);
                if i = 1 then goto JUMP_TO_THE_FUTURE;
             end;
             for battle_number := 1 to 2 do begin
                Clear;
                enemynumber := 8;
                for i := 1 to 4 do joinenemy(i,69);
                for i := 5 to 8 do joinenemy(i,68);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(TRUE,FALSE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] = 2 then begin
                      Clear;
                      Print(7,' ·©Ð—·e á¢  g·e ¸â—iµA‰A Í¡¶á–A´á¬á •¡ w');
                      Print(7,'ˆi ®ˆa ´ô´ö”a.');
                      PressAnyKey;
                   end;
                until party.etc[6] = 0;
                EndBattle(i);
                if i = 1 then goto JUMP_TO_THE_FUTURE;
             end;
             Clear;
             enemynumber := 8;
             for i := 1 to 4 do joinenemy(i,68);
             for i := 5 to 7 do joinenemy(i,69);
             joinenemy(8,70);
             repeat
                DisplayEnemies(TRUE);
                BattleMode(FALSE,FALSE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   Clear;
                   Print(7,' ·©Ð—·e á¢  g·e ¸â—iµA‰A Í¡¶á–A´á¬á •¡ w');
                   Print(7,'ˆi ®ˆa ´ô´ö”a.');
                   PressAnyKey;
                end;
             until party.etc[6] = 0;
             EndBattle(i);
             if i = 1 then goto JUMP_TO_THE_FUTURE;
             enemynumber := 8;
             for i := 1 to 6 do joinenemy(i,71);
             joinenemy(7,72);
             joinenemy(8,73);
             repeat
                DisplayEnemies(TRUE);
                BattleMode(TRUE,FALSE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   Clear;
                   Print(7,' ·©Ð—·e á¢  g·e ¸â—iµA‰A Í¡¶á–A´á¬á •¡ w');
                   Print(7,'ˆi ®ˆa ´ô´ö”a.');
                   PressAnyKey;
                end;
             until party.etc[6] = 0;
             EndBattle(i);
             if i = 1 then goto JUMP_TO_THE_FUTURE;
             Clear;
             Print(7,' ”w¯¥·e  Ó±‰s‰A ¡—a´e·i ¢‰Ÿ¡Áv”a.  ‹aŸ¡‰¡');
             Print(7,'µ¬w”¡  ¡´á¬÷· ¥w¬a—i·e  ¸a¯¥· Š…ºˆa');
             Print(7,'ÌÐa¸a ª‰ª‰·¡ Ó{´á¹a ¤áv”a. ¤éÌeµA“e ”w¯¥');
             Print(7,'·¡ º‚·¥ ®  g·e ¯¡ÁAˆa éa·¶´ö”a.');
             mapname := 'Lore';
             Load;
             x := 51; y := 31;
             PutMap(51,28,42);
             PressAnyKey;
             OverLap(1000,FALSE);
             Print(7,'´é aÒ ¡´á¬÷µA“e ¬÷”Ðe ·¯¢·¡ Ð—Ð¹v”a.');
             face := 1;
             if player[1].classtype = magic then inc(face,8);
             for j := 11 downto 3 do begin
                if j < 11 then PutTile(5,j+1,42);
                PutSprite(5,j,face);
                delay(800);
             end;
             face := 0;
             if player[1].classtype = magic then inc(face,8);
             PutTile(5,3,42);
             PutSprite(5,3,face);
             Print(7,' ‹aˆõ·e  ¤a¡ ¬¡¶… Š…ºŸi Èe¬— ¯¡Ç¡“e ¸a');
             Print(7,'Ÿ¡µv”a. »¥¸÷Ðe ¬å·i Ð—Ði ® ·¶“e ¸a e·¡ ¬é');
             Print(7,'® ·¶“e ¸aŸ¡.');
             delay(1500);
             for i := 1 to 4 do begin
                if i > 1 then PutTile(i-1,3,Real_Map(x-5+i-1,y-3));
                PutSprite(i,3,21);
                delay(800);
             end;
             delay(1500);
             PutTile(5,3,54);
             for i := 4 downto 1 do begin
                PutTile(i,3,Real_Map(x-5+i,y-3));
                if i > 1 then begin
                   PutSprite(i-1,3,22);
                end;
                delay(800);
             end;
             Print(7,' ‹a ·¯¢· º·¥‰··e ¤a¡ ”w¯¥·¡´ö”a.  ¬¡');
             Print(7,'¶…  ¡´á ­A‰· µb¬aŸi Àw¹¡Ða“e  ‹a ®…ˆe·i');
             Print(7,'¡¡—e ¬aœq—i·e –­¥ ¡¡´a Àe£¡Ðaµv”a.');
             PressAnyKey;
             End_Demo(2);

JUMP_TO_THE_FUTURE:
             Scroll(TRUE);
             Clear;
             Print(7,' ·¡¹A“e ¡—a´eµA‰A ÌÐa“eŠaÐa¡a ¡¡—eˆõ·i');
             Print(7,'”e‘qÐaa“e ®…ˆe  §¹a“e ‰×Àˆa ”w¯¥·i –‰œá');
             Print(7,'°a‹¡ ¯¡¸bÐ–”a. ‹aŸ¡‰¡“e ¨ia —i´áˆa—u ”w¯¥');
             Print(7,'·i ˆq°a”å ‰×À“e Àa¶¥· Ëq­¢·a¡ ”w¯¥·i ¡©');
             Print(7,'´aý´ö”a.');
             delay(1000);
             PressAnyKey;
             Delete_Scroll_Screen;
             mapname := 'Ground1';
             Load;
             x := 58; y := 79;
             with party do begin
                year := 795;
                day := 18;
                hour := 9;
                min := 0;
                sec := 0;
             end;
             for i := 1 to 6 do
             with player[i] do
             if name <> '' then begin
                hp := 1;
                poison := 0;
                unconscious := 0;
                dead := 0;
             end;
             Display_Condition;
             Print(7,' ´é aa ´a—bÐe ®…ˆe·¡ »¡v·iŒa...');
             Print(7,' ”w¯¥·e ¢…—b ¸÷¯¥·i Àav”a.  ‹aŸ¡‰¡ ”w¯¥·¡');
             Print(7,'¥¥ ˆõ·e ¢¥ˆa y¬å—uÐe ¡´á ”ŸB· ¡¡¯s·¡´ö');
             Print(7,'”a.');
             OverLap(500,TRUE);
             PressAnyKey;
             Print(7,' ”w¯¥· ŠõˆaµA¬á ŠáµA ·¢·e ¡¢­¡Ÿ¡ˆa ¶‰aÌá');
             Print(7,'¹v”a.');
             Print(7,'');
             Print(10,' a“e ”w¯¥·i ·¡œå ¶…¡w·a¡ i´á—iµv”å ´i§¡');
             Print(10,'Aµ¡œa“e µ´å¸a·¡µ¡. ¢‰¥ ”w¯¥·e aŸi ´i‰V');
             Print(10,'»¡¶a.  a“e ·¡‰µ· ¹¥¸ˆa ´a“¡œa¬á  ·¡‰µ·');
             Print(10,'µb¬aµA ‰ÅµaÐi ¸a‰b·e ´ô­¡.  Ða»¡ e  ”w¯¥·');
             Print(10,'¶á‹sÐe ¬wÑ×·i ¥¡‰¡“e Àq·i ®ˆa ´ô´á¬á Àa¶¥');
             Print(10,'·¡Èi  a¤ó·a¡ ”w¯¥·i 795‘e·a¡ µ¡‰AÐ–­¡.');
             Print(10,'');
             Print(10,' ·¡£¡ ¡´á ­A‰“e  ”w¯¥·i ·¸Ña»¥ ·¥¢‰¡ Íw');
             Print(10,'ˆaÐi ¸÷•¡· ­A¶©·¡ »¡v­¡.  ‰iÅ¡ ”w¯¥·i ´i');
             Print(10,'´a¥© ¬aœq·e ·¡‰µµA ´ô·iˆá¶a. ­A¬w· ÂAˆw¸a');
             Print(10,'µv”å ¡—a´e·e ·¡¹A ‹¡b·¡  g·¡ ´¢Ð¹a¬á »¡');
             Print(10,'‹q ”w¯¥·  x®¡¬á Â—¦…ÐaŸ¡œa ¬—ˆbÐaµ¡. ·¡');
             Print(10,'¹A ”w¯¥·e ¥i ¹A´¢´ô·¡ ¡´á¬÷·a¡ —i´áˆi ®');
             Print(10,'·¶·iˆá¶a.');
             Print(10,' ˆá‹¡¬á  ÂAÒ· ‰i¸å·i ¤éµa  »¥¸÷Ðe ¸÷·Ÿi');
             Print(10,'¯©ÑeÐa¯¡µ¡. Ð—¶…·i §©‰V­¡.');
             Print(10,'');
             PressAnyKey;
          end;
      5 : case party.etc[26] of
            0 : if (mapname = 'Ground2') and on(92,12) then begin
                   enemynumber := 1;
                   joinenemy(1,60);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' ”w¯¥·e µ¡Ça· ¶¥Ñ¥·i ÇaŸ¡¯aÈi ¥© ­¢µA ¥··¥');
                   Print(15,'¯¡Åv”a.');
                   inc(party.etc[26]);
                end else ViewMap('Ground2',92,12);
            1 : if (mapname = 'Ground3') and on(35,34) then begin
                   enemynumber := 1;
                   joinenemy(1,61);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' ”w¯¥·e Ëa©· ¶¥Ñ¥·i ÇaŸ¡¯aÈi ¥© ­¢µA ¥··¥');
                   Print(15,'¯¡Åv”a.');
                   inc(party.etc[26]);
                end else ViewMap('Ground3',35,34);
            2 : if (mapname = 'Ground4') and on(11,91) then begin
                   enemynumber := 1;
                   joinenemy(1,62);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' ”w¯¥·e Å¡¥©Ëa· ¶¥Ñ¥·i ÇaŸ¡¯aÈi ¥© ­¢µA ¥·');
                   Print(15,'·¥ ¯¡Åv”a.');
                   inc(party.etc[26]);
                end else ViewMap('Ground4',11,91);
            3 : if (mapname = 'Ground1') and on(44,50) then begin
                   enemynumber := 1;
                   joinenemy(1,63);
                   repeat
                      DisplayEnemies(TRUE);
                      BattleMode(FALSE,TRUE);
                      if party.etc[6] = 254 then exit;
                      if party.etc[6] = 2 then Clear;
                   until party.etc[6] = 0;
                   Clear;
                   Print(15,' ”w¯¥·e —aœaÅ¥· ¶¥Ñ¥·i ÇaŸ¡¯aÈi ¥© ­¢µA ¥·');
                   Print(15,'·¥ ¯¡Åv”a.');
                   inc(party.etc[26]);
                   party.etc[20] := 11;
                end else ViewMap('Ground1',44,50);
            4 : begin
                   Clear;
                   Print(7,' ÇaŸ¡¯aÈi ¥© ­¢µA“e  ´a¢ˆõ•¡ ˜áµ¡Ÿa»¡ ´g´v');
                   Print(7,'”a.');
                end;
          end;
   end;
end;

end.
