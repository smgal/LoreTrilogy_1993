Unit MystSpec;
{$O+,F+}
INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, Voice, MystBatt, MystEnd;

 Procedure SpecialEvent;


IMPLEMENTATION


Procedure Plus_Ability_Sub(st : string);

const
   Price_Data_Sub : array[1..30] of longint = (
                30,60,125,250,500,1000,2000,3000,4000,6000,
                8000,12000,16000,24000,32000,64000,96000,128000,192000,256000,
                384000,512000,770000,1000000,1500000,2000000,2500000,3000000,350000,4000000);
var
   price_data : array[1..30] of longint;
   max, ability : byte;
   k : integer;
begin
   Print(7,' ”w¯¥·e a· ¢…¹AŸi ¡¡–  xÂ´ö­¡.  ‹a ¥¡”s');
   Print(7,'·a¡,  ”w¯¥·¡ Ñ×‹q·i aµA‰A ¤aÃ¥”a¡e ”w¯¥—i');
   Print(7,'º—· Ðe¬aœq· '+st+'·i Ðe ”e‰ µ©a º‰V­¡.');
   k := ChooseWhomSub(130,FALSE,FALSE);
   if k = 0 then exit;
   if st = '¸÷¯¥b' then begin
                    max := 30;
                    ability := player[k].mentality;
                    for i := 1 to max do price_data[i] := Price_Data_Sub[i];
   end;
   if st = '·¥b' then begin
                    max := 30;
                    ability := player[k].endurance;
                    for i := 1 to max do price_data[i] := Price_Data_Sub[i];
   end;
   if st = 'ÁAb' then begin
                    max := 30;
                    ability := player[k].strength;
                    for i := 1 to max do price_data[i] := Price_Data_Sub[i];
   end;
   if st = '£¥Àó¬÷' then begin
                    max := 20;
                    ability := player[k].agility;
                    for i := 1 to max do price_data[i] := Price_Data_Sub[i];
   end;
   if st = '¸÷ÑÂ¬÷' then begin
                    max := 20;
                    ability := player[k].accuracy;
                    for i := 1 to max do price_data[i] := Price_Data_Sub[i+1]
   end;
   with player[k] do begin
      if ability >= max then begin
         Print(7,name+ReturnSJosa(name)+' »¡‹q ÂA‰¡· '+st+' ®Ã¡·³“¡”a.');
         exit;
      end;
      if party.gold < price_data[succ(ability)] then begin
         str(price_data[succ(ability)],s);
         Print(7,'·©Ð—·e '+s+' ˆ· Ñ×‹q·¡ Ï©¶aÐs“¡”a.');
         exit;
      end;
      inc(ability);
      party.gold := party.gold - price_data[ability];
      str(ability,s);
      Print(15,name+ReturnSJosa(name)+'· '+st+'·e ·¡¹A '+s+'·³“¡”a.');
   end;
   if st = '¸÷¯¥b' then player[k].mentality := ability;
   if st = '·¥b' then player[k].endurance := ability;
   if st = 'ÁAb' then player[k].strength := ability;
   if st = '£¥Àó¬÷' then player[k].agility := ability;
   if st = '¸÷ÑÂ¬÷' then player[k].accuracy := ability;
end;

Procedure Plus_Mentality;
begin
   Plus_Ability_Sub('¸÷¯¥b');
end;
Procedure Plus_Endurance;
begin
   Plus_Ability_Sub('·¥b');
end;

Procedure Plus_Strength;
begin
   Plus_Ability_Sub('ÁAb');
end;

Procedure Plus_Agility;
begin
   Plus_Ability_Sub('£¥Àó¬÷');
end;

Procedure Plus_Accuracy;
begin
   Plus_Ability_Sub('¸÷ÑÂ¬÷');
end;

Procedure Find_Gold(bit : byte; value : longint);
begin
   if not getbit(bit) then begin
      findgold(value);
      setbit(bit);
   end;
end;

Procedure Find_Item(var param : byte; bit, item_number, value : byte);
const
   data : array[1..10] of string[15] = (
             'ÁAb ÒA¥¢´¢·i',' a¤ó ÒA¥¢´¢·i','Ð•¢· ´¢Á¡Ÿi',
             '·¯¢· ´¢Á¡Ÿi','¦ÑÉ· ´¢Á¡Ÿi','­¡ÑÅ ¢…¬áŸi',
             '”Ñw Ñõ¦‰·i','®¸÷ Š¯i·i','§¡Ð— ¦ÃaŸi','·¡•· Š¯i·i');
begin
   if param and bit = 0 then begin
      Clear;
      str(value,s);
      Print(7,'·©Ð—·e '+data[item_number]+' '+s+'ˆ ¤i‰eÐ–”a.');
      if party.item[item_number] + value < 256 then
         party.item[item_number] := party.item[item_number] + value
      else
         party.item[item_number] := 255;
      param := param or bit;
   end;
end;

Function sgn(eq : integer) : integer;
begin
   if eq > 0 then sgn := 1
   else if eq < 0 then sgn := -1
   else sgn := 0;
end;

Function Random_Order(max_no : byte) : boolean;
var
   data : array[0..10] of byte;
   temp, swap : byte;
   i,k : integer;
   aux_m : array[0..10] of string[50];
begin
   for i := 0 to max_no do data[i] := i;
   for i := max_no downto 1 do begin
      temp := random(max_no) + 1;
      swap := data[i];
      data[i] := data[temp];
      data[temp] := swap;
   end;
   move(m,aux_m,sizeof(m));
   for i := 1 to max_no do m[i] := aux_m[data[i]];
   k := Select(180,max_no,max_no,FALSE,TRUE);
   if data[k] = max_no then
      Random_Order := TRUE
   else
      Random_Order := FALSE
end;

