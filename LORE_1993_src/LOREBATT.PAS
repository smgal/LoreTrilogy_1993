Unit LoreBatt;

INTERFACE

Uses
   Crt, Graph, UHanX, LoreSub, Voice, LoreMenu;

 Procedure PlusExperience(person,foe : integer);
 Procedure PlusGold;
 Procedure DisplayEnemies(clean : boolean);
 Function ExistEnemies : boolean;
 Procedure AttackOne;
 Procedure CastOne;
 Procedure CastAll;
 Procedure CastSpecial;
 Procedure BattleESP;
 Function RunAway : boolean;
 Procedure WeaponAttack;
 Procedure castattacksub(magic : string; power,num : integer);
 Procedure castattackone(num : integer);
 Procedure castattackall;
 Procedure enemycure(num, plus : integer);
 Procedure castattack;
 Procedure specialattack;
 Procedure SpecialCastAttack;
 Procedure EnemyAttack;
 Function EndBattle(var exitcode : integer) : boolean;
 Procedure BattleMode(assualt : boolean);
 Procedure randomenemy(var enemynumber: integer);
 Procedure EncounterEnemy;


IMPLEMENTATION

Procedure PlusExperience(person,foe : integer);
var
   i : byte;
   plus : longint;
begin
   plus := enemy[foe].E_number;
   plus := plus * plus * plus div 8;
   if plus = 0 then plus := 1;
   if not enemy[foe].unconscious then begin
      str(plus,s);
      cPrint(14,11,player[person].name+'“e ',s,' eÇq ‰wÐñÃ¡Ÿi ´è´ö”a !');
      with player[person] do experience := experience + plus;
   end
   else begin
      for i := 1 to 6 do if exist(i) then
      player[i].experience := player[i].experience + plus;
   end;
end;

Procedure PlusGold;
var
   long, plus : longint;
begin
   if party.etc[6] = 2 then exit;
   long := 0;
   for i := 1 to enemynumber do begin
      j := enemy[i].E_number;
      k := enemydata[j].ac;
      if k = 0 then k := 1;
      with enemydata[j] do begin
         plus := level;
         plus := plus * level;
         plus := plus * level;
         plus := plus * k;
         long := long + plus;
      end;
   end;
   party.gold := party.gold + long;
   str(long,s);
   message(15,'·©Ð—·e '+s+'ˆ· ‹q·i ´è´ö”a.');
end;

Procedure DisplayEnemies(clean : boolean);
begin
   if clean then begin
      SetFillStyle(1,0);
      Bar(20,20,199,199);
      SetFillStyle(1,8);
   end;
   for i:= 1 to enemynumber do
   with enemy[i] do begin
      case hp of
         0 : SetColor(8);
         1..19 : SetColor(12);
         20..49 : SetColor(4);
         50..99 : SetColor(6);
         100..199 : SetColor(14);
         200..299 : SetColor(2)
         else SetColor(10);
      end;
      if unconscious then SetColor(8);
      if dead then SetColor(0);
      OutTextXY(50,20*i+20,name);
   end;
end;

Function ExistEnemies : boolean;
var
   i,j : integer;
begin
   j := 0;
   for i := 1 to enemynumber do
   if not enemy[i].dead then inc(j);
   if j = 0 then ExistEnemies := FALSE else ExistEnemies := TRUE;
end;

