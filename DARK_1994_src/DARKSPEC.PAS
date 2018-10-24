Unit DarkSpec;

INTERFACE

Uses
   Crt, Graph, UHanX, DarkSub, Voice, DarkBatt, DarkEnd;

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

Procedure Find_Gold(var param : byte; bit : byte; value : longint);
begin
   if param and bit = 0 then begin
      findgold(value);
      param := param or bit;
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


Procedure SpecialEvent_Sub1;
begin
   scroll(TRUE);
   case party.map of
      1 : begin
             Clear;
             if on(82,9) then
             if wantenter('AŠ‰ž¯a· µ¡– b') then begin
                if party.etc[10] >= 16 then begin
                   Print(7,' ·¡£¡ µ¡– b·e ÌaŠA–E Òµv”a.');
                   exit;
                end;
                with party do begin
                   map := 9; xaxis := 25; yaxis := 40;
                end;
                Load;
                with party do begin
                   if ((etc[33] <> 0) or (etc[34] <> 0)) and (etc[32] and bit5 = 0) then begin
                      if day >= etc[34]*256+etc[33] then begin
                         if hour >= 12 then begin
                            PutMap(40,13,49);
                            etc[32] := etc[32] or bit5;
                         end;
                      end;
                   end
                   else if (etc[32] and bit5 > 0) then begin
                      if etc[50] and bit7 = 0 then
                         PutMap(40,13,49);
                   end;
                end;
             end
             else begin
                x := x - x1;
                y := y - y1;
             end;
             Silent_Scroll;
          end;
      2 : begin
             if on(96,94) or on(96,95) then begin
                Clear;
                Print(7,' ·©Ð—·e ‰¡”· ·A¸â·a¡ ‰·ˆe ·¡•··¡ –A´ö”a.');
                x := 141; y := 116;
                Silent_Scroll;
             end;
             if (x = 137) and (y in [115..119]) then begin
                Clear;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•··¡ –A´ö”a.');
                x := 94; y := 100;
                Silent_Scroll;
             end;
             if on(144, 56) then Find_Gold(party.etc[44],bit2,5000);
             if on(146, 57) then Find_Item(party.etc[44],bit3,8,5);
             if on(150, 58) then Find_Gold(party.etc[44],bit4,8000);
             if on(154, 56) then Find_Item(party.etc[44],bit5,9,3);
             if on(137,110) then Find_Gold(party.etc[44],bit6,15000);
             if on(109, 89) then Find_Item(party.etc[44],bit7,5,2);
             if on(144, 80) then Find_Gold(party.etc[44],bit8,20000);

             if on(105, 88) then Find_Gold(party.etc[45],bit2,18000);

             if on(  8, 16) then Find_Gold(party.etc[47],bit1,1000);
             if on(  8, 49) then Find_Gold(party.etc[47],bit2,2000);
             if on( 20, 55) then Find_Gold(party.etc[47],bit3,3000);
             if on( 23, 51) then Find_Gold(party.etc[47],bit4,4000);
             if on( 36, 41) then Find_Gold(party.etc[47],bit5,5000);
             if on(117,116) then Find_Gold(party.etc[47],bit6,6000);
             if on(143, 73) then Find_Gold(party.etc[47],bit7,7000);
             if on(167, 38) then Find_Gold(party.etc[47],bit8,8000);

             if on( 41, 61) then Find_Item(party.etc[48],bit1,1,3);
             if on(115,  7) then Find_Item(party.etc[48],bit2,2,2);
             if on(162, 15) then Find_Item(party.etc[48],bit3,3,1);
             if on(163, 51) then Find_Item(party.etc[48],bit4,4,3);
             if on(164, 61) then Find_Item(party.etc[48],bit5,5,2);
             if on(169, 52) then Find_Item(party.etc[48],bit6,6,3);
             if on( 97, 60) then Find_Item(party.etc[48],bit7,7,4);
             if on( 99,112) then Find_Item(party.etc[48],bit8,8,5);

             if on( 49, 14) then Find_Gold(party.etc[49],bit1,30000);
             if on( 95, 34) then Find_Item(party.etc[49],bit2,5,5);
             if on(140,  7) then Find_Gold(party.etc[49],bit3,25000);
             if on( 85, 89) then Find_Gold(party.etc[49],bit4,20000);
             if on( 97, 24) then Find_Item(party.etc[49],bit5,9,5);
             if on( 74, 78) then Find_Gold(party.etc[49],bit6,35000);
             if on( 11, 71) then Find_Item(party.etc[49],bit7,10,2);

             if on(193,119) and (party.etc[49] and bit8 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·¡ £»·i ¥¡¸a ˆá‹¡µA“e ©a e q·e ‹¡¬aˆa');
                Print(7,'³aœá¹a ·¶´ö”a. ‹a· ¢‹¡µÁ ˆsµµ·e ÑwÍe ´ô·¡');
                Print(7,'Œ´á¹a ·¶´ö»¡ e  ‹a· Ça¡ Ë¢ ¤wÌ“e  ´a»¢');
                Print(7,'¬a¶wÐi ® ·¶´ö”a. ·©Ð—·e ‹a ¤wÌŸi ˆa»¡‹¡¡');
                Print(7,'Ðaµv”a.');
                PressAnyKey;
                Print(10,' ·A‰©·¡ »¡“¡‰¡ ·¶”å Ça¡ Ë¢ ¤wÌŸi ˆa»© ¬a');
                Print(10,'œq·i ‰¡Ÿa¯¡µ¡.');
                k := ChooseWhomSub(106,FALSE,FALSE);
                if k = 0 then exit;
                Clear;
                if Verify_Shield(k,4) then begin
                   player[k].shield := 4;
                   Modify_Item(k);
                   Print(15,player[k].name+ReturnSJosa(player[k].name)+' Ça¡ Ë¢ ¤wÌŸi ¸wÀbÐ–”a.');
                   party.etc[49] := party.etc[49] or bit8;
                end
                else begin
                   Print(7,player[k].name+'µA‰A“e ·¡ ¤wÌˆa  x»¡ ´g¯s“¡”a.');
                end;
             end;

             if on(63,68) and (party.etc[45] and bit1 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·¡ £»·i ¥¡¸a ˆá‹¡µA“e ©a e q·e ‹¡¬aˆa');
                Print(7,'³aœá¹a ·¶´ö”a. ‹a· ¤wÌµÁ ˆsµµ·e ÑwÍe ´ô·¡');
                Print(7,'Œ´á¹a ·¶´ö»¡ e  ‹a· ´·i ¸åÊ •¡¡“e ´a»¢');
                Print(7,'¬a¶wÐi ® ·¶´ö”a. ·©Ð—·e ‹a ¢‹¡Ÿi ˆa»¡‹¡¡');
                Print(7,'Ðaµv”a.');
                PressAnyKey;
                Print(10,' ·A‰©·¡ »¡“¡‰¡ ·¶”å  ´·i ¸åÊ •¡¡Ÿi  ˆa»©');
                Print(10,'¬aœq·i ‰¡Ÿa¯¡µ¡.');
                k := ChooseWhomSub(106,FALSE,FALSE);
                if k = 0 then exit;
                Clear;
                if Verify_Weapon(k,13) then begin
                   player[k].weapon := 13;
                   Modify_Item(k);
                   Print(15,player[k].name+ReturnSJosa(player[k].name)+' ´·i ¸åÊ •¡¡Ÿi ¸wÀbÐ–”a.');
                   party.etc[45] := party.etc[45] or bit1;
                end
                else begin
                   Print(7,player[k].name+'µA‰A“e ·¡ ¢‹¡ˆa  x»¡ ´g¯s“¡”a.');
                end;
             end;

             if on(104,10) and (party.etc[45] and bit3 = 0) then begin
                if party.etc[45] and bit4 = 0 then exit;
                Clear;
                Print(7,' ·©Ð—·¡ ¢‰¶áµA ”a”aŸa¸a  ¢‰­¢µA¬á ˆñ·e ‰×À');
                cPrint(7,11,'Ÿi ¡a  ¸å¬é· ','Ób¶a¬â ˆsµµ','·¡ ˜áµ©œv”a.  ·¡');
                Print(7,'ˆsµµ·e  Ñe¸· ‹¡®‰¡  e—i ® ·¶“e ÏiœË¡¶‘');
                Print(7,'¸»©· ˆsµµ¥¡”a –¤· ¤w´áb·i »¡“¥”a‰¡ Ðe');
                Print(7,'”a.');
                PressAnyKey;
                Print(10,' Ñ¡®µA¬á ˜áµ¡Ÿe  Ób¶a¬â ˆsµµ·i ¸wÀbÐi ¬aœq');
                Print(10,'·i ‰¡Ÿa¯¡µ¡.');
                k := ChooseWhomSub(106,FALSE,FALSE);
                if k = 0 then exit;
                Clear;
                if Verify_Armor(k,255) then begin
                   player[k].armor := 255;
                   Modify_Item(k);
                   Print(15,player[k].name+ReturnSJosa(player[k].name)+' Ób¶a¬â ˆsµµ·i ¸wÀbÐ–”a.');
                   party.etc[45] := party.etc[45] or bit3;
                end
                else begin
                   Print(7,player[k].name+'µA‰A“e ·¡ ˆsµµ·¡  x»¡ ´g¯s“¡”a.');
                end;
             end;

             if (on(104,14) or on(105,14)) and (party.etc[45] and bit4 = 0) then begin
                Clear;
                enemynumber := 8;
                for i := 1 to 5 do joinenemy(i,34);
                joinenemy(6,36);
                joinenemy(7,39);
                joinenemy(8,45);
                DisplayEnemies(TRUE);
                Print(13,' ¸qŒe, ¶Ÿ¡—i·e ¸å¬é· ˆsµµ·i »¡Ç¡“e Ìa®Ž…');
                Print(13,'—i·¡”a. ”w¯¥—i·e ”á ·¡¬w —i´á ˆi® ´ô”a. ¸a');
                Print(13,'ˆbµ¡Ðœa.');
                PressAnyKey;
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   inc(y);
                   Silent_Scroll;
                   exit;
                end;
                Clear;
                Print(7,' ”w¯¥·e ¥¡¢‰ Ìa®Ž…—i·i ¢‰Ÿ¡Áv”a.');
                party.etc[45] := party.etc[45] or bit4;
             end;
             if on(149,51) and (party.etc[45] and bit5 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·¡ ´|·a¡ »¥Ð—Ðaa Ð–»¡ e  ¸ñ´‚ ¬—¢‰·¡');
                Print(7,'·©Ð—·i Í¡¶áÐ–”a.');
                PressAnyKey;
                enemynumber := 8;
                for i := 1 to enemynumber do joinenemy(i,23);
                DisplayEnemies(TRUE);
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   dec(y);
                   Silent_Scroll;
                   exit;
                end;
                party.etc[45] := party.etc[45] or bit5;
             end;
             if on(149,66) and (party.etc[45] and bit6 = 0) then begin
                Print(7,' ·©Ð—·¡ •·Š‰ ´|µA ¬ö·i˜ •·Š‰· ·³ŠŸi »¡Ç¡');
                Print(7,'“e ŠA¢‰—i·¡ ·©Ð—· ´|·i ˆa¡  b´v”a.');
                PressAnyKey;
                enemynumber := 5;
                for i := 1 to 5 do joinenemy(i,i+25);
                DisplayEnemies(TRUE);
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   inc(y);
                   Silent_Scroll;
                   exit;
                end;
                party.etc[45] := party.etc[45] or bit6;
             end;
             if Real_Map(x,y) = 52 then begin
                if on(104,10) then exit;
                if Real_Map(x,y) <> Map^[x,y] then exit;
                Clear;
                Print(7,' ·©Ð—·¡ ¢‰¶á¡ ˆaa‰¡ Ða¸a ˆs¸a‹¡ ¢‰·e ¶w´q');
                Print(7,'·a¡ ¤aŽá‰¡  i´v”a.');
                for j := 61 to 119 do
                for i := 8 to 106 do begin
                   if Real_Map(i,j) = 52 then Map^[i,j] := 50;
                                            { ^ §¹·¡ ·¶“e »¡Ñw·i ´ôµQ }
                end;
                Silent_Scroll;
             end;
             if on(184,31) and (party.etc[11] = 1) then begin
                Clear;
                Print(7,' ´a“¡ ! '+player[1].name+' ¸a‘Aˆa µa‹¡ ¶Å·©·¥ˆa ?');
                Print(7,' ¸÷ i µ¡œˆe  e·¡‘A.');
                Print(7,'');
                Print(3,' a•¡ µb¯¡ ¤eˆs‘A. a“e »¡‹q œa¯aËa —¡Ã¡ ¬÷');
                Print(3,'º“±µA‰A ”w¯¥· ¯¥¥e·i ´i´aµ¡œa‰¡ ¦Èb·i ¤h');
                Print(3,'´v”a‘A. ¸a‘Aˆa ¬i´a ·¶´á¬á ¸÷ i ”aÐ—·¡‘A.');
                Print(7,'');
                Print(7,' ‹aœåˆa ?  ¬÷º“±·¡ aŸi ‹aœý‰A ¬—ˆbÐ º¯¡');
                Print(7,'”a“¡ ¸÷ i ‰¡ sŠ….  ‹aœå ‹aœý‰¡ ·¡ ´eµA ·¶“e');
                Print(7,'–ˆ· •·Š‰ ­¢µA“e  ·¡£¡ »¡Ða ­A‰µÁ· É·¡');
                Print(7,'ˆa  ”e¸é –A´á ¤áv”a‘A.  aµÁ »¡“¡´á¯a ‹¡ˆa');
                Print(7,'‹a ‰µ·i ÈiÂ‰ Ða¸a a¸a  »¡Ða ­A‰·  a¤ó¬aµA');
                Print(7,'·Ð ·³Šˆa ¥·­á–E ˆõ ˆ{‘A.  ‹aœ•¡ Ðe¤å Èq');
                Print(7,'ÐñµA ¥¡“e ˆõ•¡ ¹½·e ‰wÐñ·©ÉA‰¡. »¡‹q·e ‹aˆõ');
                Print(7,'¥¡”a“e  a· ´e¦Ÿi ¬÷º“±A ´iŸ¡“e‰A ”á º—');
                Print(7,'¶a Ða‰VŠ…. ‹aœñ  å¸á ˆa¥¡•¡¢ Ða‰A.');
                inc(party.etc[11]);
             end;

             if on(157,94) then begin
                if party.etc[44] and bit1 = 0 then exit;
                Clear;
                if party.etc[46] and bit1 = 0 then begin
                   Allright := TRUE;
                   Print(7,' ”w¯¥ ´|· ¬â¬w·¡ ·³·i µi´ö”a.');
                   Print(7,'');
                   Print(15,' a“e ‰¡”· ·A¸âº— Àå¢…Ðb·i ”q”wÐa‰¡ ·¶­¡.');
                   Print(15,' e´¢ a· 4 ˆa»¡ »©¢…·i ¡¡– É·‰ÁÐa¡e ·¡ ¯¡');
                   Print(15,'Ðñ·i É·‰ÁÐeˆõ·a¡ ˆeºÐa‰V­¡.');
                   PressAnyKey;
                   Print(7,' "¯¡‹aá¯a X1" ·¡œe ¥i·e Ñe” ‰ÁÐbµA¬á ´á˜å');
                   Print(7,'¥i¡ ˆeº –A‰¡ ·¶‰V­¡ ?');
                   m[0] := '';
                   m[1] := 'Ñ¢¬÷';
                   m[2] := '¤‚¬‚ µá¬÷';
                   m[3] := '§iœ‚Ñ©';
                   m[4] := 'º—¬÷¸a ¥i';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 3 then Allright := FALSE;
                   Print(7,' Ñe¸ ´ia»¥ Ðw¬÷º—µA¬á ˆa¸w ¤j·e Ðw¬÷·e ¢');
                   Print(7,'´õ·¡œa‰¡ ´ia¹a ·¶­¡ ?');
                   m[1] := 'Í©œaŸ¡¯a ( ¦‚‹b¬÷ )';
                   m[2] := '¯¡Ÿ¡¶¯a';
                   m[3] := '¯aÏ¡Äa';
                   m[4] := '¥AÉI‹A¯a';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 2 then Allright := FALSE;
                   Print(7,' ‹q§¹‰Á ÎŸe§¹· ·¡º—¬÷·a¡ ´ia»¥ ´aŸq”a¶…');
                   Print(7,'¥i· ·¡Ÿq·e ¢´õ·¡‰V­¡ ?');
                   m[1] := '¯¡Ÿ¡¶¯a';
                   m[2] := '´iÅ©‰Á £¡¸aŸa';
                   m[3] := '´i§¡Aµ¡';
                   m[4] := '¥AœaËaŸ¢¯a';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 3 then Allright := FALSE;
                   Print(7,' ”a·qº— µ¡Ÿ¡µ¥ ¸aŸ¡· ¥i·¡ ´a“¡ˆõ·i ‰©œa ¥¡');
                   Print(7,'•¡¢ Ða¯¡µ¡.');
                   m[1] := '¥AÉI‹A¯a';
                   m[2] := 'Ÿ¡‰I';
                   m[3] := '¥AœaËaŸ¢¯a';
                   m[4] := '´eÈaA¯a';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 4 then Allright := FALSE;
                   if Allright then begin
                      Print(15,' ”w¯¥·e ¸÷ i µi¯±Ó¡ " ™¡ ”aŸe »¡¯¢· ¬÷¸å "');
                      Print(15,'·i Ð–a ¥¡Š…¶a. ˆa … ¡¡—e ¢…¹A“e ¤a¡ ˆá');
                      Print(15,'‹¡µA¬á aµ¡“e ¢…¹A—i·¡´ö”aµ¡.');
                      Print(15,' ”w¯¥·e ·¡ ¯¡Ðñ·i É·‰Á Ð–­¡.');
                      Print(7,'');
                      Print(11,' [ ‰wÐñÃ¡ + 50000 ]');
                      for i := 1 to 5 do
                      with player[i] do begin
                         if name <> '' then experience := experience + 50000;
                      end;
                      party.etc[46] := party.etc[46] or bit1;
                   end
                   else begin
                      Print(15,' ”w¯¥·e ¡¡—e ¢…¹AŸi ¡¡–  xÂ»¡ ¡µÐ–­¡.  ');
                      Print(15,'ˆa … ¢…¹A“e ¡¡– " ™¡ ”aŸe »¡¯¢· ¬÷¸å "µA');
                      Print(15,'¬á ·AœÐe ˆõ·¡œa“e ˆõ·i ´i´a –¯¡µ¡.');
                   end;
                end
                else begin
                   Plus_Mentality;
                end;
             end;

             if on(157,108) then begin
                if party.etc[44] and bit1 = 0 then exit;
                Clear;
                if party.etc[46] and bit2 = 0 then begin
                   Allright := TRUE;
                   Print(7,' ”w¯¥ ´|· ¬â¬w·¡ ·³·i µi´ö”a.');
                   Print(7,'');
                   Print(15,' a“e ‰¡”· ·A¸âº— ÄñÏAÈáŸi ”q”wÐa‰¡ ·¶­¡.');
                   Print(15,' e´¢ a· 4 ˆa»¡ »©¢…·i ¡¡– É·‰ÁÐa¡e ·¡ ¯¡');
                   Print(15,'Ðñ·i É·‰ÁÐeˆõ·a¡ ˆeºÐa‰V­¡.');
                   PressAnyKey;
                   Print(7,' " ”aÇa ¡A·¡»¡ ¯©Ÿ¡´e Äa£¡á¯a "œa“e ·¡ ‰A·±');
                   Print(7,'·¡ »¡¶¥Ða“e ‹aœÏ¢ Äa—a“e ¢´õ·¡‰V­¡ ?');
                   m[0] := '';
                   m[1] := 'Hercules';
                   m[2] := 'Color Graphics Adapter';
                   m[3] := 'Enhanced Graphics Adapter';
                   m[4] := 'Video Graphics Array';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 4 then Allright := FALSE;
                   Print(7,' ”a·q·e µaœá OS ˆe· ¡ww´áœaµ¡. ·¡º—µA¬á ¬÷');
                   Print(7,'»©·¡ ”aŸe ÐaaŸi Àx´a¥¡•¡¢ Ða¯¡µ¡.');
                   m[1] := 'Pro - Dos : "prefix"';
                   m[2] := 'Unix      : "ls"';
                   m[3] := 'MS - Dos  : "dir"';
                   m[4] := 'Apple Dos : "catalog"';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 1 then Allright := FALSE;
                   Print(7,' ‹aœñ ·¡ ‰A·±·i  e—i˜ ³a·¥ ´å´á º—µA¬á ºˆa');
                   Print(7,'–A“e ´å´á“e ¢´õ·¡´ö‰V­¡ ?');
                   m[1] := 'FORTRAN';
                   m[2] := 'BASIC';
                   m[3] := 'Pascal';
                   m[4] := 'C ++';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 3 then Allright := FALSE;
                   Print(7,' ”a·q·e µaœá ÄñÏAÈá ´å´á· Â‰b Ðq®œaµ¡. ‹a');
                   Print(7,'º— ‰i‰Áˆa ËiŸ¥ ˆõ·e ¢´õ·¡‰V­¡ ?');
                   m[1] := 'FORTRAN : WRITE(*,*) ''Dark.exe''';
                   m[2] := 'BASIC   : PRINT "Dark.exe";';
                   m[3] := 'Pascal  : writeln(''Dark.exe'');';
                   m[4] := 'C       : puts("Dark.exe");';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 2 then Allright := FALSE;
                   if Allright then begin
                      Print(15,' ”w¯¥·e ¸÷ i  µi¯±Ó¡ ÄñÏAÈáŸi ‰·¦Ð–a ¥¡Š…');
                      Print(15,'¶a.');
                      Print(15,' ”w¯¥·e ·¡ ¯¡Ðñ·i É·‰Á Ð–­¡.');
                      Print(7,'');
                      Print(11,' [ ‰wÐñÃ¡ + 50000 ]');
                      for i := 1 to 5 do
                      with player[i] do begin
                         if name <> '' then experience := experience + 50000;
                      end;
                      party.etc[46] := party.etc[46] or bit2;
                   end
                   else begin
                      Print(15,' ”w¯¥·e ¡¡—e ¢…¹AŸi ¡¡–  xÂ»¡ ¡µÐ–­¡.');
                   end;
                end
                else begin
                   Plus_Endurance;
                end;
             end;

             if on(171,94) then begin
                if party.etc[44] and bit1 = 0 then exit;
                Clear;
                if party.etc[46] and bit3 = 0 then begin
                   Allright := TRUE;
                   Print(7,' ”w¯¥ ´|· ¬â¬w·¡ ·³·i µi´ö”a.');
                   Print(7,'');
                   Print(15,' a“e ‰¡”· ·A¸âº— ¢‰Ÿ¡Ðb·i ”q”wÐa‰¡ ·¶­¡.');
                   Print(15,' e´¢ a· 3 ˆa»¡ »©¢…·i ¡¡– É·‰ÁÐa¡e ·¡ ¯¡');
                   Print(15,'Ðñ·i É·‰ÁÐeˆõ·a¡ ˆeºÐa‰V­¡.');
                   PressAnyKey;
                   Print(7,' §¹¥¡”a ”á ¨aŸa‰A ”iŸ© ® ·¶“e  ˆa¬w· ·³¸a');
                   Print(7,'ˆa ·¶­¡. ‹a ·³¸a· ·¡Ÿq·e ¢´õ·¡‰V­¡ ?');
                   m[0] := '';
                   m[1] := 'Ïiœa»a a';
                   m[2] := 'Æ¡Ça';
                   m[3] := 'ÈaÇ¡µ¥';
                   m[4] := 'Èa»¡µ¥';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 3 then Allright := FALSE;
                   Print(7,' ”a·qº— “AËe· ­Aˆa»¡ ¤óÃ¢µA ­¢Ða»¡ ´g“e ˆõ');
                   Print(7,'·e ´á“a ˆõ·¡‰V­¡ ?');
                   m[1] := ' e·A ·¥b· ¤óÃ¢';
                   m[2] := '‰Å¬÷· ¤óÃ¢';
                   m[3] := '¸b¶w ¤e¸b¶w· ¤óÃ¢';
                   m[4] := '»©œ· ¥¡¹¥· ¤óÃ¢';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 4 then Allright := FALSE;
                   Print(7,' ”a·q ‰·¯¢º— ËiŸ¥ˆõ·i Ðe¤å ‰©œa ¥¡•¡¢ Ða');
                   Print(7,'¯¡µ¡.');
                   m[1] := 'F = ma';
                   m[2] := 'F = Blv';
                   m[3] := 'F = mg';
                   m[4] := 'F = Bli';
                   k := Select(120,4,4,FALSE,TRUE);
                   if k <> 2 then Allright := FALSE;
                   if Allright then begin
                      Print(15,' ”w¯¥·e ¢‰Ÿ¡ÐbµA•¡  µb¯¡ ¬w”wÐe »¡¯¢·i ˆa»¡');
                      Print(15,'‰¡ ·¶Š…¶a.');
                      Print(15,' ”w¯¥·e ·¡ ¯¡Ðñ·i É·‰Á Ð–­¡.');
                      Print(7,'');
                      Print(11,' [ ‰wÐñÃ¡ + 50000 ]');
                      for i := 1 to 5 do
                      with player[i] do begin
                         if name <> '' then experience := experience + 50000;
                      end;
                      party.etc[46] := party.etc[46] or bit3;
                   end
                   else begin
                      Print(15,' ”w¯¥·e ¡¡—e ¢…¹AŸi ¡¡–  xÂ»¡ ¡µÐ–­¡.');
                   end;
                end
                else begin
                   Plus_Strength;
                end;
             end;

             if on(170,108) then begin
                if party.etc[44] and bit1 = 0 then exit;
                Clear;
                if party.etc[46] and bit4 = 0 then begin
                   Allright := TRUE;
                   Print(7,' ”w¯¥ ´|· ¬â¬w·¡ ·³·i µi´ö”a.');
                   Print(7,'');
                   Print(15,' a“e ‰¡”· ·A¸âº— " ™¡ ”aŸe »¡¯¢· ¬÷¸å "');
                   Print(15,'µA ”Ðe ¬w¯¢·i ”q”wÐa‰¡ ·¶­¡.');
                   Print(15,' e´¢ a· 3 ˆa»¡ »©¢…·i ¡¡– É·‰ÁÐa¡e ·¡ ¯¡');
                   Print(15,'Ðñ·i É·‰ÁÐeˆõ·a¡ ˆeºÐa‰V­¡.');
                   PressAnyKey;
                   Print(7,' ·¡ ‰A·±· ¸å¸b·¡¡a 1¦ µv”å " ™¡ ”aŸe »¡¯¢');
                   Print(7,'· ¬÷¸å "· ¸â· ÂA‰¡ ¥¡¯a“e ’Šµv­¡ ?');
                   m[0] := '';
                   m[1] := 'µA·¥­eËa ·¡§i';
                   m[2] := 'Ó¡—aœa';
                   m[3] := '—aœaÅ¡“¡´e';
                   m[4] := '‘AÇa¡ e¬á';
                   m[5] := '¡—a ´e';
                   k := Select(120,5,5,FALSE,TRUE);
                   if k <> 4 then Allright := FALSE;
                   Print(7,' ¸å¸bµA¬á  —aœ‰¥·¡ ·¶”å •·Š‰µA¬á  ®•¡Ða”å');
                   Print(7,'ÂA‰¡· Á¡“wb¸a“e ’Šµv­¡ ?');
                   m[1] := 'A—a ´eÈaA¯a';
                   m[2] := '¯aÏ¡Äa';
                   m[3] := '´i§¡Aµ¡';
                   m[4] := '—aœaÅ¡“¡´e';
                   m[5] := '¡´á ÐåÈá';
                   k := Select(120,5,5,FALSE,TRUE);
                   if k <> 2 then Allright := FALSE;
                   Print(7,' ¸å¸bµA¬á ”w¯¥·¡ ¡¡Ðñ·i Ð–”å ”ŸB·e ¡¡– ¡y');
                   Print(7,'ˆ¡ ·¡ž´á¹a ·¶´ö­¡ ?');
                   m[1] := '3 ˆ';
                   m[2] := '4 ˆ';
                   m[3] := '5 ˆ';
                   m[4] := '6 ˆ';
                   m[5] := '7 ˆ';
                   k := Select(120,5,5,FALSE,TRUE);
                   if k <> 3 then Allright := FALSE;
                   if Allright then begin
                      Print(15,' ”w¯¥·e " ™¡ ”aŸe »¡¯¢· ¬÷¸å "·i ¸÷ i µi¯±');
                      Print(15,'Ó¡ Ðeˆõ ˆ{Š…¶a.');
                      Print(15,' ”w¯¥·e ·¡ ¯¡Ðñ·i É·‰Á Ð–­¡.');
                      Print(7,'');
                      Print(11,' [ ‰wÐñÃ¡ + 50000 ]');
                      for i := 1 to 5 do
                      with player[i] do begin
                         if name <> '' then experience := experience + 50000;
                      end;
                      party.etc[46] := party.etc[46] or bit4;
                   end
                   else begin
                      Print(15,' ”w¯¥·e ¡¡—e ¢…¹AŸi ¡¡–  xÂ»¡ ¡µÐ–­¡.');
                   end;
                end
                else begin
                   Plus_Agility;
                end;
             end;

             if on(186,95) then begin
                if party.etc[44] and bit1 = 0 then exit;
                Clear;
                if party.etc[46] and bit5 = 0 then begin
                   Allright := TRUE;
                   Print(7,' ”w¯¥ ´|· ¬â¬w·¡ ·³·i µi´ö”a.');
                   Print(7,'');
                   Print(15,' a“e ‰¡”· ·A¸âº— ”w¯¥·¡ ‰c´á aˆe ¶…¡wµA');
                   Print(15,'‰ÅÐe ·¡ÐŸi ”q”wÐa‰¡ ·¶­¡.');
                   Print(15,' e´¢ a· 3 ˆa»¡ »©¢…·i ¡¡– É·‰ÁÐa¡e ·¡ !@');
                   Print(15,'QfhR%{`as& ^Z>;/~ ^^Q+\! ¼¬hs<e#±');
                   delay(2000);
                   write(^G);
                   Print(15,'< Error  43 : Illegal assiggnment >');
                   delay(2000);
                   write(^G);
                   Print(15,'< Error   3 : Unknown identifier >');
                   delay(2000);
                   write(^G);
                   Print(15,'< Error 122 : Invalid variable reference >');
                   delay(2000);
                   write(^G);
                   Print(15,' Program is Terminated !! ($F34DC1:$01BA8) ');
                   Print(7,'');
                   Print(7,' Ða»¡ e ¬â¬w·e ¯±Ða‰A ­¥¬w –A´á ·¶´ö‰¡ ¹A”');
                   Print(7,'¡ ¸b•·Ða»¡ ´g´v”a.');
                end;
             end;

             if on(186,108) then begin
                if party.etc[44] and bit1 = 0 then exit;
                Clear;
                if party.etc[46] and bit6 = 0 then begin
                   Allright := TRUE;
                   Print(7,' ”w¯¥ ´|· ¬â¬w·¡ ·³·i µi´ö”a.');
                   Print(7,'');
                   Print(15,' a“e ‰¡”· ·A¸âº— ®ÐbµA ”Ðe »¡¯¢·i ”q”w');
                   Print(15,'Ða‰¡ ·¶­¡.');
                   Print(15,' e´¢ a· 3 ˆa»¡ »©¢…·i ¡¡– É·‰ÁÐa¡e ·¡ ¯¡');
                   Print(15,'Ðñ·i É·‰ÁÐeˆõ·a¡ ˆeºÐa‰V­¡.');
                   PressAnyKey;
                   Print(7,' X = 7, Y = 9, Z * Z = X + Y œa¡e Z · ˆt·e');
                   Print(7,'´á˜ý‰A –A‰V­¡ ?');
                   m[0] := '';
                   m[1] := '<< 3 >>';
                   m[2] := '<< 4 >>';
                   m[3] := '<< 5 >>';
                   m[4] := '<< 6 >>';
                   m[5] := '<< 7 >>';
                   k := Select(120,5,5,FALSE,TRUE);
                   if k <> 2 then Allright := FALSE;
                   Print(7,' X + Y = 7, X - Y = 1 µA¬á X µÁ Y Ÿi ´i´a');
                   Print(7,'¬á X * Y · ”s·i  iÐ º¯¡µ¡.');
                   m[1] := '<<  0 >>';
                   m[2] := '<<  7 >>';
                   m[3] := '<< 10 >>';
                   m[4] := '<< 12 >>';
                   m[5] := '<< 14 >>';
                   k := Select(120,5,5,FALSE,TRUE);
                   if k <> 4 then Allright := FALSE;
                   Print(7,' ”w¯¥·e ´a a ¡´á ÐåÈáŸi  ev·i ˆõ·¡µ¡.  ‹a');
                   Print(7,'ˆa ·¶´ö”å ¹ÁÎa· ( X - Y ) “e ´á˜ý‰A –Aµ¡ ?');
                   m[1] := '<< 153 >>';
                   m[2] := '<< 168 >>';
                   m[3] := '<< 171 >>';
                   m[4] := '<< -57 >>';
                   m[5] := '<< -25 >>';
                   k := Select(120,5,5,FALSE,TRUE);
                   if k <> 1 then Allright := FALSE;
                   if Allright then begin
                      Print(15,' ”w¯¥·e ®Ðb ¯©b ™¡Ðe ””e ÐaŠ…¶a,');
                      Print(15,' ”w¯¥·e ·¡ ¯¡Ðñ·i É·‰Á Ð–­¡.');
                      Print(7,'');
                      Print(11,' [ ‰wÐñÃ¡ + 50000 ]');
                      for i := 1 to 5 do
                      with player[i] do begin
                         if name <> '' then experience := experience + 50000;
                      end;
                      party.etc[46] := party.etc[46] or bit6;
                   end
                   else begin
                      Print(15,' ”w¯¥·e ¡¡—e ¢…¹AŸi ¡¡–  xÂ»¡ ¡µÐ–­¡.');
                   end;
                end
                else begin
                   Plus_Accuracy;
                end;
             end;
          end;
      3 : begin
             if on(44,45) and (party.etc[35] and bit6 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e µa‹¡¬á ','·¯¢· ´¢Á¡','Ÿi ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [ ·¯¢· ´¢Á¡ + 4 ]');
                with party do begin
                   if item[4] + 4 < 256 then item[4] := item[4] + 4
                   else item[4] := 255;
                end;
                party.etc[35] := party.etc[35] or bit6;
             end;
             if on(54,53) and (party.etc[35] and bit7 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e µa‹¡¬á ','ÁAb ÒA¥¢´¢','·i ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [ ÁAb ÒA¥¢´¢ + 5 ]');
                with party do begin
                   if item[1] + 5 < 256 then item[1] := item[1] + 5
                   else item[1] := 255;
                end;
                party.etc[35] := party.etc[35] or bit7;
             end;
             if on(51,50) and (party.etc[35] and bit8 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e µa‹¡¬á ','·¡•· Š¯i','·i ¤i‰e Ðaµv”a.');
                Print(7,'');
                Print(11,' [ ·¡•· Š¯i + 2 ]');
                with party do begin
                   if item[10] + 2 < 256 then item[10] := item[10] + 2
                   else item[10] := 255;
                end;
                party.etc[35] := party.etc[35] or bit8;
             end;
             if on(69,38) or on(16,10) or on (72,7) then begin
                PutImage(98,144,Chara^[24+28],AndPut);
                PutImage(98,144,Chara^[24],OrPut);
                Clear;
                Print(7,' µa´á µ¡œˆe  e·¡Š….  a“e ·¡ ‰A·±· ¹A¸b¸a');
                Print(7,'·¥ ´eµw‹¡œa‘A. ¸á¤åµA•¡  g·¡  ev´ö»¡. Ñ¢¯¡');
                Print(7,'”w¯¥·¡ ·¡ ‰µµA¬á ”á ·¡¬w ‰A·± »¥Ð—·¡ ´e–E”a');
                Print(7,'¡e »¡‹q aµA‰A •¡¶‘·i À÷Ða‰A. ´á˜åˆa ?');
                m[0] := '';
                m[1] := '¸÷ i ‹aœý¯s“¡”a';
                m[2] := '´a“¡µ¡.  Ó±·a¡•¡ ˆa“wÐs“¡”a.';
                k := Select(140,2,2,FALSE,TRUE);
                if k <> 1 then begin
                   Clear;
                   Print(7,' ¸a‘A  a·qµA —i´ö‘A. ‹aœñ ¸iÐ¥¡‰Aa.');
                   Silent_Scroll;
                   exit;
                end;
                Delete_Scroll_Screen;
                with party do begin
                   map := 1; xaxis := 20; yaxis := 12;
                end;
                Load;
                Silent_Scroll;
                Clear;
                Print(7,' ”w¯¥·e ¡´á¬÷ ‹eÀá¡ ‰·ˆe ·¡•· –A´á¹v”a.');
             end;
             if on(51,51) and (party.etc[9] and $0F = $0F) then begin
                Clear;
                Print(7,' ”w¯¥·e ·¡ ‰µµA¬á Ði ·©·i ¡¡– {–”a.');
                Print(7,' ·©Ð—·e  a¤ó· Ó±·i ÐsÁa ”a¯¡ »¡¬w·a¡ ‰·ˆe');
                Print(7,'·¡•··i ¯¡¸b Ð–”a.');
                Print(7,'');
                Print(14,' I ‹aœa§a .. ¤a¯a Í¡Ÿa ..');
                with party do begin
                   map := 10; xaxis := 26; yaxis := 10;
                end;
                Load;
                PressAnyKey;
                Delete_Scroll_Screen;
                Silent_Scroll;
                party.etc[9] := 0;
                inc(party.etc[10]);
                Print(7,' ·©Ð·e ”a¯¡ ¡Aá¯a¡ •©´aµÖ‰¡  »¡Ða ­A‰¡');
                Print(7,'· ·³Š“e ”a¯¡ ¥·­á –A´ö”a.');
             end;
             if on(23,35) and (party.etc[9] and bit6 > 1) then begin
                Clear;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•· –A´á¹v”a.');
                x := 16; y := 95;
                Silent_Scroll;
             end;
             if on(8,74) and (party.etc[9] and bit6 > 1) then begin
                Clear;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•· –A´á¹v”a.');
                x := 71; y := 8;
                Silent_Scroll;
             end;
             if on(73,10) and (party.etc[42] and bit1 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·e ¢´åˆa  Ó£¡Ðe ¦‰§¹·¡ ˜á”a“¡“e ˆõ·i');
                Print(7,'¥¡´v‰¡ ‹aˆõ·¡ •¡Œ§¡ ¦‰·¡œa“e ˆõ·i ´i´aÀaŸ¡');
                Print(7,'‰¡ ¬å¹A ‰·‰b·i ¯¡¸bÐ–”a.');
                PressAnyKey;
                enemynumber := 8;
                for i := 1 to enemynumber do joinenemy(i,33);
                with enemy[enemynumber] do begin
                   endurance := 30;
                   hp := endurance * level * 10;
                   castlevel := 6;
                end;
                DisplayEnemies(TRUE);
                BattleMode(TRUE,TRUE);
                if party.etc[6] = 0 then party.etc[42] := party.etc[42] or bit1;
             end;
             if on(76,13) and (party.etc[42] and bit2 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·¡ ‹©·i »¡aa Ða¸a ˆs¸a‹¡ ¤a¶á ·¥ˆe—i');
                Print(7,'·¡ ‹©·i ˆa¡  b´v”a.');
                enemynumber := 5;
                for i := 1 to enemynumber do joinenemy(i,24);
                Displayenemies(TRUE);
                Print(7,'');
                Print(13,' ¸qŒe !! ·¡ ‹©·i ‹a· »¡aˆaa Ða“a¡. ¡¢®‘');
                Print(13,'·¡ ´aŒs”a¡e ·¶“e •¥ ¡¡–Ÿi ´á ‘½´aœa ‹aœá');
                Print(13,'¡e ¡¢®‘ e·e ¬ia º‰V”a.');
                m[0] := '';
                m[1] := '‹a—i‰Á ¸åÊŸi ¤é·¥”a';
                m[2] := '‹a—iµA‰A ¡¡—e •¥·i º…”a';
                k := Select(170,2,2,FALSE,TRUE);
                if k = 2 then begin
                   party.gold := 0;
                   Silent_Scroll;
                   exit;
                end;
                BattleMode(TRUE,TRUE);
                if party.etc[6] = 254 then exit;
                Clear;
                enemynumber := 6;
                for i := 1 to enemynumber do joinenemy(i,47);
                DisplayEnemies(TRUE);
                Print(13,' ’ˆa ¶Ÿ¡ ´—i·i ˆå—aŸ¡“a¡ !  ·¡ ¬a·¡Çi³');
                Print(13,'¯a“±· ‰¥¥·  u·i ¥¡´aœa !!');
                PressAnyKey;
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                Clear;
                enemynumber := 6;
                for i := 1 to 3 do joinenemy(i,47);
                for i := 4 to 5 do joinenemy(i,59);
                joinenemy(enemynumber,63);
                DisplayEnemies(TRUE);
                Print(13,' a“e ·¡‰µ· ”¸w·¥ º‚·q· ‹¡¬a“±·¡¯¡”a. ”á');
                Print(13,'·¡¬w· Ó¬—·¡ a‹¡¸åµA  a· ­¥µA¬á {·i  ˜');
                Print(13,'´á´¡ ‰VŠ…. ¸a ‹aœñ ¤h´aœu !!!!');
                PressAnyKey;
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   dec(y);
                   Silent_Scroll;
                   exit;
                end;
                party.etc[42] := party.etc[42] or bit2;
                Clear;
                Print(7,' ·©Ð—·e º‚·q· ‹¡¬aŸi ¢‰Ÿ¡Áv”a. Ða»¡ e º‚·q');
                Print(7,'· ‹¡¬a“e µÅ¸åÓ¡ º‚»¡ ´g‰¡ ¶Ÿ¡µA‰A  i·i ˆé');
                Print(7,'´ö”a.');
                Print(7,'');
                Print(13,' ·a·b~~~ a“e µa»¡Œõ µa‹¡¬á ¬e¸â ¬—ÑÉ·i Ð');
                Print(13,'µÖ»¡ e ”w¯¥—i Àáœñ ˆwÐe ¬w”“e ¥¡»¡ ¡µÐ–­¡');
                Print(13,'. Ñ¢¯¡ ˆa ”w¯¥—i ·©Ð—· aËa  áŸ¡µA ˜aœa');
                Print(13,'”a“¡¡a Ðe ® ¤¶¡•¡ –A‰V­¡ ?');
                m[0] := '';
                m[1] := '¹½­¡, ”w¯¥·¡ ¶¥Ðe”a¡e';
                m[2] := '´a“¡–Aµ¡, ¬e¸â·i ·©Ð—·a¡ –‰ ®“e ´ô­¡';
                k := Select(190,2,2,FALSE,TRUE);
                if k = 1 then begin
                   join(63,6);
                   player[6].hp := 1;
                   Display_Condition;
                end;
             end;
             if on(87,9) and (party.etc[42] and bit3 = 0) then begin
                Clear;
                enemynumber := 3;
                for i := 1 to enemynumber do joinenemy(i,58);
                DisplayEnemies(TRUE);
                Print(13,' a“e ¡©¢“±· Ëb¡w·i ¤h‰¡  áÓ—i·i ¹AˆáÐa');
                Print(13,'‹¡ ¶áÐ aµ¥ º‚·q· ¯¥,  »b ¬a¯¥·¡”a.  a·');
                Print(13,'Ã¥Š—i·i ¦Ÿa•¡¢ Ða»¡. ‹aœñ.');
                PressAnyKey;
                enemynumber := 5;
                for i := 4 to enemynumber do joinenemy(i,60);
                DisplayEnemies(TRUE);
                Print(13,' ¶Ÿ¡—i·e ¡©¢“±·i ¶áÐ¬á e °a¶…”a.  ”w¯¥—i');
                Print(13,'‰Á“e ¬a¸â·¥ ˆq¸÷·e ´ô»¡ e  ·¡ ˆõ•¡ ¡©¢“±·');
                Print(13,'¡ww·¡“¡ ¶Ÿ¡•¡ ´á¼é ® ´ô”a. ‹aœñ »¡µ¢µA¬á');
                Print(13,'a ¶Ÿ¡ ¥¡•¡¢ Ða»¡.');
                PressAnyKey;
                BattleMode(TRUE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 0 then
                   party.etc[42] := party.etc[42] or bit3
                else
                   dec(y);
                Silent_Scroll;
             end;
             if on(94,9) and (party.etc[42] and bit4 = 0) then begin
                Clear;
                enemynumber := 1;
                joinenemy(enemynumber,70);
                DisplayEnemies(TRUE);
                Print(13,' ‘©œa¶… •©Ìab·¡Š…, '+player[1].name+'.');
                Print(13,' a“e ‰ÁˆáµA  ‘Aˆa  ‘AÇa¡ e¬áŸi ¢‰Ÿ¡Áv·i˜');
                Print(13,'¦Èá ¾‚ ¥ÁµÖ´ö‘A. ¬a¯© ¸÷ i ¹¥‰wÐ–´ö“e•A »¡');
                Print(13,'‹q·e ¬á¡ ¸â·¡ –A´öŠ…. ´aÀq! a· ­¡ˆŸi ´e');
                cPrint(13,11,'Ð–Š…. a“e ','q¯³¸a¬÷· ¸å¬a','œa‰¡ Ða‘A. ¶¥œ“e');
                Print(13,'¡´á Ëb‰·”· ¦”¸w·¡´ö“e•A »¡‹q·e a· ´¡');
                Print(13,' w·i ¶áÐ ¡©¢· ¦Ða¡ ·¶»¡. »¡‹q·e ¡©¢·');
                Print(13,'¯±¥¢·¡ –A´á ‹a¡ ¦Èá ÑÅ¬w  a¤ó·i ¤¶‰¡ ·¶');
                Print(13,'”a‘A.  ¤aŸe”¡  iÐa¡e ¡©¢·i ·¡¶wÐaµa aŸi');
                Print(13,'”á ˆwÐa‰A  e—i‰¡ ·¶‘A.  ¡y”i ¸åµA ¡´á Ëb‰·');
                Print(13,'”· ”¸w·¡´ö”å ¡´á ÐåÈáˆa  ·¡ ‰µ·a¡ µÖ”á');
                Print(13,'Š…. a“e ‹aµA‰A —iÇ¡»¡ ´g·aa‰¡ Ï¡Ð ”a‘a´¡');
                Print(13,'Ð–‘A. Ða»¡ e a“e “a© ® ·¶´ö»¡. ·¡¹A ‹a“e');
                Print(13,'a· ¬w”ˆa ´e –E”a“e ˆõ·i  ‹¡Ÿi É·Ð ´i ®');
                Print(13,'ˆa ·¶´ö”a‘A.  ‹a“e ”¸w·¡œa“e ·¡·A e·a¡ a');
                Print(13,'· ´¡ w·i »µ’Ÿaa‰¡ Ð–‘A. ‹a“e Â—¯©Ðe ¡—a');
                Print(13,'´e· ¯±¥¢·¡´ö»¡ e a“e ‹aœå ¬aœq·¡ ´a“¡´ö‘A');
                Print(13,'. a“e ¡—a ´e·¡ »¡¯¡Ða“e ‘AÇa¡ e¬á Èa•¡Ÿi');
                Print(13,'¥i¡  ”iˆs»¡ ´g‰A ¤h´a —iµv‘A.  ‹aœ¬á ‰iŠ‚');
                Print(13,'¡´á Ëb‰·” µA¬á ¤e‹¡Ÿi —i‰A –A´ö‰¡  a“e');
                Print(13,'aŸi ˜aŸa“e ­¡®· ¬aœq—i·i ·¡i‰¡ ¯¥­A‰Ÿi');
                Print(13,'Àx´a a· ´¡ w·i ÍiÃ¡a Ð–»¡. ‹aŸ¡‰¡  a»¡ b');
                Print(13,'·a¡ ˆa ”a”aŸe ‰µ·e ¤a¡ µa‹¡ »¡Ða ­A‰œa');
                Print(13,'‘A. ”w¯¥· ·©Ð—µA“e ”aÐ—Ó¡•¡ ¡´á ÐåÈáˆa ´ô');
                Print(13,'Š…. »b, ˆa ¢ ”w¯¥—i‰Á °a¶¡´¡ Ðe”a“e ·¡·A');
                Print(13,'ˆa ´ô“e ­Q·¡–A»¡. ˆa ¬á¡· ‹¡Ÿi Ãb¸÷Ð¥¡');
                Print(13,'“¡ ”w¯¥—i·¡ ´¢ˆe ¶­AÐaŠ…. Ða»¡ e a•¡ µb¯¡');
                Print(13,'a· ·©Ð——i·¡ ”á ·¶·a“¡  b¬w  bÐa‰VŠ…. µa‹¡');
                Print(13,'¬á ¶Ÿ¡ Ñs¬w Ðaa Ða•¡¢Ða»¡. ¶Ÿ¡—i ¬á¡“e');
                Print(13,'»¡¬w ­A‰· ¬aœq·¡‘A.  a•¡ ·¡œý‰A •·¹¢¡Ÿ¡');
                Print(13,'°a¶“e ˆõ·e ¶¥Ã¡ ´g‘A. ¬a¯© a“e ”á ·¡¬w ¡©');
                Print(13,'¢µA‰A ¤¶‰ ˆõ·¡ ´ô”a‘A. ¡©¢‰Á ¸÷¡e·a¡ ”');
                Print(13,'‰iÐa¡e a· ¯wŸ¡ˆa ÑÂ¯©Ði ¸÷•¡œa‘A. a“e ¡©');
                Print(13,'¢· ¡ww·a¡ µa‹¡ ·¶»¡ e ”á ·¡¬w ‹aµA‰A ¡w');
                Print(13,'w·i ¤h·i ·¡·Aˆa ´ô”a‘A.');
                Print(7,'');
                PressAnyKey;
                Print(13,' ¶Ÿ¡—i·e ¬á¡· ‹©¡ ˆa“e ˆõ·¡ ´á˜éŒa ?');
                Print(13,' ‹aœá¡e ¬á¡ˆa ÍeÐ »¡»¡. a·  iµA ¢¯e ‰');
                Print(13,'œ¢·¡ ·¶”a”åˆa Ða“e ˆõ·e ´a“¡œa‘A. ´á˜åˆa ?');
                m[0] := '';
                m[1] := '‹aœá¡e ‹aœý‰A Ða»¡';
                m[2] := '”wÃ¡ ´g“e ­¡Ÿ¡, ¦…¡w ·¡ˆå ‰œ¢·¡”a';
                k := Select(120,2,2,FALSE,TRUE);
                if k = 2 then begin
                   enemynumber := 8;
                   for i := 2 to 8 do joinenemy(i,59);
                   BattleMode(TRUE,TRUE);
                   if party.etc[6] = 254 then exit;
                end;
                party.etc[42] := party.etc[42] or bit4;
                Silent_Scroll;
             end;
             if on(14,24) and (party.etc[9] and $70 = $70) then begin
                Clear;
                Print(7,' ”w¯¥·e ·¡ ‰µµA¬á Ði ·©·i ¡¡– {–”a.');
                Print(7,' ·©Ð—·e  a¤ó· Ó±·i ÐsÁa ”a¯¡ »¡¬w·a¡ ‰·ˆe');
                Print(7,'·¡•··i ¯¡¸b Ð–”a.');
                Print(7,'');
                Print(14,' I ‹aœa§a .. ¤a¯a Í¡Ÿa ..');
                with party do begin
                   map := 10; xaxis := 13; yaxis := 10;
                end;
                Load;
                PressAnyKey;
                Delete_Scroll_Screen;
                Silent_Scroll;
                party.etc[9] := 0;
                inc(party.etc[10]);
                Print(7,' ·©Ð·e ”a¯¡ ¡Aá¯a¡ •©´aµÖ‰¡  »¡Ða ­A‰¡');
                Print(7,'· ·³Š“e ”a¯¡ ¥·­á –A´ö”a.');
             end;
          end;
      4 : begin
             if on(13,94) or on(13,29) then begin
                PutImage(98,144,Chara^[24+28],AndPut);
                PutImage(98,144,Chara^[24],OrPut);
                Clear;
                Print(7,' ”a¯¡ ™¡  evŠ…, '+player[1].name+'.');
                Print(7,' ”w¯¥•¡ ´i”a¯¡Ï¡ a“e ·¡ ‰A·±· ¹A¸b¸a·¥ ´e');
                Print(7,'µw‹¡œa‘A. Ñ¢¯¡ e·¡•¡ ¹¡¸é·¡ ¸i¡µ –A´á¬á A');
                Print(7,'¥I·i ”á Ç¡¶‰¡ ¯¼”a¡e aµA‰A ¦ÈbÐa‰A. ”a¯¡');
                Print(7,'¡´á¬÷·a¡ ·¡•· ¯¡Åa º‰V‘A.');
                m[0] := '';
                m[1] := '¸÷ i ‹aœý¯s“¡”a';
                m[2] := '´a“¡µ¡.  Ó±·a¡•¡ ˆa“wÐs“¡”a.';
                k := Select(156,2,2,FALSE,TRUE);
                if k <> 1 then begin
                   Clear;
                   Print(7,' ¸a‘A  a·qµA —i´ö‘A. ‹aœñ ¸iÐ¥¡‰Aa.');
                   Silent_Scroll;
                   exit;
                end;
                Delete_Scroll_Screen;
                with party do begin
                   map := 1; xaxis := 20; yaxis := 12;
                end;
                Load;
                Silent_Scroll;
                Clear;
                Print(7,' ”w¯¥·e ¡´á¬÷ ‹eÀá¡ ‰·ˆe ·¡•· –A´á¹v”a.');
             end;
             if on(31,90) then begin
                Clear;
                x := 45; y := 92;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•· –A´á¹v”a.');
                Silent_Scroll;
             end;
             if on(30,72) then begin
                Clear;
                x := 44; y := 67;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•· –A´á¹v”a.');
                Silent_Scroll;
             end;
             if on(30,74) then begin
                Clear;
                x := 10; y := 62;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•· –A´á¹v”a.');
                Silent_Scroll;
             end;
             if on(31,44) then begin
                Clear;
                x := 15; y := 44;
                Print(7,' ·©Ð—·e ‰·ˆe ·¡•· –A´á¹v”a.');
                Silent_Scroll;
             end;
             if on(41,56) and (Real_Map(41,55) <> 41) then begin
                Clear;
                Print(7,' ·©Ð—·¡ ´|µA ·¶“e A¤áŸi ¸s´a ”w‰v”a.');
                Print(7,' ®…ˆe ŠW·q·¡ ”ŸB ¸åÁAŸi »¥•·Ða‹¡ ¯¡¸b Ð–‰¡');
                Print(7,'”w¯¥ ´|· ¸w´¢‰·¡ »¡Ða¡ ˆaœa ´f´a ¤áv”a.');
                for j := 1 to ymax do
                for i := 1 to xmax do begin
                   if Real_Map(i,j) = 50 then PutMap(i,j,49);
                end;
                PutMap(41,55,41);
                Silent_Scroll;
             end;
             if on(20,72) then begin
                Clear;
                Print(7,' ”w¯¥·e ¯©®¡ ¶w· Š‰·i ¥¡»¡ ¡µÐa‰¡ »¡aÁv');
                Print(7,'”a.  ‹a Š‰µA“e  ¬÷»©·¡ ¬aa¶… ¶w—i·¡ ·¶´ö‰¡');
                Print(7,'‰¨ ¯¡§¡ˆa ¦›´á °a¶‘·¡ ¯¡¸b –A´ö”a.');
                PressAnyKey;
                enemynumber := 8;
                for i := 1 to enemynumber do joinenemy(i,54);
                DisplayEnemies(TRUE);
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   dec(x);
                   Silent_Scroll;
                   exit;
                end;
                Clear;
                Print(7,' ¶w· •·Š‰µA“e  •·½¢·a¡ ·¡´á»¡“e É·¡ˆa ·¶');
                Print(7,'´ö”a.');
                for i := 21 to 29 do PutMap(i,72,41);
                Silent_Scroll;
             end;
             if on(20,74) then begin
                Clear;
                Print(7,' ·©Ð—·¡  b”aŸe ‰µ·a¡ ¸ó´á—i¸a  Ða“iµA¬á ¦');
                Print(7,'Èá §¡žw—i·¡ ‰·‰bÐ µ¡‹¡ ¯¡¸b Ð–”a.');
                PressAnyKey;
                enemynumber := 5;
                for i := 1 to enemynumber do joinenemy(i,43);
                DisplayEnemies(TRUE);
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   dec(x);
                   Silent_Scroll;
                   exit;
                end;
                Clear;
                Print(7,' §¡žw—i·i ¢‰Ÿ¡ Ã¡¸a ¹¡‹q¸åµA“e ¥¡»¡ ¡µ Ð–”å');
                Print(7,'É·¡ˆa ·¶´ö”a.');
                for i := 21 to 29 do PutMap(i,74,41);
                Silent_Scroll;
             end;
             if on(36,46) and (party.etc[42] and bit5 = 0) then begin
                Clear;
                enemynumber := 7;
                for i := 1 to enemynumber - 1 do joinenemy(i,66);
                joinenemy(enemynumber,71);
                Displayenemies(TRUE);
                Print(13,' ¯A·µ~~  ¯A·µ~~  ¸åµA•¡ ¶Ÿ¡  ee¸â·¡ ·¶»¡,');
                Print(13,player[1].name+'.');
                Print(13,' ‹a˜“e ‘AÇa¡ e¬á“±·i ¶áÐ °a¶¶´ö“e•A ·¡¹A');
                Print(13,'“e ¡AÏ¡¯aÉ¡ÍIA¯a“±·i ˜aŸe”a“e ˆõ·¡ ¹¡‹q ”i');
                Print(13,'œa»¥ ¸ñ·¡»¡. á“e ¶Ÿ¡ˆa µÅ¸åÓ¡ º‚´ö”a‰¡ ¬—');
                Print(13,'ˆbÐ–‰V»¡ e  ¥¡¯¡”a¯¡Ï¡ ¶Ÿ¡—i·e ‹¡‰ ¬—¡wÁA');
                Print(13,'œa¬á ”a¯¡ ¹¡Ÿ³·i Ða¡e ¬iŸ© ®ˆa ·¶»¡.  ™¡Ðe');
                Print(13,'¯a¯a¡Ÿi ”á¶‚ ˆwÐa‰A ˆ¹¡ Ði®•¡ ·¶»¡. ‹aœá');
                Print(13,'¡e ¬¡µÁ»¥ a· Ó±·i ˆq¬wÐa¯¡»¡.');
                PressAnyKey;
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   inc(y);
                   Silent_Scroll;
                   exit;
                end;
                PutMap(36,44,41);
                party.etc[42] := party.etc[42] or bit5;
                Silent_Scroll;
             end;
             if on(36,46) and (Real_Map(36,44) <> 41) then PutMap(36,44,41);
          end;
      6 : begin
             Clear;
             if (x = 19) and (party.etc[30] and bit1 = 0) then begin
                j := 49 - y + 6;
                for i := 9 downto 6 do begin
                   if i < 9 then PutImage((i+1)*24,j*24,font^[44],CopyPut);
                   PutImage(i*24,j*24,font^[53],CopyPut);
                   Delay(500);
                end;
                while j <> 6 do begin
                   PutImage(i*24,j*24,font^[44],CopyPut);
                   j := j + sgn(6-j);
                   PutImage(i*24,j*24,font^[53],CopyPut);
                   Delay(500);
                end;
                Print(7,' ·©´ávŠ…, '+player[1].name+'.');
                Print(7,' ¸a‘A ¨iŸ¡ ¡—a ´e “±A ˆa¥¡•¡¢ Ða‰A. ‹sÓ¡');
                Print(7,'Àx·a¯¡“e ˆõ ¥¡“¡ ´a¢œ•¡ ¢¯e Çe ·©·¡ ¤é´á');
                Print(7,'»¥ˆõ ˆ{‘A. ‘AÇa¡ e¬á ·¡Ò ¡y‘eˆe ­A¬w·¡ ¹¡');
                Print(7,'¶wÐa”á“¡ e...');
                Print(7,' ‹aˆå ‹aœý‰¡ ¨iŸ¡ ¬á–Ÿa‰A.');
                c := readkey;
                if c = #0 then c := readkey;
                for i := 7 to 8 do begin
                   PutImage((i-1)*24,j*24,font^[44],CopyPut);
                   PutImage(i*24,j*24,font^[53],CopyPut);
                   Delay(500);
                end;
                while j <> 49 - y + 6 do begin
                   PutImage(i*24,j*24,font^[44],CopyPut);
                   j := j + sgn((49-y+6)-j);
                   PutImage(i*24,j*24,font^[53],CopyPut);
                   Delay(500);
                end;
                for i := 9 to 10 do begin
                   PutImage((i-1)*24,j*24,font^[44],CopyPut);
                   if i < 10 then PutImage(i*24,j*24,font^[53],CopyPut);
                   Delay(500);
                end;
                for i := 48 to 51 do Putmap(19,i,44);
                party.etc[30] := party.etc[30] or bit1;
             end;
             if on(41,79) then begin
                if party.etc[30] and bit4 = 0 then begin
                   party.etc[30] := party.etc[30] or bit4;
                   for i := 1 to 3 do begin
                      delay(500);
                      dec(x);
                      Scroll(TRUE);
                   end;
                   Putmap(41,79,44);
                   Clear;
                   Print(7,' ·©Ð—·e ˆa¸w ‹¡¥¥¸â·¥ ¢‹¡¡  ¡¡–  ¢¸w·i');
                   Print(7,'Ðaµv”a.');
                   for i := 1 to 6 do
                   with player[i] do begin
                      if (name <> '') and (weapon = 0) and (classtype = sword)
                         and (class <> 5) then begin
                         weapon := 1;
                         wea_power := 5;
                      end;
                   end;
                end;
             end;
             if on(51,12) or on(52,12) then begin
                if (party.etc[50] and bit5 > 0) or (party.etc[50] and bit6 > 0) then begin
                   Clear;
                   if party.etc[30] and bit5 > 0 then begin
                      Print(7,' ”a¯¡ •©´aµ¡”a“¡, '+player[1].name);
                      Print(7,' ·¡¤åµA“e ‹¡´á·¡ ‘A‘±—i·i ÐÃ¡¶‰¡´¡  i‰V”a');
                      Print(7,'. a· Ã¥Š—i•¡ ·¡¤åµA ˆá—iˆõ·¡”a.');
                      PressAnyKey;
                      enemynumber := 7;
                   end
                   else begin
                      Print(7,' ´a“¡! ”w¯¥·¡ ¶Ÿ¡—i·i ¤¯¥Ða‰¡ ºA®Ÿi Î‰´á');
                      Print(7,'º”a“¡... ‹aœý”a¡e ¶Ÿ¡—i·e ‰iÊ¡¬á ”w¯¥—i');
                      Print(7,'‰Á ¯w¦Ði® ¤cµA ´ôŠ…¶a.');
                      PressAnyKey;
                      party.etc[30] := party.etc[30] or bit5;
                      enemynumber := 2;
                   end;
                   for i := 1 to enemynumber do begin
                      joinenemy(i,26);
                      with enemy[i] do begin
                         name := '¥w¬a '+chr(48+i);
                         special := 0;
                         castlevel := 0;
                         E_number := 1;
                      end;
                   end;
                   Displayenemies(TRUE);
                   if player[6].name = '£¡Ã¥ ¹¡' then begin
                      Clear;
                      Print(7,' ¶Ÿ¡—i –áµA ·¶”å  £¡Ã¥ ¹¡ˆa ¸åÊˆa ·©´áa');
                      Print(7,'¸a a¸a •¡ w·i ˆa¤áv”a.');
                      player[6].name := '';
                      Display_Condition;
                      Pressanykey;
                   end;
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 255 then exit;
                   if party.etc[6] = 0 then begin
                      Clear;
                      Print(15,'”w¯¥—i·e ®ˆq­¡ ¥w¬a—i·i ¢‰Ÿ¡Áv”a.');
                      party.etc[30] := party.etc[30] or bit5;
                      Putmap(51,12,44); Putmap(52,12,44);
                      Putmap(50,11,44); Putmap(53,11,44);
                      Silent_Scroll;
                   end;
                end;
             end;
             if on(86,48) then begin
                Clear;
                Print(7,' ”w¯¥·e µi®AŸi ¤i‰e Ð–”a.');
                PutMap(87,48,44);
                Silent_Scroll;
             end;
             if on(90,40) and (party.etc[31] and bit1 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 2000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 2000;
                party.etc[31] := party.etc[31] or bit1
             end;
             if on(90,41) and (party.etc[31] and bit2 = 0) then begin
                Print(7,' ”w¯¥·e 100 ˆ· ¯¢œ··i ¤i‰eÐ–”a.');
                if party.food + 100 < 256 then party.food := party.food + 100
                else party.food := 255;
                party.etc[31] := party.etc[31] or bit2
             end;
             if on(90,42) and (party.etc[31] and bit3 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 1000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 1000;
                party.etc[31] := party.etc[31] or bit3
             end;
             if on(90,43) and (party.etc[31] and bit4 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 2500 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 2500;
                party.etc[31] := party.etc[31] or bit4
             end;
             if on(90,44) and (party.etc[31] and bit5 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 5000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 5000;
                party.etc[31] := party.etc[31] or bit5
             end;
             if on(82,52) and (party.etc[32] and bit1 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 5000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 5000;
                party.etc[32] := party.etc[32] or bit1
             end;
             if on(84,52) and (party.etc[32] and bit2 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 5000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 5000;
                party.etc[32] := party.etc[32] or bit2
             end;
             if on(89,52) and (party.etc[32] and bit3 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 5000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 5000;
                party.etc[32] := party.etc[32] or bit3
             end;
             if on(91,52) and (party.etc[32] and bit4 = 0) then begin
                Print(7,' ”w¯¥·e ‹qÑÁ 5000 ˆŸi ¤i‰eÐ–”a.');
                party.gold := party.gold + 5000;
                party.etc[32] := party.etc[32] or bit4
             end;
             if y = 95 then
             with party do begin
                if WantExit then begin
                   map := 1; xaxis := 20; yaxis := 12;
                   Load;
                end
                else dec(y);
                Silent_Scroll;
             end;
          end;
      7 : begin
             Clear;
             if x = 50 then begin
                Print(7,' µa‹¡“e  –¤å¼· ”ŸB·a¡ ·¡•·Ða“e  ‰A·¡Ëa');
                Print(7,'·³“¡”a. Ða»¡ e ”w¯¥·e ‹a ‰µµA¬á Ðaµa´¡Ði ·±');
                Print(7,'¢ˆa ´ô¯s“¡”a. ”a¯¡ •©´aˆa º¯³¯¡µ¡.');
             end;
             if (x = 30) or (x = 32) then begin
                Putmap(31,y,45);
                PutImage(120+(31-x)*24,144,Font^[45],CopyPut);
             end;
             if y = 70 then begin
                if wantexit then begin
                   with party do begin
                      map := 1; xaxis := 77; yaxis := 57;
                   end;
                   load;
                end
                else begin
                   dec(y); scroll(TRUE);
                end;
             end;
          end;
      8 : begin
             if on(41,27) and (party.etc[40] and bit2 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e ÑÁ¦… ­¢µA¬á ',' a¤ó ÒA¥¢´¢','·i ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [  a¤ó ÒA¥¢´¢ + 2 ]');
                with party do begin
                   if item[2] + 2 < 256 then item[2] := item[2] + 2
                   else item[2] := 255;
                end;
                party.etc[40] := party.etc[40] or bit2;
             end;
             if on(11,33) and (party.etc[40] and bit3 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e ¬w¸a ­¢µA¬á ','ÑÁ¬i','·i ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [ ÑÁ¬i + 100 ]');
                with party do begin
                   if arrow + 100 < 32768 then arrow := arrow + 100
                   else arrow := 32767;
                end;
                party.etc[40] := party.etc[40] or bit3;
             end;
             if on(11,40) and (party.etc[40] and bit4 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e ¬w¸a ­¢µA¬á ','®¸÷ Š¯i','·i ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [ ®¸÷ Š¯i + 5 ]');
                with party do begin
                   if item[8] + 5 < 256 then item[8] := item[8] + 5
                   else item[8] := 255;
                end;
                party.etc[40] := party.etc[40] or bit4;
             end;
             if on(11,43) and (party.etc[40] and bit5 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e ¬w¸a ­¢µA¬á ','­¡ÑÅ ¢…¬á','Ÿi ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [ ­¡ÑÅ ¢…¬á + 2 ]');
                with party do begin
                   if item[6] + 2 < 256 then item[6] := item[6] + 2
                   else item[6] := 255;
                end;
                party.etc[40] := party.etc[40] or bit5;
             end;
             if (x < 6) or (y < 7) or (x > 44) or (y > 93) then begin
                if wantexit then begin
                   with party do begin
                      map := 3; xaxis := 66+x1; yaxis := 78+y1;
                   end;
                   Load;
                end
                else begin
                   x := x - x1;
                   y := y - y1;
                end;
                Silent_Scroll;
             end;
          end;
      9 : begin
             Clear;
             if on(18,30) and (party.etc[32] and bit5 = 0) then
             with party do begin
                if (etc[33] = 0) and (etc[34] = 0) then begin
                   etc[34] := (day+10) div 256;
                   etc[33] := (day+10) - etc[34] * 256;
                end;
                i := etc[34]*256+etc[33];
                Print(7,' ”w¯¥·e ¬w¸aŸi –á»¡”å º—  ‹a ¶áµA ‘½µa ·¶“e');
                Print(7,'½¢»¡Ÿi ¤i‰e Ð–”a.  ‹a ˆõ·e AŠ‰ž¯aˆa ³e ˆõ');
                Print(7,'·±·i ´i ®ˆa ·¶´ö”a.');
                Print(7,'');
                Print(15,' ¸á“e »¡‹q ´¢Á¡Ÿi Àx·aœá ”aŸe ”ŸBµA ˆa·¶¯s');
                str((i div 30)+1 : 2,s);
                Print(15,'“¡”a.  ¹Aˆa •©´aµ¡‹¡¡ –A´á ·¶“e i·e '+s+' ¶©');
                str((i mod 30)+1 : 2,s);
                Print(15,s+' ·©·¡£a¡ ‹a˜ Àx´a µ¡¯³¯¡µ¡.');
             end;
             if (x < 6) or (y < 7) or (x > 44) or (y > 43) then begin
                if wantexit then begin
                   with party do begin
                      map := 1; xaxis := 82; yaxis := 10;
                   end;
                   Load;
                end
                else begin
                   x := x - x1;
                   y := y - y1;
                end;
                Silent_Scroll;
             end;
          end;
   end;
end;

Procedure SpecialEvent_Sub2;
begin
   scroll(TRUE);
   case party.map of
      10: begin
             if on(25,43) or on(26,43) then begin
                if party.etc[10] = 1 then party.etc[10] := 2;
                if party.etc[10] = 3 then begin
                   Clear;
                   Print(7,' ”w¯¥·¡ ¡Aá¯aµA —i´áµ¡¸a  a¸a  ´á˜å ¬aœq·');
                   Print(7,'¯¡ÁAˆa ‘½µa¹a ·¶´ö”a. ‹a ¯¡ÁA“e ÑwÁAŸi ´i´a');
                   Print(7,'¥© ® ´ô·i ¸÷•¡¡ Ï¡ Ê¬÷·¡ˆa –A´á·¶´ö‰¡ ‹a');
                   Print(7,'· —wµA“e  Äá”aœe •¢ ÑÁ¬i·¡ µŸ¡Ða‰A ‰ÅÉ·Ð');
                   Print(7,'·¶´ö”a.');
                   Print(7,' •·Š‰ ·³ŠµA¬á“e ˜ aÃ±  Á¡¯w”i·¡ §¡Ã¡‰¡ ·¶');
                   Print(7,'´ö‰¡ ‹a ”i§¹·e ‹a ¯¡ÁAµA¬á Óiœá¬á aµÁ ‰¡·¥');
                   Print(7,'Ï¡µA §¡Áa¬á ¦Š‰A ¢‰—iµa ¹v”a.');
                   Print(7,' ®…ˆe ”w¯¥·e ´i§¡Aµ¡· µ´å· Š¸é·¡ ˜á µ©');
                   Print(7,'œv”a. ‹aˆõ·e ¤a¡ ·¡œå ˆõ·¡´ö”a.');
                   Print(11,' " ¡Aá¯a· ”i·¡ ¦Š‰A ¢‰—i˜  ´á–‘· µwÑ¥·¡');
                   Print(11,' aÈaa ­A‰· ¹· i·i µ‰¡Ðe”a. "');
                   PressAnyKey;
                   face := 5;
                   for i := 1 to 2 do begin
                      dec(y);
                      Scroll(TRUE);
                      delay(2000);
                   end;
                   Print(7,' ”w¯¥·¡ ¹¡‹q ”á ´e½¢·a¡ —i´á ˆv·i˜ ’Š…ˆa');
                   Print(7,'ˆa ”w¯¥·i »¡Åa ¥¡‰¡ ·¶”a“e “a±·¡ —i´ö”a.');
                   delay(5000);
                   ok := FALSE;
                   repeat
                      enemynumber := 8;
                      for i := 1 to 7 do joinenemy(i,19);
                      joinenemy(8,27);
                      with enemy[8] do begin
                         strength := 100;
                         castlevel := 0;
                         special := 0;
                      end;
                      DisplayEnemies(TRUE);
                      Clear;
                      if party.etc[10] = 3 then begin
                         Print(7,' —a—¡´á  evŠ…, '+player[1].name+'.');
                         Print(7,' a“e ‘AÇa¡ e¬á“±·¡ áµA‰A ”wÐe Ò ‹a ¥¢®');
                         Print(7,'Ÿi Ða‹¡ ¶áÐ  ¡y‘e·i ‹¡”av”a.  ‹aŸ¡‰¡ a·');
                         Print(7,'¥w¬a—i•¡ ˆa»¡‰A –A´ö»¡. a“e áŸi ·¡ ‰µ·a¡');
                         Print(7,'i´á —i·¡‹¡ ¶áÐ ‰­¢ ·¡ ‰µµA¬á ¬i·¥·i ¸á»©');
                         Print(7,'œö»¡. ‰iŠ‚ ˆéa —i´öŠ…. ´a~Ða~Ða~Ða~~~');
                         PressAnyKey;
                         inc(party.etc[10]);
                      end else begin
                         Print(7,' ‹aœáa a“e ‹aœý‰A ®ó‰A º‚»¡“e ´g“e”a.  ”a');
                         Print(7,'¯¡ a· ‰·‰b·i ¤h´aœa !');
                         PressanyKey;
                      end;
                      repeat
                         BattleMode(FALSE,FALSE);
                         if party.etc[6] = 254 then exit;
                         if party.etc[6] = 2 then begin
                            Clear;
                            Print(7,' Ða»¡ e á¢  g·e ¸â—iµA‰A Í¡¶á–A´á •¡ w ˆi');
                            Print(7,'®ˆa ´ô´ö”a.');
                            PressAnyKey;
                            DisplayEnemies(TRUE);
                            Allright := FALSE;
                         end else Allright := TRUE;
                      until Allright;
                      if EndBattle(i) then
                      if i = 1 then begin
                         Clear;
                         Print(13,' ”w¯¥·e ´b a ¬a·Ž…µA‰A ‹¡¯s·i ¤h´a¬á  ˆá·');
                         Print(13,'”a º‚‰A –A´ö·i˜  ˆs¸a‹¡ y·¢·e ¡¢­¡Ÿ¡ˆa  å');
                         Print(13,'‰µµA¬á —ia µÖ”a.');
                         Print(13,' '+player[1].name+'. a“e A—a ´eÈaA¯a·©­A.');
                         Print(13,' ”w¯¥•¡ ¯©b·¡  g·¡ º‰´öŠ…. ·¡œå ¹¡¢œ‹¡—i');
                         Print(13,'µA‰A ”wÐa”a“¡.  ‹aœñ ´¢ˆe· •¡¶‘·i º•¡¢Ða');
                         Print(13,'»¡. ¸i ¥¡‰Aa.');
                         PressAnyKey;
                         Pause(FALSE);
                         Print(15,' A—a ´eÈaA¯a“e ''Àa¶¥ ·¡Èi'' ·i ¡¡—e ¸âµA‰A');
                         Print(15,'¬a¶wÐ–”a.');
                         Print(7,'');
                         for i := 1 to enemynumber do
                         with enemy[i] do begin
                            if not unconscious then begin
                               Print(12,' '+name+ReturnSJosa(name)+' ·¯¢·i ·°´ö”a');
                               hp := 0;
                               unconscious := TRUE;
                            end;
                         end;
                         DisplayEnemies(FALSE);
                         Pause(TRUE);
                         PressAnyKey;
                         Print(13,' a“e ´å¹Aa ”w¯¥ º¶áµA¬á  ”w¯¥µA‰A •¡¶‘·i');
                         Print(13,'º•¡¢ Ða‰V‘A. ‹aŸ¡‰¡ ˆa ´i´a… ¤a¡“e ”a');
                         Print(13,'Ça ¡A·¡»¡“e  ¹¥¸ Ðe”a‘A.  ·¡¹A ¦Èáˆa ”aÇa');
                         Print(13,'¡A·¡»¡µÁ· ‰i¸å·¡ ¯¡¸b –A“e ˆé­A. ‹aœñ ”a·q');
                         Print(13,'µA ™¡ ¥¡•¡¢ Ða­A.');
                         for i := 1 to 6 do
                         with player[i] do begin
                            if (hp < 0) or (unconscious > 0) or (dead > 0) then begin
                               hp := 1;
                               unconscious := 0;
                               dead := 0;
                            end;
                         end;
                         Display_Condition;
                         PressAnyKey;
                         Silent_Scroll;
                         ok := TRUE;
                      end else ok := FALSE;
                   until ok;
                end;
             end;
             if (x in [23..28]) and (y in [9..12]) then begin
                Clear;
                Print(7,' ·©Ð—·¡ ¸é¥bµA ¬á¸a a¸a  ¶á´s¸â·¥ Ó±·¡ ·©Ð—');
                Print(7,'·i i´á ”w‹¡‹¡ ¯¡¸bÐ–‰¡ ‰iŠ‚ ·©Ð—·e ‹a Ó±·i');
                Print(7,'¤áË¡»¡ ¡µÐa‰¡  ·¢…· Š ÷ ­¢·a¡ ¨a¹a —i‰¡');
                Print(7,' i´v”a.');
                with party do begin
                   map := 3; xaxis := 51; yaxis := 51;
                end;
                Load;
                Scroll(FALSE);
                PressanyKey;
                Delete_Scroll_Screen;
                face := 4;
                Silent_Scroll;
                Print(7,' ÐeÀqÒµA ·©Ð—·¡ Œ´áa¬á ¥¥ ˆõ·e »¡¬w· ­A');
                Print(7,'‰µÁ  ”aŸq ´ô“e ­A¬w·¡´ö”a.  ”a e ”aŸe ˆõ·¡');
                Print(7,'·¶”a¡e  ·¥‰·· È´··¡ »¡¬w· È´·‰Á ˆ{·¡ a');
                Print(7,'Èav”aˆa ¬aœa¹v”a Ða“e ˆõ ª…·¡´ö”a.');
                party.etc[9] := party.etc[9] or bit1;
             end;
             if (x in [11..15]) and (y in [10..12]) then begin
                Clear;
                Print(7,' ·©Ð—·e ¸é¥b ´|·a¡ ¬ö‰¡,  ¸á¤å‰Á ˆ{·¡ ´á˜å');
                Print(7,'ˆwÐe Ó±µA ·Ð¬á Š ÷ ­¢·a¡ ¨ia —i´áˆv”a.');
                with party do begin
                   map := 3; xaxis := 14; yaxis := 24;
                end;
                Load;
                Scroll(FALSE);
                PressanyKey;
                Delete_Scroll_Screen;
                face := 4;
                Silent_Scroll;
                Print(7,' ·©Ð—·¡ Œ´áa ¥¡“¡ ¸á¤å‰Á“e ¹¡‹q ”aŸe ‰µ·a');
                Print(7,'¡ ·¡•· –A´á¹v·q·i ´i ® ·¶´ö”a.');
                party.etc[9] := party.etc[9] or bit5;
             end;
             if y = 45 then
             with party do begin
                if WantExit then begin
                   map := 1; xaxis := 18; yaxis := 89;
                   Load;
                end
                else dec(y);
                Silent_Scroll;
             end;
          end;
      11: begin
             if (y = 26) and (party.etc[31] and bit6 = 0) then begin
                Clear;
                Print(7,' ”w¯¥·e ·¡ ‰µµA ‘½µa ·¶“e  ´á˜å ¬âÌe·i ¤i‰e');
                Print(7,'Ð–”a.  Ða»¡ e ´i ® ´ô“e ‰¡”´á¡ ³aµa¹a ·¶');
                Print(7,'´á¬á •¡¸áÓ¡ ·ª·i ® ´ô´ö”a.  Ða»¡ e  ·©Ð—·e');
                Print(7,'‹aˆõ·i ˆa¹a ˆa‹¡¡ Ð–”a.');
                party.etc[31] := party.etc[31] or bit6;
             end;
             if (y = 31) and (party.etc[31] and bit6 > 0)
             and (party.etc[31] and bit7 = 0) then begin
                Clear;
                if exist(3) then
                with player[3] do begin
                   Print(7,' '+name+ReturnSJosa(name)+' Ðe•·´e ¬—ˆbÐa”á“¡  i·i Œá–”a.');
                   Print(7,'');
                   Print(3,' ¸qŒe,  ‹a ‰¡”´áŸi µ¸åµA ¥¡´v”å ‰µ·i ¤w‹q');
                   Print(3,'¬—ˆb Ð–”a‘A. ˆa 1 ‘e¸åµA ¡—a ´e“±· ·©');
                   Print(3,'·i •¡µÁº‰¡ ·¶´ö·i˜  ¡—a ´eA¬á ·¡œå ‹i·¡');
                   Print(3,'¸âÑa ·¶“e ‰¡¬áŸi  ·ª‰¥ Ð–´ö”a‘A.  ¦…¡wÓ¡ ·¡');
                   Print(3,'ˆõ·i ¡—a ´e“±A ˆa¹aˆa¡e  ¦…¡wÓ¡ Ð•¢·¡ –I');
                   Print(3,'ˆé­A.');
                end;
                party.etc[31] := party.etc[31] or bit7;
             end;
             if y = 45 then
             if wantexit then begin
                with party do begin
                   map := 2; xaxis := 16; yaxis := 17;
                end;
                Load;
             end
             else dec(y);
             Silent_Scroll;
          end;
      12: begin
             if on(39,38) or on(12,38) or on(12,13) or on(39,13) then begin
                Clear;
                if on(39,38) then b := bit1;
                if on(12,38) then b := bit2;
                if on(12,13) then b := bit3;
                if on(39,13) then b := bit4;
                if party.etc[35] and b = 0 then begin
                   Print(15,' ”w¯¥·e ‹a ‰µ· A¤áŸi ”w‰v”a.');
                   party.etc[35] := party.etc[35] or b;
                   if party.etc[35] and $0F = $0F then begin
                      for j := 25 to 26 do
                      for i := 18 to 27 do PutMap(j,i,44);
                      PutMap(25,28,54); PutMap(26,28,54);
                      PutMap(24,28,36); PutMap(27,28,36);
                      for i := 24 to 27 do PutMap(i,29,36);
                      Print(7,'');
                      Print(15,' ‹aœá¸a, ˆs¸a‹¡ Ñ¡® ½¢µA¬á ŠA·q·¡ —iv”a.');
                   end;
                end
                else begin
                   Print(15,' ”w¯¥·e A¤áŸi ¶¥ ¬wÈ¡ ‘½´v”a.');
                   party.etc[35] := party.etc[35] xor b;
                end;
                exit;
             end;
             if (on(25,25) or on(26,25)) and (party.etc[32] and bit8 = 0) then begin
                Clear;
                i := 1;
                person := 2;
                while i < 6 do begin
                   if exist(person) then person := i;
                   inc(i);
                end;
                with player[person] do
                if person = 1 then begin
                   Print(7,' ”w¯¥·e ¢¯±Å¡ ¤i ´aœµA¬á ¤e¼b·¡“e  •¡¸a‹¡');
                   Print(7,'· ¹¡ˆb·i ¥¡´v”a. ‹aˆõ·i ¸a­AÓ¡ ¹¡¬aÐ ¥¡“¡');
                   Print(7,'´á˜å ¬âÌe· ¹¡ˆb·¡´ö”a.  ˆá‹¡µA“e ´i ®´ô“e');
                   Print(7,'‰¡”´áˆa ¸e›b ³aµa ·¶´ö”a. ”w¸w·e ·ª·i ®ˆa');
                   Print(7,'´ô´ö»¡ e ˆa¹aˆa‹¡¡ Ð–”a.');
                end
                else begin
                   Print(7,' ˆs¸a‹¡ ·©Ð—· ¹A·© –áµA ·¶”å '+name+ReturnBJosa(name)+' ¢¥ˆaŸi ¤i‰eÐa‰¡ ·©Ð—·i ¦‰œá ­A¶¶”a.');
                   Print(7,'');
                   Print(3,' ¸qŒe, ¸a‘A—i µa‹¡Ÿi ¥¡‰A.');
                   Print(7,'');
                   ReturnSexData;
                   Print(7,' '+SexData+'ˆa  iÐ–”a.');
                   Print(7,'');
                   Print(3,' ¤w‹q ˆa –á ˜aœa µ¡”aˆa ˜w ­¢µA ¤e¿q ¢ˆÓ¥');
                   Print(3,'¬âÌe·i ¤i‰e Ð–”a‘A.  ·¡ˆõ ¥¡‰Aa. ´á˜å ‹i¸a');
                   Print(3,'ˆa ³aµa ·¶Š….  ‰¡”´á·¥ ˆõ ˆ{·e•A ´á¼–—e ˆa');
                   Print(3,'¹a ˆa•¡¢ Ða»¡.');
                end;
                party.etc[32] := party.etc[32] or bit8;
                exit;
             end;
             if y = 45 then begin
                if wantexit then begin
                   with party do begin
                      map := 2; xaxis := 149; yaxis := 66;
                   end;
                   Load;
                end
                else dec(y);
                Silent_Scroll;
                exit;
             end;
             if party.etc[4] = 0 then begin
                Clear;
                x := x - x1;
                y := y - y1;
                Silent_Scroll;
                Print(7,' ·©Ð—·e w˜áœá»¡¡ ˜é´á »©¨å Ð–”a.');
             end;
          end;
      13: begin
             if y <= 6 then begin
                if wantexit then begin
                   with party do begin
                      map := 3; xaxis := 89; yaxis := 93;
                   end;
                   Load;
                end
                else inc(y);
                Silent_Scroll;
             end;
             if y in [7..32] then
             if party.etc[1] > 0 then begin
                party.etc[1] := 0;
                Silent_Scroll;
             end;
             if (y = 34) and (party.etc[40] and bit7 = 0) then begin
                Clear;
                cPrint(7,11,' ·©Ð—·¡ ¬a¶¥´e·a¡ —i´á µÖ·i˜“e ·¡£¡  ','´á–‘','');
                cPrint(7,11,'','· Â¹·¸a—i','·¡œa‰¡ ¦‰Ÿ¡¶“e ¬aœq—i·e  ¬aœa»¥');
                Print(7,'Òµv”a.');
                party.etc[40] := party.etc[40] or bit7;
             end;
             if y = 43 then begin
                Clear;
                Print(7,' ‹a‰µµA“e  ­¡¶á ´á–‘· Â¹·¸a—i·¡ ¶Ÿ¡ ·©Ð—');
                Print(7,'µA‰A ¥¡“e ¡A­A»¡ˆa ·¶´ö”a.');
                Print(7,'');
                Print(13,' ”w¯¥—i·¡  ¶Ÿ¡ ´á–‘· Â¹·¸a—i·i ½¹‰¡ ·¶”a');
                Print(13,'“e ˆõ·i ´i‰¡·¶”a. Ða»¡ e ‹a ¸÷•¡· ¯©b·a¡');
                Print(13,'“e  ¶Ÿ¡µA‰A ”ÐwÐa»¡ ¹¡Àa ¡µÐe”a“e ˆõ·i ´i');
                Print(13,'ˆõ·¡”a.  ¶Ÿ¡—i·e áÓ—i· ¶‘»¢·±·i  {{Ó¡');
                Print(13,'Ìa´bÐa‰¡ ·¶”a.  ·¡£¡ ¯©Ÿ¡´e Äa£¡á¯a“e ¶Ÿ¡');
                Print(13,'—i·¡ ´e¸åÐe ‰µ·a¡ µ«‰a ‘½´v»¡. Ða»¡ e áÓ');
                Print(13,'—i·e ¶Ÿ¡µA‰A ¸â‹b Ñs¹¡Ð´¡ e Ði ˆõ·¡”a. ¶');
                Print(13,'Ÿ¡—i·e ¯¥µA ·Ð ¬åÈ‚ –A´á»¥ ¬aœq—i·¡‰¡  ·¡');
                Print(13,'­A¬w·e á¢a ”ásÑa¹a ·¶»¡. ·¡ ­A¬w·i ”a¯¡');
                Print(13,'ŒuÐa‰A Ða‹¡ ¶áÐ¬á“e   ¶ ˆá”Ðe Ó±·¡ Ï©');
                Print(13,'¶aÐa‰V»¡. ‹aœ¬á ¶Ÿ¡ˆa ¬åÈ‚Ðe ˆõ·e ¤a¡ ¯©');
                Print(13,'Ÿ¡´e Äa£¡á¯aœa“e ´b· »³ÐsÁA·¥ ˆõ·¡”a.  ¶');
                Print(13,'Ÿ¡—i·e ¬¡¶… ­A¬w·i ¶áÐ¬á“e ´b· Ó±·¡œa•¡');
                Print(13,'¬a´·Ða»¡ ´g“e”a.  ”w¯¥•¡ ¶Ÿ¡· ›u·i ´i´v”a');
                Print(13,'¡e  ·¡¹A Í¡‹¡Ða‰¡  ¶Ÿ¡—i· ·»¡Ÿi ˜aŸa‹¡Ÿi');
                Print(13,'¤aœa“e ¤a·¡”a.');
                Print(7,'');
                PutMap(11,39,52);
                if party.etc[9] and bit3 = 0 then begin
                   Print(11,' [ ‰wÐñÃ¡ + 100000 ]');
                   Print(7,'');
                   party.etc[9] := party.etc[9] or bit3;
                   for i := 1 to 5 do
                   if player[i].name <> '' then player[i].experience := player[i].experience + 100000;
                end;
             end;
             if on(11,39) and (party.etc[40] and bit6 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·e  µa‹¡¬á ”Š— ´aŸa¤iA¯aËaŸi ¤i‰e Ða');
                Print(7,'µv”a. ´aŸa¤iA¯aËaŸi ˆa»© ¬aœq·i ‰¡Ÿa¯¡µ¡.');
                k := ChooseWhomSub(106,FALSE,FALSE);
                if k = 0 then exit;
                Clear;
                if Verify_Weapon(k,28) then begin
                   player[k].weapon := 28;
                   Modify_Item(k);
                   Print(15,player[k].name+ReturnSJosa(player[k].name)+' ´aŸa¤iA¯aËaŸi ¸wÀbÐ–”a.');
                   party.etc[40] := party.etc[40] or bit6;
                end
                else begin
                   Print(7,player[k].name+'µA‰A“e ·¡ ¢‹¡ˆa  x»¡ ´g¯s“¡”a.');
                end;
             end;
          end;
      14: begin
             if (y = 41) and (party.etc[41] and bit1 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e µa‹¡¬á ','·¡•· Š¯i','·i ¤i‰e Ðaµv”a.');
                Print(7,'');
                Print(11,' [ ·¡•· Š¯i + 4 ]');
                with party do begin
                   if item[10] + 4 < 256 then item[10] := item[10] + 4
                   else item[10] := 255;
                end;
                party.etc[41] := party.etc[41] or bit1;
             end;
             if on(18,14) and (party.etc[41] and bit2 = 0) then begin
                Clear;
                cPrint(15,11,' ·©Ð—·e µa‹¡¬á ','ÁAb ÒA¥¢´¢','·i ¤i‰eÐaµv”a.');
                Print(7,'');
                Print(11,' [ ÁAb ÒA¥¢´¢ + 5 ]');
                with party do begin
                   if item[1] + 5 < 256 then item[1] := item[1] + 5
                   else item[1] := 255;
                end;
                party.etc[41] := party.etc[41] or bit2;
             end;
             if on(26,9) then begin
                Clear;
                Print(7,' ·©Ð—·e µa‹¡¬á ´á˜å ¯¡ÁAŸi ¤i‰e Ðaµv”a.  ¯¡');
                Print(7,'ÁA“e ¯±Ða‰A ¦ÌÐ ·¶´á¬á ´bÂáˆa »¥•·Ðaµv”a');
                Print(7,'. ‹a ¯¡ÁA· ­¥µA“e ·©‹¡¸w Àáœñ ¥¡·¡“e À‚ Ðe');
                Print(7,'Š¥·¡ Â ºá´á¹a ·¶´ö”a.');
                Print(7,' ”w¯¥·e  ‹a À‚·i ¯¡ÁA· ­¥µA¬á ¨´á  ·ª‹¡');
                Print(7,'¯¡¸bÐ–”a. ‹a À‚· º—¶aÐe ¶w·i ¥¡¡e ”a·q‰Á');
                Print(7,'ˆ{”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 10 ¶© 15 ·©');
                Print(7,'');
                Print(7,' »¡‹q ˆa Ða‰¡ ·¶“e ·©·¡  ¸÷ i µ°·e ·©·¥»¡');
                Print(7,'¯a¯a¡ˆa ·¯±·¡ˆe”a.  ·¡£¡ §¹· ¬a¶¥·e ·¡Ÿq');
                Print(7,'‰Á“e ”aŸe ´á–‘· ¬a¶¥·a¡ ¥eÐˆa‰¡ ·¶‰¡  a');
                Print(7,'ˆa ˜aŸa‰¡ ·¶“e ¡AÏ¡¯aÉ¡ÍIA¯a“±·e ¬å·i Îa¤w');
                Print(7,'Ða‰¡ e ·¶·iª… ¯©»¡¡“e  ¬å·i ¶á¯¡Ðe ´b·i Ð—');
                Print(7,'Ða‰¡ ·¶”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 10 ¶© 18 ·©');
                Print(7,'');
                Print(7,' µ¡“i•¡ a“e ™¡ Ðe ¬aœq· ¸¢‰·i º‚µv”a. ´a');
                Print(7,'¯a¡¡•A¶¯a“±· ¡ww·i ´á‹©® ´ô´á¬á  ´á¼é®');
                Print(7,'´ô·¡ º‚µv»¡ e  a·  a·q·e  ´·¯±· ˆaÀ‚·a¡');
                Print(7,'¤å£¥Ða‰¡ ·¶”a. ´á¼á¡e a“e ¡AÏ¡¯aÉ¡ÍIA¯a“±');
                Print(7,'µA‰A  ·¡¶w e ”wÐa‰¡ ·¶”a“e “a±·¡ —a“e‰A ¬a');
                Print(7,'¯©·¡”a. Ða»¡ e ·¡œý‰A Ð¬áœa•¡ ­A‰ˆa ¹± ”á');
                Print(7,'¹½´a»© ® e ·¶”a¡e  a“e ·¡¶w ”wÐ•¡ ¹½”a“e');
                Print(7,'¬—ˆb·¡ —e”a. ¸÷ i ­A¬w·e á¢ ”áœá¶¡ ¹v”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 10 ¶© 23 ·©');
                Print(7,'');
                Print(7,' xµA á¢ q¿¢Ðe  i·i —i´ö”a.  »¡‹q•¡ a·');
                Print(7,'ˆa¯q·e ¤w w·¡»© Ða—u·¡ –‹eˆáŸ¥”a. ¡AÏ¡¯aÉ¡');
                Print(7,'ÍIA¯a“±‰Á ¡©¢“±‰Á· ”ÑÁŸi  ¶µeÓ¡ µ{—i´ö');
                Print(7,'”a. ‹a—i·¡ Š—‹b¸â·a¡ Ða‰¡¸a Ða“e ·©·e ¤a¡');
                Print(7,'­A‰ ¡i w·¡´ö”a.  ‹a—i·¡ Îa¬wÐa“e ¹·Ša“e ¤a');
                Print(7,'¡  aŠa µv”a.  ‹a—i·¡ aµA‰A  ¸¢‰·i º‚·¡‰A');
                Print(7,'Ða‰¡“e  ‹a ¬—¡wb·i ¤h´a—iµa ¸ñ¸ñ ‹a—i·  a');
                Print(7,'b·i ˆwÐa‰A ÐµÖ”å ˆõ·¡´ö”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 10 ¶© 25 ·©');
                Print(7,'');
                Print(7,' a“e —a—¡´á §¹· ¬a¶¥·i ÈiÂ‰Ð–”a. ‹aŸ¡‰¡“e');
                Print(7,'µa‹¡ Ï©¡i· ¬—¹¥·¡œe •·Š‰µA ·e¯¥Ð–”a.  ‹a—i');
                Print(7,'· ¥¡¥¢·¡ –a¶¶‹¡ ˜¢…·¡´ö”a.  Ða»¡ e ´é a');
                Print(7,'ˆa»¡ ´g´a ‹a—i·  abµA ‘¡Â‰ –A´á ¤áŸ©ˆõ ˆ{');
                Print(7,'”a. a“e ‹a—i·  ab· ˆwÐq·i ¾‚ ¥ÁµÖ·a“¡Œa');
                Print(7,'´a a ËiŸ± ´ô·i ˆõ·¡”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 10 ¶© 26 ·©');
                Print(7,'');
                Print(7,' ´aÃ±µA ˆa ¹¡‹q ”á ´e¸å Ði ® ·¶“e ¤w¤ó·¡');
                Print(7,'¢…—b ˜áµ©œa ¯©Ð—Ða‹¡¡ Ð–”a.  •·Š‰· ·³ŠŸi');
                Print(7,'“|·a¡  b‰¡ ™¡ É·¡Ÿi ¡¡– Àa”eÐ ¤áv”a.');
                Print(7,'´a¢Ÿ¡ ‰·ˆe ·¡•·· ”i·¥·¡œa‰¡ Ða”áœa•¡ ·¡œý');
                Print(7,'‰A ‹¼·e •·Š‰·i ·©·©·¡ Ê¯¡Ð¬á aŸi Àx´a …');
                Print(7,'Ò µa‹¡Œa»¡ ‰·ˆe ·¡•··i Ð µ© ®“e ´ô·aŸ¡œa');
                Print(7,'‰¡ ¬—ˆbÐe”a.  ·¡¹A“e Íe´eÓ¡ ¸i ® ·¶·i ˆõ·¡');
                Print(7,'”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 11 ¶© 3 ·©');
                Print(7,'');
                Print(7,' a· ‰¬e·e Ëiv”a. µ¡“i ´aÃ±µA 4¡w· ´á–‘');
                Print(7,'· Â¹·¸a·  b‰b·¥  ¥AŸ¡´i·¡ aŸi Àx´a ');
                Print(7,'´ö”a.  ‹a“e ‹a—i·i ¤¯¥Ðe aŸi Ðaž ¹··© ŠA');
                Print(7,'¡¶¡ Ða¡a º‚•¡¢ •¢·¡ ·¶“e Àw·a¡ aŸi ¿©œö');
                Print(7,'”a. »¡‹q ‰¡É··¡ á¢ ¯±Ða”a. ­¥•¡ ˜éŸ¡‰¡ ¸÷');
                Print(7,'¯¥•¡  j»¡´g”a. ·¡¹A“e  a»¡ b·¥ˆa ¥¡”a.');
                PressAnyKey;
                Print(15,' 773 ‘e 11 ¶© 4 ·©');
                Print(7,'');
                Print(7,'  ¬—¡w•¡ µ¡“iŒa»¡ ‰V»¡.  ‹aœ¬á ˆa º‚·e');
                Print(7,'–áµA ’Š…ˆaˆa aŸi ¤i‰eÐi»¡•¡ ¡¡Ÿa“¡ ‹a—iµA');
                Print(7,'”Ðe Ëb»··i ´iaº´á  ”aŸe ¬aœq—i•¡ º· Ði');
                Print(7,'® ·¶•¡¢ Ð´¡ ‰V”a“e ¬—ˆb·¡ —i´ö”a.');
                Print(7,' 4 ¤å¼ ¥¡¯a·¥ ¥AŸ¡´i·e  a¤ó“wb·i ¹A¶AÐa‰¡');
                Print(7,'“e ¥¡É· ·¥ˆe‰Á ˆ{·i ¸÷•¡· ÁAb·i ˆa¹v”a.');
                Print(7,'Ða»¡ e  a¤ó “wb•¡  ”aŸe 3 ¡wµA §¡Ða¡e ¥¡¸i');
                Print(7,'ˆõ ´ô”a. Ða»¡ e ‰iÅ¡ ¢¯¡Ði ®“e ´ô”a.');
                Print(7,' 3 ¤å¼ ¥¡¯a·¥ ¡©¢·e  ÑÅ¬w·  a¤óµA ”ˆa·¡');
                Print(7,'”a. ´a a ÂA‰¡· ÑÅ¬w  a¤ó¬a·¡”a.');
                Print(7,' 2 ¤å¼ ¥¡¯a·¥ ´a¯a¡¡•A¶¯a“e ‰œ¢· Àå¸·¡');
                Print(7,'”a.  Ða»¡ e  a¤ó¬a·¡‹¡ ¥¡”a“e  a¤ó·i ¬a¶wÐa');
                Print(7,'“e ¸å¬a½¢µA ˆaŒs”a.');
                Print(7,' ÂA‰¡ ¥¡¯a·¥ ¡AÏ¡¯aÉ¡ÍIA¯a“e ‹¡¬a‰b· ÁAb');
                Print(7,'µA ” a¤ó¬a·  a¤ó·i ˆa»¡‰¡ ·¶”a. Ëb‹¡“e ‰·');
                Print(7,'º— Ð‚·WÐsµA ·Ð ‹¡Ÿi ª‘´á´á  ¸â·i ‰·‰bÐa');
                Print(7,'“e ¤w¤ó·¡”a.');
                Print(7,'');
                Print(7,' ‹aŸ¡‰¡ »¡‹q ‹a—i·e ™¡ ”aŸe 2ˆ· ”ŸBµA ˆb');
                Print(7,'ˆb ˜é´á¹a¬á ´á–‘· µwÑ¥·i ¦ÑÉ ¯¡Ç© Ó±·i ¦…');
                Print(7,'¬eÐ¬á ¡¡·a‰¡ ·¶”a.  ˆa ´a“e ˆõ·e ·¡‰A ¸å');
                Print(7,'¦·¡”a. ˆa º‚”áœa•¡ ·¡ ‹i·¡ •¡¶‘·¡ –A´ö·a');
                Print(7,'¡e Ðe”a. ‹aŸ¡‰¡ ... ...');
                Print(7,'');
                if party.etc[9] and bit4 = 0 then begin
                   Print(11,' [ ‰wÐñÃ¡ + 100000 ]');
                   Print(7,'');
                   for i := 1 to 5 do
                   if player[i].name <> '' then player[i].experience := player[i].experience + 100000;
                   party.etc[9] := party.etc[9] or bit4;
                end;
             end;
             if y = 45 then begin
                if wantexit then begin
                   with party do begin
                      map := 3; xaxis := 33; yaxis := 50;
                   end;
                   Load;
                   if party.etc[40] and bit8 = 0 then
                      party.etc[40] := party.etc[40] or bit8
                   else
                      for i := 51 to 67 do PutMap(33,i,0);
                end
                else dec(y);
                Silent_Scroll;
             end;
          end;
      15: begin
             if on(12,15) and (party.etc[41] and bit3 = 0) then begin
                Clear;
                Print(13,' ”w¯¥·¡ µa‹¡Ÿi »¡aˆa‰V”a‰¡¶a ? ‹aœñ ¶Ÿ¡—i');
                Print(13,'·i  å¸á ³aœá›aŸ¡¯¡»¡¶a.');
                enemynumber := 8;
                for i := 1 to enemynumber do joinenemy(i,35);
                DisplayEnemies(TRUE);
                PressAnyKey;
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then
                   dec(x)
                else
                   party.etc[41] := party.etc[41] or bit3;
                Silent_Scroll;
                exit;
             end;
             if on(44,35) and (party.etc[41] and bit4 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·¡ ´|·a¡ »¥Ð—Ðaa Ð–·i˜ ¢´åˆa Çe ¢‰');
                Print(7,'ÁAµÁ  aºÃ¡‰A –A´ö”a.  ‹a—i·e ’…·i ¤å›b·¡¡a');
                Print(7,'”ia —i´ö‰¡  ·©Ð—·e ‹a ¢‰ÁAˆa  ˆa‰¡·©—i·¡œa');
                Print(7,'“e ´i´aÀ–”a.');
                PressAnyKey;
                enemynumber := 7;
                for i := 1 to enemynumber do joinenemy(i,42);
                DisplayEnemies(TRUE);
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then
                   inc(y)
                else
                   party.etc[41] := party.etc[41] or bit4;
                Silent_Scroll;
                exit;
             end;
             if on(29,14) and (party.etc[41] and bit5 = 0) then begin
                Clear;
                enemynumber := 8;
                for i := 1 to 5 do joinenemy(i,37);
                for i := 6 to 8 do joinenemy(i,47);
                with enemy[8] do begin
                   name := 'ˆá” ¬a·¡Çi³¯a';
                   strength := 60;
                   resistance := 80;
                end;
                DisplayEnemies(TRUE);
                Print(13,' ˆa ¥AŸ¡´i“±·i »¡Ç¡“e  a»¡ b Ñ¡¶á”·¡»¡.');
                Print(13,' ‹a ¸÷•¡· ®•¸a¡ µa‹¡Œa»¡ •©ÌaÐ µ¡”a“¡ ¹¡');
                Print(13,'‹q·e ¹¥‰wÐi eÐe ·©·¡Š….  a“e  »¡‹qŒa»¡µÁ“e');
                Print(13,'‰b·¡ ”aŸa»¡.  ¤a¡ ¥AŸ¡´i“±· µ¡ŸeÌi‰Á ”aŸq');
                Print(13,'´ô“e ¹¥¸·¡“¡Œa. ¸a ”ñ¥aœa !!');
                PressAnyKey;
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 254 then exit;
                   if party.etc[6] <> 2 then ok := TRUE
                   else begin
                      Clear;
                      Print(7,' Ða»¡ e ¸â·e {Œa»¡ ¶Ÿ¡Ÿi ˜aœa ¦›´ö”a.');
                      PressAnyKey;
                      ok := FALSE;
                   end;
                until ok;
                party.etc[41] := party.etc[41] or bit5;
             end;
             if (y < 11) and (party.etc[9] and bit6 = 0) then begin
                Clear;
                enemynumber := 1;
                joinenemy(1,72);
                DisplayEnemies(TRUE);
                Print(13,' µa‹¡Œa»¡ ¸i•¡µÖŠ…, '+player[1].name+'.');
                Print(13,' á“e ´a a a·  a¤óµA  ‚´ô·¡ ³aœá»© ˆõ·¡”a');
                Print(13,'. ‰iŠ‚ ‹a‰A á· ¶…¡w·¡“¡Œa.');
                PressAnyKey;
                Print(7,'');
                Print(14,' µ¡ŸaËa ·©Q .. Äi ¹E ..');
                enemynumber := 5;
                for i := 1 to enemynumber-1 do joinenemy(i,59);
                joinenemy(enemynumber,72);
                DisplayEnemies(TRUE);
                Print(7,'');
                Print(7,' ¥AŸ¡´i·e ­¡ÑÅ  a¤ó·a¡ º¶á· •¡ a¤‘·i •¡ a');
                Print(7,'¤‘ ·¥ˆe·a¡ ­¡¬— ¯¡Åv”a.');
                PressAnyKey;
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if (party.etc[6] = 0) or (enemy[8].dead) then begin
                   party.etc[9] := party.etc[9] or bit6;
                   Clear;
                   Print(13,' ·a·b~~~ Ða»¡ e ˆa ‹aŸ¡ ®ó‰A áµA‰A ”wÐiˆõ');
                   Print(13,'ˆ{·a¡ !!');
                   Print(7,'');
                   Print(7,' ¥AŸ¡´i·¡ º‚·a¡e¬á ÓiŸ¥ Ï¡ˆa •¡ a¤‘ ·¥ˆe· ¯¡');
                   Print(7,'ÁA¡ ¯a¡a —i´áˆv‰¡  •¡ a¤‘ ·¥ˆe·e ”á¶‚ ˆwÐa‰A');
                   Print(7,'¦ÑÉ·i Ð–”a.');
                   dec(enemynumber);
                   for i := 1 to enemynumber do begin
                      joinenemy(i,51);
                      enemy[i].name := '•¡ a¤‘ ·¥ˆe';
                   end;
                   DisplayEnemies(TRUE);
                   PressAnyKey;
                   BattleMode(TRUE,TRUE);
                end;
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   x := 25; y := 44;
                end;
                Silent_Scroll;
                exit;
             end;
             if on(12,15) or on(44,35) or on(29,14) or (y<11) then exit;
             if y = 45 then begin
                if wantexit then begin
                   with party do begin
                      map := 3; xaxis := 36; yaxis := 17;
                   end;
                   Load;
                end
                else dec(y);
                Silent_Scroll;
                if party.etc[9] and bit6 > 0 then begin
                   Clear;
                   Print(7,' ·©Ð—·e ¥AŸ¡´i·i ÀáÃ¡Ða‰¡  ¢¬aÓ¡ •·Š‰·i ¨a¹a');
                   Print(7,'aµÖ”a.  Ða»¡ e ˆá”Ða‰A ÑÅ¬—Ðe •¡ a¤‘ ·¥ˆe·e');
                   Print(7,'»³¶aÐa‰A ·©Ð—µA‰A ˜aœa ¦›´ö”a.');
                   PressAnyKey;
                   Print(7,'');
                   Print(14,' ·¥ ‘¢¯a ‹aœa§a ..');
                   Print(7,'');
                   Print(7,' ·©Ð—·e "·A•¢ ˆa¯a"  a¤ó·i  •·Š‰ ´e·i Ð·Ð ¬a');
                   Print(7,'¶w Ð–”a.');
                   Print(7,'');
                   Print(14,' ¤a¯a Í¡Ÿa ‹aœa§a ..');
                   Print(7,'');
                   Print(7,' ‹aŸ¡‰¡ ·©Ð—·e "Á¡·qÌa"Ÿi ·¡¶wÐaµa  •·Š‰ ·³Š');
                   Print(7,'Ÿi Ðq¡© ¯¡Åv”a.');
                   PressAnyKey;
                end;
                exit;
             end;
             x := x + 3*x1;
             y := y + 3*y1;
             Silent_Scroll;
             if Real_Map(x,y) = 0 then SpecialEvent;
          end;
      16: begin
             if (y = 14) and (party.etc[9] and bit7 = 0)  then begin
                Clear;
                Print(7,' ·©Ð—·e ´u! Ða“e ¬a·¡µA  £©Í–E ¤w´e·a¡ ¨ia');
                Print(7,'—i´á ˆa‰¡  i´v”a.');
                y := 9;
                Silent_Scroll;
             end;
             if on(9,7) then begin
                x := 6; y := 7;
                Silent_Scroll;
             end;
             if on(6,40) then begin
                x := 9; y := 40;
                party.etc[41] := party.etc[41] or bit6;
                Silent_Scroll;
             end;
             if (x in [9..12]) and (y in [6..9]) then begin
                PutMap(x,y,42);
                PutMap(9+random(4),6+random(4),0);
             end;
             if y = 45 then begin
                if (party.etc[9] and bit7 = 0) and (party.etc[41] and bit6 > 0) then begin
                   Clear;
                   enemynumber := 1;
                   joinenemy(enemynumber,73);
                   DisplayEnemies(TRUE);
                   Print(13,' ”w¯¥—i·¡  a· ­¥´aŠáµA¬á ¨a¹a aˆaa‰¡ Ða»¡');
                   Print(13,' e ‹aˆå Çe Àbˆb·¡µ¡.  ”w¯¥—i·¡ ·¡ •·Š‰·i ÑA¡A');
                   Print(13,'‰¡ ·¶·i˜ a“e ·¡£¡ ”w¯¥—i· ´¢¸ñ‰Á ”e¸ñ·i ¤i');
                   Print(13,'‰eÐ–­¡.  »b, ‹a  i·e a· ÑÅ¬w  a¤ó·   â·¡ˆa');
                   Print(13,'–A´ö”a“e ˆõ·¡µ¡. a“e §¡¢ ”aŸe  a¤óµA“e ¥i¡');
                   Print(13,'¸“w·¡ ´ô»¡ e  ÑÅ¬w  a¤ó e·e  ÂA‰¡Ÿi ‰¡®Ða‰¡');
                   Print(13,'·¶”aµ¡. ‹aœñ ”w¯¥·e ”w¯¥· ÑÅ¬w‰Á °a¶‰A –A‰¡');
                   Print(13,'‰iŠ‚µA“e ¯a¯a¡µA »¡Áa ¯aœá»¡‰A –A»¡¶a.  ‹aŸ¡');
                   Print(13,'‰¡“e  a·  a¤óµA ·Ð ¸• ”á£¡ˆa –I ¶…¡w ¤cµA');
                   Print(13,'–A»¡ ´e‰V»¡¶a. ¸a, ‹aœá¡e ¯¡¸b Ða‰V­¡.');
                   PressAnyKey;
                   ok := TRUE;
                   repeat
                      if ok = FALSE then begin
                         Clear;
                         Print(13,' Ða»¡ e a·  a¤ó·e ·¡ ¸÷•¡¡ { a“e ˆõ·¡ ´a');
                         Print(13,'“¡œaµ¡.  ”a¯¡ Ðe¤å ”w¯¥· ÑÅ¬wµA ¨a¹a —i´á ¥¡');
                         Print(13,'¯¡µ¡. ÐaÐaÐaÐa ~~');
                         PressAnyKey;
                      end;
                      enemynumber := 0;
                      for i := 1 to 6 do begin
                         if player[i].name <> '' then begin
                            inc(enemynumber);
                            Turn_Mind(i,enemynumber);
                         end;
                      end;
                      DisplayEnemies(TRUE);
                      Clear;
                      repeat
                         BattleMode(FALSE,FALSE);
                         if party.etc[6] = 254 then exit;
                         if party.etc[6] = 2 then begin
                            Clear;
                            Print(7,' Ða»¡ e ·©Ð—·e ÑÅ¬wµA¬á ÑA´ái ® ´ô´ö”a.');
                            PressAnyKey;
                            DisplayEnemies(TRUE);
                            Allright := FALSE;
                         end else Allright := TRUE;
                      until Allright;
                      if EndBattle(i) then
                      if i = 1 then begin
                         Clear;
                         Print(7,' ·©Ð—·¡ ÑÅ¬wµA ¨a¹a  ¯a¯a¡ Ìa¡iÐa‰¡ ·¶·i˜');
                         Print(7,' éŸ¡¬á ŠáµA ·¢·e ·q¬÷·¡ —ia µÖ”a.');
                         Print(7,'');
                         Print(10,' '+player[1].name+'. a“e A—a ´eÈaA¯a·©­A.');
                         Print(10,' ”a¯¡ ™¡  ea‰A •öŠ….  ¬w”wÓ¡ ¶áÐñÐe ¬wÑ×·¥');
                         Print(10,'ˆõ ˆ{Š…. ‹aœñ ˆa ÑÅ¬w·i Œ´á º•¡¢ Ða»¡.');
                         Print(7,'');
                         delay(2000);
                         Print(14,' ´e ¤a¯a Æ´a¯a ..');
                         Print(7,'');
                         Print(7,' ®…¯¢ˆeµA ÑÅ¬w·e ˆèÑv‰¡  ¡©¢·¡ ¡¡¯s·i —aœá');
                         Print(7,'–”a.');
                         enemynumber := 1;
                         joinenemy(enemynumber,73);
                         DisplayEnemies(TRUE);
                         PressAnyKey;
                         Print(13,' á“e ™¡ ’Š¡. a· ÑÅ¬w·i ˆè´á ”a“¡ ”');
                         Print(13,'”eÐe ¯©b·¡Š….  Ða»¡ e ”w¯¥· ·»¡ˆa µa‹¡¡');
                         Print(13,'¯a¡a—i»¡ ¡µÐa•¡¢ ‰i‰Ÿi  ˜´á´¡ ‰VŠ….  ”w¯¥');
                         Print(13,'·¡ ´a¢Ÿ¡ šá´áa”a‰¡ Ð•¡  ·BÁAˆa ´ô“e µwÑ¥');
                         Print(13,'·¥ º¹AµA µAá»¡ ¸w¥b·i š»¡“e ¡µÐa‰V»¡. ‹a');
                         Print(13,'œñ a“e ·¡ ¸a—i‰Á ¸åÊŸi  a¢Ÿ¡ »¡´á´¡ ‰V­¡');
                         Print(13,'. ¸a ‹aœñ ‰i‰ ¤cµA¬á ·¡ ¸a—i· ÂAÒŸi ˆq¬w');
                         Print(13,'Ða‹¡ ¤aœaµ¡.');
                         PressAnyKey;
                         for i := 1 to 6 do
                         with player[i] do begin
                            if (hp < 0) or (unconscious > 0) or (dead > 0) then begin
                               hp := 1;
                               unconscious := 0;
                               dead := 0;
                            end;
                         end;
                         Display_Condition;
                         Print(7,' ¡©¢·¡ A—a ´eÈaA¯aµA ”Ðe ‰i‰Ÿi   e—a“e');
                         Print(7,'®…ˆe ·©Ð—·e ‹¡ÒAŸi ËqÈa¬á  ¬å‰·Š¥·i ¸s‰A –A');
                         Print(7,'´ö”a.');
                         PressAnyKey;
                         Allright := TRUE;
                         repeat
                            DisplayEnemies(TRUE);
                            BattleMode(Allright,TRUE);
                            if party.etc[6] = 254 then exit;
                            if party.etc[6] <> 2 then ok := TRUE
                            else begin
                               Clear;
                               Print(7,' Ða»¡ e ·©Ð—·e ¡©¢· ‰i‰µA¬á ¤õ´ái ® ´ô');
                               Print(7,'´ö”a.');
                               Allright := FALSE;
                               ok := FALSE;
                               PressAnyKey;
                            end;
                         until ok;
                         party.etc[9] := party.etc[9] or bit7;
                         Clear;
                         Print(10,' ÓA~~~  ‰a¶ ¡©¢· ‰i‰µA¬á ¤õ´ávŠ…. a·');
                         Print(10,'Â‰Ñe·¡ •¡¶‘·¡ –A´öa ?  a“e ™¡ ”a·qµA aÈa');
                         Print(10,'a•¡¢ Ða»¡. ‹a˜Œa»¡ ´e‘wÓ¡ ...');
                         Print(7,'');
                         Print(7,' A—a ´eÈaA¯a“e ¸ñ¸ñ Ó£¡Ð »¡”á“¡  ·¡ ¬a');
                         Print(7,'œa»¡‰¡  i´v”a.');
                         PressAnyKey;
                         ok := TRUE;
                      end else ok := FALSE;
                   until ok;
                   SpecialEvent;
                end
                else begin
                   if wantexit then begin
                      with party do begin
                         map := 3;
                         if party.etc[9] and bit7 = 0 then begin
                            xaxis := 93; yaxis := 7;
                         end
                         else begin
                            xaxis := 14; yaxis := 27;
                         end;
                      end;
                      Load;
                   end
                   else dec(y);
                   Silent_Scroll;
                end;
             end;
          end;
      17: begin
             if on(14,9) then begin  { Lever 1 }
                Clear;
                if party.etc[43] and bit1 = 0 then begin
                   Print(7,' ·©Ð—·e A¤áŸi ¹ÁÃb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   party.etc[43] := party.etc[43] or bit1;
                   PutMap(24,23,40);
                   PutMap(26,24,41);
                   PutMap(26,26,41);
                   PutMap(25,28,41);
                end
                else begin
                   Print(7,' ·©Ð—·e A¤áŸi ¶Ãb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   Party.etc[43] := party.etc[43] xor bit1;
                   PutMap(24,23,41);
                   PutMap(26,24,40);
                   PutMap(26,26,40);
                   PutMap(25,28,40);
                end;
             end;
             if on(14,21) then begin  { Lever 2 }
                Clear;
                if party.etc[43] and bit2 = 0 then begin
                   Print(7,' ·©Ð—·e A¤áŸi ¹ÁÃb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   party.etc[43] := party.etc[43] or bit2;
                   PutMap(25,22,41);
                   PutMap(26,23,40);
                   PutMap(27,26,41);
                   PutMap(26,27,40);
                end
                else begin
                   Print(7,' ·©Ð—·e A¤áŸi ¶Ãb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   Party.etc[43] := party.etc[43] xor bit2;
                   PutMap(25,22,40);
                   PutMap(26,23,41);
                   PutMap(27,26,40);
                   PutMap(26,27,41);
                end;
             end;
             if on(14,33) then begin  { Lever 3 }
                Clear;
                if party.etc[43] and bit3 = 0 then begin
                   Print(7,' ·©Ð—·e A¤áŸi ¹ÁÃb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   party.etc[43] := party.etc[43] or bit3;
                   PutMap(26,22,41);
                   PutMap(27,24,41);
                   PutMap(24,25,40);
                   PutMap(26,25,40);
                end
                else begin
                   Print(7,' ·©Ð—·e A¤áŸi ¶Ãb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   Party.etc[43] := party.etc[43] xor bit3;
                   PutMap(26,22,40);
                   PutMap(27,24,40);
                   PutMap(24,25,41);
                   PutMap(26,25,41);
                end;
             end;
             if on(37,9) then begin  { Lever 4 }
                Clear;
                if party.etc[43] and bit4 = 0 then begin
                   Print(7,' ·©Ð—·e A¤áŸi ¹ÁÃb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   party.etc[43] := party.etc[43] or bit4;
                   PutMap(26,21,40);
                   PutMap(27,23,41);
                   PutMap(25,26,40);
                   PutMap(26,28,41);
                end
                else begin
                   Print(7,' ·©Ð—·e A¤áŸi ¶Ãb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   Party.etc[43] := party.etc[43] xor bit4;
                   PutMap(26,21,41);
                   PutMap(27,23,40);
                   PutMap(25,26,41);
                   PutMap(26,28,40);
                end;
             end;
             if on(37,21) then begin  { Lever 5 }
                Clear;
                if party.etc[43] and bit5 = 0 then begin
                   Print(7,' ·©Ð—·e A¤áŸi ¹ÁÃb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   party.etc[43] := party.etc[43] or bit5;
                   PutMap(25,21,40);
                   PutMap(25,24,41);
                   PutMap(25,25,40);
                   PutMap(25,27,41);
                end
                else begin
                   Print(7,' ·©Ð—·e A¤áŸi ¶Ãb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   Party.etc[43] := party.etc[43] xor bit5;
                   PutMap(25,21,41);
                   PutMap(25,24,40);
                   PutMap(25,25,41);
                   PutMap(25,27,40);
                end;
             end;
             if on(37,33) then begin  { Lever 6 }
                Clear;
                if party.etc[43] and bit6 = 0 then begin
                   Print(7,' ·©Ð—·e A¤áŸi ¹ÁÃb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   party.etc[43] := party.etc[43] or bit6;
                   PutMap(25,23,40);
                   PutMap(24,24,41);
                   PutMap(27,25,40);
                   PutMap(24,26,41);
                end
                else begin
                   Print(7,' ·©Ð—·e A¤áŸi ¶Ãb·a¡ £©´ö”a.');
                   Print(7,' ‰¨·¡´á ŠW·q·¡ º—´wµA¬á ¶‰a aµÖ”a.');
                   Party.etc[43] := party.etc[43] xor bit6;
                   PutMap(25,23,41);
                   PutMap(24,24,40);
                   PutMap(27,25,41);
                   PutMap(24,26,40);
                end;
             end;
             if (on(25,9) or on(26,9)) and (party.etc[9] and bit2 = 0) then begin
                Clear;
                Print(7,' ·©Ð—·¡ ¢´åˆaµA Ñ©Ÿ¥—u ·¡ ¸aŸ¡µA ¬ö·i˜  é');
                Print(7,'Ÿ¡¬á Ó£¡Ðe ÑwÁAˆa µa‹¡¡ ”aˆaµ±·i ´i ® ·¶');
                Print(7,'´ö”a.  ‹a· ¡¡¯s·e ‹e´ñÐe ¸å¬a· ¡¡¯s·¡´ö»¡');
                Print(7,' e ¶E­¥µA“e ¤wÌˆa ´a“¥   a¤ó· »¡Ìw·¡ˆa ºá');
                Print(7,'´á¹a ·¶´ö”a. ‰¨·¡´á ‹a“e ¶Ÿ¡µA‰A  i·i ˆé‹¡');
                Print(7,'¯¡¸b Ð–”a.');
                PressAnyKey;
                enemynumber := 3;
                joinenemy(1,74);
                for i := 2 to enemynumber do joinenemy(i,69);
                DisplayEnemies(TRUE);
                Print(13,' a· ¡w¬÷·e ·¢Ó¡ —i´á¬á ¸i ´i‰¡ ·¶‰V»¡. a');
                Print(13,'“e ­A‰ ÂA‰¡· ¸åÊ  a•¡¬a·¥ ´a¯a¡¡•A¶¯a“±');
                Print(13,'·¡¯¡”a.  µa‹¡Œa»¡ Ã±ÊÐ µ¡”a“¡ ŠW¸wÐe “wb');
                Print(13,'·¡Š…. ”w¯¥‘A—i·¡ ¶Ÿ¡Íe·¡´ö”a¡e ¬w”wÓ¡ •¡¶‘');
                Print(13,'·¡ –A´ö·i ÉE•A. Ða»¡ e ´á¼é® ´ôŠ….  µa‹¡Ÿi');
                Print(13,'”w¯¥‘A—i· ¢”ñ·a¡  e—i ® ¤cµA.');
                PressAnyKey;
                enemynumber := 8;
                for i := 1 to 5 do joinenemy(i,54+i);
                for i := 6 to 7 do joinenemy(i,69);
                joinenemy(enemynumber,74);
                DisplayEnemies(TRUE);
                BattleMode(FALSE,TRUE);
                if party.etc[6] = 254 then exit;
                if (not enemy[8].dead) and (party.etc[6] = 2) then begin
                   inc(y);
                   Silent_Scroll;
                   exit;
                end;
                party.etc[9] := party.etc[9] or bit2;
                Clear;
                Print(13,' Ða»¡ e á· ¯©b·a¡•¡  ¡AÏ¡¯aÉ¡ÍIA¯a“±·e');
                Print(13,'·¡‹¡»¡ ¡µÐi ‰A”a. ‹a¦…·e ¦‰¬a ¦‰¡i· ¯¥¸â·¥');
                Print(13,'¹¥¸·¡“¡Œa.');
                Print(7,'');
                Print(7,' ´a¯a¡¡•A¶¯a“e ·¡  i·i  aÃ¡‰¡“e ³aœá¹v”a.');
             end;
             if y = 6 then begin
                if wantexit then begin
                   with party do begin
                      map := 4; xaxis := 9; yaxis := 22;
                   end;
                   Load;
                end else inc(y);
                Silent_Scroll;
             end;
             if y = 45 then begin
                if wantexit then begin
                   with party do begin
                      map := 4; xaxis := 14; yaxis := 44;
                   end;
                   Load;
                end else inc(y);
                Silent_Scroll;
             end;
          end;
      18: begin
             if (x in [18..33]) and (y in [23,26]) and (party.etc[42] and bit6 = 0) then begin
                Clear;
                enemynumber := 8;
                for i := 1 to 4 do joinenemy(i,58);
                for i := 5 to 7 do joinenemy(i,61);
                joinenemy(enemynumber,71);
                with enemy[enemynumber] do begin
                   name := 'ÂAÒ· ˆa—¡´e';
                   specialcastlevel := 1;
                end;
                DisplayEnemies(TRUE);
                Print(13,' ¸qŒe ˆá‹¡µA ¬áœa.  ”w¯¥—i·i ”á ·¡¬w ´e·a¡');
                Print(13,'—i´á ˆa‰A Ði ® ´ô”a.  µa‹¡ˆa ¤a¡ ¡AÏ¡¯aÉ¡');
                Print(13,'ÍIA¯a“±·  a»¡ b ¤w´á¬å·¡“¡Œa. µaœá i Ða»¡');
                Print(13,'´g‰V”a. ¤a¡ ‰i¸å·¡”a.');
                PressAnyKey;
                BattleMode(TRUE,TRUE);
                if party.etc[6] = 254 then exit;
                if party.etc[6] = 2 then begin
                   x := x - x1;
                   y := y - y1;
                   Silent_Scroll;
                   exit;
                end;
                party.etc[42] := party.etc[42] or bit6;
             end;
             if y = 15 then begin
                Clear;
                Print(7,' ”w¯¥·e »¢ˆq¸â·a¡ ‰i¸å· ®…ˆe·¡ ”aˆaµÖ”a“e');
                Print(7,'ˆõ·i ´i´v”a.  ¤é°á ¡AÏ¡¯aÉ¡ÍIA¯a“e ”w¯¥ ´|');
                Print(7,'·a¡ ˆé´á aµÖ‰¡, ·©Ð—·e ¸åÊ È­AŸi ÂáÐaµv');
                Print(7,'”a.');
                PressAnyKey;
                enemynumber := 1;
                joinenemy(enemynumber,75);
                DisplayEnemies(TRUE);
                Clear;
                Print(13,' ”w¯¥—i·¡  ”aÇa ¡A·¡»¡ ¯©Ÿ¡´e Äa£¡á¯a· ¬');
                Print(13,'¡¶… Èe¬—·i ¤wÐÐaœá µ¥ ¸a—i·¥ˆa ? ‹aœý»¡ e');
                Print(13,'·¡£¡ Ðe¤i “x´öŠ….  a· –õ½¢· ¬—ÁA ¤´· ËA');
                Print(13,'§a ­¢·i ¥¡‰Aa. ¸áˆõ·¡ ¬¡ ¦ÑÉÐa“e ¯©Ÿ¡´e');
                Print(13,'Äa£¡á¯aœa‘A.');
                Print(7,'');
                Print(7,' ”w¯¥·¡ ‹aˆa ˆaŸ¡Ç¡“e ‰µµA¬á ¥¥ˆõ·e  ¸ñ´‚·¡');
                Print(7,'Óiœá Ÿ¡‰¡ ·¶“e  ¦Š·e ‰¡‹¡ ”÷´áŸ¡ˆ{·e ·BÁA');
                Print(7,'µv”a.  áŸ¡µA“e ¢®Ðe ¸å‹¡ ¥··¡ ¸Ña ·¶´ö‰¡');
                Print(7,'—wµA“e  µw´·¦…·i ‰·‹sÐa“e ‰Å·¡ µe‰i –A´á ·¶');
                Print(7,'´ö”a. ·¡˜a‹q Œq¤b·¡“e ˆñ·e ’…µA¬á“e ´áŸ¥ ­¡');
                Print(7,'‘a· ’…§¹·¡ ´a“¥  »wµ¡¡ ˆa—bÀe »±¯w· ’…§¹');
                Print(7,'·i “a© ® ·¶´ö”a.');
                Print(7,'');
                Print(13,' ¸i¥Ö‰V»¡. ·¡£¡ ‹a‘a“e ¯a¯a¡· ¡±´eµA ¥··¥');
                Print(13,'–A´á ·¶“e Ó±·i Œ”p´a ¤áv»¡.  ˆa ·¡ ¯a¶á');
                Print(13,'Ã¡Ÿi ’Ÿq‰Á •·¯¡µA  ¡´á· ­A‰¡ ‰·ˆe ·¡•·');
                Print(13,'·¡ –A‰A –A´á·¶”a‘A.');
                Print(7,'');
                Print(7,' ‹a“e ‹a· ­¥´eµA ·¶“e Ÿ¡¡¡Å¥· ¯a¶áÃ¡Ÿi ’‰');
                Print(7,'œö‰¡  ®…ˆe ¯©Ÿ¡´e Äa£¡á¯a“e ‰·ˆe ·¡•··i Ða');
                Print(7,'µa ·¡‰µµA¬á ¬aœa¹v”a.');
                Print(7,'');
                Print(13,' ‹aŸ¡‰¡ ”w¯¥—i·e ˆa ÀáŸ¡Ða•¡¢ Ða»¡.  ”w');
                Print(13,'¯¥—i·e ¡´á ¬÷·¡ ¦‰Èa“e ¸w¡e·i ¡µ¥¡‰A –A´á');
                Print(13,'¸÷ i ´a®ó‰VŠ….  ´a¢Ÿ¡  ¡—a ´e·¡œa‰¡ Ð•¡');
                Print(13,'¯©Ÿ¡´e Äa£¡á¯a· ´b· Ó±µA“e  ”wÐa»¡ ¡µÐe');
                Print(13,'”a‘A. ‹a‘a“e ¦‰¡i· ¬—¡wÁA·¡“¡Œa  i·©­A.');
                Print(7,'');
                PressAnyKey;
                enemynumber := 8;
                joinenemy(1,58);
                joinenemy(2,58);
                joinenemy(3,61);
                joinenemy(4,69);
                joinenemy(5,69);
                joinenemy(6,66);
                joinenemy(7,71);
                joinenemy(8,75);
                repeat
                   DisplayEnemies(TRUE);
                   BattleMode(FALSE,TRUE);
                   if party.etc[6] = 254 then exit;
                   if (not enemy[8].dead) and (party.etc[6] = 2) then begin
                      Clear;
                      Print(7,' Ða»¡ e ¡AÏ¡¯aÉ¡ÍIA¯a“e  ·©Ð—· •¡ºŸi Ðá');
                      Print(7,'¶wÐa»¡ ´g´v”a.');
                      PressAnyKey;
                      ok := FALSE;
                   end else ok := TRUE;
                until ok;
                party.etc[9] := party.etc[9] or bit3;
                Silent_Scroll;
                Clear;
                Print(7,' ·©Ð—·¡  ¡AÏ¡¯aÉ¡ÍIA¯aŸi ¢‰Ÿ¡Ã¡‰¡“e  ¡¡—e');
                Print(7,' a¤ó· Ó±·i Ðaa¡ ¢—Áa »¡¬w·a¡ ‰·ˆe ·¡•·');
                Print(7,'·i ¯¡•¡ Ð–”a.');
                PressAnyKey;
                Delete_Scroll_Screen;
                with party do begin
                   map := 1; xaxis := 24; yaxis := 48;
                end;
                Load;
                Scroll(TRUE);
                Print(7,' ·©Ð—·e ¡´á ”ŸB·a¡ ‰·ˆe ·¡•··i Ð–”a.');
                for i := 1 to 5 do player[i].sp := 0;
                Display_Condition;
                inc(party.etc[10]);
             end;
          end;
   end;
end;

Procedure SpecialEvent;
begin
   if party.map <= 9 then SpecialEvent_Sub1 else SpecialEvent_Sub2;
end;

end.