Procedure SpecialEvent_Sub1;
begin

   scroll(TRUE);

   if mapname = 'Ground1' then begin
      if on(30,20) and (not getbit(51)) then begin
         Clear;
         enemynumber := 7;
         joinenemy(1,36);
         enemy[1].name := 'Í©¢¯a';
         for i := 2 to 7 do begin
            joinenemy(i,34);
            enemy[i].name := 'ˆw•¡';
         end;
         DisplayEnemies(TRUE);
         Print( 7,' ”w¯¥·¡ ‹©·i ˆa”å •¡º—µA ˆs¸a‹¡ ˆw•¡ˆa aÈa');
         Print( 7,'v”a.  ‹aŸ¡‰¡ ¹A·© ´|µA ·¶“e µa¸a ˆw•¡ˆa  i');
         Print( 7,'·i Œá–”a.');
         Print( 7,'');
         Print(13,' ·¡œå ‰µµA ˆó•¡ ´ô·¡ •©´a”a“¡”a“¡, ÐaÐaÐa.');
         Print(13,' ¶Ÿ¡ 7 ¡w· “wb·i ”wÐ»¡ ¡µÐi ˆõ ˆ{·a¡e');
         Print(13,'®…®…Ó¡ ˆa»¥ •¥·i ”a ‘½´aœa.');
         setbit(51);
         m[0] := '';
         m[1] := 'ˆa»¥ •¥·i ¡¡– º…”a';
         m[2] := '¬å¹A ‰·‰b·i ˆaÐe”a';
         if Select(190,2,2,FALSE,TRUE) = 1 then begin
            party.gold := 0;
            Scroll(TRUE);
            Print(7,' ”w¯¥·e ˆw•¡µA‰A ¡¡—e •¥·i ¨´v‰v”a.');
            exit;
         end;
         BattleMode(TRUE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(13,' ·b!! a· Ì¤Ÿi ·¥¸÷Ða‰V”a.  a“e ¶¥œ ´q');
         cPrint(13,11,'¬i¸a¡ ·©Ða”å ','Í©¢¯a','œa‰¡Ðe”a. ®e·i ¡¢¸â·a');
         Print(13,'¡ ”w¯¥‰Á •·Ð—Ða‰¡ ¯¼”a. ”w¯¥·e ´á˜åˆa?');
         m[0] := '';
         m[1] := '¹½­¡, ÐáœbÐa‰V­¡';
         m[2] := '‹aœý‰A“e ´g–Aµ¡';
         if Select(150,2,2,FALSE,TRUE) = 1 then begin
            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := 'Í©¢¯a';
                  sex := female;
                  class := 6;
                  classtype := sword;
                  level := 5;
                  strength := 15;
                  mentality :=19;
                  concentration := 20;
                  endurance := 11;
                  resistance := 18;
                  agility := 20;
                  accuracy := 17;
                  luck := 10;
                  poison := 0;
                  unconscious := 0;
                  dead := 0;
                  hp := 1;
                  sp := 0;
                  experience := 0;
                  potential_experience := ReturnEXP(level);
                  weapon := 18;
                  shield := 0;
                  armor := 1;
                  potential_ac := 2;
                  sword_skill := 10;
                  axe_skill := 0;
                  spear_skill := 35;
                  bow_skill := 10;
                  shield_skill := 0;
                  fist_skill := 20;
                  Modify_Item(k);
                  setbit(45);
                  Silent_Scroll;
                  Display_Condition;
                  Clear;
               end;
            end
            else begin
               Print(7,' ¤é°á ¬aœq·¡ ¡¡– À¶¡¹a ·¶Š….  ”a·q ‹¡ÒAŸi');
               Print(7,'Ÿi ‹¡”aŸ¡»¡.');
               exit;
            end;
         end
         else asyouwish;
      end;
      if on(84,86) then begin
         if party.year > 699 then exit;
         if wantenter('Ða•A¯a ‰A·¡Ëa') then begin
            mapname := 'HdsGate';
            Load;
            Scroll(TRUE);
            exit;
         end;
      end;
   end;

   if mapname = 'Lore' then begin
      if on(44,10) and (party.etc[20] = 0) then begin
         for i := 9 downto 7 do begin
            if (i+1) <= 9 then PutTile(i+1,6,44);
            PutTile(i,6,53);
            delay(1000);
         end;
         Clear;
         Print(9,' ´á·¡, '+player[1].name+'. ¡—a´e“±·¡ é Àx·a¯¥”a. ˜aœaµÁ!');
         PressAnyKey;
         PutTile(6,6,44);
         delay(2000);
         j := 2; if player[1].classtype = magic then inc(j,8);
         for i := 6 to 10 do begin
            if i < 10 then PutTile(i,6,44);
            PutTile(i-1,6,44);
            if i < 9 then PutTile(i+1,6,53);
            if i < 10 then PutSprite(i,6,j);
            delay(800);
         end;
         Delete_Scroll_Screen;
         delay(2000);
         x := 51; y := 31;
         aux := soundon;
         soundon := FALSE;
         Scroll(FALSE);
         soundon := aux;
         b := 1; if player[1].classtype = magic then inc(b,8);
         for k := 11 downto 6 do begin
            if (k+1) <= 11 then begin
               PutTile(4,k+1,i); PutTile(5,k+1,j);
            end;
            i := Real_Map(50,k+25); j := Real_Map(51,k+25);
            PutSprite(4,k,13); PutSprite(5,k,b);
            delay(700);
         end;
         s := ReturnBJosa(player[1].name);
         if s <> '·¡' then s := '';
         Print(10,' ·q.. ”w¯¥·¡ '+player[1].name+s+'œa“e ¬aœq·¡µ¡?');
         Print(10,' ˆa ”w¯¥·i Ëb¥iÓ¡ ¦Ÿe ·¡·A“e  ”aŸq·¡ ´a');
         Print(10,'“¡œa  ”w¯¥·i Ëb¥i ¬a¡e ¯¡Åaºa“e ·•¡µA¬á');
         Print(10,'œaµ¡.');
         PressAnyKey;
         Print(10,' ”w¯¥·¡  ¬i·¥ ºA¡ ¸sÑaµ¡‹¡ ¸åŒa»¡“e  º¶á');
         Print(10,'¬aœq—iµA‰A  ¶ ·¥¸÷¤h·e ¶wˆqÐe ¬aœq·¡´ö”a');
         Print(10,'“e ˆõ·i ´i‰¡ ·¶­¡.  ˆa »¡‹q ¦ÈbÐa“e  ¡y');
         Print(10,'ˆa»¡Ÿi —i´á º…”a¡e ”w¯¥µA‰A ‹a ”•ˆa¡ ¸a·A');
         Print(10,'¡¶… ¬k·i ¥¡¸wÐa‰V­¡.');
         PressAnyKey;
         for k := 7 to 12 do begin
            PutTile(4,k-1,i);
            i := Real_Map(50,k+25);
            if k < 12 then PutSprite(4,k,13);
            delay(700);
         end;
         Print(7,' 674‘e 1¶© 17·© i, ¡´á ­A‰µA¬á“e Äá”aœe');
         Print(7,'Àq¥e·¡ ·¶´ö­¡. ”w¯¥·e ·¡¸åµA•¡ ·¥ŸAµÁ Èa¹·');
         Print(7,'¹¢ˆeµA ¬a·¡ˆa ´g¹½´v”a“e ˆõ·i ‹¡´â Ði ˆá¶a.');
         Print(7,'™¡Ðe  ¬a­¡Ðe µwÉ¡¦…¸—·¡  g´v”å ˆõ•¡ ¬a¯©·¡');
         Print(7,'µ¡.  ‹aœå•A ¤a¡ ·¡i ®¤‚‘e· µb¬aŸi »¡“±');
         Print(7,'´aÏa¡—¡ÉA ÉAœa· ¥A¯aÌá¬÷·¡ Ëa©¹¢µA ·Ð');
         Print(7,'µÅ¸åÓ¡ Ðqœb ”wÐ–”å ˆõ·¡µ¡. ˆá‹¡¬á ˆaŒa¯a¡');
         Print(7,'ÈiÂ‰Ðe ¬aœq—i·  i·i §©¡e ‹a i ¥A¯aÌá¬÷·e');
         Print(7,'Àá¸éÐe ¸é‹AµÁ  ´a§¡‹AÑÅ ­¢µA¬á  ´a·¡—i·¡a');
         Print(7,'¦‘a¸a Ðiˆõ´ô·¡ ¡¡– ÀáÀqÓ¡ º‚´á ˆv”a‰¡ Ða');
         Print(7,'µ¡.  Ëa©¹¢·e ¯¡ÁAˆa »i§¡Ðe ˆáŸ¡µA¬á  ÑÅˆb');
         Print(7,'¸b¶w¹AŸi  x·a¡a  ‰×¸â·¥ ¬i·¥·i ‰­¢ Ð”´ö');
         Print(7,'”a‰¡ Ða“e ÈiÂ‰¸a·  i·i —h‰¡  a“e ¦…·i Àq');
         Print(7,'»¡ ¡µÐ ¡¡—e ¬÷º—i·i ¦‰œá¬á Èa¹·¹¢‰Á· ¸å');
         Print(7,'¸—·i ‰i· Ð–­¡. ·¡œý‰A Ðq·a¡¬á ¥A¯aÌá¬÷µA');
         Print(7,'¬á º‚´áˆe ¬aœq—i· ¶¥Ñ¥·i ”iœ ºa“e ·•¡');
         Print(7,'œaµ¡.');
         Print(7,'');
         PressAnyKey;
         party.etc[20] := 2;
         setbit(0);
      end;
      if on(46,10) and (not(getbit(35) or getbit(50))) then begin

         k := 0;
         repeat
            inc(k);
         until (player[k].name = '') or (k = 6);
         if k >= 6 then exit;

         for i := 1 to 3 do begin
            if (i-1) >= 1 then PutTile(i-1,6,44);
            PutTile(i,6,53);
            delay(500);
         end;
         Clear;
         Print(9,' '+player[1].name+'.');
         Print(9,' a•¡ µb¯¡ ¸a‘AÀáœñ ¥A¯aÌá¬÷·a¡ ˆa‰¡ ¯¼‘A.');
         Print(9,'·¡œå ˆqµ¢µA¬á Íw¬—·i »¡“a“¡ Ðe ¤å ¡¡Ðñ·i');
         Print(9,'Ð¥¡“e‰A ¹½·i ˆõ ˆ{´a¬á  i·¡»¡.  a“e ¸å¬a');
         Print(9,'¡¬á· Ša·B•¡ ¤h´v·a“¡ ´a a ¸a‘A ·©¶¥ º—µA');
         Print(9,'¬á“e ˆa¸w ¸åÊb·¡ šá´ái ˆé­A.');
         m[0] := '';
         m[1] := 'µb¯¡ Äa‘¡Î¯a ¸a‘A ª…·¡´¡';
         m[2] := '¸a‘A •¡¶‘Œa»¡“e Ï©¶a ´ô”a‘A';
         if Select(200,2,2,FALSE,TRUE) = 1 then begin
            for i := 8 downto 5 do begin
               PutTile(i+1,7,44);
               PutTile(i,7,53);
               delay(1500);
            end;
            Print(7,' ‹aœý”a¡e Äa‘¡Î¯a•¡ ”w¯¥‰Á ˆ{·e ¡¢¸â·i ˆa');
            Print(7,'»¥”a“e ·¡·A¡  ¬a¡e ¯¡Åa ”iœa“e  ´‹¡Š…¶a.');
            Print(7,'‹aœñ ¡—a´e “±µA‰A ¢‰´á¥¡‰¡ µ¡‰V¯s“¡”a.');
            PressAnykey;
            for i := 6 to 10 do begin
               PutTile(i-1,7,44);
               if i < 10 then PutTile(i,7,53);
               delay(500);
            end;
            Delete_Scroll_Screen;
            Print(7,' ‹a¡¦Èá 30¦…·¡ »¡v”a.');
            PlusTime(0,30,0);
            PressAnyKey;
            Scroll(TRUE);
            PutTile(3,6,53);
            for i := 9 downto 5 do begin
               if (i+1) <= 9 then PutTile(i+1,7,44);
               PutTile(i,7,53);
               delay(1000);
            end;
            Print(7,' Äa‘¡Î¯aŸi Î‰´áº¡•¡ ¹½”a‰¡  ¡—a´e“±·¡ Ðá');
            Print(7,'œbÐa­v¯s“¡”a. ¸÷ i Ó´eÐe ·©·³“¡”a. µ¸åµA');
            Print(7,'“e ¸åÑa ´ô”å ·©·¥•A ... ´á¼–—e Äa‘¡Î“e ·¡');
            Print(7,'¹A ¸a·A· ¡±·³“¡”a.');
            PressAnyKey;
            PutTile(4,6,44);
            delay(1000);
            PutTile(3,6,44);
            PutTile(4,6,53);
            delay(1000);
            PutTile(4,6,44);

            k := 0;
            repeat
               inc(k);
            until (player[k].name = '') or (k = 6);
            if k < 6 then begin
               with player[k] do begin
                  name := 'Äa‘¡Î¯a';
                  sex := male;
                  class := 7;
                  classtype := sword;
                  level := 5;
                  strength := 19;
                  mentality := 6;
                  concentration := 4;
                  endurance := 18;
                  resistance := 17;
                  agility := 20;
                  accuracy := 17;
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
                  armor := 0;
                  potential_ac := 2;
                  sword_skill := 20;
                  axe_skill := 10;
                  spear_skill := 5;
                  bow_skill := 0;
                  shield_skill := 50;
                  fist_skill := 10;
                  Modify_Item(k);
                  PutMap(41,10,44);
                  setbit(35);
                  Display_Condition;
                  Clear;
               end;
            end;
            for i := 6 to 9 do begin
               PutTile(i-1,7,44);
               PutTile(i,7,53);
               delay(500);
            end;
            Silent_Scroll;
         end
         else begin
            for i := 2 downto 0 do begin
               PutTile(i+1,6,44);
               if i > 0 then PutTile(i,6,53);
               delay(1000);
            end;
         end;
      end;
      if y = 95 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'LastDtch' then begin
      if y = 70 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Menace' then begin
      if on(14,27) then Find_Gold(138,1000);
      if on( 6,39) then Find_Gold(139,1500);
      if on(42,36) then Find_Gold(140,2000);
      if on(44,41) then Find_Gold(141, 500);
      if on(27, 6) then begin
         Clear;
         Print(7,' ”w¯¥·e µa‹¡¬á £©œs·a¡ ¥··¥–E ¸b·e ¬w¸aŸi');
         Print(7,'¤i‰eÐaµv”a. ¹¡¯±Ð¬á µi´á¥¡“¡ µ´å¬á Ðe Š¥');
         Print(7,'·¡ ‹a ­¢µA —i´á ·¶´ö”a.');
         Print(7,' ”w¯¥·e Ñ¡‹¡¯±µA ‹a À‚·i ÍiÁv”a.');
         PressAnyKey;
         Print(14,'INDEX :');
         Print(7,'');
         Print(15,'  Chapter 1. »¡¯¢· ¬÷¸å');
         Print(15,'  Chapter 2. ”aÇa¡A·¡»¡· Èe¬—');
         Print(15,'  Chapter 3. ¹A¸b¸a· Àa¶¥');
         Print(15,'  Chapter 4. ¶á¬å¸a· ÂAÒ');
         Print(15,'  Chapter 5. ·¡ µ´å· ‰i i');
         PressAnyKey;
         Print(15,'Chapter 1.');
         Print(7,'');
         cPrint(7,11,' ´¢ 150‘e –á, »¡¯¢· ¬÷¸å· ¦‚½¢ Ð´eµA ','™¡','');
         cPrint(11,7,'”aŸe »¡¯¢· ¬÷¸å','·¡œa“e Ï¡œa£¡—aˆa ¬—‹¥”a.','');
         Print(7,'‹a‰µµA¬á“e ·¡ ­A‰· »¥¯©–E ·£¡Ÿi ¤i‰e Ði');
         Print(7,'® ·¶‰A –I ˆõ·¡¡a  ''™¡ ”aŸe »¡¯¢· ¬÷¸å''·¡');
         Print(7,'œa“e ›u·i ·¡Ð Ði ® ·¶‰A Ði ˆõ·¡”a.');
         PressAnyKey;
         Print(7,' ”w¯¥·¡ ”a·q ¸w·i ñ‰v»¡ e Chapter 2.· ');
         Print(7,'¶w·e ’Š…ˆaµA ·Ðaµa ¿¸‰a¹a aˆv”a.');
         PressAnyKey;
         Print(15,'Chapter 3.');
         Print(7,'');
         Print(7,' ·¡‰µ 3Àa¶¥µA¬á 4Àa¶¥· Â‚·a¡ ¹¡‹q e ·¡•·');
         Print(7,'Ða¡e  ¸åÑa ”aŸe ¬¡¶… 3Àa¶¥· ­A‰ˆa ÍiÁa');
         Print(7,'»¥”a.  ”¦¦…·e È÷ §¥ ‰·ˆe ­¢·¡ˆáa ¬—¡wÁA');
         Print(7,'ˆa ´ô“e ˆá”Ðe ˜w”÷·¡ˆa ·¶‹¡•¡ Ða»¡ e ˜˜');
         Print(7,'¡ ¬—¡wÁAˆa ·¶“e ‰µ·© ®•¡ ·¶”a.  ‹a º— Ða');
         cPrint(7,11,'a“e ¸a¯¥· ¥i·i ¯a¯a¡ ','»¡Š','œa‰¡ ¦Ÿa“e ¹·');
         Print(7,'¹¢·¡ ¬a“e ‰µ·¡ ·¶”a. ‹a‰µµA“e ·¡ ‰·ˆe· Àw');
         Print(7,'¹¡¸a·¥ ´eµw‹¡“±·¡  »¡‹q•¡ µi¯±Ó¡ ‰A·± ¯¡a');
         Print(7,'Ÿ¡µ¡µÁ ¯¡¯aÉQ·i Š¬wÐa‰¡ ·¶·i ˆõ·¡”a.');
         PressAnyKey;
         Print(15,'Chapter 4.');
         Print(7,'');
         Print(7,' 795‘e ¶á¬å¸a“e ¬aœa»¡‰¡  ¡´á ­A‰“e »¥¸÷');
         Print(7,'Ðe ÍwÑÁ· ‹©¡ ¸ó´á—e”a.  ·¡Ò· ­A‰“e ´e');
         Print(7,'µw‹¡“±·¡ Àw¹¡Ða»¡ ´g´a•¡  ¶Ÿ¡ ¯a¯a¡ˆa £¡');
         Print(7,'œŸi ˆÀâÐ aˆa‰A –A‰¡,  ´eµw‹¡“± µb¯¡ ¡');
         Print(7,'´á ­A‰µA ”Ðe ·©—i·i ¶Ÿ¡µA‰A ¡¡– ¶á·±Ða');
         Print(7,'‰¡ ”á ·¡¬w ¡´á µb¬aµA ˆ·³Ða»¡ ´g‰A –E”a.');
         PressAnyKey;
         Print(15,'Chapter 5.');
         Print(7,'');
         Print(7,' 795‘e ·¡Ò· £¡œ“e ”á ·¡¬w Àw¹¡–A»¡ ´g“e');
         Print(7,'”a. ‹a˜¦Èá“e ¶Ÿ¡ ¯a¯a¡ˆa ˆÀâÐ aˆa“e');
         Print(7,'£¡œˆa ·¶·i ª…·¡”a.  ‹aŸ¡‰¡  a· µ´å¬á•¡');
         Print(7,'·¡ˆõ·a¡ {·i  ˜‰A –E”a.');
         PressAnyKey;
         Print(7,' ‹aŸ¡‰¡  a»¡ b ¸wµA ·¡œý‰A °á ·¶´ö”a.');
         Print(7,'');
         Print(15,' ·¡ À‚·e ˆa º‚·e ”a·q i');
         Print(15,'              ­A¬wµA aÈa i ˆõ·¡”a.');
      end;
      if y = 45 then
      if getbit(0) then begin
         if wantexit then DefaultExit
         else begin
            dec(y); Scroll(TRUE);
         end;
      end
      else begin
         Clear;
         Print(7,' ”w¯¥·¡ ‰×¬e·i aˆaa Ð–·i˜  ”w¯¥·e  ”w¯¥');
         Print(7,'´|µA ¤é´á¹a ·¶“e ‰×‰w·i ¥¡‰¡ ¬ñ›bÐq·i “av');
         Print(7,'”a. ¹¡‹q ¸åµA ”w¯¥µA‰A ·©”w·i º´ö”å ‹a ‰×');
         Print(7,'¬e´ó¸aˆa ÀwµA ¿©Ÿ¥ À¡ ³aœá¹a ·¶´ö”a.  ”w');
         Print(7,'¯¥·e ‹a ¸aµA‰A¡ ”aˆaˆv”a.  ‹a“e Àw·a¡ ¯±');
         Print(7,'¸w·i ‰ÅÉ· ”wÐeÀ ³aœá¹a ·¶´ö”a. a“e ‹a Àw');
         Print(7,'·¡ yµA ·¢´á¬á ‹a Àw·i ©³´a ºá´ö”a.  ‹a Àw');
         Print(7,'·e ¤a¡ ˆa ¬a·¶w·a¡ ³a”å a· Àw·¡´ö”a.');
         PressAnyKey;
         party.etc[1] := 10;
         Silent_Scroll;
         for k := 11 downto 7 do begin
            if (k+1) <= 11 then begin
               PutTile(5+25-x,k+1,i); PutTile(6+25-x,k+1,j);
            end;
            i := map^[25,k+39]; j := map^[26,k+39];
            PutSprite(5+25-x,k,13); PutSprite(6+25-x,k,13);
            delay(500);
         end;
         Print(7,' ˆs¸a‹¡ aÈae ¡´á¬÷· ¥w¬a—i·e ”w¯¥· Àw');
         Print(7,'·i ¨´u´a —i‰¡  iÐ–”a.');
         Print(7,'');
         Print(9,' ¶Ÿ¡“e ”w¯¥·i ¬i·¥ Ñq·¡ ÁAÍ¡Ðs“¡”a.  ‹a');
         Print(9,'Ÿ¡‰¡ ·¡ Àw·e »wˆá¢‰¡ ´s® Ða‰V¯s“¡”a.  ¥e');
         Print(9,'¡w·e ¤ó¸÷µA¬á Ða¯³¯¡¶a.');
         PressAnyKey;
         Delete_Scroll_Screen;
         mapname := 'Lore';
         Load;
         x := 51; y := 31;
         aux := soundon;
         soundon := FALSE;
         Scroll(FALSE);
         soundon := aux;
         b := 1; if player[1].classtype = magic then inc(b,8);
         for k := 11 downto 6 do begin
            if (k+1) <= 11 then begin
               PutTile(4,k+1,i); PutTile(5,k+1,42); PutTile(6,k+1,j);
            end;
            i := Real_Map(50,k+25); j := Real_Map(52,k+25);
            PutSprite(4,k,13); PutSprite(5,k,b); PutSprite(6,k,13);
            delay(700);
         end;
         Print(7,' ¡—a´e·¡ ¥w¬aµA‰A  iÐ–”a.');
         Print(7,'');
         Print(10,' ·¡ ¸a“e ’Š·¥•A µa‹¡¡ i‰¡ µÖ­¡?');
         PressAnyKey;
         Print(9,' ·¡ ¸a“e µa‹¡ ·¡ Àw·a¡ ‰×¬e´ó¸aŸi ¿©œá º‚');
         Print(9,'µv¯s“¡”a.  ¶Ÿ¡ –‰·¡ ‰·Ša³‰A•¡ ·¡ ¸aˆa ‹a');
         Print(9,'Ÿi ¿©œö”å ·¡ Àw·i ©³´a“e ˆõ·i ¡¢‰bÐa‰¡“e');
         Print(9,'»b¯¡ ÁAÍ¡ Ð–¯s“¡”a. ¶Ÿ¡—i· ‰wÐ¡“e ‰×¬e');
         Print(9,'´ó¸aµÁ· ‹q¸å ‰Å‰¡ ·¥Ð  ¸á»©œá»¥ ¬i·¥·¡');
         Print(9,'œa‰¡ ¥¡´a»³“¡”a.');
         Print(9,' ‹aŸ¡‰¡ ·¡ Àw·i »wˆá¢‰¡ ¹A¯¡Ða‰V¯s“¡”a.');
         for k := 5 downto 4 do begin
            if (k+1) <= 6 then PutTile(4,k+1,i);
            i := Real_Map(50,k+25);
            PutSprite(4,k,13);
            delay(1000);
         end;
         delay(1000);
         for k := 5 to 6 do begin
            if (k-1) >= 4 then PutTile(4,k-1,i);
            i := Real_Map(50,k+25);
            PutSprite(4,k,13);
            delay(1000);
         end;
         PressAnyKey;
         Print(7,' ¡—a´e·¡  iÐ–”a.');
         Print(7,'');
         Print(10,' ”w¯¥·e ·¡‰µ· ¤óŸI·i ´i‰¡ ·¶‰V»¡¶a?  ¤ñºA');
         Print(10,'´ô“e ÍwÑÁ¡¶… ­A¬w·i  e—i‹¡ ¶áÐ  ¬i·¥¸a“e');
         Print(10,'¡¡– ¬aÑw ™¡“e ¹·¯¥ÑwµA ÀáÐe”a“e ˆõ•¡ ´i‰¡');
         Print(10,'·¶·iˆá¶a. ”w¯¥·e ¸å‰Áˆa ´ô‹¡ ˜¢…µA ¬aÑw·i');
         Print(10,'¬å‰¡Ða»¡“e ´g‰V­¡.  ‹aœý»¡ e ÂA”Ðe ¸a§¡Ÿi');
         Print(10,'¥AÎ‰´á•¡ ¹·¯¥Ñw·e ¡eÃ¡ ¡µÐi Œá¶a.');
         PressAnyKey;
         Delete_Scroll_Screen;
         x := 39; y := 10;
         Silent_Scroll;
         delay(2000);
         i := map^[x+2,y];
         j := map^[x+1,y];
         map^[x+2,y] := j;
         map^[x+1,y] := i;
         Silent_Scroll;
         Print(9,' a· •·žaˆa Ðe ¡w ¬—‰vŠ….  a“e 1‘e ¤e ¸å');
         cPrint(9,11,'µA ¸é•¡ ¬wÐ Ñq·¡  ¹·¯¥Ñw·i ¬å‰¡ ¤h·e ','Äa','');
         cPrint(11,9,'‘¡Î¯a','œa‰¡ Ða‘A.  ¶Ÿ¡“e ˆ{·¡ Íw¬—·i ¬i •·','');
         Print(9,'ža·¡“¡ ¸i »¡•¡¢ Ða»¡.');
         PressAnyKey;
         Delete_Scroll_Screen;
         delay(2000);
         map^[x+2,y] := i;
         map^[x+1,y] := j;
         with party do begin
            year := 674; day := 18; hour := 8; min := 0; sec := 0;
         end;
         Silent_Scroll;
         Print(7,' ˜“e 674‘e 1¶© 19·©.  ”w¯¥·e µa‹¡¬á ´¢ –');
         Print(7,'”i·i »¡–”a.');
      end;
   end;

   if mapname = 'Valiant' then begin
      if y = 70 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Ground2' then begin
      if on(30,47) and (not getbit(51)) and (not getbit(50)) then begin
         Clear;
         Print(7,' ”w¯¥·e ‹©·i ˆa”å º—   ¶ »¡Ã¥—u·¡ ¥¡·¡“e');
         Print(7,'Ðe µaÐ—¸aŸi  ev”a. ‹a“e ˆa ¥A¯aÌá¬÷·a¡');
         Print(7,'ˆe”a“e  i·i —h”á“¡ ·¡œý‰A  iÐ–”a.');
         PressAnyKey;
         Print(7,' ¸á“e »¡‹q ´aÏa¡—¡ÉA ÉAœaµA¬á µ¡“e ‹©·³“¡');
         Print(7,'”a. ˆá‹¡¬á ¶µeÓ¡ Ëa©¹¢· ‰¥¡Ÿi ¥¡´v“e•A');
         Print(7,'‹a ¹·¹¢·e µ×Š¥ ­A¯s¹A·¡¡a µ×Š¥ º—¯±·a¡ ¬a');
         Print(7,'ÒAˆa Š¬÷–A´á ·¶¯s“¡”a. Ëa©¹¢· µ×·e ‹aŸ¡');
         Print(7,'ˆwÐa»¡ ´g»¡ e ‹a· ¦Ða—i º—µA“e á ˆwÐe¸a');
         Print(7,'ˆa ·¶¯s“¡”a.');
         setbit(51);
      end;
      if on(90,80) then begin
         Clear;
         if getbit(8) and (not getbit(7)) then begin
            Print(7,' ˆá‹¡µA“e  µ¡Ça· ‹i¡ ¸âÑa»¥  §¡¬â·¡ ·¶´ö');
            Print(7,'”a.  ‹aŸ¡‰¡ ”w¯¥·e  ‹a ‹i·i ·ª´á aˆv”a.');
            Print(7,'ˆá‹¡µA ¸âÓ¥ º¢…·i ¶A¸a ˆs¸a‹¡ ”w¯¥·  áŸ¡');
            Print(7,'ˆa Ñ¥œe¯aœá¶¡¹v‰¡ ‰¨ ¸÷¯¥·i ·°´ö”a.');
            setbit(7);
            delay(2000);
            Delete_Scroll_Screen;
            with party do begin
               day := day + 1;
               hour := 23;
               min := 0;
               sec := 0;
            end;
            x := 82; y := 52;
            Silent_Scroll;
         end else if getbit(7) then begin
            Print(7,' ˆá‹¡µA“e µ¡Ça· ‹i¡ ³aµa»¥ §¡¬â·¡ µa¸åÓ¡');
            Print(7,'·¶´ö”a.');
         end else begin
            Print(7,' ˆá‹¡µA“e §¡¬â·¡ Ðaa  ¬á ·¶´ö»¡ e  •¡¸áÓ¡');
            Print(7,'¢¯e ‹i·¥»¡ ´i´a ¥© ®ˆa ´ô´ö”a.');
         end;
      end;
      if on(44,7) then begin
         Clear;
         if getbit(3) then begin
            if (not getbit(203)) and (party.etc[20] < 4) then begin
               Print(7,' ”w¯¥·¡ ´aÏa¡—¡ÉA ‰A·¡Ëa ´e·a¡  b—i´á ˆa');
               Print(7,'a‰¡Ði ˜, Ðá‰·µA¬á y·¢·e ¡¢­¡Ÿ¡ˆa ”w¯¥·i');
               Print(7,'¦‰œö”a. ‹a ¡¢­¡Ÿ¡· º·¥‰··e ¤a¡ ¡—a´e·¡');
               Print(7,'´ö”a');
               PressAnyKey;
               Print(10,' —a—¡´á ·¡‰µŒa»¡ µÖŠ…¶a. ˆa Ðe ˆa»¡ ¦Èb');
               Print(10,'·i ”á Ð•¡ –A‰V­¡?  ·¡£¡ ¥A¯aÌá¬÷·e ²‚¤{·¡');
               Print(10,'–A´á¬á  ¬a¯©¬w ¶¥¸÷·e  ”á ·¡¬w Ï©¶aÃ¡ ´g‰A');
               Print(10,'–A´ö­¡. ‹aœ¬á ¦ÈbÐaˆå•A ¶Ÿ¡· ¶¥ÓW·¥ Ëa');
               Print(10,'©¹¢·i  µÅ¸åÓ¡ ¡iÐ º¯¡µ¡.  ‹a—i·  a·i·e');
               Print(10,'¥A¯aÌá¬÷ ¦‚•·½¢ ¬e´b»¡µbµA ·¶­¡. ”w¯¥· ¯w');
               Print(10,'Ÿ¡Ÿi ‹¡¶¥ÐaŸ¡œa.');
               Print(11,'[ ‰wÐñÃ¡ + 10000 ]');
               for i := 1 to 6 do
               if exist(i) then player[i].experience := player[i].experience + 10000;
               setbit(203);
               PressAnyKey;
            end;
            Print(7,' ”w¯¥·¡ ·¡ ‰µµA ¬á¸a  ¬¡¶… Î—‰w·¡ aÈaa');
            Print(7,'‹¡ ¯¡¸bÐ–”a.');
            mapname := 'Ground3';
            x := 13; y := 12;
            Load;
            OverLap(300,TRUE);
         end;
      end;
   end;

   if mapname = 'Gaea' then begin
      if on(18,27) then Find_Gold(142,5000);
      if on(16,23) then Find_Gold(143,10000);
      if on(15,25) then Find_Gold(144,(random(9)+1) * 1000);
      if on(12,26) then Find_Gold(145,(random(9)+1) * 1000);
      if on(10,24) and (not getbit(146)) then begin
         if party.etc[21] < 3 then Find_Gold(146,(random(9)+1) * 1000)
         else begin
            Clear;
            cPrint(7,11,'”w¯¥·e ','ÑÁµq· ÇaŸ¡¯aÈi','·i ¤i‰eÐ–”a.');
            inc(party.crystal[1]);
         end;
         setbit(146);
      end;
      if on(23,25) and (party.etc[21] = 3) then begin
         x := 20;
         Scroll(TRUE);
      end;
      if on(21,25) and (party.etc[21] = 3) then begin
         x := 24;
         Scroll(TRUE);
      end;
      if (y = 10) and (not (getbit(3) and getbit(4))) then begin
         inc(y);
         Clear;
         Print(13,'¶¥·¥·i ´i ® ´ô“e Ó±·¡ ”w¯¥·i ˆá¦Ð–”a.');
         Silent_Scroll;
      end;
      if y = 6 then begin
         if not (getbit(3) and getbit(4)) then begin
            inc(y);
            Clear;
            Print(7,'‰A·¡Ëa“e ¸åÑa ¸b•·Ða»¡ ´g´v”a.');
            Silent_Scroll;
         end else begin
            Screen_Fade_Out(300);
            absolute_set_xy := TRUE;
            mapname := 'Ground4';
            x := 48; y := 36;
            Load;
            absolute_set_xy := FALSE;
            Silent_Scroll;
         end;
      end;
      if y = 45 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'OrcTown' then begin
      if (y = 19) and (not getbit(55)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 3 do joinenemy(i,19);
         for i := 4 to 7 do joinenemy(i,20);
         joinenemy(8,22);
         DisplayEnemies(TRUE);
         Print(7,' ”w¯¥ ´|µA“e  ´á“a¬·¥ˆa  »¢·A¸á—i·¡ ‹©·i');
         Print(7,' b‰¡ ¬á ·¶´ö”a.');
         if getbit(7) then begin
            Print(7,' ‹a º—µA¬á  a¤ó¬a ÀaŸ±·i ¹A”¡ Ðe µ¡Ça Ða');
            Print(7,'aˆa ”w¯¥µA‰A  i·iÐ–”a.');
            Print(7,'');
            Print(13,' a“e µ¡ÇaÇ·“±·i ¶áÐ º‚‰¡ ¬a“e ´aÇ¡¡A·¡»¡');
            Print(13,'œa‰¡ Ðe”a. aŸi ³aœá›aŸ¡‹¡ ¸åµA“e µ¡ÇaÇ·“±');
            Print(13,'·i  ei ®ˆa ´ô”a.');
         end;
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         PutMap(23,18,43);
         setbit(55);
         Silent_Scroll;
      end;
      if (x in [24..27]) and (y in [16..18]) and (not getbit(56)) then begin
         Clear;
         enemynumber := 6;
         for i := 1 to 2 do joinenemy(i,21);
         joinenemy(3,23);
         for i := 4 to 5 do joinenemy(i,20);
         joinenemy(6,24);
         DisplayEnemies(TRUE);
         Print(7,' ”w¯¥·¡ µ¡ÇaÇ·µA‰A ¸ó‹eÐa¸a  ¡¡—e ¸åÊ¬a—i');
         Print(7,'·¡ µ¡ÇaÇ· º¶áŸi  b´a¬ö”a.');
         if getbit(7) then begin
            Print(7,' ‹aœá¸a µ¡ÇaÇ··¡ ”w¯¥µA‰A  iÐ–”a.');
            Print(7,'');
            Print(13,' ”w¯¥·¡  µá aŸi  º‚·¡a Ða“e»¡ ¡¡Ÿa‰V»¡ e');
            Print(13,'‰i‰Á“e ¨åÐe ·©·¡”a.');
            Print(13,' ¸a! Ðe¤aÈw ¦›´á¥¡¸a!!');
         end;
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            x := 25; y := 21;
            exit;
         end;
         PutMap(25,17,43); PutMap(26,17,43);
         setbit(56);
         setbit(3);
         for i := 53 to 64 do setbit(i);
         party.etc[21] := 2;
         for i := 1 to 6 do begin
            if (player[i].name <> '') and (player[i].dead = 0) then
            player[i].experience := player[i].experience + 15000;
         end;
         Silent_Scroll;
         Clear;
         Print(14,' ”w¯¥·e µ¡Ça¹¢· ¥¡¯a·¥ µ¡ÇaÇ··i ¢‰Ÿ¡Áv”a.');
         Print(11,'[ ‰wÐñÃ¡ + 15000 ]');
      end;
      if y = 45 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Ground3' then begin
      if on(13,11) then begin
         Clear;
         Print(7,' ”w¯¥·¡ ·¡ ‰µµA ¬á¸a  ¬¡¶… Î—‰w·¡ aÈaa');
         Print(7,'‹¡ ¯¡¸bÐ–”a.');
         mapname := 'Ground2';
         x := 44; y := 8;
         Load;
         OverLap(300,TRUE);
      end;
   end;

   if mapname = 'Vesper' then begin
      if (x in [5,71]) or (y in [6,70]) then begin
         if wantexit then begin
            absolute_set_xy := TRUE;
            mapname := 'Ground3';
            x := Map_Header.ExitX;
            y := Map_Header.ExitY;
            x := x + x1;
            y := y + y1;
            Load;
            Scroll(TRUE);
            absolute_set_xy := FALSE;
         end else begin
            x := x - x1;
            y := y - y1;
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'TrolTown' then begin
      if on(6,36) or on(45,29) then begin
         Clear;
         Print(7,' ”w¯¥·¡ ´aœµA ·¶“e ¥b•©·i ¤l¸a  ¥b•©·e ´¢');
         Print(7,'ˆe ´aœ¡ Œá¹v”a.  ‹aŸ¡‰¡ ¡y Á¡ÒµA –…ÈbÐe');
         Print(7,'‹¡‰·q·¡ —iv”a.');
         for i := 25 to 26 do
         if on(6,36) then begin
            for j := 24 to 25 do PutMap(i,j,44);
         end else begin
            for j := 22 to 23 do PutMap(i,j,44);
         end;
      end;
      if (x in [25..26]) and (y in [26..30]) then begin
         if party.etc[4] = 0 then begin
            Clear;
            Print(7,'·©Ð—·e ‰‰¢·a¡ ˜é´á¹a ¤áv”a.');
            PressAnyKey;
            party.etc[6] := 255;
            GameOver;
            exit;
         end;
      end;
      if on(13,19) then begin
         Clear;
         Print(7,' ”w¯¥·¡ ·¡‰µµA ¬á¸a ˆs¸a‹¡ ¦§¡Ëaœ“·¡ ¸b•·');
         Print(7,'Ða¡a ˆá”Ðe Í¢¤i·¡ ·©´áv‰¡, ‰¨·¡´á ·¯¢·¡');
         Print(7,'Óaa¹v”a');
         PressAnyKey;
         party.etc[6] := 255;
         GameOver;
         exit;
      end;
      if on(12,17) and (not getbit(130)) then begin
         Clear;
         cPrint(7,11,'”w¯¥·e ','µAá»¡ ÇaŸ¡¯aÈi','·i ¤i‰eÐ–”a.');
         inc(party.crystal[7]);
         setbit(130);
      end;
      if on(14,17) and (not getbit(131)) then begin
         Clear;
         cPrint(7,11,'”w¯¥·e ','ÐeÌa· ÇaŸ¡¯aÈi','·i ¤i‰eÐ–”a.');
         inc(party.crystal[2]);
         setbit(131);
      end;
      if on(12,21) and (not getbit(132)) then begin
         Clear;
         Find_Gold(132,15000);
         setbit(132);
      end;
      if on(14,21) and (not getbit(133)) then begin
         Clear;
         Print(7,'”w¯¥·e ¯¢œ· 200ˆŸi ¤i‰eÐ–”a.');
         if party.food + 200 < 256 then inc(party.food,200)
         else party.food := 255;
         setbit(133);
      end;
      if (y = 70) then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Ground4' then begin
      if on(48,35) then begin
         Screen_Fade_Out(300);
         DefaultExit;
      end;
   end;

   if mapname = 'Ancient' then begin
      if on(10,13) or on(11,13) then begin
         Clear;
         Print(7,' ”w¯¥·e  ¢”ñ ´|·a¡ ¤i·i   —¡—¡a Ð–»¡ e');
         Print(7,'´á˜å Ó±µA ·Ð ”á ·¡¬w —i´á ˆi ®ˆa ´ô´ö”a.');
         inc(y);
         Silent_Scroll;
      end;
      if on(10,12) or on(11,12) then begin
         Clear;
         Print(7,'');
         Print(7,'');
         Print(15,'         Rest In Peace ----------');
         Print(7,'');
         Print(10,'              µA·¥­eËa ·¡§i');
         Print(7,'');
         Print(15,'        348 ‘e ˆa·i, µa‹¡µA ¸q—i”a');
         if not getbit(206) then begin
            PressAnyKey;
            Print(11,' [ ‰wÐñÃ¡ + 500000 ]');
            for i := 1 to 6 do begin
               if exist(i) then
               player[i].experience := player[i].experience + 500000;
            end;
            setbit(206);
         end;
      end;
      if (x in [5,16]) or (y in [6,25]) then begin
         if wantexit then begin
            absolute_set_xy := TRUE;
            mapname := 'Ground4';
            x := Map_Header.ExitX;
            y := Map_Header.ExitY;
            x := x + x1;
            y := y + y1;
            Load;
            Scroll(TRUE);
            absolute_set_xy := FALSE;
         end else begin
            x := x - x1;
            y := y - y1;
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Hut' then begin
      if on(9,13) and (not getbit(204)) then begin
         Clear;
         Print(7,' ”w¯¥·e ´|µA ·¶“e Àw·i ˆa¹v”a');
         Print(11,' [ œ…¬á + 1 ]');
         if party.BackPack[3,6] + 1 < 255 then inc(party.BackPack[3,6]);
         setbit(204);
         PutMap(8,13,35);
         Silent_Scroll;
      end;
      if on(9,14) and (not getbit(205)) then begin
         Clear;
         Print(7,' ”w¯¥·e ´|µA ·¶“e ˆsµµ·i ˆa¹v”a');
         Print(11,' [ œa¡Iœa + 1 ]');
         if party.BackPack[6,7] + 1 < 255 then inc(party.BackPack[6,7]);
         setbit(205);
         PutMap(8,14,35);
         Silent_Scroll;
      end;
      if (x in [5,26]) or (y in [6,25]) then begin
         if wantexit then begin
            absolute_set_xy := TRUE;
            mapname := 'Ground4';
            x := Map_Header.ExitX;
            y := Map_Header.ExitY;
            x := x + x1;
            y := y + y1;
            Load;
            Scroll(TRUE);
            absolute_set_xy := FALSE;
         end else begin
            x := x - x1;
            y := y - y1;
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Ground5' then begin
      Clear;
      Print(7,' ”w¯¥·e ¸q·i ¸a‰¡·¶“e ´á˜å ·e–…¸aŸi ¥¡´v”a.');
      Print(7,'‹a“e ”w¯¥· ‹¡ÀâµA ¸q·i Œ´ö“e»¡  ’…·i ›a‰¡');
      Print(7,'”w¯¥·i ¤aœa ¥¡´v”a. ‹aŸ¡‰¡“e  i·i ¯¡¸bÐ–”a.');
      Print(7,'');
      if getbit(14) then begin
         if getbit(13) then begin
            Print(9,' ·¡¹A ”w¯¥·e —aœaÅ¡“¡´e·  i·i —i·i ® ·¶·i');
            Print(9,'ˆõ·³“¡”a.');
         end else begin
            Print(9,' aµA‰A“e ”w¯¥·¡  ¢© ¶¥Ða“e»¡ Ò¥Ó¡ ¥¡·¡“eŠ…');
            Print(9,'¶a. ”w¯¥·e »¡‹q —aœaÅ¡“¡´e·  i·i ¤¶a Ða');
            Print(9,'‰¡·¶ºa?');
            if party.etc[5] > 0 then begin
               Print(9,' ‹aœñ ˆaŸaÁa —aŸ¡ºa.  ·¡ˆå ¹Aˆa ¤i¡wÐe ¸a•·');
               Print(9,'É·µb‹¡·¥•A Šá­¢µA”a ý·i¡e  —aœaÅ¡“¡´e·  i');
               Print(9,'·i —i·i ® ·¶·i ˆõ·³“¡”a.');
               setbit(13);
            end else begin
               Print(9,' Ða»¡ e ŠáÀg´a¬á ˆaŸaÁa º‰¡ ¯¼»¡ ´gŠ…¶a.');
            end;
         end;
      end else begin
         Print(9,' Ñ¢¯¡ ”w¯¥ »¡‹q —aœaÅ¡“¡´e· ‹i·i ¤¶a Ða');
         Print(9,'»¡ ´g¯s“¡Œa? ‹aœý”a¡e ·¡ ”ŸB ¸åÁAŸi –á¹a¬á');
         Print(9,'‹q§¹· ·¥´áŸi Àx´a ¥¡¯³¯¡µ¡.');
      end;
   end;

   if mapname = 'DracTown' then begin
      if x = 5 then begin
         if wantexit then begin
            DefaultExit;
            if getbit(6) then PutMap(15,31,53);
         end else begin
            inc(x);
            Silent_Scroll;
         end;
      end;
      if on(65,101) and (not getbit(29)) then begin
         Clear;
         Print(7,' ˆs¸a‹¡ Ñ¡® £»µA¬á ’Š…ˆaˆa ”w¯¥· ¤i·i ¸s');
         Print(7,'‰¡ Ñ¡® £»·a¡ i´á Ÿ¡a Ð–”a.  Ða»¡ e ”w');
         Print(7,'¯¥· ¢‰ ¶áŸi ˆè“e  a¤ó˜¢…µA ”w¯¥·e ¸åÑa i');
         Print(7,'a —i´áˆa»¡ ´g´v”a. •¡Ÿ¡´á ”w¯¥·¡ ¸÷ÁA ¦‰¡w');
         Print(7,'· ­¥·i i´á µ©a ¢‰ ¤c·a¡ —i´á µ©v”a. ‘©');
         Print(7,'œs‰A•¡ ”w¯¥·¡ ¢‰ ¤c·a¡ i´á µ©Ÿ¥ ˆõ·e ‹q§¹');
         Print(7,'· ·¥´áµv”a. ‹a‘a“e ˆóµA »©a ”w¯¥µA‰A ´¶¥');
         Print(7,'Ð–”a.');
         PressAnyKey;
         Print(9,' ¹A¤i ¬iaº­A¶a. ‹a· ¸weÃ¥ˆõ ª…·¡µ¶a.');
         Print(9,'  e´¢ ¬ia º¯¡¡e  ”w¯¥µA‰A  —aœaÅ¡“¡´e¹¢·');
         Print(9,'‹i·i ˆaŸaÁa —aŸ©A¶a.');
         setbit(29);
         m[0] := '';
         m[1] := '·¥´áŸi ‘½´aº…”a';
         m[2] := 'º‚µa ¤áŸ¥”a';
         if Select(160,2,2,FALSE,TRUE) <> 2 then begin
            Print(9,' ‹a ·¥´á“e ”w¯¥µA‰A ‹q§¹· ˆažŸi ªv”a.');
            Print(9,' ‹aœá¸a ”w¯¥·e ´¢ˆe· ´á»¡œá¶‘·i “av”a.');
            setbit(14);
         end else begin
            Print(7,' ”w¯¥·e ‹a ·¥´áŸi º‚µa ¤áv”a.');
         end;
      end;
   end;
   if on(76,73) and (not getbit(104)) then begin
      setbit(104);
      Clear;
      Print(11,' [ ÑÁ¬i + 400 ]');
      if party.arrow + 400 < 60000 then inc(party.arrow,400);
      PutMap(77,73,44);
      Silent_Scroll;
   end;
   if on(68,66) and (not getbit(105)) then begin
      Clear;
      Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸aŸi µi¸a  ˆs¸a‹¡ ÓsÑiŠáˆa Êá');
      Print(7,'´áaµÖ”a.');
      PressAnyKey;
      enemynumber := 8;
      for i := 1 to 8 do joinenemy(i,4);
      DisplayEnemies(TRUE);
      BattleMode(FALSE,TRUE);
      if party.etc[6] = 254 then exit;
      if party.etc[6] = 2 then begin
         Silent_Scroll;
         exit;
      end;
      setbit(105);
      PutMap(67,66,44);
      Silent_Scroll;
   end;
   if on(68,73) and (not getbit(106)) then begin
      setbit(106);
      Clear;
      Print(11,' [ ¯¢œ· + 255 ]');
      party.food := 255;
      PutMap(67,73,44);
      Silent_Scroll;
   end;
   if on(63,71) and (not getbit(107)) then begin
      setbit(107);
      Clear;
      Print(11,' [ Ñ×‹q + 200000 ]');
      party.gold := party.gold + 200000;
      PutMap(62,71,44);
      Silent_Scroll;
   end;
   if on(68,88) and (not getbit(108)) then begin
      setbit(108);
      Clear;
      Print(11,' [ ­¡ÑÅ· ÇaŸ¡¯aÈi + 1 ]');
      inc(party.crystal[6]);
      PutMap(67,88,44);
      Silent_Scroll;
   end;
   if on(63,79) and (not getbit(109)) then begin
      Clear;
      Print(7,' ”w¯¥·¡  ¥¡¢‰¬w¸aŸi µi¸a  ˆs¸a‹¡ —aœaÇAœaˆa');
      Print(7,'Êá´áaµÖ”a.');
      PressAnyKey;
      enemynumber := 5;
      for i := 1 to 5 do joinenemy(i,14);
      DisplayEnemies(TRUE);
      BattleMode(FALSE,TRUE);
      if party.etc[6] = 254 then exit;
      if party.etc[6] = 2 then begin
         Silent_Scroll;
         exit;
      end;
      setbit(109);
      PutMap(62,79,44);
      Silent_Scroll;
   end;
   if on(64,64) and (not getbit(110)) then begin
      setbit(110);
      Clear;
      Print(11,' [ ÐeÌa· ÇaŸ¡¯aÈi + 1 ]');
      inc(party.crystal[2]);
      PutMap(65,64,44);
      Silent_Scroll;
   end;
   if on(97,100) then begin
      Clear;
      cPrint(7,15,' ¢a§¡µA“e ','¹A 21” —aœaÅ¥ ¹Aµ×· ¢a','œa‰¡ ³aµa');
      Print(7,'·¶´ö”a.');
   end;
   if on(89,103) then begin
      Clear;
      cPrint(7,15,' ¢a§¡µA“e ','¹A 17” —aœaÅ¥ ¹Aµ×· »¡Ða ¢a','œa‰¡');
      Print(7,'³aµa ·¶´ö‰¡  ¤a¡ £»µA“e ‹¡¢aÐa‰A ¬—‹¥ ¤a”b');
      Print(7,'·¡ ·¶´ö”a.');
      if getbit(30) then exit;
      PressAnyKey;
      Print(7,' ”w¯¥·¡ ¤a”b·i £©´á¸a  ¤a”b·¡ ¯aŸaŸa £©a');
      Print(7,'a¡a ¹³·e »¡Ða‰”e·¡ aÈav”a.  ‰”e· ·³Š');
      Print(7,'µA“e ¯a¬eÐe ‹¡¶…·¡  ‘•©‰¡ ·¶´ö‰¡  ¸a­AÓ¡ ”a');
      Print(7,'¯¡ ¥¡“¡ švÐa‰A ·¡œå ‹i¸aˆa ¬‰a¹a ·¶´ö”a.');
      Print(12,'''·¡‰µ·a¡ ¤i·i —¡—¥ ¸a“e —aœaÅ¥ ¹Aµ×· ¸áº');
      Print(12,'Ÿi ¤h‰A –I ˆõ·¡”a.''');
      m[0] := '';
      m[1] := '»¡Ða‰”e·a¡ aˆe”a';
      m[2] := '”a¯¡ ¤a”b·i ¶¥¶áÃ¡ ¯¡Ç¥”a';
      if Select(200,2,2,FALSE,TRUE) <> 1 then begin
         Print(7,' ”w¯¥·¡ ¤a”b·i i´á ”w‹¡¸a ”a¯¡ ¯aŸaŸa £©a');
         Print(7,'µÁ¬á ¶¥¶áÃ¡ –A´ö”a.');
         exit;
      end;
      k := 0;
      for i := 5 downto 2 do begin
         if exist(i) then k := i;
      end;
      if k > 0 then begin
         s := ReturnBJosa(player[k].name);
         if s = 'ˆa' then s := '';
         s := player[k].name + s;
         Print(7,' ”w¯¥·¡ ·©Ð——i·i •AŸ¡‰¡ »¡Ða‰”e·a¡ aˆa');
         Print(7,'a Ða¸a ”w¯¥·i ¸á»¡¯¡Ç¡“e ¬aœq·¡ ·¶´ö”a.');
         Print(7,' ‹a“e ¤a¡ '+s+'µv”a.');
         Print(7,' ‹a“e  i·i Ð–”a.');
         PressAnyKey;
         Print(9,' ¶Ÿ¡—i· ¡¢¸â·e ˜a¡ ·¶“e•A ·©¦œá ·¡œå ¡¡');
         Print(9,'Ðñ·i Ði Ï©¶aˆa ´ô»¡ ´g·eˆa?  ¶Ÿ¡—i·e  ¡¡–');
         Print(9,'µa‹¡µA ·¶‰V‘A.  ‰A”aˆa ‰”eµA ³aµa ·¶“e  ·¡');
         Print(9,'‹i•¡  a·qµA ˆéŸ¥”a‘A. ¸÷ i ˆa‰¡ ¯¼”a¡e ¸a‘A');
         Print(9,'Ñ¥¸a¬á ˆa‰Aa. ¶Ÿ¡“e µa‹¡¬á ‹¡”aŸ©ÉA“¡.');
         m[0] := '';
         m[1] := 'Ñ¥¸aœa•¡ »¡Ða¢”ñ·a¡ ˆe”a';
         m[2] := '”¶¥—i· ·‰e”¡ ‹a e –…”a';
         if Select(200,2,2,FALSE,TRUE) = 2 then begin
            Print(7,' ”w¯¥·e ”a¯¡ ¢‰œá¬á¬á ¤a”b·i ¶¥¶áÃ¡ ¯¡Åv”a.');
            exit;
         end;
      end;
      setbit(30);
      for i := 2 to 5 do begin
         for j := 0 to 8 do player[i].name[j+9] := player[i].name[j];
         player[i].name[0] := chr(0);
      end;
      Display_Condition;
      DefaultEnter;
   end;

   if mapname = 'Tomb' then begin
      if on(83,10) then PutMap(39,31,44);
      if on(19,35) and (not getbit(124)) then begin
         setbit(124);
         Clear;
         Print(11,' [ ÏiœË¡¶‘ ˆsµµ + 1 ]');
         if party.BackPack[6,10] < 255 then inc(party.BackPack[6,10]);
      end;
      if on(84,15) and (not getbit(125)) then begin
         setbit(125);
         Clear;
         Print(11,' [ Ñ×‹q + 100000 ]');
         party.gold := party.gold + 100000;
      end;
      if on(87,15) and (not getbit(126)) then begin
         setbit(126);
         Clear;
         Print(11,' [ Ñ×‹q + 50000 ]');
         party.gold := party.gold + 50000;
      end;
      if on(84,26) and (not getbit(127)) then begin
         Clear;
         Print(7,' ”w¯¥·¡  ¥¡¢‰¬w¸aŸi µi¸a  ˆs¸a‹¡ ¸á¯w¬a¸aˆa');
         Print(7,'Êá´áaµÖ”a.');
         PressAnyKey;
         enemynumber := 1;
         joinenemy(1,1);
         enemy[1].level := 30;
         enemy[1].hp := enemy[1].endurance * enemy[1].level * 10;
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(127);
      end;
      if on(87,26) and (not getbit(128)) then begin
         Clear;
         Print(7,' ”w¯¥·¡  ¥¡¢‰¬w¸aŸi µi¸a  ˆs¸a‹¡ ÅI¥A¡¯aˆa');
         Print(7,'Êá´áaµÖ”a.');
         PressAnyKey;
         enemynumber := 5;
         for i := 1 to 5 do begin
            joinenemy(i,12);
            enemy[i].level := 15;
            enemy[i].hp := enemy[i].endurance * enemy[i].level * 10;
         end;
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         setbit(128);
      end;
      if on(85,21) and (not getbit(129)) then begin
         Clear;
         Print(7,' ”w¯¥·¡ ŠE ´|µA ¬ö·i˜ ¢´åˆa ¢aÐe ¦…¶á‹¡ˆa');
         Print(7,'”w¯¥· ¸å¯¥·i ¯aÃ¡‰¡ »¡aˆv”a.  ¸q¯¡Ò ‰Å·');
         Print(7,'šŒ÷·¡ ¯aŸaŸa µiŸ¡‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e ¢·');
         Print(7,'¯¢¸â·a¡ Ðe ˆé·q –á¡ ¢‰œáv”a. ‰¨·¡´á ‰Å­¢');
         Print(7,'µA¬á“e  µAÉAŸaÑÁ–E —aœaÅ¡“¡´e· ÑwÁAˆa ·©´á');
         Print(7,'v”a. ‹aŸ¡‰¡  i·i Ða‹¡ ¯¡¸bÐ–”a.');
         PressAnyKey;
         enemynumber := 1;
         joinenemy(1,58);
         enemy[1].name := '17” —aœaÅ¥¹Aµ×';
         enemy[1].specialcastlevel := enemy[1].specialcastlevel or $80;
         DisplayEnemies(TRUE);
         Print(13,' 100‘e eµA •¡Š‰Ž…·¡ ™¡ ·¡‰µµA aÈavŠ….  á');
         Print(13,'•¡ µb¯¡ ˆa ˆa»¡‰¡ ·¶“e  µwÑ¥· ÇaŸ¡¯aÈi·i');
         Print(13,'Ò‘Ã© ¡¢¸â·a¡ µa‹¡µA µ¥ ˆõ·±µA ËiŸ±´ô”a. Ða');
         Print(13,'»¡ e á•¡ ¥i ®´ô·¡  ·¡ ´|· Ð‰©‰Á ˆ{·e ¶…');
         Print(13,'¡w·¡ –Iˆõ·¡”a.');
         PressAnyKey;
         repeat
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then Clear;
         until party.etc[6] = 0;
         Clear;
         Print(11,' [ µwÑ¥· ÇaŸ¡¯aÈi + 1 ]');
         setbit(129);
         inc(party.crystal[5]);
      end;
   end;

   if mapname = 'Imperium' then begin
      if y = 45 then begin
         if wantexit then begin
            DefaultExit;
            PutMap(x,y-1,53);
         end
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
      if on(28,17) then begin
         Clear;
         SetColor(Yellow);
         i := hwinx1; j := hwiny1;
         cHPrint(i,j,' You  ask  Young-Kie  how to play this game'); inc(j,16);
         cHPrint(i,j,'easilly. Young-Kie''s smile makes you uneasy'); inc(j,16);
         cHPrint(i,j,', as uneasy as  staring down the sources of'); inc(j,16);
         cHPrint(i,j,'game programs. " It''s really very simple, "'); inc(j,16);
         cHPrint(i,j,'he  laughs. " This game''s  secret  code  is'); inc(j,16);
         cHPrint(i,j,'ascii #197. "');
      end;
      if on(25,24) then begin
         if not getbit(31) then begin
            Clear;
            Print(7,' —a—¡´á '+player[1].name+'“±·¡ µa‹¡µA ”w•¡ Ða­vŠ…¶a.');
            Print(7,' ¸á· ­¡ˆŸi Ða¸a¡e ¤a¡ ‹a µA·¥­eËa ·¡§i·³');
            Print(7,'“¡”a. ¸á· ·BÁA“e ¤é°á µ¡œ¸åµA ¬aœa»¡‰¡ ´ô');
            Print(7,'¯s“¡”a. ¸á“e ¡—a´e‰Á“e ”iŸ¡ ‹a¸á Íw¤ñÐe ·¥');
            Print(7,'ˆe·¡´ö·a“¡Œa¶a.  »¡‹q·e  a· ·»¡ e·¡ q´a');
            Print(7,'¤e¯¥¤e·¥· ‰w»¡µA¬á  ·¡œý‰A ·¡‰µµA ¹¥¸Ða‰¡');
            Print(7,'·¶¯s“¡”a. ‹aœñ ¥¥¥·a¡ —i´áˆa‰V¯s“¡”a.');
            Print(7,' ¸á“e µ¸åµA ¡—a´eµA‰A, ¬å·i ¶áÐ¬áœa¡e a');
            Print(7,'· ·¡Ÿq·i ·¡¶wÐaµa  ´b·i §¡eÐ•¡ ¹½”a‰¡ ´¢');
            Print(7,'­¢Ð–´ö¯s“¡”a.  ‹aœ¬á ¡´á ­A‰µA¬á  ´á˜áÐe');
            Print(7,'´e¹½·e ·©·¡ ¬—‹¡”áœa•¡  ¸á· ­¡Ð—·¡´ö‘¡œa‰¡');
            Print(7,'Ã¡¦Ð¤áŸ¡¡a  ¡—a´e·e ¸a¯¥· »¡¶áŸi ·A»¡Ði');
            Print(7,'® ·¶´ö¯s“¡”a.  Ða»¡ e ¡—a´e·e Ðˆa ˆi®¢');
            Print(7,'¸a¯¥· ¶áÃ¡Ÿi »¡Ç¡‹¡ ¶áÐ¬á  ¸á· ·¡Ÿq·i ·¡');
            Print(7,'¶wÐe”a“e “a±·¡ µÁ”}‹¡ ¯¡¸bÐ–¯s“¡”a. ¶¥œ·');
            Print(7,'‹a“e ¸åÑa ‹aœé ¬aœq·¡ ´a“¡´ö“e•A  á¢a Çe');
            Print(7,'¡w¬÷‰Á »¡¶áµA µ©œa·¶”a¥¡“¡  ¡´á¬÷· ¬÷ºœa');
            Print(7,'“e »¢À‚·¡ ‹aŸi ¸a¯¥ e·i ¬—ˆbÐa“e Ñe¯©º·¸a');
            Print(7,'¡ ¤aŽ´á ¤áŸ¥ ˆõ·³“¡”a.  ¬å· ”Îa¸a¡¬á·');
            Print(7,'‹a“e Ðw¬w º¶áŸi ÑÅ‹¡ ¯¡Ç© eÐe  ¬åÐ—·i Àx‹¡');
            Print(7,'¯¡¸bÐ–‰¡  ‰iŠ‚·e qµA‰A ¥¡·¡‹¡ ¶áÐe ¬å·i Ð—');
            Print(7,'Ða‹¡ ¯¡¸bÐ–¯s“¡”a.  ‹aŸ¡‰¡  ‹s‹¡´¡ ·¡¤åˆ{·e');
            Print(7,'Çe ¯©®Ÿi  ¸á»¡Ÿa‰¡´¡  i´v¯s“¡”a.  ¡—a´e·e');
            Print(7,'·¥ˆe·i á¢ ¬—ˆbÐa“e  a·qµA¬á ·¥ˆe· µwµb·i');
            Print(7,'“iaº‹¡ ¶¥Ð–‰¡  ‹a ‰i‰Á“e Èa¹·¹¢µA ”Ðe Ã±');
            Print(7,'¤ñ·a¡ ·¡´á¹v¯s“¡”a.  ·¡ˆå ¦…¡w ¡—a´e· ¸i');
            Print(7,'¡µ–E Ð—•··¡¡a ˆá· •©·¡Ç© ® ´ô“e ‰i‰ÁŸi }');
            Print(7,'‰¡´¡  i´v¯s“¡”a.  »¡‹q· ‹a“e Š¥b‰Á ¡wµ·');
            Print(7,'‘¡µˆa –A´á  ‰×¸â·a¡ ·¡ ·©·i ˆwÐ—Ða‰¡ ·¶¯s');
            Print(7,'“¡”a. ‹aŸ¡‰¡ ·¡ ·©·¡ ”a {a”áœa•¡ ”á Çe ¡w');
            Print(7,'µŸi ´è‹¡¶áÐ ¬åÐ—·i §·¸aÐe ”aŸe ·©·i ™¡ Ž');
            Print(7,'£© ˆõ·³“¡”a.');
            Print(7,'  e´¢ ¸á·  i·¡  x”a“e‰A ÑÂ·¥–A¡e ¦—¡ ¸á·');
            Print(7,'ÍeµA ¬á¬á ¸áŸi •¡µÁº¯³¯¡¶a. ¸á“e ”w¯¥‰Á ˆ{');
            Print(7,'·e ¦…· •¡¶‘·¡ Ça‰A Ï©¶aÐs“¡”a.');
            Print(7,'');
            PressAnyKey;
            setbit(31);
         end;
         Clear;
         Print(7,' »¡‹q ”w¯¥·i ¡´á¬÷ ´|·a¡ ‰·ˆe·¡•· ¯¡Åa —a');
         Print(7,'Ÿ¡‰V¯s“¡”a.  ˆá‹¡¬á ¸áµÁ ¡—a´e· »¥¶áŸi ÑÂ');
         Print(7,'·¥Ð º¯¡‹¡ ¤aœs“¡”a.');
         m[0] := '';
         m[1] := '‰·ˆe·¡•··i Ðe”a';
         m[2] := '‰·ˆe·¡•··i Ða»¡´g“e”a';
         if Select(180,2,2,FALSE,TRUE) = 1 then begin
            party.etc[20] := 7;
            DefaultEnter;
         end;
      end;
   end;
end;

Procedure SpecialEvent_Sub2;
label
   battle1, battle2, battle3, battle4;
var
   x0,y0,x2,y2 : integer;
begin

   Scroll(TRUE);

   if mapname = 'Kobold' then begin
      if x = 5 then begin
         if wantexit then begin
            if getbit(86) then begin
               Clear;
               Print(7,' ”w¯¥·¡ ¢…·i a¬áa Ða¸a  •¡ wÁv”å Å¡¥©ËaÇ·');
               Print(7,'·¡ ”w¯¥ ´|·i ˆa¡  b´v”a.');
               Print(7,'');
               Print(13,' a“e áŸi  ­¥·a¡ ÀáÃ¡Ða»¡ ´g‰¡“e Íe´eÓ¡');
               Print(13,'º‚·i ®ˆa ´ô´ö”a. ‹aœ¬á a“e µw¶¥Ðe ¬—¡w·i');
               Print(13,'ˆa»¡‹¡Ÿi ¶¥Ð–‰¡  ‹a ”•ˆa¡ ´b aµA‰A Ñ¥·i Ìi');
               Print(13,'´v”a. a“e ‰iÅ¡ º‚»¡´g‰¡ áŸi {Œa»¡ ŠA³Ó©');
               Print(13,'ˆõ·¡”a.');
               PressAnyKey;
               repeat
                  Clear;
                  enemynumber := 1;
                  joinenemy(1,45);
                  DisplayEnemies(TRUE);
                  BattleMode(FALSE,TRUE);
                  if party.etc[6] = 254 then exit;
               until party.etc[6] = 2;
            end;
            DefaultExit;
            if getbit(86) then begin
               Clear;
               Print(7,' ”w¯¥·¡ ¬÷ ¤c·a¡ ÈiÂ‰Ða¸a  Ðá‰·µA¬á ¡—a´e');
               Print(7,'· ·q¬÷·¡ —iaµÖ”a.');
               Print(7,'');
               Print(10,' ”w¯¥·e ¨iŸ¡ ·¡‰µ·i aˆa¯¡µ¡.  a· ¬å· ¥·');
               Print(10,'·¥·a¡  ´b a· Ó±·i §©Ÿ¥ Å¡¥©ËaÇ··i  b‰V­¡.');
               Print(10,'´a a ‹a“e ”a¯¡“e ·¡ ¬÷·i ¤õ´áa»¡ ¡µÐiˆá¶a.');
               Print(7,'');
               Print(7,'  i·¡À {a‹¡•¡ ¸åµA Å¡¥©Ëa¬÷ º¶áµA“e  Š');
               Print(7,'Ñw· ‰i‰ˆa Ñw¬÷ –A´ö‰¡  ‰¨·¡´á ‹¡· Ìa¢…·¡');
               Print(7,'·©œ÷·¡‹¡ ¯¡¸bÐ–”a.');
               setbit(5);
            end;
         end
         else begin
            inc(x);
            Silent_Scroll;
         end;
      end;
      if on(8,30) and (Real_Map(9,30) <> 53) then begin
         PutMap(9,30,53);
         Silent_Scroll;
         Clear;
         Print(7,' ˆs¸a‹¡ ˜wµA¬á Îu i·¡ ­µ´a aµÖ”a.');
      end;
      if (x in [30..55]) and (y in [21..36]) then begin
         if on(49,31) and (not getbit(17)) then begin
            Clear;
            enemynumber := 7;
            for i := 1 to 5 do joinenemy(i,36);
            for i := 6 to 7 do joinenemy(i,39);
            DisplayEnemies(TRUE);
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Silent_Scroll;
               exit;
            end;
            Clear;
            Print(7,' ”w¯¥·e ³aœá»¥  Å¡¥©Ëa ‹e¶á‹¡¬a· ¡±·i –á¹a');
            Print(7,'µA¡Aœi—aÇ¡Ÿi Àx´a–”a.');
            setbit(17);
         end else begin
            for j := y - 1 to y + 1 do
            for i := x - 1 to x + 1 do PutMap(i,j,50);
            Silent_Scroll;
         end;
      end;
      if on(38,13) then begin
         PutMap( 99,21,43);
         Clear;
         Print(7,' ”w¯¥·¡ ¤a”b· ‹¡¢aÐe ¥b•©·i ¤l¸a •©·¡ ´¢ˆe');
         Print(7,'£»·a¡ —i´áˆv”a.');
      end;
      if on(121,36) then begin
         PutMap(110,26,43);
         Clear;
         Print(7,' ”w¯¥·¡ ¤a”b· ‹¡¢aÐe ¥b•©·i ¤l¸a •©·¡ ´¢ˆe');
         Print(7,'£»·a¡ —i´áˆv”a.');
      end;
      if on(112,29) then begin
         PutMap( 96,21,43);
         Clear;
         Print(7,' ”w¯¥·¡ ¤a”b· ‹¡¢aÐe ¥b•©·i ¤l¸a •©·¡ ´¢ˆe');
         Print(7,'£»·a¡ —i´áˆv”a.');
      end;
      if on(96,36) then begin
         PutMap(107,30,43);
         Clear;
         Print(7,' ”w¯¥·¡ ¤a”b· ‹¡¢aÐe ¥b•©·i ¤l¸a •©·¡ ´¢ˆe');
         Print(7,'£»·a¡ —i´áˆv”a.');
      end;
      if on(105,27) then begin
         PutMap(118,35,43);
         Clear;
         Print(7,' ”w¯¥·¡ ¤a”b· ‹¡¢aÐe ¥b•©·i ¤l¸a •©·¡ ´¢ˆe');
         Print(7,'£»·a¡ —i´áˆv”a.');
      end;
      if on(100,36) and (not getbit(18)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 7 do joinenemy(i,36);
         joinenemy(8,39);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' ”w¯¥·e ¥bµA ˆéa ·¶“e Ñ×‹q Ç¡Ÿi ˆa¹v”a.');
         setbit(18);
      end;
      if on(32,90) and (not getbit(19)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 7 do joinenemy(i,36);
         joinenemy(8,37);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' ”w¯¥·e Å¡¥©Ëa  »¢·A¸á· ¡±·i –á¹a¬á  ¤‚‹q');
         Print(7,'Ç¡Ÿi ¤i‰eÐ–”a.');
         setbit(19);
      end;
      if (x in [96..119]) and (y in [85..98]) then begin
         if random(2) = 0 then begin
            x2 := x1; y2 := y1;
         end else repeat
            x2 := random(3) - 1; y2 :=  random(3) - 1;
         until not((x2 = 0) and (y2 = 0));
         x0 := x + x2; y0 := y + y2;
         case Real_Map(x0,y0) of
            43 : begin
                    PutMap(x,y,43); PutMap(x0,y0,0);
                 end
            else begin
                    x0 := x - 2 * x2;
                    y0 := y - 2 * y2;
                    PutMap(x,y,43);
                    PutMap(x0,y0,0);
                 end;
         end;
         if Real_Map(x+x1,y+y1) in [37,38] then begin
            x := x + x1 * 2;
            y := y + y1 * 2;
            Silent_Scroll;
         end;
      end;
      if on(95,91) and (not getbit(20)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 6 do joinenemy(i,36);
         for i := 7 to 8 do joinenemy(i,37);
         DisplayEnemies(TRUE);
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' ”w¯¥·e ¥bµA ˆéŸ¥ ¬aÌa·¡´á Ç¡Ÿi ˆa¹v”a.');
         setbit(20);
      end;

      if (x = 27) and getbit(18) then begin
         PutMap(28,60,43); PutMap(28,61,43);
         PutMap(29,60,0); PutMap(29,61,0);
         Silent_Scroll;
      end;
      if (x = 124) and getbit(19) and getbit(89) then begin
         PutMap(123,60,43); PutMap(123,61,43);
         PutMap(122,60,0); PutMap(122,61,0);
         Silent_Scroll;
      end;
      if (x = 62) and getbit(20) then begin
         for j := 60 to 61 do
         for i := 63 to 64 do PutMap(i,j,43);
         PutMap(65,60,0); PutMap(65,61,0);
         Silent_Scroll;
      end;
      if (x = 27) and getbit(17) then begin
         for j := 60 to 61 do
         for i := 87 to 88 do PutMap(i,j,43);
         PutMap(86,60,0); PutMap(86,61,0);
         Silent_Scroll;
      end;

      if (x = 122) and (not getbit(92)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 6 do joinenemy(i,39);
         for i := 7 to 8 do joinenemy(i,40);
         DisplayEnemies(TRUE);
         Print(13,' ¸÷ i e»©‹¥ ·¥ˆe—i·¡Š…. ¤å¤åÓ¡ ÌÐa¡e¬á ™¡');
         Print(13,'¯¡§¡Ÿi ˆé´á µ¡”a“¡...');
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            inc(x);
            Silent_Scroll;
            exit;
         end;
         setbit(92);
      end;
      if (x = 29) and (not getbit(91)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 4 do joinenemy(i,39);
         for i := 5 to 7 do joinenemy(i,37);
         joinenemy(8,41);
         DisplayEnemies(TRUE);
         Print(13,' ™¡ ·¥ˆe—i·¡ ¶Ÿ¡ ¬÷·i Ã±¤ñÐaœá µÖŠ….  áÓ');
         Print(13,'—i·e ·¡ º¶á· Ð‰©—i·¡ ¥¡·¡»¡ ´g“eˆa? ·¡ˆõ');
         Print(13,'—i·e ¶Ÿ¡µA‰A ¢¡¡Ðe °a¶‘·i ˆé´ö”aˆa º‚´áˆe');
         Print(13,'¬aœq—i· Ð‰©·¡”a.');
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            dec(x);
            Silent_Scroll;
            exit;
         end;
         setbit(91);
      end;
      if (x = 86) and (not getbit(90)) then begin
         Clear;
         enemynumber := 8;
         for i := 1 to 7 do joinenemy(i,37);
         joinenemy(8,38);
         DisplayEnemies(TRUE);
         Print(13,' a“e ·¡ ¬÷· ‰w§¡”¸w·¡”a.  a· ·±¢“e ¤a');
         Print(13,'¡ áÓ—i·i  ·¡ ´e·a¡  —iµa ‘½»¡ ´g“e ˆõ·¡');
         Print(13,'”a. a· ¡¢®‘·i ¤aÁa¬áœa•¡...');
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            inc(x);
            Silent_Scroll;
            exit;
         end;
         setbit(90);
      end;
      if (x = 86) and getbit(90) then begin
         for j := 60 to 61 do
         for i := 63 to 65 do PutMap(i,j,43);
         for j := 60 to 61 do
         for i := 28 to 29 do PutMap(i,j,43);
      end;
      if (x = 65) and (not getbit(89)) then begin
         Clear;
         enemynumber := 4;
         for i := 1 to 3 do joinenemy(i,39);
         joinenemy(4,42);
         DisplayEnemies(TRUE);
         Print(13,' ¶wÅA•¡ ¶Ÿ¡ ¬÷· ¦Œa»¡ —i´áµÖŠ…. ”w¯¥—i');
         Print(13,'·e ­¡ÑÅ  a¤ó·¡œeˆé —i´á¥Öa? »¡‹q ¤a¡ ˆa');
         Print(13,'­¡ÑÅ  a¤ó· »¥ˆaŸi ¥¡µaº»¡.');
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            dec(x);
            Silent_Scroll;
            exit;
         end;
         setbit(89);
      end;

      if on(48,73) and (Real_Map(46,47) in [50]) then begin
         for j := 42 to 50 do
         for i := 37 to 54 do
         if Real_Map(i,j) in [50] then PutMap(i,j,49);
      end;
      if on(45,46) and (Real_Map(56,63) in [50]) then begin
         for j := 51 to 74 do
         for i := 56 to 60 do
         if Real_Map(i,j) in [50] then PutMap(i,j,48);
      end;
      if (x in [42..53]) and (y in [55..66]) then begin
         if party.etc[36] > 3 then exit;
         inc(party.etc[36]);
         PutMap(x,y,43);
         if party.etc[36] = 4 then begin
            Clear;
            Print(7,' ”w¯¥·e ˜wµA ¤e¿q ¢ˆÑa·¶“e  µ¡ÌiÇ¡Ÿi ¤i‰eÐ–');
            Print(7,'”a.');
            setbit(21);
         end
         else PutMap(random(12)+42,random(12)+55,0);
      end;

      if (x in [91..121]) and (y in [41..80]) then begin
         if on(91,41) and (not getbit(22)) then begin
            Clear;
            Print(7,' ”w¯¥·e ´á–‘­¢µA¬á•¡  ¤e¼b·¡“e ¢‰ÁAŸi  Ðaa');
            Print(7,'¥¡´v”a. ¸a­AÓ¡¥¡“¡ ‹aˆõ·e Ób¶a¬âÇ¡µv‰¡ »b¯¡');
            Print(7,'‹aˆõ·i ˆa¹v”a.');
            setbit(22);
            exit;
         end;
         if (on(91,59) or on(121,62)) and ebony then begin
            ebony := FALSE;
            Silent_Scroll;
            exit;
         end;
         if on( 93,60) then begin
            x := 91; y := 60;
            ebony := FALSE;
            Silent_Scroll;
            exit;
         end;
         if on(119,61) then begin
            x := 121; y := 61;
            Silent_Scroll;
            exit;
         end;
         if on(103,75) then begin
            x := 107; y := 60;
            ebony := FALSE;
            Silent_Scroll;
            exit;
         end;
         if on(108,75) then begin
            x := 102; y := 49;
            Silent_Scroll;
            exit;
         end;
         if on(105,58) and (Real_Map(105,59) <> 43) then begin
            PutMap(105,59,43);
            exit;
         end;
         if not ebony then begin
            ebony := TRUE;
            Silent_Scroll;
         end;
      end;

      if on(58,101) and (Real_Map(58,100) <> 49) then begin
         for j := 100 downto 86 do PutMap(58,j,49);
         PutMap(58,85,0);
         Silent_Scroll;
         Clear;
         Print(7,' ”w¯¥·¡ ¢¯±Å¡ ¥bµA Ìi·i ‹¡”¸a ¥b·e ´e·a¡');
         Print(7,'²‚ —i´áˆa ¤áv”a. ‹aŸ¡‰¡“e ¬¡¶… ‹©·¡ aÈa');
         Print(7,'v”a.');
      end;
      if on(58,85) then begin
         PutMap(58,85,43);
         PutMap(76,74,52);
         Clear;
         Print(7,' ”w¯¥·¡ ¤i £»· ¥b•©·i ¤l¸a  ¥b•©·e  ·A´sµA');
         Print(7,'·Ð ¬á¬áÓ¡ ˆaœa´f‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e »b¯¡');
         Print(7,'¥b•©µA¬á ¤i·i ™A‰¡ Ðe ˆé·q ¢‰œá¬ö”a. Ða»¡ e');
         Print(7,'¥b•©·e ¨ia —i´áˆa—u·¡ £»·a¡ ˆaœa ´f´v”a.');
         k := 0;
         for i := 5 downto 2 do
            if exist(i) then k := i;
         if k > 0 then begin
            s := player[k].name + ReturnBJosa(player[k].name);
            Print(7,' ‹a˜ µ|µA ·¶”å '+s+'  iÐ–”a.');
            Print(7,'');
            Print(9,' ·¡œå ¸wÃ¡“e ¸åµA Ðe¤å ¥¥ ¸â·¡ ·¶”a‘A. ¥b•©');
            Print(9,'·¡ ˆaœa ´f“e ¢‰AµÁ ´sb·a¡ ”aŸe ‰µ· ¢‰ÁA');
            Print(9,'Ÿi ˜áµ©Ÿ¡“e ¸wÃ¡œa‘A. ‹aœå•A ´á—¡ˆa ”a¯¡ ˜á');
            Print(9,'µ©œv“e»¡ ¡¡Ÿa‰VŠ….');
         end;
      end;
      if on(76,74) then begin
         PutMap(65,25,35);
         PutMap(64,25,0);
         PutMap(76,74,48);
         Clear;
         Print(7,' ”w¯¥·¡ ¢‰ ¶á¡ ˜áµ¡Ÿe ˜w·i ¤l¸a  ”a¯¡ ˆaœa');
         Print(7,'´f´a ¤áv”a.');
         Silent_Scroll;
      end;
      if on(64,25) and (Real_Map(108,53) <> 0) then begin
         for j := 53 to 54 do
         for i := 108 to 109 do PutMap(i,j,0);
         PutMap(64,25,43);
         Print(7,' ¬÷· q•·½¢µA¬á  •©µeÓ¡ Äá”aœe »¥•··q‰Á Ðq');
         Print(7,'A ‹¡‰ ­¡Ÿ¡ˆa —iv”a.');
      end;
      if on(106,54) and (not getbit(200)) then begin
         Print(7,' ”w¯¥·e ¥bµA¬á ¢´åˆa ¤e¼b·¡“e ˆõ·¡ ·¶´á ¥b');
         Print(7,'·a¡ ”aˆaˆv”a.  ˆaŒa·¡µA¬á ¥¡“¡ ‹aˆõ·e ®¸÷');
         Print(7,'·¡´ö”a.  Ða»¡ e ‹a ®¸÷·e Ëb·¡Ða‰A•¡ ¯a¯a¡');
         Print(7,'Ó£¡Ðe §¹·i ¤iÐa‰¡ ·¶´ö”a.  ”w¯¥·¡ ®¸÷­¢·i');
         Print(7,'—iµa”a ¥¡´v·i˜  ­¡¯aœaÃ¡‰A ‘©œi ® ¤cµA ´ô');
         Print(7,'´ö”a.  ‹a­¢µA“e ÑwÁAŸi ¦…ˆeÐa‹¡ Ó±—i ¸÷•¡·');
         Print(7,' g·e µwÑ¥—i·¡ ¤ÒAÐa‰¡ ·¶´ö”a.  ‹a—i·¡ ´a a');
         Print(7,'·¡ Ó£¡Ðe §¹·i ¤iÐa“e ˆõ ˆ{´v”a.  ”w¯¥·¡ ´¢');
         Print(7,'ˆe· Ó±·i º´á ¨´á ¥¡“¡ ®ó‰A ¥bµA¬á ˜é´á¹a');
         Print(7,'aµÖ”a.');
         k := 0;
         for i := 1 to 5 do
            if exist(i) then  k := i;
         if k > 0 then begin
            s := player[k].name + ReturnBJosa(player[k].name);
            Print(7,' ‹aˆé ¥¡”á“¡ '+s+'  iÐ–”a.');
            Print(7,'');
            Print(9,' ´a“¡, ·¡ˆå....  ·¡ˆå ¤a¡ ‹a ¸å¬é ­¢µA¬áa');
            cPrint(9,11,'‘¥Ð»¡”å ','µwÑ¥· ÇaŸ¡¯aÈi','·±µA ËiŸ±´ô‘A. ·¡ˆõ');
            Print(9,'·e ¸å­A‰µA –ˆ ¤cµA ¹¥¸Ða»¡ ´g“e ŠáÐe ˆõ');
            Print(9,'·¥•A ¶Ÿ¡ˆa ¤i‰eÐ–Š….');
            Print(7,'');
            PressAnyKey;
         end;
         setbit(200);
         inc(party.crystal[5]);
      end;

      if on(75,60) and getbit(21) and (Real_Map(75,61) <> 43) then begin
         PutMap(75,61,43);
         Silent_Scroll;
      end;
      if on(76,61) and getbit(22) and (Real_Map(77,61) <> 43) then begin
         PutMap(77,61,43);
         Silent_Scroll;
      end;
      if on(77,59) and (not getbit(88)) then begin
         enemynumber := 8;
         for i := 1 to 3 do joinenemy(i,39);
         for i := 4 to 5 do joinenemy(i,40);
         for i := 6 to 7 do joinenemy(i,41);
         joinenemy(8,43);
         DisplayEnemies(TRUE);
         Clear;
         Print(13,' ¯¥¬÷Ðe ¯¥· ¹A”eµA ”áœá¶… ¤i·i —¡—¥ ‘±—i·e');
         Print(13,'’Š¡?  ¯¥·i ¡¡•¢Ðe áÓ‘A ·¥ˆe—iµA‰A ¡±­¡');
         Print(13,'ˆaŸaÃ±·i º‰V”a. ¤u´aœu!!');
         PressAnyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            inc(y);
            Silent_Scroll;
            exit;
         end;
         Clear;
         Print(7,' ”w¯¥·e ”¹A¬a¸w·a¡¦Èá ”a·¡´a¡¥—aÇ¡ – ˆ');
         Print(7,'Ÿi ¨´v´v”a.');
         setbit(88);
      end;

      if (y = 39) and getbit(88) and ((party.etc[30] shr 4) = (x - 63) div 4) then begin
         if Real_Map(x,y-1) <> 43 then begin
            for j := y-2 to y-1 do
            for i := x-1 to x do PutMap(i,j,43);
            Silent_Scroll;
         end;
      end;
      if (y = 82) and getbit(88) and ((party.etc[30] and $0F) = (x - 64) div 4) then begin
         if Real_Map(x,y+1) <> 43 then begin
            for j := y+1 to y+2 do
            for i := x to x+1 do PutMap(i,j,43);
            Silent_Scroll;
         end;
      end;

      if on(68,25) then begin
         if getbit(147) then exit;
         if (party.etc[31] and BIT1) > 0 then begin
            if getbit(24) then begin
               if getbit(134) then exit;
battle1:
               enemynumber := 1;
               joinenemy(1,46);
               Clear;
               Print(7,' ˆs¸a‹¡ ¥¡¢‰¬w¸a· ´· µ|µA¬á Ìi·¡ aµ¡‰¡ £»');
               Print(7,'µA¬á ”aŸ¡ˆa aµ¡”á“¡  ŠA¢‰¡ ¥eÐ ”w¯¥·i ‰·');
               Print(7,'‰bÐa‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e  ‹aˆõ·¡ ¥¡¢‰¬w¸a·');
               Print(7,'¡¡¯s·i Ða‰¡ ·¶“e  £¡£¡Çaœa“e ˆõ·i ‹q¤w ´i´a');
               Print(7,'Àav”a.');
               PressAnyKey;
               DisplayEnemies(TRUE);
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then begin
                  inc(y);
                  Silent_Scroll;
                  exit;
               end;
               PutMap(69,25,43);
               Silent_Scroll;
               setbit(134);
            end else if getbit(11) then begin
               {$B+}
               Clear;
               AllRight := TRUE;
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ”w¯¥µA‰A »©¢…·i ”å¹v”a.');
               PressAnyKey;
               Print(15,' 1Íe <™¡ ”aŸe »¡¯¢· ¬÷¸å>‰Á 2Íe <”aÇa ¡A·¡');
               Print(15,'»¡ ¯©Ÿ¡´e Äa£¡á¯a>µA  ¡¡– Â‰ÑeÐ–”å ·¥¢‰·¡');
               Print(15,'´a“¥ ˆõ·e ’Š·¥ˆa?');
               m[0] := '';
               m[1] := '¡—a´e';
               m[2] := '‘AÇa¡ e¬á';
               m[3] := 'A—a ´eÈaA¯a';
               m[4] := '´i§¡Aµ¡';
               AllRight := AllRight and Random_Order(4);
               Print(15,' ·¡ ‰A·±· 1,2,3 ÍeµA ¡¡– Â‰ÑeÐe ·¥¢‰·e ’');
               Print(15,'Š·¥ˆa?');
               m[0] := '';
               m[1] := '¯©Ÿ¡´e Äa£¡á¯a';
               m[2] := '´eÈaA¯a Jr.';
               m[3] := '—aœaÅ¡“¡´e';
               m[4] := 'µA·¥­eËa ·¡§i';
               AllRight := AllRight and Random_Order(4);
               Print(15,' ·¡ ‰A·±µA¬á 1,3 Íe e Â‰ÑeÐe ·¥¢‰·¡ ´a“¥ ˆõ');
               Print(15,'·e ’Š·¥ˆa?');
               m[0] := '';
               m[1] := 'Äa‘¡Î¯a';
               m[2] := '´eÈaA¯a Jr.';
               m[3] := '—aœaÅ¡“¡´e';
               m[4] := '¹A¸b¸a(´eµw‹¡)';
               AllRight := AllRight and Random_Order(4);
               if AllRight then begin
                  Print(7,' ¥¡¢‰¬w¸a“e ¯a¯a¡ ¯aŸaŸb µiv”a.');
                  Print(7,'');
                  Print(11,' [ ·¥b + 0 µA¬á + 4 ]');
                  for i := 1 to 6 do
                  if player[i].name <> '' then
                     player[i].endurance := player[i].endurance + (player[i].luck div 5);
                  setbit(147);
               end else begin
                  setbit(24);
                  goto battle1;
               end;
               {$B-}
            end else begin
               Clear;
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ¢´áœa  i·i Ð–»¡ e ¸åÑa ´i´a —i');
               Print(7,'·i ®ˆa ´ô´ö”a.');
            end;
         end else begin
            Clear;
            Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö»¡ e  ¬w¸a ¶á');
            Print(7,'· –ˆ‰©·e ´a¢ i•¡ Ða»¡ ´g´v”a.');
         end;
      end;
      if on(72,25) then begin
         if getbit(148) then exit;
         Clear;
         if (party.etc[31] and BIT2) > 0 then begin
            if getbit(25) then begin
               if getbit(135) then exit;
battle2:
               enemynumber := 1;
               joinenemy(1,46);
               Clear;
               Print(7,' ˆs¸a‹¡ ¥¡¢‰¬w¸a· ´· µ|µA¬á Ìi·¡ aµ¡‰¡ £»');
               Print(7,'µA¬á ”aŸ¡ˆa aµ¡”á“¡  ŠA¢‰¡ ¥eÐ ”w¯¥·i ‰·');
               Print(7,'‰bÐa‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e  ‹aˆõ·¡ ¥¡¢‰¬w¸a·');
               Print(7,'¡¡¯s·i Ða‰¡ ·¶“e  £¡£¡Çaœa“e ˆõ·i ‹q¤w ´i´a');
               Print(7,'Àav”a.');
               PressAnyKey;
               DisplayEnemies(TRUE);
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then begin
                  inc(y);
                  Silent_Scroll;
                  exit;
               end;
               PutMap(73,25,43);
               Silent_Scroll;
               setbit(135);
            end else if getbit(11) then begin
               {$B+}
               AllRight := TRUE;
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ”w¯¥µA‰A »©¢…·i ”å¹v”a.');
               PressAnyKey;
               j := random(100) + 1;
               str(j : 2,s);
               Print(15,' ”w¯¥·e  Ð‚·WÐs  a¤ó·i  ¹·¹· ¬a¶wÐa‰¥ Ðe”a.');
               Print(15,'”w¯¥·¡ ‰·‹¡ º—µA ¦…Í¡ Ð ·¶“e  ®­¡¶¥¸a 4ˆ');
               Print(15,'Ÿi ÑIŸQ¶¥¸a 1ˆ¡ Ð‚·WÐs ¯¡Åv·i˜  »©œ·‰i­¥');
               Print(15,'·¡ '+s+' mg ·¡œa¡e ¸âµA‰A ¤wÂ‰–E µAá»¡“e ´é a');
               Print(15,'·¥ˆa?');
               m[0] := '';
               str((j* 3) / 100 : 4:2,m[1]);
               str((j* 1) / 100 : 4:2,m[2]);
               str((j*10) / 100 : 4:2,m[3]);
               str((j* 9) / 100 : 4:2,m[4]);
               for i := 1 to 4 do m[i] := m[i] + ' x 10^15';
               AllRight := AllRight and Random_Order(4);
               Print(15,' ”w¯¥·e ¹·¹· ‰·ˆe·¡•··i Ðaµa  ¶áÃ¡Ÿi ·¡•·Ða');
               Print(15,'‹¡•¡ Ðe”a.  ‹aŸ¡‰¡ ‹a˜ ”w¯¥·e 3Àa¶¥· ‰·ˆe');
               Print(15,'µA  ˆwÐe º—b·i ˆé´á  ‰·ˆe·i ´sÂ‚ ¯¡Ç¥Ò ‹a');
               Print(15,'‰·ˆe¡e·i š‰¡  ·¡•·Ða‰¡ a¬á  ‰·ˆe·i ¶¥¶áÃ¡');
               Print(15,'¯¡Ç±·a¡°á(¶¡Ïa ¤w¯¢) ‹aˆõ·i ˆa“wÐa‰A Ðe”a.');
               Print(15,'·¡ˆõ·e ¢¯e ¤óÃ¢·a¡ »w¡w–I ® ·¶‰V“eˆa?');
               m[0] := '';
               m[1] := '»©œ·¥¡¹¥· ¤óÃ¢';
               m[2] := '¸b¶w ¤e¸b¶w· ¤óÃ¢';
               m[3] := 'Ëb® ¬w”¬÷ ·¡¥';
               m[4] := '·©¤e ¬w”¬÷ ·¡¥';
               AllRight := AllRight and Random_Order(4);
               Print(15,' ”w¯¥·e '' a¤ó ÑÁŠ''œa“e  ¦‰‰··i  e—i´á ¸âµA');
               Print(15,'‰A ”å¹a ¹A´sÐ¥¥ ‰wÐñ·¡ ·¶”a. ”w¯¥·e ”w¯¥·');
               Print(15,'­¥ ¶áµA ¦‰”÷´áŸ¡Ÿi  e—i‹¡ ¶áÐ¬á  ·¡ ¢‰»©·i');
               Print(15,'‰iÐs¯¡Ç¥”a. ·¡ ¢‰»©· ·¡Ÿq·e ¢´õ·¥ˆa?');
               m[0] := '';
               m[1] := 'Hydrogen';
               m[2] := 'Carbon';
               m[3] := 'Nitrogen';
               m[4] := 'Oxygen';
               AllRight := AllRight and Random_Order(4);
               if AllRight then begin
                  Print(7,' ¥¡¢‰¬w¸a“e ¯a¯a¡ ¯aŸaŸb µiv”a.');
                  Print(7,'');
                  Print(11,' [ ­¡ÑÅ· ÇaŸ¡¯aÈi + 1 ]');
                  inc(party.crystal[6]);
                  setbit(148);
               end else begin
                  setbit(25);
                  goto battle2;
               end;
               {$B-}
            end else begin
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ¢´áœa  i·i Ð–»¡ e ¸åÑa ´i´a —i');
               Print(7,'·i ®ˆa ´ô´ö”a.');
            end;
         end else begin
            Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö»¡ e  ¬w¸a ¶á');
            Print(7,'· –ˆ‰©·e ´a¢ i•¡ Ða»¡ ´g´v”a.');
         end;
      end;
      if on(76,25) then begin
         if getbit(149) then exit;
         Clear;
         if (party.etc[31] and BIT3) > 0 then begin
            if getbit(26) then begin
               if getbit(136) then exit;
battle3:
               enemynumber := 1;
               joinenemy(1,46);
               Clear;
               Print(7,' ˆs¸a‹¡ ¥¡¢‰¬w¸a· ´· µ|µA¬á Ìi·¡ aµ¡‰¡ £»');
               Print(7,'µA¬á ”aŸ¡ˆa aµ¡”á“¡  ŠA¢‰¡ ¥eÐ ”w¯¥·i ‰·');
               Print(7,'‰bÐa‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e  ‹aˆõ·¡ ¥¡¢‰¬w¸a·');
               Print(7,'¡¡¯s·i Ða‰¡ ·¶“e  £¡£¡Çaœa“e ˆõ·i ‹q¤w ´i´a');
               Print(7,'Àav”a.');
               PressAnyKey;
               DisplayEnemies(TRUE);
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then begin
                  inc(y);
                  Silent_Scroll;
                  exit;
               end;
               PutMap(77,25,43);
               Silent_Scroll;
               setbit(136);
            end else if getbit(11) then begin
               {$B+}
               AllRight := TRUE;
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ”w¯¥µA‰A »©¢…·i ”å¹v”a.');
               PressAnyKey;
               m[0] := '';
               m[1] := '               x”a';
               m[2] := '             ´a“¡”a';
               Print(15,' ”i‰Á »¡Š· a·¡“e ˆ{ˆáa »¡Šˆa ”á  g”a.');
               if Select(180,2,2,FALSE,TRUE) <> 2 then AllRight := FALSE;
               Print(15,' µ¸åµA“e ÑÁ¬÷‰Á ¡¢¬÷ ¬a·¡µA Ñ¢¬÷·¡ Ðaa ·¶');
               Print(15,'´ö”a.');
               if Select(180,2,2,FALSE,TRUE) <> 1 then AllRight := FALSE;
               Print(15,' È´·· a·¡“e 50 ´â¬i·¡”a.  80 ´â‘e ¸åµA•¡');
               Print(15,'»¡‹q· È´· ¸aŸ¡µA Ðw¬÷·¡ ·¶´ö·i ˆõ·¡”a.');
               if Select(180,2,2,FALSE,TRUE) <> 1 then AllRight := FALSE;
               Print(15,' ¶º· Ça‹¡“e ¥eÐq·¡ ´ô”a.');
               if Select(180,2,2,FALSE,TRUE) <> 2 then AllRight := FALSE;
               Print(15,' È´·‰ Ñ¢¬÷· ®…¬á“e  ®¬÷, ‹q¬÷, »¡Š,...');
               Print(15,'Àåµ×¬÷, Ðµ×¬÷, ¡wµ×¬÷· ®…¬á¡ ·©¸÷Ða”a.');
               if Select(180,2,2,FALSE,TRUE) <> 2 then AllRight := FALSE;
               Print(15,' É¡¬÷·i ¢‰µA ›¶¡e ›e”a.');
               if Select(180,2,2,FALSE,TRUE) <> 1 then AllRight := FALSE;
               if AllRight then begin
                  Print(7,' ¥¡¢‰¬w¸a“e ¯a¯a¡ ¯aŸaŸb µiv”a.');
                  Print(7,'');
                  Print(11,' [ ÑÁµq· ÇaŸ¡¯aÈi + 1 ]');
                  inc(party.crystal[1]);
                  setbit(149);
               end else begin
                  setbit(26);
                  goto battle3;
               end;
               {$B-}
            end else begin
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ¢´áœa  i·i Ð–»¡ e ¸åÑa ´i´a —i');
               Print(7,'·i ®ˆa ´ô´ö”a.');
            end;
         end else begin
            Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö»¡ e  ¬w¸a ¶á');
            Print(7,'· –ˆ‰©·e ´a¢ i•¡ Ða»¡ ´g´v”a.');
         end;
      end;
      if on(80,25) then begin
         if getbit(150) then exit;
         Clear;
         if (party.etc[31] and BIT4) > 0 then begin
            if getbit(27) then begin
               if getbit(137) then exit;
battle4:
               enemynumber := 1;
               joinenemy(1,46);
               Clear;
               Print(7,' ˆs¸a‹¡ ¥¡¢‰¬w¸a· ´· µ|µA¬á Ìi·¡ aµ¡‰¡ £»');
               Print(7,'µA¬á ”aŸ¡ˆa aµ¡”á“¡  ŠA¢‰¡ ¥eÐ ”w¯¥·i ‰·');
               Print(7,'‰bÐa‹¡ ¯¡¸bÐ–”a.  ”w¯¥·e  ‹aˆõ·¡ ¥¡¢‰¬w¸a·');
               Print(7,'¡¡¯s·i Ða‰¡ ·¶“e  £¡£¡Çaœa“e ˆõ·i ‹q¤w ´i´a');
               Print(7,'Àav”a.');
               PressAnyKey;
               DisplayEnemies(TRUE);
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then begin
                  inc(y);
                  Silent_Scroll;
                  exit;
               end;
               PutMap(81,25,43);
               Silent_Scroll;
               setbit(137);
            end else if getbit(11) then begin
               {$B+}
               AllRight := TRUE;
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ”w¯¥µA‰A »©¢…·i ”å¹v”a.');
               PressAnyKey;
               m[0] := '';
               m[1] := '               x”a';
               m[2] := '             ´a“¡”a';
               Print(15,' BASIC ´å´á·  '';''(­A£¡Å©¥)·e  ¢…¸w· {·i');
               Print(15,'·£¡Ðe”a');
               if Select(180,2,2,FALSE,TRUE) <> 2 then AllRight := FALSE;
               Print(15,' PascalµA¬á ”·³ ‹¡Ñ¡“e ''=''·¡”a.');
               if Select(180,2,2,FALSE,TRUE) <> 2 then AllRight := FALSE;
               Print(15,' C ´å´á“e  µw¢… ­¡¢…¸aŸi  ‹¡¥¥·a¡ ¬é‰–A´ö');
               Print(15,'”a.');
               if Select(180,2,2,FALSE,TRUE) <> 1 then AllRight := FALSE;
               Print(15,' FORTRAN·e subroutine ‹¡“w·¡ ´ô”a.');
               if Select(180,2,2,FALSE,TRUE) <> 2 then AllRight := FALSE;
               Print(15,' Small Talk, C++, Pascal·e Ñe¸ ¡¡– ˆ‚ÁA»¡');
               Print(15,'Ð· Ïa¡‹aœ£··i »¡¶¥Ðe”a.');
               if Select(180,2,2,FALSE,TRUE) <> 1 then AllRight := FALSE;
               if AllRight then begin
                  Print(7,' ¥¡¢‰¬w¸a“e ¯a¯a¡ ¯aŸaŸb µiv”a.');
                  Print(7,'');
                  Print(11,' [ ÁAb ™¡“e ¸÷¯¥b + 0 µA¬á + 2 ]');
                  for i := 1 to 6 do
                  if player[i].name <> '' then begin
                     j := ((player[i].luck div 5) + 1) div 2;
                     if player[i].classtype = magic then
                        player[i].mentality := player[i].mentality + j
                     else
                        player[i].strength := player[i].strength + j;
                  end;
                  setbit(150);
               end else begin
                  setbit(27);
                  goto battle4;
               end;
               {$B-}
            end else begin
               Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö·i˜  ¬w¸a ¶á');
               Print(7,'· –ˆ‰©·¡ ¢´áœa  i·i Ð–»¡ e ¸åÑa ´i´a —i');
               Print(7,'·i ®ˆa ´ô´ö”a.');
            end;
         end else begin
            Print(7,' ”w¯¥·¡ ¥¡¢‰¬w¸a ´|·a¡ ”aˆa¬ö»¡ e  ¬w¸a ¶á');
            Print(7,'· –ˆ‰©·e ´a¢ i•¡ Ða»¡ ´g´v”a.');
         end;
      end;
      if on(84,25) then begin
         if (not getbit(23)) then begin
            Clear;
            Print(7,' ”w¯¥·¡ ´|µA ·¶“e ¥¡¢‰¬w¸aŸi ¥¡´v·i˜  ¬ñ¿µ');
            Print(7,'Ðq·i “a¡¡a Ðe ˆé·q ¢‰œá¬ö”a.  ‹a ¬w¸a ¶áµA');
            Print(7,'“e ·¥ˆe· Ð‰©·¡ ´f´a ·¶´ö‰¡ ‹a Ð‰©µA“e –');
            Print(7,'’…•·¸aµÁ  áŸ¡Äaœb·¡ —q¬÷—q¬÷ ¦›´á ·¶´ö”a.');
            Print(7,' ¯aŸaŸa Ð‰©·¡ ‰¡ˆŸi —i¡a ”w¯¥·i ‘¡a ¥¡´v');
            Print(7,'”a. ”w¯¥·e ”a¯¡ Ðe ˆé·q·i ¢‰œá¬ö”a.  ‹aœá¸a');
            Print(7,'‹a Ð‰©·e ©aª…·¥ – ­¥·i —i´á ”w¯¥·i ˆaŸ¡Åv');
            Print(7,'”a. ‹aŸ¡‰¡ ·¥ˆe·  i·i Ða‹¡ ¯¡¸bÐ–”a.');
            Print(7,'');
            Print(9,' ”w¯¥·e ”w¯¥—i·¡ »¡‹qÐa‰¡ ·¶“e ·©·¡ ´á˜å ˆõ');
            Print(9,'·¥»¡ ¡¡Ÿa‰¡ ·¶”a.  »¡‹q ·¡ ¯¡”ˆa  ¸÷·œa‰¡');
            Print(9,'¬—ˆbÐa“e ˆõ·i µb¬aˆa ¤e—a¯¡ ¸÷·œa‰¡ Íwˆa»µ');
            Print(9,'»¡“e ´g·i ˆõ·¡”a. ”w¯¥·¡  e´¢ µA·¥­eËa ·¡§i');
            Print(9,'·i  ea»¡ ´g´v”a¡e ”w¸w ‹aŸi  ea¥¡´aœa. ‹a');
            Print(9,'Ÿi É·Ð ”w¯¥·e »¥¸÷Ðe ¸÷·Ÿi ÁAÐñÐa‰A –I ˆõ');
            Print(9,'·¡”a. ‰A”aˆa á“e ...');
            Print(7,'');
            Print(7,' ‹aˆa  ·¡œå  i·i Ða‰¡ ·¶·i˜  ˆs¸a‹¡ Àå¸÷·i');
            Print(7,'š‰¡ »¢‰b’A»¥·¡ ‹aŸi ˆwÈaÐ–”a.  ”w¯¥·e ®…ˆe');
            Print(7,'¸â·a¡ ¤é´á»¥ ·¡ ·©·i ¥¡‰¡  äaˆe—u ´é a•·');
            Print(7,'´e ·¶”aˆa ¬e¬eÓ¡ Ó{´á»¥ ©aŸi ¥¡¡a ¤w‹q·  i');
            Print(7,'·i –A¬‰v”a.');
            Print(7,'');
            PressAnyKey;
            setbit(23);
         end;
         if (party.etc[31] and BIT5) > 0 then begin
            if getbit(151) then exit;
            Clear;
            Print(7,' ”w¯¥·e Ð‰©·¡ ˆéÈá ´f´a ·¶”å ¥¡¢‰¬w¸aŸi µi');
            Print(7,'´ö”a.');
            Print(7,'');
            Print(11,' [ Ça¡ Ë¢ ¤wÌ + 1 ]');
            Print(11,' [ §aŸ¡ˆe—¡ + 1 ]');
            Print(11,' [ ÀéÊA + 1 ]');
            if party.BackPack[2,5] < 255 then inc(party.BackPack[2,6]);
            if party.BackPack[5,4] < 255 then inc(party.BackPack[5,4]);
            if party.BackPack[6,5] < 255 then inc(party.BackPack[6,5]);
            setbit(151);
         end;
      end;

      if (on(76,90) or on(77,90)) and (not getbit(87)) then begin
         Clear;
         enemynumber := 5;
         for i := 1 to 2 do joinenemy(i,41);
         joinenemy(3,40);
         joinenemy(4,42);
         joinenemy(5,44);
         DisplayEnemies(TRUE);
         Print(13,' a“e Å¡¥©ËaÇ·“±· ‹e¶á”· ”¸w·¡”a.  ˆa');
         Print(13,'¬i´a ·¶“eÐe  áÓ—i·i ‰iÅ¡ ·¡ ´e·a¡ Ðe¤i¸a');
         Print(13,'Š‚•¡ —iµa‘½»¡ ¡µÐi ˆõ·¡”a.');
         PressanyKey;
         BattleMode(FALSE,TRUE);
         if party.etc[6] = 254 then exit;
         if party.etc[6] = 2 then begin
            inc(y);
            Silent_Scroll;
            exit;
         end;
         setbit(87);
      end;
      if (on(76,86) or on(77,86)) and (not getbit(86)) then begin
         Clear;
         enemynumber := 1;
         joinenemy(1,45);
         DisplayEnemies(TRUE);
         Print(13,' »¡¬w ÂA¬w ÂA”·  a•¡¬a·¥ a, Å¡¥©ËaÇ·µA‰A');
         Print(13,'•¡¸åÐ µ¡”a“¡ ¸å i ¤¼w Ðe¤å ¹½Ša. ‘A‘±—i');
         Print(13,'·e a Ñ¥¸a¬á ¬w”Ða‰V”a. ˆa­¡¡¶… ˆõ—i...');
         PressAnyKey;
         repeat
            BattleMode(FALSE,TRUE);
            if party.etc[6] = 254 then exit;
            if party.etc[6] = 2 then begin
               Clear;
               Print(7,' ”w¯¥·e Å¡¥©ËaÇ·µA‰A¬á •¡ wÃ¡a Ð–»¡ e ‹aˆa');
               Print(7,' e—e ‰i‰Ÿi ¤õ´á i ®ˆa ´ô´ö”a.');
               PressAnyKey;
               DisplayEnemies(TRUE);
            end;
         until party.etc[6] = 0;
         Clear;
         Print(7,' ”w¯¥·¡  Å¡¥©ËaÇ··i ¢‰Ÿ¡ÁvŠaœa‰¡ ¬—ˆbÐ–·i');
         Print(7,'˜ Å¡¥©ËaÇ··e ‰·ˆe·¡•··  a¤ó·i °á¬á ´á—¡¥');
         Print(7,'ˆa ¬aœa¹a ¤áv”a. ”w¯¥·e ”wÑ×Ð¬á ·¡‰µ ¸å»¡');
         Print(7,'µb·i Ê¯¡Ð ¥¡´v»¡ e ‹a“e ´ô´ö”a.');
         setbit(86);
      end;
   end;

   if mapname = 'HdsGate' then begin
      if on(25,30) then begin
         Clear;
         if Real_Map(20,27) = 40 then begin
            i := 40; j := 41;
            Print(7,' ”w¯¥·e A¤áŸi ¶E½¢·a¡ ”w‰v”a.');
         end
         else begin
            i := 41; j := 40;
            Print(7,' ”w¯¥·e A¤áŸi µ¡Ÿe½¢·a¡ ”w‰v”a.');
         end;
         PutMap(20,27,j);
         PutMap(22,28,j);
         PutMap(21,29,i);
         PutMap(23,31,i);
         PutMap(15,32,i);
         PutMap(16,33,j);
         PutMap(119,34,j);
         PutMap(17,35,i);
         PutMap(24,33,j);
         PutMap(28,33,i);
         PutMap(25,35,j);
         PutMap(27,35,i);
         PutMap(22,36,i);
         PutMap(23,39,i);
         Silent_Scroll;
         exit;
      end;
      if on(23,15) then begin
         Clear;
         if Real_Map(23,28) = 40 then begin
            i := 40; j := 41;
            Print(7,' ”w¯¥·e A¤áŸi ¶E½¢·a¡ ”w‰v”a.');
         end
         else begin
            i := 41; j := 40;
            Print(7,' ”w¯¥·e A¤áŸi µ¡Ÿe½¢·a¡ ”w‰v”a.');
         end;
         PutMap(21,27,i);
         PutMap(23,28,j);
         PutMap(20,30,i);
         PutMap(22,30,j);
         PutMap(19,32,i);
         PutMap(17,33,i);
         PutMap(18,34,j);
         PutMap(16,35,j);
         PutMap(26,32,j);
         PutMap(28,32,i);
         PutMap(25,34,j);
         PutMap(27,34,j);
         PutMap(23,38,j);
         PutMap(21,39,j);
         exit;
      end;
      if on(23,19) then begin
         Clear;
         if Real_Map(20,29) = 40 then begin
            i := 40; j := 41;
            Print(7,' ”w¯¥·e A¤áŸi ¶E½¢·a¡ ”w‰v”a.');
         end
         else begin
            i := 41; j := 40;
            Print(7,' ”w¯¥·e A¤áŸi µ¡Ÿe½¢·a¡ ”w‰v”a.');
         end;
         PutMap(23,27,i);
         PutMap(20,29,j);
         PutMap(22,29,j);
         PutMap(21,31,i);
         PutMap(16,32,i);
         PutMap(18,33,i);
         PutMap(16,34,j);
         PutMap(19,35,i);
         PutMap(25,32,j);
         PutMap(27,33,j);
         PutMap(24,34,i);
         PutMap(26,34,i);
         PutMap(22,37,i);
         PutMap(20,38,i);
         exit;
      end;
      if on(27,15) then begin
         Clear;
         if Real_Map(21,28) = 40 then begin
            i := 40; j := 41;
            Print(7,' ”w¯¥·e A¤áŸi ¶E½¢·a¡ ”w‰v”a.');
         end
         else begin
            i := 41; j := 40;
            Print(7,' ”w¯¥·e A¤áŸi µ¡Ÿe½¢·a¡ ”w‰v”a.');
         end;
         PutMap(22,27,i);
         PutMap(21,28,j);
         PutMap(23,29,i);
         PutMap(20,31,j);
         PutMap(18,32,i);
         PutMap(19,33,j);
         PutMap(17,34,j);
         PutMap(15,35,i);
         PutMap(24,32,j);
         PutMap(27,32,j);
         PutMap(26,33,i);
         PutMap(24,35,j);
         PutMap(28,35,i);
         PutMap(23,37,i);
         PutMap(21,40,i);
         exit;
      end;
      if on(27,19) then begin
         Clear;
         if Real_Map(20,28) = 40 then begin
            i := 40; j := 41;
            Print(7,' ”w¯¥·e A¤áŸi ¶E½¢·a¡ ”w‰v”a.');
         end
         else begin
            i := 41; j := 40;
            Print(7,' ”w¯¥·e A¤áŸi µ¡Ÿe½¢·a¡ ”w‰v”a.');
         end;
         PutMap(20,28,j);
         PutMap(21,30,j);
         PutMap(23,30,j);
         PutMap(22,31,i);
         PutMap(17,32,i);
         PutMap(15,33,i);
         PutMap(15,34,j);
         PutMap(18,35,j);
         PutMap(25,31,i);
         PutMap(28,34,i);
         PutMap(26,35,j);
         PutMap(21,38,j);
         PutMap(22,39,j);
         exit;
      end;
      if map^[x,y] = Real_Map(x,y) then begin
         Clear;
         Print(12,' ”w¯¥·¡ ¢‰ ­¢·a¡ ¤i·i —¡—¡¸a  ®…¯¢ˆeµA µ¥');
         Print(12,'¡±·¡ Èa¤áv”a.');
         for i := 1 to 6 do
         with player[i] do
         if name <> '' then begin
            hp := 0;
            dead := 1;
         end;
         Display_Condition;
         PressAnyKey;
         Clear;
         party.etc[6] := 255;
         GameOver;
         exit;
      end;
   end;

   if mapname = 'Dome' then begin
      if (x in [5,46]) or (y in [6,95]) then begin
         if wantexit then begin
            Print(9,' ”w¯¥·¡ ¤i‰eÐe ·¡ ¸w­¡“e  ¦…¡w ¤Ÿ¡´åËa Ï¡');
            Print(9,'Ïi»a· ¬aœq—i·i ¡—a´e· ¯¡ˆb¤ñ¶áµA ¤õ´áa');
            Print(9,'‰A Ða‹¡µA  Â—¦…Ðe ‰µ·©ˆó“¡”a.  ”w¯¥·e ¸÷ i');
            Print(9,'Ò‰ŸWÐe ·©·i Ð­v¯s“¡”a.  ¹Aˆa  ‰¨ ”w¯¥·i');
            Print(9,'»¡¬w·a¡ ·¡•· ¯¡Åa —aŸ¡‰V¯s“¡”a. ‹aŸ¡‰¡ ¸á');
            Print(9,'“e  ¡y ‘e ¸÷•¡ ÓA¯¢·i ÂáÐaa Ðs“¡”a.  ¸á·');
            Print(9,'µw¸â µAá»¡Ÿi   a·i·i ˆå¬éÐa‰¡ ¬aœq—i·i ·¡');
            Print(9,'•· ¯¡Ç¡“e•A °á¤áa¬á µAá»¡ Â—¸å ‹¡ˆe·¡ Ï©');
            Print(9,'¶aÐs“¡”a. µaÈŒõ ”w¯¥· •¡¶‘—i ¸÷ i ‰¡ aµÖ');
            Print(9,'¯s“¡”a. ‰­¢ ¸a¯¥·¡ ‰i¯±Ðe ·»¡”¡ Ž•Ž•Ða');
            Print(9,'‰A a´aˆa¯³¯¡¶a.  ¸á“e ·¡¹A –õ·©·i ¡¡– ”w');
            Print(9,'¯¥µA‰A  {‹¡‰V¯s“¡”a.  ”w¯¥·¡œa¡e ¦…¡wÓ¡ Ð');
            Print(9,'‰ˆáœa £¨¯s“¡”a. ‹aœñ, ´e‘wÓ¡...');
            PressAnyKey;
            mapname := 'Ground1';
            Load;
            with party do begin
               watch_year := year;
               watch_day := day;
               watch_hour := hour;
               watch_min := min;
               watch_sec := sec;
            end;
            Time_Watch := TRUE;
            Time_Event_No := 3;
            watch_min := watch_min + 90;
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
            x := 80; y := 80;
            Scroll(TRUE);
         end else begin
            x := x - x1;
            y := y - y1;
            Silent_Scroll;
         end;
      end;
   end;

   if mapname = 'Light' then begin
      if y = 70 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
      if (y = 43) and (not getbit(33)) then begin
         i := 38 - x + 5;
         for j := 1 to 5 do begin
            if j > 1 then PutTile(i,j-1,42);
            PutTile(i,j,53);
            if j < 5 then delay(500);
         end;
         Clear;
         Print(7,'a“e ·¡¤å ¤eœe·i »¡ÒáÐa‰¡ ·¶“e Äa£¡á¯aœa“e');
         Print(7,'¬aœq·¡µ¡. ¡y·© ¸åµA ¶Ÿ¡ ¬÷µA µA·¥­eËa ·¡§i');
         Print(7,'· ·»¡ˆa ”a‘aˆv­¡. ‹aŸ¡‰¡ ·¡ ­A¬w· »¥¯©·i');
         Print(7,'´áqÎ•·¡ ´i‰A –A´ö­¡.  ¶Ÿ¡“e Ðw¬w ¡—a´e·¡');
         Print(7,' iÐa“e ˆõ·i ‹a”¡ £¨´áµÖ­¡. ‹aˆå µaÈŒõ ´i');
         Print(7,'a»¥ ‹a· ¡w¬÷ ˜¢…·¡´ö”aµ¡.  Ða»¡ e ·¡¹A“e');
         Print(7,'µ¶Aˆa ·¶”a“eˆé Œ”j‰A –A´ö­¡.');
         Print(7,'”w¯¥·e ‹a· ¡ww”¡ µ¡Ça, Ëa©, Å¡¥©Ëa, —a');
         Print(7,'œaÅ¡“¡´e ·¡ ‘A¹·¹¢·i ¹AˆáÐaµa ·¥ˆe·i ·¡³‰A');
         Print(7,'Ðeˆå ¬a¯©·¡µ¡. ”w¯¥ ™¡Ðe ‹a ·©·i ¸aœw¯aœó‰A');
         Print(7,'¬—ˆbÐi»¡•¡ ¡¡Ÿaµ¡.  Ða»¡ e  ¶Ÿ¡· ·³¸wµA¬á');
         Print(7,'¥©˜ ‹aœý”a“e ˆõ·¡»¡, ¸é”¡ ”aŸe ¹·¹¢· ·³');
         Print(7,'¸wµA¬á“e ”w¯¥·¡ Ðe ·©·¡ ¸÷·Ÿi ¶áÐe ˆõ·¡ ´a');
         Print(7,'“¡œaµ¡.  ¯©¹A¡ ¸i¡µ·e ¶Ÿ¡ˆa Ð–·a¡e¬á •¡Ÿ¡');
         Print(7,'´á ‹a—iµA‰A ¸i¡µ·i ”ü´á ³¶¡¬á  ‹a—i·i ÐÐe');
         Print(7,'ˆõ·¡»¡´g­¡. ”w¯¥·¡ µA·¥­eËa ·¡§i·i  ev”a“e');
         Print(7,' i·i —i´ö­¡. ‹aœý”a¡e ¶Ÿ¡ˆa »¡‹q Ðaa“e ·©');
         Print(7,'·i ·¡ÐÐiˆá¶a.  ¶Ÿ¡—i·e ”w¯¥·¡ ¶Ÿ¡· ÍeµA');
         Print(7,'¬á¬á ¡—a´e·i ·w»·Ð º‹¡Ÿi ¤aœa‰¡ ·¶­¡.');
         Print(7,' ¸a, ¬åÈ‚·e ”w¯¥µA‰A ·¶­¡.');
         Print(7,'');
         Print(7,'');
         Pause(FALSE);
         for i := 1 to 7 do Print(7,'');
         Pause(TRUE);
         m[0] := '';
         m[1] := '¡—a´e·i ¤¯¥Ðe”a';
         m[2] := '¡—a´e·  i”¡ ·¡—i·i ¤éÐe”a';
         if Select(200,2,2,FALSE,TRUE) = 1 then begin
            setbit(33);
            party.etc[25] := 2;
            Print(7,' ¶Ÿ¡ ¬÷· ¬aœq—i·e ”w¯¥· ¶w‹¡ ·¶“e ‰i”eµA');
            Print(7,'Àe¬aŸi ¥¡‰¡ ·¶­¡. ¸÷ i ¸wÐe ·©·¡µ¡.');
            with party do begin
               watch_year := year;
               watch_day := day;
               watch_hour := hour;
               watch_min := min;
               watch_sec := sec;
            end;
            Time_Watch := TRUE;
            Time_Event_No := 0;
            watch_min := watch_min + 10;
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
            for i := 2 to 5 do begin
               for j := 0 to 8 do player[i].name[j+9] := player[i].name[j];
               player[i].name[0] := chr(0);
            end;
            Display_Condition;
            i := 38 - x + 5;
            for j := 5 downto 1 do begin
               PutTile(i,j,42);
               if j > 1 then begin
                  PutTile(i,j-1,53);
                  delay(500);
               end;
            end;
         end else begin
            party.etc[25] := 1;
            enemynumber := 8;
            for i := 1 to 8 do joinenemy(i,64);
            DisplayEnemies(TRUE);
            repeat
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then Clear;
            until party.etc[6] = 0;
            Clear;
            enemynumber := 8;
            for i := 1 to 7 do joinenemy(i,64);
            joinenemy(8,65);
            DisplayEnemies(TRUE);
            repeat
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then Clear;
            until party.etc[6] = 0;
            Clear;
            enemynumber := 8;
            for i := 1 to 4 do joinenemy(i,64);
            for i := 5 to 7 do joinenemy(i,65);
            joinenemy(8,66);
            DisplayEnemies(TRUE);
            repeat
               BattleMode(FALSE,TRUE);
               if party.etc[6] = 254 then exit;
               if party.etc[6] = 2 then Clear;
            until party.etc[6] = 0;
            setbit(33);
            party.etc[20] := 9;
            Clear;
            Print(7,' Ða»¡ e  Äa£¡á¯a“e  ¤Ÿ¡´åËa Ï¡Ïi»a· q·e');
            Print(7,'º£¥—i·i •AŸ¡‰¡  ¬÷·i ¤áŸ¥À  ‰A·¡ËaŸi É·Ð');
            Print(7,'•¡ wˆa ¤áv”a.');
         end;
      end;
   end;

   if mapname = 'Dark' then begin
      if y = 95 then begin
         if wantexit then DefaultExit
         else begin
            dec(y);
            Silent_Scroll;
         end;
      end;
   end;

end;


Procedure SpecialEvent;
begin
   SpecialEvent_Sub2;
   SpecialEvent_Sub1;
end;

end.