Procedure AttackOne;
begin
   returnsexdata;
   k := battle[person,3];
   if enemy[k].dead then begin
      if not ExistEnemies then exit;
      battle[person,3] := battle[person,3] + 1;
      k := k + 1;
      if battle[person,3] <= enemynumber then AttackOne;
      exit;
   end;
   s := ReturnMessage(person,battle[person,1],person,battle[person,3]);
   Print(15,s);
   if enemy[k].unconscious and not enemy[k].dead then begin
      case random(4) of
         0 : Print(12,sexdata+'· ¢‹¡ˆa '+enemy[k].name+'· ¯±¸w·i ŽÁš´ö”a');
         1 : Print(12,enemy[k].name+'·  áŸ¡“e '+sexdata+'· ‰·‰b·a¡ ¬e¬e ¹¡ˆb·¡ v”a');
         2 : Print(12,'¸â· Ï¡ˆa ¬a¤wµA ªa¹v”a');
         3 : Print(12,'¸â·e §¡¡w‰Á ÐqA ¿¸‰a aˆv”a');
      end;
      if soundon then scream2;
      PlusExperience(person,k);
      enemy[k].hp := 0;
      enemy[k].dead := TRUE;
      exit;
   end;
   if (random(20) > player[person].accuracy[1]) then begin
      Print(7,sexdata+'· ‰·‰b·e §µaˆv”a ....');
      exit;
   end;
   with player[person] do i := round(strength * wea_power * level[1] div 20);
   i := i - i * random(50) div 100;
   if random(100) < enemy[k].resistance then begin
      Print(7,'¸â·e '+sexdata+'· ‰·‰b·i ¸á»¡Ð–”a');
      exit;
   end;
   with enemy[k] do j := round(ac * level * (random(10)+1) / 10);
   i := i - j;
   if i <= 0 then begin
      Print(7,'‹aœáa, ¸â·e '+sexdata+'· ‰·‰b·i  b´v”a');
      exit;
   end;
   with enemy[k] do begin
      hp := hp - i;
      str(i,s);
      if hp <= 0 then begin
         hp := 0;
         unconscious := FALSE; dead := FALSE;
         Print(12,'¸â·e '+sexdata+'· ‰·‰b·a¡ ·¯¢¦‰¡w·¡ –A´ö”a');
         if soundon then hit;
         PlusExperience(person,k);
         unconscious := TRUE;
      end
      else begin
         cPrint(7,15,'¸â·e ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
         if soundon then hit;
      end;
      DisplayEnemies(FALSE);
   end;
end;

Procedure CastOne;
begin
   returnsexdata;
   j := battle[person,2];
   k := battle[person,3];
   if enemy[k].dead then begin
      if not ExistEnemies then exit;
      battle[person,3] := battle[person,3] + 1;
      k := k + 1;
      if battle[person,3] <= enemynumber then castone;
      exit;
   end;
   s := ReturnMessage(person,battle[person,1],battle[person,2],battle[person,3]);
   Print(15,s);
   if enemy[k].unconscious then begin
      Print(12,sexdata+'·  a¤ó·e ¸â· ¯¡ÁA ¶áµA¬á ¸bµiÐ–”a');
      if soundon then scream1;
      PlusExperience(person,k);
      enemy[k].hp := 0;
      enemy[k].dead := TRUE;
      DisplayEnemies(FALSE);
      exit;
   end;
   with player[person] do begin
      i := round(level[2]*j*j/2);
      if sp < i then begin
         Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
         exit;
      end;
      sp := sp - i;
      if random(20) >= accuracy[2] then begin
         Print(7,'‹aœáa, '+enemy[k].name+'Ÿi §µaˆv”a');
         exit;
      end;
      i := round(j * j * level[2] * 2);
   end;
   if random(100) < enemy[k].resistance then begin
      Print(7,enemy[k].name+'“e '+sexdata+'·  a¤ó·i ¸á»¡Ð–”a');
      exit;
   end;
   with enemy[k] do j := round(ac * level * (random(10)+1) / 10);
   i := i - j;
   if i <= 0 then begin
      Print(7,'‹aœáa, '+enemy[k].name+'“e '+sexdata+'·  a¤ó ‰·‰b·i  b´v”a');
      exit;
   end;
   with enemy[k] do begin
      hp := hp - i;
      str(i,s);
      if hp <= 0 then begin
         Print(12,name+'“e '+sexdata+'·  a¤óµA ·Ð ·¯¢¦‰“w·¡ –A´ö”a');
         if soundon then hit;
         PlusExperience(person,k);
         hp := 0;
         unconscious := TRUE;
      end
      else begin
         cPrint(7,15,name+'“e ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
         if soundon then hit;
      end;
      DisplayEnemies(FALSE);
   end;
end;

Procedure CastAll;
begin
   battle[person,3] := 1;
   while battle[person,3] <= enemynumber do begin
      CastOne;
      inc(battle[person,3]);
   end;
end;

Procedure CastSpecial;
begin
   if party.etc[38] and bit1 = 0 then begin
      Print(7,'”w¯¥µA‰A“e ´a»¢ “wb·¡ ´ô”a.');
      exit;
   end;
   case battle[person,2] of
      1 : with enemy[battle[person,3]] do begin
             if player[person].sp < 10 then begin
                Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                exit;
             end;
             player[person].sp := player[person].sp - 10;
             if random(100) < resistance then begin
                Print(7,'¸â·e •¢ ‰·‰b·i ¸á»¡ Ð–”a');
                exit;
             end;
             if random(40) > player[person].accuracy[2] then begin
                Print(7,'•¢ ‰·‰b·e §µaˆv”a');
                exit;
             end;
             Print(4,name+'“e º—•¢ –A´ö”a');
             poison := TRUE;
          end;
      2 : with enemy[battle[person,3]] do begin
             if player[person].sp < 30 then begin
                Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                exit;
             end;
             player[person].sp := player[person].sp - 30;
             if random(100) < resistance then begin
                Print(7,'‹¡®‰ ¢bÑÁ ‰·‰b·e ¸á»¡ ”wÐ–”a');
                exit;
             end;
             if random(60) > player[person].accuracy[2] then begin
                Print(7,'‹¡®‰ ¢bÑÁ ‰·‰b·e §µaˆv”a');
                exit;
             end;
             Print(4,name+'· Ëb® ‰·‰b “wb·¡ ¹Aˆá–A´ö”a');
             special := 0;
          end;
      3 : with enemy[battle[person,3]] do begin
             if player[person].sp < 15 then begin
                Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                exit;
             end;
             player[person].sp := player[person].sp - 15;
             if random(100) < resistance then begin
                Print(7,'¤w´á ¢bÑÁ ‰·‰b·e ¸á»¡ ”wÐ–”a');
                exit;
             end;
             if ac < 5 then j := 40 else j := 25;
             if random(j) > player[person].accuracy[2] then begin
                Print(7,'¤w´á ¢bÑÁ ‰·‰b·e §µaˆv”a');
                exit;
             end;
             Print(4,name+'· ¤w´á “wb·¡ ¸áÐa–A´ö”a');
             if (resistance < 31) or (random(2) = 0) then dec(ac)
             else resistance := resistance - 10;
          end;
      4 : with enemy[battle[person,3]] do begin
             if player[person].sp < 20 then begin
                Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                exit;
             end;
             player[person].sp := player[person].sp - 20;
             if random(200) < resistance then begin
                Print(7,'“wb ¸áÐa ‰·‰b·e ¸á»¡ ”wÐ–”a');
                exit;
             end;
             if random(30) > player[person].accuracy[2] then begin
                Print(7,'“wb ¸áÐa ‰·‰b·e §µaˆv”a');
                exit;
             end;
             Print(4,name+'· ¸åÁA¸â·¥ “wb·¡ ¸áÐa–A´ö”a');
             if level > 1 then dec(level);
             if resistance > 0 then resistance := resistance - 10
             else resistance := 0;
          end;
      5 : with enemy[battle[person,3]] do begin
             if player[person].sp < 15 then begin
                Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                exit;
             end;
             player[person].sp := player[person].sp - 15;
             if random(100) < resistance then begin
                Print(7,' a¤ó ¦‰“w ‰·‰b·e ¸á»¡ ”wÐ–”a');
                exit;
             end;
             if random(100) > player[person].accuracy[2] then begin
                Print(7,' a¤ó ¦‰“w ‰·‰b·e §µaˆv”a');
                exit;
             end;
             if castlevel > 1 then Print(4,name+'·  a¤ó “wb·¡ ¸áÐa–A´ö”a')
             else Print(4,name+'·  a¤ó “wb·e ¬aœa¹v”a');
             if castlevel > 0 then dec(castlevel);
          end;
      6 : with enemy[battle[person,3]] do begin
             if player[person].sp < 20 then begin
                Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                exit;
             end;
             player[person].sp := player[person].sp - 20;
             if random(100) < resistance then begin
                Print(7,'Èi Á¡·¥ÑÁ ‰·‰b·e ¸á»¡ ”wÐ–”a');
                exit;
             end;
             if random(100) > player[person].accuracy[2] then begin
                Print(7,'Èi Á¡·¥ÑÁ ‰·‰b·e §µaˆv”a');
                exit;
             end;
             if specialcastlevel > 1 then
                Print(4,name+'· Á¡¸aµe¸â “wb·¡ ¸áÐa–A´ö”a')
             else Print(4,name+'· Á¡¸aµe¸â “wb·e ¬aœa¹v”a');
             if specialcastlevel > 0 then dec(specialcastlevel);
          end;
   end;
end;

Procedure BattleESP;
begin
   if not ((player[person].class in [2,3,6]) or (party.etc[39] and bit1 > 0)) then begin
      Print(7,'”w¯¥µA‰A“e ´a»¢ “wb·¡ ´ô”a.');
      exit;
   end;
   if battle[person,2] in [1,2,4] then begin
      Print(7,ReturnMagic(battle[person,2]+40)+'“e ¸åÊ¡¡—aµA¬á“e ¬a¶wÐi ®ˆa ´ô¯s“¡”a.');
      exit;
   end;
   if battle[person,2] = 3 then
   with enemy[battle[person,3]] do begin
      if player[person].esp < 15 then begin
         Print(7,'Á¡ˆqˆb »¡®ˆa ¦¹¢Ð–”a');
         exit;
      end;
      player[person].esp := player[person].esp - 15;
      if not (E_number in [6,10,20,24,27,29,33,35,40,47,53,62]) then begin
         Print(7,'•¢¯±®‰·e ¸åÑa É·Ða»¡ ´g´v”a');
         exit;
      end;
      j := level;
      if E_number = 62 then j := 17;
      if (j > player[person].level[3]) and (random(2) = 0) then begin
         Print(7,'¸â·  a·q·i i´á—i·¡‹¡µA“e ´a»¢ “wb·¡ ¦¹¢Ð–”a');
         exit;
      end;
      if random(60) > (player[person].level[3]-j)*2 + player[person].accuracy[3] then begin
         Print(7,'¸â·  a·q·e Óe—iŸ¡»¡ ´g´v”a');
         exit;
      end;
      Print(11,'¸â·e ¶Ÿ¡· Íe·¡ –A´ö”a');
      join(E_number,6);
      dead := TRUE; unconscious := TRUE; hp := 0; level := 0;
      Display_Condition;
   end
   else begin
      if player[person].esp < 20 then begin
         Print(7,'Á¡ˆqˆb »¡®ˆa ¦¹¢Ð–”a');
         exit;
      end;
      player[person].esp := player[person].esp - 20;
      k := random(player[person].level[3]) + 1;
      ReturnSexData;
      case k of
         1..6 : begin
                   case k of
                      1,2 : Print(7,'º¶á· •©—i·¡ ˜áµ©œa '+
                            enemy[battle[person,3]].name + 'Ÿi ‰·‰bÐa‹¡ ¯¡¸bÐe”a');
                      3,4 : Print(7,enemy[battle[person,3]].name +
                            ' º¶á· ­A‹E·¡ ‹aµA‰A Ã±ÊÐaµa ÐŸi ·³Ó¡‹¡ ¯¡¸bÐe”a');
                      5,6 : Print(7,sexdata + '· ¢‹¡ˆa ˆs¸a‹¡ '+
                            enemy[battle[person,3]].name + 'µA‰A ”ia—i‹¡ ¯¡¸bÐe”a');
                   end;
                   j := enemy[battle[person,3]].hp;
                   if j < k * 10 then j := 0 else j := j - k * 10;
                   enemy[battle[person,3]].hp := j;
                   if enemy[battle[person,3]].unconscious
                   and not enemy[battle[person,3]].dead then begin
                      enemy[battle[person,3]].dead := TRUE;
                      plusexperience(person,battle[person,3]);
                   end;
                   if (j=0) and not enemy[battle[person,3]].unconscious then begin
                      enemy[battle[person,3]].unconscious := TRUE;
                      plusexperience(person,battle[person,3]);
                   end;
                end;
         7..10 : begin
                    case k of
                       7,8 : begin
                                Print(7,'ˆs¸a‹¡ ˜w­¢· ¶œa“Q·¡ Ð‚¦…µi·i ·©·aÅa ‰¡µ¥');
                                Print(7,'· µi‹¡ˆa ¸â· º¶áŸi ˆq°a‹¡ ¯¡¸bÐe”a');
                             end;
                       9,10 : begin
                                 Print(7,'‰·‹¡º—· ®­¡ˆa •©µeÓ¡ Ð‚·WÐs·i ·©·aÅa »©œ·');
                                 Print(7,'‰i­¥· µAá»¡Ÿi ¸â—iµA‰A ¤wÂ‰Ða‹¡ ¯¡¸bÐe”a');
                              end;
                    end;
                    for i := 1 to enemynumber do begin
                       j := enemy[i].hp;
                       if j < k * 5 then j := 0 else j := j - k * 5;
                       enemy[i].hp := j;
                       if enemy[i].unconscious and not enemy[i].dead then begin
                          enemy[i].dead := TRUE;
                          plusexperience(person,battle[person,3]);
                       end;
                       if (j=0) and not enemy[i].unconscious then begin
                          enemy[i].unconscious := TRUE;
                          plusexperience(person,i);
                       end;
                    end;
                 end;
         11..12 : begin
                     Print(7,sexdata + '“e ¸âµA‰A ‰·Í¡¯±·i ¦‰´á ý´ö”a');
                     j := battle[person,3];
                     if random(40) < enemy[j].resistance then begin
                        if enemy[j].resistance < 5 then enemy[j].resistance := 0
                        else enemy[j].resistance := enemy[j].resistance - 5;
                        exit;
                     end;
                     if random(60) > player[person].accuracy[3] then begin
                        if enemy[j].endurance < 5 then enemy[j].endurance := 0
                        else enemy[j].endurance := enemy[j].endurance - 5;
                        exit;
                     end;
                     enemy[j].dead := TRUE;
                     Print(10,enemy[j].name + '“e ˆó·i  â‰¡“e •¡ w ˆa¤áv”a');
                  end;
         13..14 : begin
                     auxPrint(7,sexdata + '“e ¸â· ¯¥»¥ ”¬aŸi ¹¡¸éÐaµa ¸â· ',TRUE);
                     auxPrint(7,'ÁAb·i ¸ñÀa ´¢ÑÁ ¯¡Ç¡a Ðe”a',FALSE);
                     if random(100) < enemy[battle[person,3]].resistance then exit;
                     if random(40) > player[person].accuracy[3] then exit;
                     enemy[battle[person,3]].poison := TRUE;
                  end;
         15..17 : begin
                     Print(7,sexdata + '“e µqb·a¡ ¸â· ¯±¸w·i  ñÂa Ðe”a');
                     j := battle[person,3];
                     if random(40) < enemy[j].resistance then begin
                        if enemy[j].resistance < 5 then enemy[j].resistance := 0
                        else enemy[j].resistance := enemy[j].resistance - 5;
                        exit;
                     end;
                     if random(80) > player[person].accuracy[3] then begin
                        if enemy[j].hp < 10 then begin
                           enemy[j].hp := 0;
                           enemy[j].unconscious := TRUE;
                        end
                        else enemy[j].hp := enemy[j].hp - 5;
                        exit;
                     end;
                     enemy[j].unconscious := TRUE;
                  end
         else begin
                 Print(7,sexdata + '“e ¸â·i ÑÅ¬w­¢µA ¨a»¡‰A ÐaaÐe”a');
                 j := battle[person,3];
                 if random(40) < enemy[j].resistance then begin
                    if enemy[j].agility < 5 then enemy[j].agility := 0
                    else enemy[j].agility := enemy[j].agility - 5;
                    exit;
                 end;
                 if random(30) > player[person].accuracy[3] then exit;
                 for i := 1 to 2 do
                 if enemy[j].accuracy[i] > 0 then
                    dec(enemy[j].accuracy[i]);
              end;
      end;
      DisplayEnemies(FALSE);
   end;
end;

Function RunAway : boolean;
begin
   if Random(50) > player[person].agility then begin
      RunAway := FALSE;
      Print(7,'‹aœáa, ·©Ð—·e ¬÷‰·Ða»¡ ¡µÐ–”a');
   end
   else begin
           RunAway := TRUE;
           Print(11,'¬÷‰·¸â·a¡ •¡ w·i ˆv”a');
   end;
end;

Procedure WeaponAttack;
var
   i,j,k,h : integer;
begin
   with enemy[person] do begin;
      if random(20) >= accuracy[1] then begin
         Print(7,name+'“e §µ xÂ´ö”a');
         exit;
      end;
      k := 0;
      for i := 1 to 6 do if exist(i) then inc(k);
      h := random(k)+1;
      k := 0; j := 0;
      for i := 1 to 6 do if exist(i) then begin
         inc(k);
         if k = h then j := i;
      end;
      if j = 0 then j := random(6) + 1;
      if player[j].name = '' then j := random(5) + 1;
      i := strength * level * (random(10)+1) div 10;
      if exist(j) then
      if random(50) < player[j].resistance then begin
         Print(13,name+'“e '+player[j].name+'Ÿi ‰·‰bÐ–”a');
         Print(7,'‹aœáa, '+player[j].name+'“e ¸â· ‰·‰b·i ¸á»¡Ð–”a');
         exit;
      end;
      if exist(j) then
         i := i - (player[j].ac * player[j].level[1] * (random(10)+1) div 10);
      if i <= 0 then begin
         Print(13,name+'“e '+player[j].name+'Ÿi ‰·‰bÐ–”a');
         Print(7,'‹aœáa, '+player[j].name+'“e ¸â· ‰·‰b·i ¤w´áÐ–”a');
         exit;
      end;
      if player[j].dead > 0 then player[j].dead := player[j].dead + i;
      if (player[j].unconscious > 0) and (player[j].dead = 0) then
         player[j].unconscious := player[j].unconscious + i;
      if player[j].hp > 0 then player[j].hp := player[j].hp - i;
      Print(13,player[j].name+'“e '+name+'µA‰A ‰·‰b ¤h´v”a');
      str(i,s);
      cPrint(5,13,player[j].name+'“e ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
   end;
end;

Procedure castattacksub(magic : string; power,num : integer);
begin
   with enemy[person] do begin
      if random(20) >= accuracy[2] then begin
         Print(7,name+'·  a¤ó‰·‰b·e §µaˆv”a');
         exit;
      end;
      if exist(num) then
      if random(50) < player[num].resistance then begin
         Print(7,'‹aœáa, '+player[num].name+'“e ¸â·  a¤ó·i ¸á»¡Ð–”a');
         exit;
      end;
      power := power - random(power div 2);
      if exist(num) then
         power := power -
         (player[num].ac * player[num].level[1] * (random(10)+1) div 10);
      if power <= 0 then begin
         Print(7,'‹aœáa, '+player[num].name+'“e ¸â·  a¤ó·i  b´a–”a');
         exit;
      end;
      if player[num].dead > 0 then player[num].dead := player[num].dead + power;
      if (player[num].unconscious > 0) and (player[num].dead = 0) then
         player[num].unconscious := player[num].unconscious + power;
      if player[num].hp > 0 then player[num].hp := player[num].hp - power;
      str(power,s);
      cPrint(5,13,player[num].name+'“e ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
   end;
end;

Procedure castattackone(num : integer);
begin
   with enemy[person] do begin
      case mentality of
         1..3 : begin
                   s := 'Â—‰b';
                   k := 1;
                end;
         4..8 : begin
                   s := '—‹¡';
                   k := 2;
                end;
         9..10 : begin
                    s := '‰¡É·';
                    k := 4;
                 end;
         11..14 : begin
                     s := 'Ñ¢Ðe';
                     k := 6;
                  end;
         15..18 : begin
                     s := 'ÑÁµq';
                     k := 7;
                  end
         else begin
            s := '¤åˆ';
            k := 10;
         end;
      end;
      i := k * level;
      Print(13,enemy[person].name+'“e '
         +player[num].name+'µA‰A '''+s+''' a¤ó·i ¬a¶wÐ–”a');
      castattacksub(s,i,num);
   end;
end;

Procedure castattackall;
var
   method : string;
begin
   case enemy[person].mentality of
      1..6 : begin
                method := 'µiÌa';
                k := 1;
             end;
      7..12 : begin
                 method := 'µAá»¡';
                 k := 2;
              end;
      13..16 : begin
                  method := 'Á¡·qÌa';
                  k := 3;
               end;
      17..20 : begin
                  method := 'Ñ¢Ðe‹¡';
                  k := 5;
               end
      else begin
         method := 'ÑÁµqÍ¢Î—';
         k := 8;
      end;
   end;
   i := k * enemy[person].level;
   Print(13,enemy[person].name+'“e ·©Ð— ¡¡–µA‰A '''+method+''' a¤ó·i ¬a¶wÐ–”a');
   for j := 1 to 6 do castattacksub(method,i,j);
end;

Procedure enemycure(num, plus : integer);
begin
   if person = num then Print(13,enemy[person].name+'“e ¸a¯¥·i Ã¡žaÐ–”a')
   else Print(13,enemy[person].name+'“e '+enemy[num].name+'Ÿi Ã¡žaÐ–”a');
   if enemy[num].dead then enemy[num].dead := FALSE
   else if enemy[num].unconscious then begin
      enemy[num].unconscious := FALSE;
      if enemy[num].hp <= 0 then enemy[num].hp := 1;
   end
   else begin
      enemy[num].hp := enemy[num].hp + plus;
      if enemy[num].hp > enemy[num].endurance * enemy[num].level then
      enemy[num].hp := enemy[num].endurance * enemy[num].level;
   end;
end;

Procedure castattack;
var
   i,j,k : integer;
begin
   case enemy[person].castlevel of
      1 : begin
             if player[6].name = '' then k := 5 else k := 6;
             j := random(k) + 1;
             if not exist(j) then j := random(k) + 1;
             castattackone(j);
          end;
      2 : begin
             k := 0;
             for i := 1 to 6 do if exist(i) then inc(k);
             h := random(k)+1;
             k := 0; j := 0;
             for i := 1 to 6 do if exist(i) then begin
                inc(k);
                if k = h then j := i;
             end;
             if j = 0 then j := random(6) + 1;
             if player[j].name = '' then j := random(5) + 1;
             castattackone(j);
          end;
      3 : begin
             k := 0;
             for i := 1 to 6 do if exist(i) then inc(k);
             if random(k) < 2 then begin
                k := 0;
                for i := 1 to 6 do if exist(i) then inc(k);
                h := random(k)+1;
                k := 0; j := 0;
                for i := 1 to 6 do if exist(i) then begin
                   inc(k);
                   if k = h then j := i;
                end;
                if j = 0 then j := random(6) + 1;
                if player[j].name = '' then j := random(5) + 1;
                castattackone(j);
             end
             else castattackall;
          end;
      4 : with enemy[person] do begin
             if (hp < endurance * level div 3) and (random(2) = 0) then
                enemycure(person,level * mentality div 4)
             else begin
                k := 0;
                for i := 1 to 6 do if exist(i) then inc(k);
                if random(k) < 2 then begin
                   k := 0;
                   for i := 1 to 6 do if exist(i) then inc(k);
                   h := random(k)+1;
                   k := 0; j := 0;
                   for i := 1 to 6 do if exist(i) then begin
                      inc(k);
                      if k = h then j := i;
                   end;
                   if j = 0 then j := random(6) + 1;
                   if player[j].name = '' then j := random(5) + 1;
                   castattackone(j);
                end
                else castattackall;
             end;
          end;
      5 : with enemy[person] do begin
             if (hp < endurance * level div 3) and (random(3)=0) then
                enemycure(person,level * mentality div 4)
             else begin
                k := 0;
                for i := 1 to 6 do if exist(i) then inc(k);
                if random(k) < 2 then begin
                   j := 0; k := 0;
                   for i := 1 to enemynumber do j := j + enemy[i].hp;
                   for i := 1 to enemynumber do k := k + enemy[i].endurance * enemy[i].level;
                   k := k div 3;
                   if (enemynumber>2) and (j<k) and (random(2)=0) then
                   for i := 1 to enemynumber do enemycure(i,level * mentality div 6)
                   else begin
                      j := 1;
                      for i := 6 downto 1 do if exist(i) then j := i;
                      for i := 2 to 6 do if exist(i) and (player[i].hp<player[j].hp) then j := i;
                      castattackone(j);
                   end;
                end
                else castattackall;
             end;
          end;
      6 : with enemy[person] do begin
             if (hp < endurance * level div 3) and (random(3)=0) then begin
                enemycure(person,level * mentality div 4);
                exit;
             end;
             j := 0; k := 0;
             for i := 1 to 6 do if player[i].name <> '' then begin
                inc(j);
                k := k + player[i].ac;
             end;
             k := k div j;
             if (k>4) and (random(5)=0) then begin
                for i := 1 to 6 do if player[i].name <> '' then begin
                   Print(13,name+'“e '+player[i].name+'· ˆsµµÌaŠAŸi ¯¡•¡Ð–”a');
                   if player[i].luck > random(21) then Print(7,'‹aœáa, '+name+'“e ¬÷‰·Ða»¡ ¡µÐ–”a')
                   else begin
                      Print(5,player[i].name+'· ˆsµµ·e ÌaŠA–A´ö”a');
                      if player[i].ac > 0 then dec(player[i].ac);
                   end;
                end;
                display_condition;
             end
             else begin
                j := 0; k := 0;
                for i := 1 to enemynumber do j := j + enemy[i].hp;
                for i := 1 to enemynumber do k := k + enemy[i].endurance * enemy[i].level;
                k := k div 3;
                if (enemynumber>2) and (j<k) and (random(3)<>0) then
                for i := 1 to enemynumber do enemycure(i,level * mentality div 6)
                else begin
                   k := 0;
                   for i := 1 to 6 do if exist(i) then inc(k);
                   if random(k) < 2 then begin
                      j := 1;
                      for i := 6 downto 1 do if exist(i) then j := i;
                      for i := 2 to 6 do if exist(i) and (player[i].hp<player[j].hp) then
                         j := i;
                      castattackone(j);
                   end else castattackall;
                end;
             end;
          end;
   end;
end;

Procedure specialattack;
begin
   with enemy[person] do
   case special of
      1 : begin
             k := 0;
             for i := 1 to 6 do if player[i].poison = 0 then inc(k);
             h := random(k)+1;
             k := 0; j := 0;
             for i := 1 to 6 do if player[i].poison = 0 then begin
                inc(k);
                if k = h then j := i;
             end;
             if j = 0 then j := random(6) + 1;
             if player[j].name = '' then j := random(5) + 1;
             Print(13,name+'“e '+player[j].name+'µA‰A •¢ ‰·‰b·i ¯¡•¡Ð–”a');
             if random(40) > agility then begin
                Print(7,'•¢ ‰·‰b·e ¯©ÌÐ–”a');
                exit;
             end;
             if random(20) < player[j].luck then begin
                Print(7,'‹aœáa, '+player[j].name+'“e •¢ ‰·‰b·i Ï¡Ð–”a');
                exit;
             end;
             Print(4,player[j].name+'“e º—•¢ –A´ö”a !!');
             if player[j].poison = 0 then player[j].poison := 1;
          end;
      2 : begin
             k := 0;
             for i := 1 to 6 do if player[i].unconscious = 0 then inc(k);
             h := random(k)+1;
             k := 0; j := 0;
             for i := 1 to 6 do if player[i].unconscious = 0 then begin
                inc(k);
                if k = h then j := i;
             end;
             if j = 0 then j := random(6) + 1;
             if player[j].name = '' then j := random(5) + 1;
             Print(13,name+'“e '+player[j].name+'µA‰A Ã¡¡w¸â ‰·‰b·i ¯¡•¡Ð–”a');
             if random(50) > agility then begin
                Print(7,'Ã¡¡w¸â ‰·‰b·e ¯©ÌÐ–”a');
                exit;
             end;
             if random(20) < player[j].luck then begin
                Print(7,'‹aœáa, '+player[j].name+'“e Ã¡¡w¸â ‰·‰b·i Ï¡Ð–”a');
                exit;
             end;
             Print(4,player[j].name+'“e ·¯¢¦‰¡w·¡ –A´ö”a !!');
             if player[j].unconscious = 0 then begin
                player[j].unconscious := 1;
                if player[j].hp > 0 then player[j].hp := 0;
             end;
          end;
      3 : begin
             k := 0;
             for i := 1 to 6 do if player[i].dead = 0 then inc(k);
             h := random(k)+1;
             k := 0; j := 0;
             for i := 1 to 6 do if player[i].dead = 0 then begin
                inc(k);
                if k = h then j := i;
             end;
             if j = 0 then j := random(6) + 1;
             if player[j].name = '' then j := random(5) + 1;
             Print(13,name+'“e '+player[j].name+'µA‰A º‚·q· ‰·‰b·i ¯¡•¡Ð–”a');
             if random(60) > agility then begin
                Print(7,'º‚·q· ‰·‰b·e ¯©ÌÐ–”a');
                exit;
             end;
             if random(20) < player[j].luck then begin
                Print(7,'‹aœáa, '+player[j].name+'“e º‚·q· ‰·‰b·i Ï¡Ð–”a');
                exit;
             end;
             Print(4,player[j].name+'“e º‚´ö”a !!');
             if player[j].dead = 0 then begin
                player[j].dead := 1;
                if player[j].hp > 0 then player[j].hp := 0;
             end;
          end;
   end;
end;

Procedure SpecialCastAttack;
begin
   with enemy[person] do begin
      if E_Number = 1 then exit;
      j := 0; k := enemynumber;
      for i := enemynumber downto 1 do
      if not enemy[i].dead then inc(j)
      else k := i;
      if (j < random(3)+2) and (random(3) = 0) then begin
         if enemynumber < 7 then begin
            inc(enemynumber);
            k := enemynumber;
         end;
         joinenemy(k,E_number + random(4) - 20);
         displayenemies(TRUE);
         Print(13,name+'“e '+enemy[k].name+'Ÿi ¬—¬÷¯¡Åv”a');
      end;
      if specialcastlevel > 1 then begin
         j := 0; k := enemynumber;
         for i := enemynumber downto 1 do
         if not enemy[i].dead then inc(j)
         else k := i;
         if (player[6].name <> '') and (j < 7) and (random(5) = 0) then begin
            if enemynumber < 7 then begin
               inc(enemynumber);
               k := enemynumber;
            end;
            turn_mind(k,6);
            player[6].name := '';
            Display_Condition;
            displayenemies(TRUE);
            Print(13,name+'ˆa •¢¯±®‰·i ¬a¶wÐaµa '+enemy[k].name+
                     '·i ¸a‹¡Íe·a¡ i´á—iµv”a');
         end;
      end;
      if specialcastlevel > 2 then begin
         if special = 0 then exit;
         if random(5) = 0 then
         for k := 1 to 6 do
         if (player[k].dead = 0) and (player[k].name <> '') then begin
             Print(13,name+'“e '+player[k].name+'µA‰A º‚·q· ‰·‰b·i ¯¡•¡Ð–”a');
             if random(60) > agility then Print(7,'º‚·q· ‰·‰b·e ¯©ÌÐ–”a')
             else if random(20) < player[k].luck then
             Print(7,'‹aœáa, '+player[k].name+'“e º‚·q· ‰·‰b·i Ï¡Ð–”a')
             else begin
                Print(4,player[k].name+'“e º‚´ö”a !!');
                if player[k].dead = 0 then begin
                   player[k].dead := 1;
                   if player[k].hp > 0 then player[k].hp := 0;
                end;
             end;
         end;
      end;
   end;
end;

Procedure EnemyAttack;
var
   i,j : integer;
begin
   if enemy[person].specialcastlevel > 0 then specialcastattack;
   i := enemy[person].agility;
   if i > 20 then i := 20;
   if (enemy[person].special>0) and (random(50)<i) then begin
      j := 0;
      for i := 1 to enemynumber do
      if not (enemy[i].unconscious or enemy[i].dead) then inc(j);
      if j > 3 then begin
         specialattack;
         exit;
      end;
   end;
   if (random(enemy[person].accuracy[1]*1000) > random(enemy[person].accuracy[2]*1000))
   and (enemy[person].strength > 0) then weaponattack else castattack;
end;

Function EndBattle(var exitcode : integer) : boolean;
var
   i,j : integer;
begin
   i := 0; j := 0;
   for person := 1 to 6 do
   with player[person] do
   if name <> '' then begin
      i := i + 1;
      if not exist(person) then j := j + 1;
   end;
   if i = j then begin
      exitcode := 1; { Lost in Battle }
      EndBattle := TRUE;
      exit;
   end;
   i := 0; j := 0;
   for person := 1 to enemynumber do
   with enemy[person] do begin
      i := i + 1;
      if dead or unconscious then j := j + 1;
   end;
   if i = j then begin
      exitcode := 0; { Win in Battle }
      EndBattle := TRUE;
      exit;
   end;
   EndBattle := FALSE;
end;

Procedure BattleMode(assualt : boolean);
label loop;
begin
   party.etc[6] := 1;
   repeat begin
      if not assualt then begin
         assualt := TRUE;
         goto loop;
      end;
      for person := 1 to 6 do battle[person,1] := 0;
      DisplayEnemies(FALSE);
      autobattle := FALSE;
      for person := 1 to 6 do
      if exist(person) then begin
         if not autobattle then begin
            m[0] := player[person].name + '· ¸åÊ ¡¡—a ===>';
            m[1] := 'Ðe ¡w· ¸â·i '+ReturnWeapon(player[person].weapon)+Josa+'¡ ‰·‰b';
            m[2] := 'Ðe ¡w· ¸âµA‰A  a¤ó ‰·‰b';
            m[3] := '¡¡—e ¸âµA‰A  a¤ó ‰·‰b';
            m[4] := '¸âµA‰A Ëb®  a¤ó ‰·‰b';
            m[5] := '·©Ð—·i Ã¡ža';
            m[6] := '¸âµA‰A Á¡“wb ¬a¶w';
            m[7] := '•¡ w·i ¯¡•¡Ðq';
            if person = 1 then m[7] := '·©Ð—µA‰A ¢¹¡ˆå ‰·‰b Ði ˆõ·i »¡¯¡';
            k := Select(60,7,7,TRUE,FALSE);
            if k<>1 then Clear;
            m[1] := '´ô·q';
            if (k = 7) and (person = 1) then begin
               k := 8;
               autobattle := TRUE;
            end;
         end
         else k := 8;
         battle[person,1] := k;
         case k of
            8 : case player[person].class of
                   0,1,4..8,10 : begin
                                    battle[person,1] := 1;
                                    battle[person,2] := player[person].weapon;
                                    battle[person,3] := 1;
                                 end;
                   2,9 : begin
                            battle[person,1] := 2;
                            case player[person].level[2] of
                               0..1 : i := 1;
                               2..3 : i := 2;
                               4..7 : i := 3;
                               8..11 : i := 4;
                               12..15 : i := 5
                               else i := 6;
                            end;
                            i := round(i/2);
                            if i = 0 then i := 1;
                            battle[person,2] := i;
                            battle[person,3] := 1;
                         end;
                   3 : begin
                          battle[person,1] := 6;
                          battle[person,2] := 5;
                          j := 1;
                          for i := 1 to enemynumber do
                          if not (enemy[i].unconscious or enemy[i].dead) then j := i;
                          battle[person,3] := j;
                       end;
                end;
            1 : begin
                   j := SelectEnemy;
                   Clear;
                   if j = 0 then battle[person,1] := 0;
                   battle[person,2] := player[person].weapon;
                   battle[person,3] := j;
                end;
            2 : begin
                   for j := 1 to 6 do m[j+1] := ReturnMagic(j);
                   case player[person].level[2] of
                      0..1 : j := 2;
                      2..3 : j := 3;
                      4..7 : j := 4;
                      8..11 : j := 5;
                      12..15 : j := 6
                      else j := 7;
                   end;
                   i := Select(60,j,7,TRUE,FALSE);
                   if (i=0) or (i=1) then battle[person,1] := 0 else j := SelectEnemy;
                   Clear;
                   battle[person,2] := i-1;
                   battle[person,3] := j;
                end;
            3 : begin
                   for j := 1 to 6 do m[j+1] := ReturnMagic(j+6);
                   case player[person].level[2] of
                      0..1 : j := 1;
                      2 : j := 2;
                      3..5 : j := 3;
                      6..9 : j := 4;
                      10..13 : j := 5;
                      14..17 : j := 6
                      else j := 7;
                   end;
                   i := Select(60,j,7,TRUE,TRUE);
                   if (i=0) or (i=1) then battle[person,1] := 0;
                   battle[person,2] := i-1;
                   battle[person,3] := 0;
                end;
            4 : begin
                   for j := 1 to 6 do m[j+1] := ReturnMagic(j+12);
                   case player[person].level[2] of
                      0..4 : j := 1;
                      5..9 : j := 2;
                      10..11 : j := 3;
                      12..13 : j := 4;
                      14..15 : j := 5;
                      16..17 : j := 6
                      else j:= 7;
                   end;
                   i := Select(60,j,7,TRUE,FALSE);
                   if (i=0) or (i=1) then battle[person,1] := 0 else j := SelectEnemy;
                   Clear;
                   battle[person,2] := i-1;
                   battle[person,3] := j;
                end;
            5 : CureSpell;
            6 : begin
                   for j := 1 to 5 do m[j] := ReturnMagic(j+40);
                   i := Select(74,5,5,TRUE,FALSE);
                   if i = 0 then battle[person,1] := 0 else j := SelectEnemy;
                   Clear;
                   battle[person,2] := i;
                   battle[person,3] := j;
                   if enemy[j].unconscious or enemy[j].dead then battle[person,1] := 0;
                end;
         end;
      end;
      for person := 1 to 6 do
      if exist(person) then begin
         s := ReturnMessage(person,battle[person,1],battle[person,2],battle[person,3]);
         if battle[person,1] in [0,4,6..8] then Print(15,s);
         case battle[person,1] of
            1 : AttackOne;
            2 : CastOne;
            3 : CastAll;
            4 : CastSpecial;
            6 : BattleESP;
            7 : begin
                   ok := RunAway;
                   if ok then begin
                      party.etc[6] := 2;
                      c := ReadKey; Clear; Scroll(TRUE);
                      exit;
                   end;
                end;
         end;
         Print(7,'');
      end;
      DisplayEnemies(FALSE);
      print(7,'');
      PressAnyKey;
loop:
      for person := 1 to enemynumber do
      with enemy[person] do begin
         if poison then begin
            if unconscious then dead := TRUE
            else begin
               dec(hp);
               if hp <= 0 then unconscious := TRUE;
            end;
         end;
         if not (dead or unconscious) then EnemyAttack;
      end;
      SimpleDisCond;
      ok := EndBattle(i);
      c := ReadKey;
   end;
   until ok;
   case i of
      0 : begin
             Clear;
             PlusGold;
          end;
      1 : begin
             GameOver;
             exit;
          end;
   end;
   party.etc[6] := 0;
   Scroll(TRUE);
end;

Procedure randomenemy(var enemynumber: integer);
var
   range,plus : byte;
begin
   case party.map of
      1 : begin range := 10; plus := 1; end;
      2 : begin range := 13; plus := 8; end;
      3 : begin range := 15; plus := 16; end;
      4 : begin range := 17; plus := 24; end;
      5 : begin range := 17; plus := 33; end;
      11 : begin range := 10; plus := 6; end;
      12 : begin range := 5; plus := 17; end;
      14 : begin range := 8; plus := 5; end;
      15 : begin range := 8; plus := 18; end;
      16 : begin range := 5; plus := 28; end;
      17 : begin range := 6; plus := 23; end;
      18 : begin range := 3; plus := 30; end;
      19 : begin range := 4; plus := 38; end;
      20 : begin range := 5; plus := 41; end;
      else begin range := 0; plus := 0; end;
   end;
   enemynumber := random(range) + plus;
end;

Procedure EncounterEnemy;
var
   assualt : boolean;
   plus : longint;
begin
   if (position=town) or (party.map>20) then exit;
   enemynumber := random(maxenemy^)+1;
   if enemynumber > maxenemy^ then enemynumber := maxenemy^;
   for i:= 1 to enemynumber do begin
      randomenemy(j);
      if j = 0 then exit;
      joinenemy(i,j);
   end;
   Clear;
   SetColor(13); HPrintXY(250,50,'¸â·¡ Â‰ÑeÐ–”a !!!');
   DisplayEnemies(TRUE);
   j := 0; h := 0;
   for i := 1 to enemynumber do
   with enemy[i] do begin
      j := j + 1; h := h + agility;
   end;
   i := h div j;
   SetColor(11); HPrintXY(265,80,'¸â· Íw‹E £¥Àó¬÷');
   str(i,s); HPrintXY(281,96,': '+s);
   m[0] := '';
   m[1] := '¸â‰Á Ša¸åÐe”a';
   m[2] := '•¡ wˆe”a';
   k := Select(130,2,2,FALSE,TRUE);
   Clear;
   if k <> 1 then begin
      j := 0; h := 0;
      for i := 1 to 6 do
      with player[i] do
      if name <> '' then begin
         j := j + 1; h := h + luck;
      end;
      k := h div j;
      j := 0; h := 0;
      for i := 1 to enemynumber do
      with enemy[i] do begin
         j := j + 1; h := h + agility;
      end;
      i := h div j;
      if k > i then begin
         Scroll(TRUE);
         exit;
      end;
      assualt := FALSE;
   end
   else begin
      j := 0; h := 0;
      for i := 1 to 6 do
      with player[i] do
      if name <> '' then begin
         j := j + 1; h := h + agility;
      end;
      k := h div j;
      j := 0; h := 0;
      for i := 1 to enemynumber do
      with enemy[i] do begin
         j := j + 1; h := h + agility;
      end;
      i := h div j;
      if k > i then assualt := TRUE else assualt := FALSE;
   end;
   BattleMode(assualt);
end;

begin
end.