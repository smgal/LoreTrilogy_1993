Unit MystBatt;

INTERFACE

Uses
   Crt, Graph, UHanX, MystSub, Voice, MystMenu;

 Procedure DisplayEnemies(clean : boolean);
 Function EndBattle(var exitcode : integer) : boolean;
 Procedure BattleMode(Assualt,AutoEnd : boolean);
 Procedure EncounterEnemy;


IMPLEMENTATION

Procedure PlusExperience(person,foe : integer);
var
   i : byte;
   plus : longint;
begin
   plus := enemy[foe].level * 2;
   plus := plus * plus * plus div 8;
   if plus = 0 then plus := 1;
   if not enemy[foe].unconscious then begin
      str(plus,s);
      cPrint(14,11,player[person].name+ReturnSJosa(player[person].name)+' ',s,' eÇq ‰wÐñÃ¡Ÿi ´è´ö”a !');
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
   for i := 1 to enemynumber do
   if enemy[i].E_number > 1 then begin
      j := enemy[i].level * 2;
      k := EnemyData[j].ac;
      if k = 0 then k := 1;
      with EnemyData[j] do begin
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
      Bar(24,24,25,25);
      Bar(24,24,239,287);
      SetFillStyle(1,8);
   end;
   for i:= 1 to enemynumber do
   with enemy[i] do begin
      case hp of
         0 : SetColor(8);
         1..199 : SetColor(12);
         200..499 : SetColor(4);
         500..999 : SetColor(6);
         1000..1999 : SetColor(14);
         2000..3999 : SetColor(2)
         else SetColor(10);
      end;
      if (E_Number = 0) or ((SpecialCastLevel and $80) > 0) then SetColor(10);
      if unconscious then SetColor(8);
      if dead then SetColor(0);
      OutHPrintXY(70,20*i+50,name,FALSE);
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
var
   _ac, _power, plus : longint;
begin
   returnsexdata;
   k := battle[person,3];
   if (enemy[k].unconscious and not Cruel) or enemy[k].dead then begin
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
   if (random(20) > player[person].accuracy) then begin
      Print(7,sexdata+'· ‰·‰b·e §µaˆv”a ....');
      exit;
   end;
   with player[person] do begin
      case (weapon+6) div 7 of
         0 : _power := fist_skill;
         1 : _power := sword_skill;
         2 : _power := axe_skill;
         3 : _power := spear_skill;
         4 : _power := bow_skill
         else _power := level * 5;
      end;
      if (classtype = sword) and (class in [5,6]) then
         long := round(strength * _power * 5)
      else
         long := round(strength * wea_power * _power / 10);
   end;
   long := long - long * random(50) div 100;
   if random(100) < enemy[k].resistance[1] then begin
      Print(7,'¸â·e '+sexdata+'· ‰·‰b·i ¸á»¡Ð–”a');
      exit;
   end;
   with enemy[k] do _ac := round(ac * level * (random(10)+1));
   long := long - _ac;
   if long <= 0 then begin
      Print(7,'‹aœáa, ¸â·e '+sexdata+'· ‰·‰b·i  b´v”a');
      exit;
   end;
   with enemy[k] do begin
      hp := hp - long;
      str(long,s);
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
var
   plus : longint;
begin
   returnsexdata;
   j := battle[person,2];
   k := battle[person,3];
   if (enemy[k].unconscious and not Cruel) or enemy[k].dead then begin
      if not ExistEnemies then exit;
      battle[person,3] := battle[person,3] + 1;
      k := k + 1;
      if battle[person,3] <= enemynumber then castone;
      exit;
   end;
   if j < 11 then
      s := ReturnMessage(person,battle[person,1],battle[person,2],battle[person,3])
   else if battle[person,1] = 2 then
      s := player[person].name+ReturnSJosa(player[person].name)+
           ' ÑÁµq· ÇaŸ¡¯aÈi·i ¬a¶wÐ–‰¡, ˆá‹¡¬á ¬—¬÷–E ÑÁµqÍ¢Î—·e '+
           enemy[k].name+'µA‰A ¡wº—Ð–”a.'
   else
      s := player[person].name+ReturnBJosa(player[person].name)+
           ' ÇaŸ¡¯aÈi¡ ¬—¬÷¯¡Ç¥ ÐeÌa· ÒAµ¡Ÿ¡“e '+
           enemy[k].name+ReturnOJosa(enemy[k].name)+' ˆwÈaÐ–”a.';
   Print(15,s);
   if enemy[k].unconscious then begin
      Print(12,sexdata+'·  a¤ó·e ¸â·i µÅ¸åÓ¡ ¹AˆáÐ ¤áv”a');
      if soundon then scream1;
      PlusExperience(person,k);
      enemy[k].hp := 0;
      enemy[k].dead := TRUE;
      DisplayEnemies(FALSE);
      exit;
   end;
   if j < 11 then with player[person] do begin
      i := round(attack_magic*j*j/10);
      if sp < i then begin
         Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
         exit;
      end;
      sp := sp - i;
      if random(20) >= accuracy then begin
         Print(7,'‹aœáa, '+enemy[k].name+ReturnOJosa(enemy[k].name)+' §µaˆv”a');
         exit;
      end;
      i := round(j * j * attack_magic * 3);
   end
   else if battle[person,1] = 2 then i := 32500
   else i := 20000;
   if random(100) < enemy[k].resistance[2] then begin
      Print(7,enemy[k].name+ReturnSJosa(enemy[k].name)+' '+sexdata+'·  a¤ó·i ¸á»¡Ð–”a');
      exit;
   end;
   with enemy[k] do j := round(ac * level * (random(10)+1));
   i := i - j;
   if i <= 0 then begin
      Print(7,'‹aœáa, '+enemy[k].name+ReturnSJosa(enemy[k].name)+' '+sexdata+'·  a¤ó ‰·‰b·i  b´v”a');
      exit;
   end;
   with enemy[k] do begin
      hp := hp - i;
      str(i,s);
      if hp <= 0 then begin
         Print(12,name+ReturnSJosa(name)+' '+sexdata+'·  a¤óµA ·Ð ·¯¢¦‰“w·¡ –A´ö”a');
         if soundon then hit;
         PlusExperience(person,k);
         hp := 0;
         unconscious := TRUE;
      end
      else begin
         cPrint(7,15,name+ReturnSJosa(name)+' ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
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
const
   skill_point = 200;
   defence_point = 50;
   ability_point = 100;
   magic_point = 150;
   superman_point = 400;

 Procedure Remove_Skill;
 begin
    with enemy[battle[person,3]] do begin
       if player[person].sp < skill_point then begin
          Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
          exit;
       end;
       player[person].sp := player[person].sp - skill_point;
       if random(100) < resistance[2] then begin
          Print(7,'‹¡®‰ ¢bÑÁ ‰·‰b·e ¸á»¡ ”wÐ–”a');
          exit;
       end;
       if random(60) > player[person].accuracy then begin
          Print(7,'‹¡®‰ ¢bÑÁ ‰·‰b·e §µaˆv”a');
          exit;
       end;
       Print(4,name+'· Ëb® ‰·‰b “wb·¡ ¹Aˆá–A´ö”a');
       special := 0;
    end;
 end;

 Procedure Remove_Defence;
 begin
    with enemy[battle[person,3]] do begin
       if player[person].sp < defence_point then begin
          Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
          exit;
       end;
       player[person].sp := player[person].sp - defence_point;
       if random(100) < resistance[1] then begin
          Print(7,'¤w´á ¢bÑÁ ‰·‰b·e ¸á»¡ ”wÐ–”a');
          exit;
       end;
       if ac < 5 then j := 40 else j := 25;
       if random(j) > player[person].accuracy then begin
          Print(7,'¤w´á ¢bÑÁ ‰·‰b·e §µaˆv”a');
          exit;
       end;
       Print(4,name+'· ¤w´á “wb·¡ ¸áÐa–A´ö”a');
       if (resistance[1] < 31) or (random(2) = 0) then dec(ac);
       if resistance[1] > 0 then begin
          resistance[1] := resistance[1] - 10;
       end
       else resistance[1] := 0;
       if resistance[2] > 0 then begin
          resistance[2] := resistance[2] - 10;
       end
       else resistance[1] := 0;
    end;
 end;

 Procedure Remove_Ability;
 begin
    with enemy[battle[person,3]] do begin
       if player[person].sp < ability_point then begin
          Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
          exit;
       end;
       player[person].sp := player[person].sp - ability_point;
       if random(200) < resistance[2] then begin
          Print(7,'“wb ¸áÐa ‰·‰b·e ¸á»¡ ”wÐ–”a');
          exit;
       end;
       if random(30) > player[person].accuracy then begin
          Print(7,'“wb ¸áÐa ‰·‰b·e §µaˆv”a');
          exit;
       end;
       Print(4,name+'· ¸åÁA¸â·¥ “wb·¡ ¸áÐa–A´ö”a');
       if level > 1 then dec(level);
       if resistance[1] > 0 then begin
          resistance[1] := resistance[1] - 10;
       end
       else resistance[1] := 0;
       if resistance[2] > 0 then begin
          resistance[2] := resistance[2] - 10;
       end
       else resistance[2] := 0;
    end;
 end;

 Procedure Remove_Magic;
 begin
    with enemy[battle[person,3]] do begin
       if player[person].sp < magic_point then begin
          Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
          exit;
       end;
       player[person].sp := player[person].sp - magic_point;
       if random(100) < resistance[2] then begin
          Print(7,' a¤ó ¦‰“w ‰·‰b·e ¸á»¡ ”wÐ–”a');
          exit;
       end;
       if random(100) > player[person].accuracy then begin
          Print(7,' a¤ó ¦‰“w ‰·‰b·e §µaˆv”a');
          exit;
       end;
       if castlevel > 1 then Print(4,name+'·  a¤ó “wb·¡ ¸áÐa–A´ö”a')
       else Print(4,name+'·  a¤ó “wb·e ¬aœa¹v”a');
       if castlevel > 0 then dec(castlevel);
    end;
 end;

 Procedure Remove_Superman;
 var
    i : byte;
 begin
    with enemy[battle[person,3]] do begin
       if player[person].sp < superman_point then begin
          Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
          exit;
       end;
       player[person].sp := player[person].sp - superman_point;
       if random(100) < resistance[2] then begin
          Print(7,'Èi Á¡·¥ÑÁ ‰·‰b·e ¸á»¡ ”wÐ–”a');
          exit;
       end;
       if random(100) > player[person].accuracy then begin
          Print(7,'Èi Á¡·¥ÑÁ ‰·‰b·e §µaˆv”a');
          exit;
       end;
       if specialcastlevel > 1 then
          Print(4,name+'· Á¡¸aµe¸â “wb·¡ ¸áÐa–A´ö”a')
       else Print(4,name+'· Á¡¸aµe¸â “wb·e ¬aœa¹v”a');
       if specialcastlevel > 0 then begin
          i := 0;
          while ((specialcastlevel and (1 shl i)) > 0) or (i = 8) do begin
             inc(i);
          end;
          if i < 8 then specialcastlevel := specialcastlevel xor (1 shl i)
       end;
    end;
 end;

var
   i : integer;
begin
   case battle[person,2] of
      1 : Remove_Skill;
      2 : Remove_Defence;
      3 : Remove_Ability;
      4 : Remove_Magic;
      5 : Remove_Superman;
      6 : for i := 1 to enemynumber do begin
             battle[person,3] := i;
             if player[person].sp > skill_point then Remove_Skill;
          end;
      7 : for i := 1 to enemynumber do begin
             battle[person,3] := i;
             if player[person].sp > defence_point then Remove_Defence;
          end;
      8 : for i := 1 to enemynumber do begin
             battle[person,3] := i;
             if player[person].sp > ability_point then Remove_Ability;
          end;
      9 : for i := 1 to enemynumber do begin
             battle[person,3] := i;
             if player[person].sp > magic_point then Remove_Magic;
          end;
      10: for i := 1 to enemynumber do begin
             battle[person,3] := i;
             if player[person].sp > superman_point then Remove_Superman;
          end;
   end;
end;

Procedure BattleESP;
var
   plus : longint;
begin
   if battle[person,2] in [1,2,4] then begin
      Print(7,ReturnMagic(5,battle[person,2])+Mokjuk+' ¸åÊ¡¡—aµA¬á“e ¬a¶wÐi ®ˆa ´ô¯s“¡”a.');
      exit;
   end;
   if battle[person,2] = 3 then
   with enemy[battle[person,3]] do begin
      if player[person].esp_magic < 40 then begin
         Print(7,'•¢¯±·i ¬¡¶wÐaa Ðaµv»¡ e ´a»¢ “wb·¡ ¦¹¢Ð–”a');
         exit;
      end;
      if player[person].sp < 15 then begin
         Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
         exit;
      end;
      player[person].sp := player[person].sp - 15;
      if not (E_number in [6..9,11..16,18,19,25,26,47,64]) then begin
         Print(7,'•¢¯±®‰·e ¸åÑa É·Ða»¡ ´g´v”a');
         exit;
      end;
      j := level;
      if (j > player[person].level) and (random(2) = 0) then begin
         Print(7,'¸â·  a·q·i i´á—i·¡‹¡µA“e ´a»¢ “wb·¡ ¦¹¢Ð–”a');
         exit;
      end;
      if random(60) > (player[person].level-j)*2 + player[person].concentration then begin
         Print(7,'¸â·  a·q·e Óe—iŸ¡»¡ ´g´v”a');
         exit;
      end;
      Print(11,'¸â·e ¶Ÿ¡· Íe·¡ –A´ö”a');
      join(E_number,6);
      dead := TRUE; unconscious := TRUE; hp := 0; level := 0;
      Display_Condition;
   end
   else begin
      ReturnSexData;
      case battle[person,2] of
         6 : begin
                if player[person].esp_magic < 20 then begin
                   Print(7,sexdata+'“e º¶á· ¶¥­¡—i·i ·¡¶wÐaa Ð–·aa µb¦¹¢·¡´ö”a');
                   exit;
                end;
                if player[person].sp < 100 then begin
                   Print(7,'Á¡ˆqˆb »¡®ˆa ¦¹¢Ð–”a');
                   exit;
                end;
                player[person].sp := player[person].sp - 100;
                if random(2) = 0 then begin
                   Print(7,'ˆs¸a‹¡ ˜w­¢· ¶œa“Q·¡ Ð‚¦…µi·i ·©·aÅa ‰¡µ¥');
                   Print(7,'· µi‹¡ˆa ¸â· º¶áŸi ˆq°a‹¡ ¯¡¸bÐe”a');
                end
                else begin
                   Print(7,'‰·‹¡º—· ®­¡ˆa •©µeÓ¡ Ð‚·WÐs·i ·©·aÅa »©œ·');
                   Print(7,'‰i­¥· µAá»¡Ÿi ¸â—iµA‰A ¤wÂ‰Ða‹¡ ¯¡¸bÐe”a');
                end;
                for i := 1 to enemynumber do begin
                   j := enemy[i].hp;
                   if j < player[person].concentration * player[person].level then
                      j := 0
                   else
                      j := j - player[person].concentration * player[person].level;
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
         7 : begin
                Print(7,sexdata + '“e ¸âµA‰A ‰·Í¡¯±·i ¦‰´á ý´ö”a');
                if player[person].esp_magic < 30 then begin
                   Print(7,sexdata+'“e ´a»¢ “wb·¡ ¦¹¢ Ð–”a');
                   exit;
                end;
                if player[person].sp < 100 then begin
                   Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                   exit;
                end;
                player[person].sp := player[person].sp - 100;
                j := battle[person,3];
                if random(40) < enemy[j].resistance[2] then begin
                   if enemy[j].resistance[1] < 5 then enemy[j].resistance[1] := 0
                   else enemy[j].resistance[1] := enemy[j].resistance[1] - 5;
                   if enemy[j].resistance[2] < 5 then enemy[j].resistance[2] := 0
                   else enemy[j].resistance[2] := enemy[j].resistance[2] - 5;
                   exit;
                end;
                if random(60) > player[person].concentration then begin
                   if enemy[j].endurance < 5 then enemy[j].endurance := 0
                   else enemy[j].endurance := enemy[j].endurance - 5;
                   exit;
                end;
                enemy[j].dead := TRUE;
                Print(10,enemy[j].name + '“e ˆó·i  â‰¡“e •¡ w ˆa¤áv”a');
                plusexperience(person,j);
             end;
         8 : begin
                Print(7,sexdata + '“e ¸â·i ÑÅ¬w­¢µA ¨a»¡‰A ÐaaÐe”a');
                if player[person].esp_magic < 80 then begin
                   Print(7,sexdata+'“e ´a»¢ “wb·¡ ¦¹¢ Ð–”a');
                   exit;
                end;
                if player[person].sp < 300 then begin
                   Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                   exit;
                end;
                player[person].sp := player[person].sp - 300;
                j := battle[person,3];
                if random(30) < player[person].concentration then begin
                   for i := 1 to 2 do
                   if enemy[j].accuracy[i] < 4 then enemy[j].accuracy[i] := 0
                   else enemy[j].accuracy[i] := enemy[j].accuracy[i] - 4;
                end;
                if random(40) < enemy[j].resistance[2] then begin
                   if enemy[j].agility < 5 then enemy[j].agility := 0
                   else enemy[j].agility := enemy[j].agility - 5;
                   exit;
                end;
             end;
         9 : begin
                AuxPrint(7,sexdata + '“e ¸â· ¯¥»¥ ”¬aŸi ¹¡¸éÐaµa ¸â· ',TRUE);
                AuxPrint(7,'ÁAb·i ¸ñÀa ´¢ÑÁ ¯¡Ç¡a Ðe”a',FALSE);
                if player[person].esp_magic < 90 then begin
                   Print(7,sexdata+'“e ´a»¢ “wb·¡ ¦¹¢ Ð–”a');
                   exit;
                end;
                if player[person].sp < 500 then begin
                   Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                   exit;
                end;
                player[person].sp := player[person].sp - 500;
                if random(40) > player[person].concentration then exit;
                with enemy[battle[person,3]] do
                if poison then begin
                   if hp > 5000 then hp := hp - 5000
                   else begin
                      hp := 0;
                      unconscious := TRUE;
                      plusexperience(person,battle[person,3]);
                   end;
                end
                else poison := TRUE;
             end;
         10: begin
                Print(7,sexdata + '“e µqb·a¡ ¸â· µwÑ¥·i ¦…Ÿ¡ ¯¡Ç¡a Ðe”a');
                if player[person].esp_magic < 100 then begin
                   Print(7,sexdata+'“e ´a»¢ “wb·¡ ¦¹¢ Ð–”a');
                   exit;
                end;
                if player[person].sp < 1000 then begin
                   Print(7,' a¤ó »¡®ˆa ¦¹¢Ð–”a');
                   exit;
                end;
                player[person].sp := player[person].sp - 1000;
                j := battle[person,3];
                if random(40) < enemy[j].resistance[2] then begin
                   if enemy[j].resistance[1] < 20 then enemy[j].resistance[1] := 0
                   else enemy[j].resistance[1] := enemy[j].resistance[1] - 20;
                   if enemy[j].resistance[2] < 20 then enemy[j].resistance[2] := 0
                   else enemy[j].resistance[2] := enemy[j].resistance[2] - 20;
                   exit;
                end;
                if random(80) > player[person].concentration then begin
                   if enemy[j].hp < 5000 then begin
                      enemy[j].hp := 0;
                      enemy[j].unconscious := TRUE;
                      plusexperience(person,j);
                   end
                   else enemy[j].hp := enemy[j].hp - 5000;
                   exit;
                end;
                enemy[j].unconscious := TRUE;
             end;
      end;
      DisplayEnemies(FALSE);
   end;
end;

Procedure Summon;

 function r(seed : byte) : integer;
 begin
    r := random(seed*2+1)-seed;
 end;

begin
   case battle[person,2] of
      1 : with player[6] do begin
             case random(4) of
                0 : name := '¦‰· ¸÷w';
                1 : name := '¬aœa e”a';
                2 : name := '´a¸á';
                3 : name := '·¡ÏaŸ¡Ëa';
             end;
             sex := male;
             class := 0;
             classtype := elemental;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             endurance := 10+r(5);
             resistance := 10+r(5);
             agility := 0;
             accuracy := 10+r(5);
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             weapon := 29;
             wea_power := player[person].summon_magic * 3;
             shield := 0;
             shi_power := 0;
             armor := 0;
             ac := 0;
             potential_ac := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      2 : with player[6] do begin
             case random(9) of
                0 : name := '“±Ïa';
                1 : name := '—aŸ¡´á—a¯a';
                2 : name := '‘AA·¡—a¯a';
                3 : name := 'a·¡´á—a¯a';
                4 : name := 'aÌa·¡´á¯a';
                5 : name := 'µ¡A·¡´á—a¯a';
                6 : name := '´i­A·¡—a¯a';
                7 : name := ' aŸ¡—a';
                8 : name := 'ÅIÏ¡';
             end;
             sex := female;
             class := 0;
             classtype := elemental;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             endurance := 8+r(5);
             resistance := 12+r(5);
             agility := 0;
             accuracy := 10+r(5);
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             weapon := 30;
             wea_power := player[person].summon_magic * 2;
             shield := 0;
             shi_power := 0;
             armor := 0;
             ac := 1;
             potential_ac := 1;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      3 : with player[6] do begin
             case random(5) of
                0 : name := '‰·‹¡· ¸÷w';
                1 : name := '¯©Ïa';
                2 : name := '¯©Ï¡—a';
                3 : name := '—¡»¡“¡';
                4 : name := '·¥§¡¸á§i ¯aÉ¡Äá';
             end;
             sex := female;
             class := 0;
             classtype := elemental;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             endurance := 6+r(5);
             resistance := 14+r(5);
             agility := 0;
             accuracy := 13+r(5);
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             weapon := 31;
             wea_power := player[person].summon_magic;
             shield := 0;
             shi_power := 0;
             armor := 0;
             ac := 1;
             potential_ac := 1;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      4 : with player[6] do begin
             case random(3) of
                0 : name := '˜w· ¸÷w';
                1 : name := '‘±';
                2 : name := '”aµ¡';
             end;
             sex := male;
             class := 0;
             classtype := elemental;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             endurance := 14+r(5);
             resistance := 10+r(5);
             agility := 0;
             accuracy := 6+r(5);
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             weapon := 32;
             wea_power := player[person].summon_magic * 4;
             shield := 0;
             shi_power := 0;
             armor := 0;
             ac := 3;
             potential_ac := 3;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      5 : with player[6] do begin
             if random(2) = 0 then begin
                name := 'µA·¥­eËa a·¡Ëa';
                sex := male;
                class := 2;
                classtype := sword;
                strength := 12+r(5);
                mentality := 6+r(5);
                endurance := 15+r(5);
                resistance := 10+r(5);
                accuracy := 13+r(5);
                sp := 0;
                weapon := 6;
                wea_power := 60+r(10);
                shield := 2;
                shi_power := 2;
                armor := 3+r(1);
                potential_ac := 2;
                ac := armor + potential_ac;
                sword_skill := player[person].summon_magic;
                axe_skill := 0;
                spear_skill := 0;
                bow_skill := 0;
                fist_skill := 0;
                shield_skill := player[person].summon_magic;
             end
             else begin
                name := 'µA·¥­eËa ¡A·¡»¡';
                sex := female;
                class := 1;
                classtype := magic;
                strength := 7+r(5);
                mentality := 12+r(5);
                endurance := 7+r(5);
                resistance := 10+r(5);
                accuracy := 13+r(5);
                sp := mentality * level;
                weapon := 29;
                wea_power := 2;
                shield := 0;
                shi_power := 0;
                armor := 0;
                potential_ac := 0;
                ac := 0;
                sword_skill := 0;
                axe_skill := 0;
                spear_skill := 0;
                bow_skill := 0;
                fist_skill := 0;
                shield_skill := 0;
             end;
             level := player[person].summon_magic div 5;
             concentration := 10+r(5);
             agility := 0;
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             experience := 0;
             potential_experience := 0;
             Display_Condition;
          end;
      6 : with player[6] do begin
             case random(8) of
                0 : begin
                       name := '¤…”á¯aÃ¡';
                       endurance := 15+r(5);
                       resistance := 8+r(5);
                       accuracy := 12+r(5);
                       weapon := 33;
                       wea_power := player[person].summon_magic * 3;
                       potential_ac := 3;
                       ac := 3;
                    end;
                1 : begin
                       name := 'ÄŸ¡µ¥ Ça©œá';
                       endurance := 20+r(5);
                       resistance := 14+r(5);
                       accuracy := 13+r(5);
                       weapon := 34;
                       wea_power := player[person].summon_magic * 1;
                       potential_ac := 3;
                       ac := 3;
                    end;
                2 : begin
                       name := 'ÅEÈa¶ž¯a';
                       endurance := 17+r(5);
                       resistance := 12+r(5);
                       accuracy := 18+r(2);
                       weapon := 35;
                       wea_power := round(player[person].summon_magic * 1.5);
                       potential_ac := 2;
                       ac := 2;
                    end;
                3 : begin
                       name := '•A¡¡‰¡Ÿa‰¥';
                       endurance := 18+r(5);
                       resistance := 5+r(5);
                       accuracy := 17+r(3);
                       weapon := 36;
                       wea_power := player[person].summon_magic * 4;
                       potential_ac := 4;
                       ac := 4;
                    end;
                4 : begin
                       name := '—IœaÐe';
                       endurance := 10+r(5);
                       resistance := 20;
                       accuracy := 17;
                       weapon := 16;
                       wea_power := player[person].summon_magic * 1;
                       potential_ac := 3;
                       ac := 3;
                    end;
                5 : begin
                       name := 'µAË¥';
                       endurance := 10+r(5);
                       resistance := 10;
                       accuracy := 10+r(9);
                       weapon := 8;
                       wea_power := round(player[person].summon_magic * 0.8);
                       potential_ac := 1;
                       ac := 1;
                    end;
                6 : begin
                       name := 'ÑIÐa¶…—a';
                       endurance := 14+r(5);
                       resistance := 9+r(5);
                       accuracy := 11+r(5);
                       weapon := 33;
                       wea_power := player[person].summon_magic * 3;
                       potential_ac := 2;
                       ac := 2;
                    end;
                7 : begin
                       name := '£¡‘¡Èa¶ž¯a';
                       endurance := 13+r(5);
                       resistance := 11+r(5);
                       accuracy := 14+r(5);
                       weapon := 9;
                       wea_power := player[person].summon_magic * 3;
                       potential_ac := 2;
                       ac := 2;
                    end;
             end;
             sex := neutral;
             class := 0;
             classtype := unknown;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             agility := 0;
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      7 : with player[6] do begin
             case random(6) of
                0 : begin
                       name := 'Çiœa¶—a¸a·¡´åËa';
                       endurance := 20+r(5);
                       resistance := 15+r(5);
                       accuracy := 10+r(5);
                       weapon := 37;
                       wea_power := round(player[person].summon_magic * 2.5);
                       potential_ac := 2;
                       ac := 2;
                    end;
                1 : begin
                       name := 'Ìa·¡´á ¸a·¡´åËa';
                       endurance := 25+r(5);
                       resistance := 5+r(5);
                       accuracy := 12+r(5);
                       weapon := 38;
                       wea_power := player[person].summon_magic * 4;
                       potential_ac := 2;
                       ac := 2;
                    end;
                2 : begin
                       name := 'Ïa¡¯aËa¸a·¡´åËa';
                       endurance := 30+r(5);
                       resistance := 8+r(5);
                       accuracy := 8+r(2);
                       weapon := 2;
                       wea_power := player[person].summon_magic * 2;
                       potential_ac := 2;
                       ac := 2;
                    end;
                3 : begin
                       name := 'Ó© ¸a·¡´åËa';
                       endurance := 40+r(5);
                       resistance := 5+r(5);
                       accuracy := 7+r(3);
                       weapon := 39;
                       wea_power := round(player[person].summon_magic * 1.5);
                       potential_ac := 2;
                       ac := 2;
                    end;
                4 : begin
                       name := '¯aÉ¥ ¸a·¡´åËa';
                       endurance := 20+r(5);
                       resistance := 10+r(5);
                       accuracy := 11+r(5);
                       weapon := 37;
                       wea_power := round(player[person].summon_magic * 2.5);
                       potential_ac := 4;
                       ac := 4;
                    end;
                5 : begin
                       name := '¯aÉ¡´ñ ¸a·¡´åËa';
                       endurance := 20+r(5);
                       resistance := 10+r(5);
                       accuracy := 15+r(9);
                       weapon := 40;
                       wea_power := player[person].summon_magic * 6;
                       potential_ac := 1;
                       ac := 1;
                    end;
             end;
             sex := male;
             class := 0;
             classtype := giant;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             agility := 0;
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      8 : with player[6] do begin
             case random(4) of
                0 : begin
                       name := '‹iA·¡ ‰¡Q';
                       endurance := 30+r(5);
                       resistance := 15+r(5);
                       accuracy := 13+r(5);
                       weapon := 41;
                       wea_power := round(player[person].summon_magic * 0.5);
                       potential_ac := 3;
                       ac := 3;
                    end;
                1 : begin
                       name := 'ÏaA®á ‰¡Q';
                       endurance := 20+r(5);
                       resistance := 10+r(5);
                       accuracy := 12+r(5);
                       weapon := 0;
                       wea_power := player[person].summon_magic * 1;
                       potential_ac := 1;
                       ac := 1;
                    end;
                2 : begin
                       name := '´a·¡´å ‰¡Q';
                       endurance := 20+r(5);
                       resistance := 5+r(5);
                       accuracy := 10+r(2);
                       weapon := 42;
                       wea_power := player[person].summon_magic * 4;
                       potential_ac := 5;
                       ac := 5;
                    end;
                3 : begin
                       name := '¯aÉ¥ ‰¡Q';
                       endurance := 25+r(5);
                       resistance := 10+r(5);
                       accuracy := 13+r(3);
                       weapon := 0;
                       wea_power := player[person].summon_magic * 2;
                       potential_ac := 4;
                       ac := 4;
                    end;
             end;
             sex := neutral;
             class := 0;
             classtype := golem;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             agility := 0;
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      9 : with player[6] do begin
             case random(12) of
                0 : begin
                       name := '§iœ‚ —aœ‰¥';
                       weapon := 43;
                    end;
                1 : begin
                       name := '§iž —aœ‰¥';
                       weapon := 44;
                    end;
                2 : begin
                       name := '§iœ¯a —aœ‰¥';
                       weapon := 45;
                    end;
                3 : begin
                       name := '§a¥»a —aœ‰¥';
                       weapon := 44;
                    end;
                4 : begin
                       name := 'Ça¡ Ë¢ —aœ‰¥';
                       weapon := 46;
                    end;
                5 : begin
                       name := 'Å¡Ìá —aœ‰¥';
                       weapon := 43;
                    end;
                6 : begin
                       name := '‰©—a —aœ‰¥';
                       weapon := 46;
                    end;
                7 : begin
                       name := '‹aŸ¥ —aœ‰¥';
                       weapon := 47;
                    end;
                8 : begin
                       name := 'ÏiœË¡¶‘ —aœ‰¥';
                       weapon := 48;
                    end;
                9 : begin
                       name := 'A—a —aœ‰¥';
                       weapon := 46;
                    end;
                10: begin
                       name := '¯©¤á —aœ‰¥';
                       weapon := 49;
                    end;
                11: begin
                       name := 'ÑÁ·¡Ëa —aœ‰¥';
                       weapon := 49;
                    end;
             end;
             endurance := 30+r(10);
             resistance := 10+r(10);
             accuracy := 15+r(5);
             wea_power := round(player[person].summon_magic * (random(5)+1));
             potential_ac := 3;
             ac := 3;
             sex := neutral;
             class := 0;
             classtype := dragon;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             agility := 0;
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      10: with player[6] do begin
             case random(2) of
                0 : begin
                       name := '“b” ·¥ˆe';
                       classtype := unknown;
                       endurance := 25;
                       resistance := 15;
                       accuracy := 18;
                       weapon := 36;
                       wea_power := player[person].summon_magic * 3;
                       potential_ac := 2;
                       ac := 2;
                    end;
                1 : begin
                       name := '—aœ‰¥ “AËa';
                       classtype := dragon;
                       endurance := 30;
                       resistance := 18;
                       accuracy := 19;
                       weapon := 6;
                       wea_power := round(player[person].summon_magic * 4.5);
                       potential_ac := 4;
                       ac := 4;
                    end;
             end;
             sex := male;
             class := 0;
             level := player[person].summon_magic div 5;
             strength := 10+r(5);
             mentality := 10+r(5);
             concentration := 10+r(5);
             agility := 0;
             luck := 10+r(5);
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
      11: with player[6] do begin
             case random(3) of
                0 : begin
                       name := 'ÇaŸ¡¯aÈi —aœ‰¥';
                       classtype := dragon;
                       strength := 25;
                       mentality := 20;
                       concentration := 20;
                       endurance := 30;
                       resistance := 20;
                       agility := 0;
                       accuracy := 20;
                       luck := 20;
                       weapon := 49;
                       wea_power := 255;
                       potential_ac := 4;
                    end;
              1,2 : begin
                       name := 'ÇaŸ¡¯aÈi ‰¡Q';
                       classtype := golem;
                       strength := 20;
                       mentality := 0;
                       concentration := 0;
                       endurance := 40;
                       resistance := 25;
                       agility := 0;
                       accuracy := 13;
                       luck := 0;
                       weapon := 0;
                       wea_power := 150;
                       potential_ac := 5;
                    end;
             end;
             sex := neutral;
             class := 0;
             level := 30;
             poison := 0;
             unconscious := 0;
             dead := 0;
             hp := endurance * level * 10;
             sp := 0;
             ac := potential_ac;
             experience := 0;
             potential_experience := 0;
             shield := 0;
             shi_power := 0;
             armor := 0;
             sword_skill := 0;
             axe_skill := 0;
             spear_skill := 0;
             bow_skill := 0;
             shield_skill := 0;
             fist_skill := 0;
             Display_Condition;
          end;
   end;
end;

Procedure Assist_Attack_One;
begin
   k := battle[person,3];
   if (enemy[k].unconscious and not Cruel) or enemy[k].dead then begin
      if not ExistEnemies then exit;
      battle[person,3] := battle[person,3] + 1;
      k := k + 1;
      if battle[person,3] <= enemynumber then Assist_Attack_One;
      exit;
   end;
   s := ReturnMessage(person,battle[person,1],person,battle[person,3]);
   Print(15,s);
   if enemy[k].unconscious and not enemy[k].dead then begin
      case random(4) of
         0 : Print(12,player[person].name+'· ¢‹¡ˆa '+enemy[k].name+'· ¯±¸w·i ŽÁš´ö”a');
         1 : Print(12,enemy[k].name+'·  áŸ¡“e '+player[person].name+'· ‰·‰b·a¡ ¬e¬e ¹¡ˆb·¡ v”a');
         2 : Print(12,'¸â· Ï¡ˆa ¬a¤wµA ªa¹v”a');
         3 : Print(12,'¸â·e §¡¡w‰Á ÐqA ¿¸‰a aˆv”a');
      end;
      if soundon then scream2;
      PlusExperience(person,k);
      enemy[k].hp := 0;
      enemy[k].dead := TRUE;
      exit;
   end;
   if (random(20) > player[person].accuracy) then begin
      Print(7,player[person].name+'· ‰·‰b·e §µaˆv”a ....');
      exit;
   end;
   with player[person] do i := round(strength * wea_power * level div 2);
   i := i - i * random(50) div 100;
   if random(100) < enemy[k].resistance[1] then begin
      Print(7,'¸â·e '+player[person].name+'· ‰·‰b·i ¸á»¡Ð–”a');
      exit;
   end;
   with enemy[k] do j := round(ac * level * (random(10)+1));
   i := i - j;
   if i <= 0 then begin
      Print(7,'‹aœáa, ¸â·e '+player[person].name+'· ‰·‰b·i  b´v”a');
      exit;
   end;
   with enemy[k] do begin
      hp := hp - i;
      str(i,s);
      if hp <= 0 then begin
         hp := 0;
         unconscious := FALSE; dead := FALSE;
         Print(12,'¸â·e '+player[person].name+'· ‰·‰b·a¡ ·¯¢¦‰¡w·¡ –A´ö”a');
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

Procedure Assist_Attack_All;
begin
   battle[person,3] := 1;
   while (battle[person,3] <= enemynumber) do begin
      Assist_Attack_One;
      inc(battle[person,3]);
   end;
end;

Procedure Assist_Attack;
begin
   person := 6;
   if not exist(person) then exit;
   case player[person].classtype of
      sword     : Assist_Attack_One;
      magic     : Assist_Attack_All;
      elemental : begin
                     if player[person].weapon = 29 then Assist_Attack_One
                     else Assist_Attack_All;
                  end;
      unknown   : Assist_Attack_One;
      giant     : Assist_Attack_One;
      golem     : Assist_Attack_All;
      dragon    : Assist_Attack_One;
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
         Print(7,name+ReturnSJosa(name)+' §µ xÂ´ö”a');
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
      i := strength * level * (random(10)+1) div 5;
      if exist(j) and (player[j].classtype = sword) and (player[j].shield > 0) then
      if random(550) < player[j].shield_skill * player[j].shi_power then begin
         Print(13,name+ReturnSJosa(name)+' '+player[j].name+ReturnOJosa(name)+' ‰·‰bÐ–”a');
         Print(7,'‹aœáa, '+player[j].name+ReturnSJosa(name)+' ¤wÌ¡ ¸â· ‰·‰b·i  b´v”a');
         exit;
      end;
      if exist(j) then
         i := i - (player[j].ac * player[j].level * (random(10)+1) div 10);
      if i <= 0 then begin
         Print(13,name+ReturnSJosa(name)+' '+player[j].name+ReturnOJosa(player[j].name)+' ‰·‰bÐ–”a');
         Print(7,'‹aœáa, '+player[j].name+ReturnSJosa(player[j].name)+' ¸â· ‰·‰b·i ¤w´áÐ–”a');
         exit;
      end;
      if player[j].dead > 0 then player[j].dead := player[j].dead + i;
      if (player[j].unconscious > 0) and (player[j].dead = 0) then
         player[j].unconscious := player[j].unconscious + i;
      if player[j].hp > 0 then player[j].hp := player[j].hp - i;
      Print(13,player[j].name+ReturnSJosa(player[j].name)+' '+name+'µA‰A ‰·‰b ¤h´v”a');
      str(i,s);
      cPrint(5,13,player[j].name+ReturnSJosa(player[j].name)+' ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
   end;
end;

Procedure castattacksub(magic : string; power,num : integer);
begin
   if player[num].name = '' then exit;
   with enemy[person] do begin
      if random(20) >= accuracy[2] then begin
         Print(7,name+'·  a¤ó‰·‰b·e §µaˆv”a');
         exit;
      end;
      if exist(num) then
      if random(50) < player[num].resistance then begin
         Print(7,'‹aœáa, '+player[num].name+ReturnSJosa(player[num].name)+' ¸â·  a¤ó·i ¸á»¡Ð–”a');
         exit;
      end;
      power := power - random(power div 2);
      if exist(num) then
         power := power -
         (player[num].ac * player[num].level * (random(10)+1) div 10);
      if power <= 0 then begin
         Print(7,'‹aœáa, '+player[num].name+ReturnSJosa(player[num].name)+' ¸â·  a¤ó·i  b´a–”a');
         exit;
      end;
      if player[num].dead > 0 then player[num].dead := player[num].dead + power;
      if (player[num].unconscious > 0) and (player[num].dead = 0) then
         player[num].unconscious := player[num].unconscious + power;
      if player[num].hp > 0 then player[num].hp := player[num].hp - power;
      str(power,s);
      cPrint(5,13,player[num].name+ReturnSJosa(player[num].name)+' ',s,' eÇq· Ï¡ÐŸi ·³´ö”a');
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
      i := k * level * 5;
      Print(13,enemy[person].name+ReturnSJosa(name)+' '
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
   i := k * enemy[person].level * 5;
   Print(13,enemy[person].name+ReturnSJosa(enemy[person].name)+' ·©Ð— ¡¡–µA‰A '''+method+''' a¤ó·i ¬a¶wÐ–”a');
   for j := 1 to 6 do castattacksub(method,i,j);
end;

Procedure enemycure(num, plus : integer);
begin
   if person = num then Print(13,enemy[person].name+ReturnSJosa(enemy[person].name)+' ¸a¯¥·i Ã¡žaÐ–”a')
   else Print(13,enemy[person].name+ReturnSJosa(enemy[person].name)+' '
                 +enemy[num].name+ReturnOJosa(enemy[num].name)+' Ã¡žaÐ–”a');
   if enemy[num].dead then enemy[num].dead := FALSE
   else if enemy[num].unconscious then begin
      enemy[num].unconscious := FALSE;
      if enemy[num].hp <= 0 then enemy[num].hp := 1;
   end
   else begin
      enemy[num].hp := enemy[num].hp + plus;
      if enemy[num].hp > enemy[num].endurance * enemy[num].level * 10 then
      enemy[num].hp := enemy[num].endurance * enemy[num].level * 10;
   end;
end;

Procedure castattack;
var
   i,j,k : integer;
   l1,l2 : longint;
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
             if (hp < endurance * level * 3) and (random(2) = 0) then
                enemycure(person,level * mentality * 3)
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
             if (hp < endurance * level * 3) and (random(3)=0) then
                enemycure(person,level * mentality * 3)
             else begin
                k := 0;
                for i := 1 to 6 do if exist(i) then inc(k);
                if random(k) < 2 then begin
                   l1 := 0; l2 := 0;
                   for i := 1 to enemynumber do l1 := l1 + enemy[i].hp;
                   for i := 1 to enemynumber do l2 := l2 + enemy[i].endurance * enemy[i].level * 10;
                   l2 := l2 div 3;
                   if (enemynumber>2) and (l1<l2) and (random(2)=0) then
                   for i := 1 to enemynumber do enemycure(i,level * mentality * 2)
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
             if (hp < endurance * level * 4) and (random(3)=0) then begin
                enemycure(person,level * mentality * 3);
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
                   if player[i].luck > random(21) then Print(7,'‹aœáa, '+name+ReturnSJosa(name)+' ¬÷‰·Ða»¡ ¡µÐ–”a')
                   else begin
                      Print(5,player[i].name+'· ˆsµµ·e ÌaŠA–A´ö”a');
                      if player[i].ac > 0 then dec(player[i].ac);
                   end;
                end;
                display_condition;
             end
             else begin
                l1 := 0; l2 := 0;
                for i := 1 to enemynumber do l1 := l1 + enemy[i].hp;
                for i := 1 to enemynumber do l2 := l2 + enemy[i].endurance * enemy[i].level * 10;
                l2 := l2 div 3;
                if (enemynumber>2) and (l1<l2) and (random(3)<>0) then
                for i := 1 to enemynumber do enemycure(i,level * mentality * 2)
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
                Print(7,'‹aœáa, '+player[j].name+ReturnSJosa(player[j].name)+' •¢ ‰·‰b·i Ï¡Ð–”a');
                exit;
             end;
             Print(4,player[j].name+ReturnSJosa(player[j].name)+' º—•¢ –A´ö”a !!');
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
                Print(7,'‹aœáa, '+player[j].name+ReturnSJosa(player[j].name)+' Ã¡¡w¸â ‰·‰b·i Ï¡Ð–”a');
                exit;
             end;
             Print(4,player[j].name+ReturnSJosa(player[j].name)+' ·¯¢¦‰¡w·¡ –A´ö”a !!');
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
                Print(7,'‹aœáa, '+player[j].name+ReturnSJosa(player[j].name)+' º‚·q· ‰·‰b·i Ï¡Ð–”a');
                exit;
             end;
             Print(4,player[j].name+ReturnSJosa(player[j].name)+' º‚´ö”a !!');
             if player[j].dead = 0 then begin
                player[j].dead := 1;
                if player[j].hp > 0 then player[j].hp := 0;
             end;
          end;
   end;
end;

Procedure SpecialCastAttack(var Exit_Code : byte);
var
   i,j,k : integer;
   method : byte;
begin
   Exit_Code := 0;
   with enemy[person] do begin
      if (E_Number <= 1) then exit;
      if (specialcastlevel and $80) > 0 then begin
            if enemynumber < 8 then begin
               enemynumber := 8;
               for i := 1 to 8 do
               if i <> person then begin
                  enemy[i].name := enemy[person].name;
                  enemy[i].E_Number := 0;
                  enemy[i].hp := 1;
                  enemy[i].aux_hp := 0;
               end;
               DisplayEnemies(TRUE);
            end;
            j := random(8) + 1;
            move(enemy[person],enemy[j],sizeof(enemydata2));
            for i := 1 to 8 do
            if i <> j then begin
               enemy[i].E_Number := 0;
               enemy[i].hp := 1;
               enemy[i].poison := FALSE;
               enemy[i].unconscious := FALSE;
               enemy[i].dead := FALSE;
               enemy[i].resistance[1] := 0;
               enemy[i].resistance[2] := 0;
               enemy[i].ac := 0;
               enemy[i].level := 0;
            end;
            DisplayEnemies(FALSE);
      end;
      j := 0;
      for i := 0 to 6 do if (specialcastlevel and (1 shl i)) > 0 then inc(j);
      if j = 0 then exit;
      method := 0;
      k := 0;
      j := random(j) + 1;
      repeat
         if (specialcastlevel and (1 shl method)) > 0 then inc(k);
         inc(method);
      until k = j;
      dec(method);
      case method of
         0 :
         begin
            j := 0; k := enemynumber;
            for i := enemynumber downto 1 do
            if not enemy[i].dead then inc(j)
            else k := i;
            if (player[6].name <> '') and (j < 8) and (random(5) = 0) then begin
               s[0] := chr(2);
               s[1] := player[6].name[1];
               s[2] := player[6].name[2];
               if (s = 'Ça') or (s = '”') then exit;
               if enemynumber < 8 then begin
                  inc(enemynumber);
                  k := enemynumber;
               end;
               turn_mind(6,k);
               player[6].name := '';
               Display_Condition;
               DisplayEnemies(TRUE);
               Print(13,name+ReturnSJosa(name)+' •¢¯±®‰·i ¬a¶wÐaµa '+enemy[k].name+
                        ReturnSJosa(enemy[k].name)+' ¸a‹¡Íe·a¡ i´á—iµv”a');
            end;
         end;
         1 :
         begin
            j := 0; k := 0;
            for i := 1 to 6 do if player[i].name <> '' then begin
               inc(j);
               k := k + player[i].ac;
            end;
            k := k div j;
            if (k>4) and (random(5)=0) then begin
               for i := 1 to 6 do if player[i].name <> '' then begin
                  Print(13,name+'“e '+player[i].name+'· ˆsµµÌaŠAŸi ¯¡•¡Ð–”a');
                  if player[i].luck > random(21) then Print(7,'‹aœáa, '+name+ReturnSJosa(name)+' ¬÷‰·Ða»¡ ¡µÐ–”a')
                  else begin
                     Print(5,player[i].name+'· ˆsµµ·e ÌaŠA–A´ö”a');
                     if player[i].ac > 0 then dec(player[i].ac);
                  end;
               end;
               display_condition;
            end;
         end;
         2 :
         begin
            j := 0; k := enemynumber;
            for i := enemynumber downto 1 do
            if not enemy[i].dead then inc(j)
            else k := i;
            if (j < random(3)+2) then begin
               if enemynumber < 8 then begin
                  inc(enemynumber);
                  k := enemynumber;
               end;
               case E_Number of
                  29 : i := 1 + random(5);
                  42 : i := 6 + random(5);
                  45 : i := 39 + random(2) * 2;
                  52 : i := 11 + random(5);
                  59 : i := 50;
              73..74 : i := 71
                  else i := 1 + random(15);
               end;
               joinenemy(k,i);
               DisplayEnemies(TRUE);
               Print(13,name+ReturnSJosa(name)+' '+enemy[k].name+ReturnOJosa(enemy[k].name)+' ¬—¬÷¯¡Åv”a');
            end;
         end;
         3..5 :
         begin
            j := 0;
            for i := 1 to 6 do if exist(i) then inc(j);
            if j < random(3) + 5 then exit;
            for i := 1 to 6 do
            case method of
               3 :
               begin
                  if random(40) > player[i].luck then begin
                     inc(player[i].poison);
                     if player[i].poison = 0 then player[i].poison := 255;
                     Print(13,player[i].name+ReturnSJosa(player[i].name)+' '+
                              name+'µA ·Ð •¢µA ˆqµq –A´ö”a.');
                  end;
               end;
               4 :
               begin
                  if (player[i].unconscious = 0) and (random(30) > player[i].luck) then begin
                     player[i].unconscious := 1;
                     Print(13,player[i].name+ReturnSJosa(player[i].name)+' '+
                              name+'µA ·Ð ·¯¢¦‰¡w·¡ –A´ö”a.');
                  end;
               end;
               5 :
               begin
                  if (player[i].dead = 0) and (random(22) > player[i].luck) then begin
                     player[i].dead := 1;
                     Print(13,player[i].name+ReturnSJosa(player[i].name)+' '+
                              name+'µA ·Ð ‹s¬a ”wÐ–”a.');
                  end;
               end;
            end;
         end;
         6 :
         begin
            for i := 1 to enemynumber do EnemyCure(i,level * mentality * 4);
            if E_Number in [5,10,47] then Exit_Code := 1;
         end;
      end;
   end;
end;

Procedure EnemyAttack;
var
   i,j : integer;
begin
   if enemy[person].E_Number = 0 then exit;
   if enemy[person].specialcastlevel > 0 then begin
      b := 0;
      specialcastattack(b);
      if b > 0 then exit;
   end;
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

Procedure BattleMode(Assualt,AutoEnd : boolean);
label
   loop, Skip_Attack;
begin
   party.etc[6] := 1;
   Pause(FALSE);
   repeat begin
      if not Assualt then begin
         Assualt := TRUE;
         goto loop;
      end;
      for person := 1 to 6 do battle[person,1] := 0;
      DisplayEnemies(FALSE);
      autobattle := FALSE;
      for person := 1 to 5 do
      if exist(person) then begin
         if not autobattle then begin
            m[0] := player[person].name + '· ¸åÊ ¡¡—a ===>';
            m[1] := 'Ðe ¡w· ¸â·i '+ReturnWeapon(player[person].weapon)+Josa+'¡ ‰·‰b';
            m[2] := 'Ðe ¡w· ¸âµA‰A  a¤ó ‰·‰b';
            m[3] := '¡¡—e ¸âµA‰A  a¤ó ‰·‰b';
            m[4] := '¸âµA‰A Ëb®  a¤ó ‰·‰b';
            m[5] := '·©Ð—·i Ã¡ža';
            m[6] := '¸âµA‰A Á¡“wb ¬a¶w';
            m[7] := '­¡ÑÅ  a¤ó ¬a¶w';
            m[8] := '´¢Á¡a ÇaŸ¡¯aÈi·i ¬a¶w';
            m[9] := '•¡ w·i ¯¡•¡Ðq';
            if person = 1 then m[9] := '·©Ð—µA‰A ¢¹¡ˆå ‰·‰b Ði ˆõ·i »¡¯¡';
            k := Select(80,9,9,TRUE,FALSE);
            if k<>1 then Clear;
            m[1] := '´ô·q';
            if (k = 9) and (person = 1) then begin
               k := 10;
               autobattle := TRUE;
            end;
         end
         else k := 10;
         battle[person,1] := k;
         with player[person] do begin
            if (classtype = sword) and (k in [2..7]) then begin
               if (class <> 7) or (k <> 5) then begin
                  k := 1;
                  battle[person,1] := 1;
               end;
            end;
         end;
         case k of
            1 : begin
                   j := SelectEnemy;
                   Clear;
                   if j = 0 then battle[person,1] := 0;
                   battle[person,2] := player[person].weapon;
                   battle[person,3] := j;
                end;
            2 : begin
                   for j := 1 to 10 do m[j] := ReturnMagic(0,j);
                   j := player[person].attack_magic div 10;
                   i := Select(60,j,10,TRUE,FALSE);
                   if i = 0 then battle[person,1] := 0 else j := SelectEnemy;
                   Clear;
                   battle[person,2] := i;
                   battle[person,3] := j;
                end;
            3 : begin
                   for j := 1 to 10 do m[j] := ReturnMagic(1,j);
                   j := player[person].attack_magic div 10;
                   i := Select(60,j,10,TRUE,TRUE);
                   if i = 0 then battle[person,1] := 0;
                   battle[person,2] := i;
                   battle[person,3] := 0;
                end;
            4 : begin
                   for j := 1 to 10 do m[j] := ReturnMagic(4,j);
                   j := player[person].special_magic div 10;
                   i := Select(60,j,10,TRUE,FALSE);
                   if i = 0 then battle[person,1] := 0
                   else if i in [1..5] then j := SelectEnemy
                   else j := 1;
                   Clear;
                   battle[person,2] := i;
                   battle[person,3] := j;
                end;
            5 : CureSpell;
            6 : begin
                   for j := 1 to 5 do m[j] := ReturnMagic(5,j);
                   i := Select(74,5,5,TRUE,FALSE);
                   case i of
                      0 : battle[person,1] := 0;
                      3 : j := SelectEnemy;
                      5 : begin
                             for i := 1 to 5 do m[i] := ReturnMagic(5,i+5);
                             j := 0;
                             if player[person].esp_magic > 19 then j := 1;
                             if player[person].esp_magic > 29 then j := 2;
                             if player[person].esp_magic > 79 then j := 3;
                             if player[person].esp_magic > 89 then j := 4;
                             if player[person].esp_magic > 99 then j := 5;
                             i := Select(74,j,5,TRUE,FALSE) + 5;
                             if i = 5 then battle[person,1] := 0
                             else if i > 6 then j := SelectEnemy
                             else j := 0;
                          end;
                   end;
                   Clear;
                   battle[person,2] := i;
                   battle[person,3] := j;
                   if enemy[j].unconscious or enemy[j].dead then
                      if i <> 6 then battle[person,1] := 0;
                end;
            7 : begin
                   for i := 1 to 10 do m[i] := ReturnMagic(6,i);
                   j := player[person].summon_magic div 10;
                   i := Select(60,j,10,TRUE,TRUE);
                   if i = 0 then battle[person,1] := 0;
                   battle[person,2] := i;
                   battle[person,3] := 1;
                end;
            8 : begin
                   ok := FALSE;
                   for i := 1 to 7 do if party.crystal[i] > 0 then ok := TRUE;
                   if ok then begin
                      m[0] := '';
                      m[1] := '´¢Á¡a ´¢¢‰·i ¬a¶wÐe”a';
                      m[2] := 'ÇaŸ¡¯aÈi·i ¬a¶wÐe”a';
                      case Select(100,2,2,TRUE,TRUE) of
                         0 : battle[person,1] := 0;
                         1 : Use_Item(5);
                         2 :
                         begin
                            m[0] := '”w¯¥·¡ ¬a¶wÐi ÇaŸ¡¯aÈi·i ‰¡Ÿa¯¡µ¡.';
                            j := 0;
                            for i := 1 to 7 do begin
                               if party.crystal[i] > 0 then begin
                                  inc(j);
                                  m[j] := ReturnMagic(7,i);
                               end;
                            end;
                            k := Select(80,j,j,FALSE,TRUE);
                            i := 0; j := 0;
                            repeat
                               inc(i);
                               if party.crystal[i] > 0 then inc(j);
                            until (j = k);
                            case i of
                               1 :
                               begin
                                  battle[person,1] := 2;
                                  battle[person,2] := 11;
                                  battle[person,3] := SelectEnemy;
                                  dec(party.crystal[1]);
                               end;
                               2 :
                               begin
                                  battle[person,1] := 3;
                                  battle[person,2] := 11;
                                  battle[person,3] := 0;
                                  dec(party.crystal[2]);
                               end;
                               3,4 : begin
                                  if (party.crystal[3] > 0) and (party.crystal[4] > 0) then begin
                                     k := SelectEnemy;
                                     if enemy[k].name = '¡—a´e' then begin
                                        Clear;
                                        s := player[person].name + ReturnSJosa(player[person].name);
                                        Print(7,s+' ¡—a´e·i Ð·Ð ”aÇa ÇaŸ¡¯aÈi‰Á µA¥¡“¡ ÇaŸ¡¯aÈi·i •·¯¡µA ¬a¶wÐaµv”a.');
                                        Print(7,'ÇaŸ¡¯aÈiµA¬á ª‘´á¹a aµ¥  ˆñ·e ‹¡¶…·e  ‹q¬');
                                        Print(7,'¡—a´eµA‰A Ã±ÊÐ —i´áˆv‰¡ ‹a“e ®…¯¢ˆeµA ¤‚');
                                        Print(7,'µa‘e·i “j´á ¤áv”a');
                                        with enemy[k] do begin
                                           strength := strength div 2;
                                           mentality := mentality div 2;
                                           endurance := endurance div 2;
                                           resistance[1] := resistance[1] div 2;
                                           resistance[2] := resistance[2] div 2;
                                           agility := agility div 2;
                                           accuracy[1] := accuracy[1] div 2;
                                           accuracy[2] := accuracy[2] div 2;
                                           ac := ac div 2;
                                           level := level div 2;
                                        end;
                                        dec(party.crystal[3]);
                                        dec(party.crystal[4]);
                                     end
                                     else begin
                                        Clear;
                                        Print(7,' ·¡ ÇaŸ¡¯aÈi·e  ¬å· Ó±·i ¬a¶wÐa“e ¸âµA‰A e');
                                        Print(7,'¤e·wÐe”a.');
                                     end;
                                  end
                                  else begin
                                     Clear;
                                     Print(7,' ÇaŸ¡¯aÈi·e ¸åÑa ¤e·wÐa»¡ ´g´v”a.');
                                  end;
                                  PressAnyKey;
                               end;
                               5 :
                               begin
                                  k := SelectEnemy;
                                  if enemy[k].hp > 0 then begin
                                     Clear;
                                     Print(7,' ”w¯¥·¡  µwÑ¥· ÇaŸ¡¯aÈi·i  ¸âµA‰A ¬a¶wÐa¸a');
                                     Print(7,'¸â· µwÑ¥·e ÇaŸ¡¯aÈiµA ·Ð ¸áºŸi ¤h´a  Ñ×');
                                     print(7,'ÍÑÁ –A´á¹v”a.');
                                     enemy[k].aux_hp := (enemy[k].aux_hp + 1) div 2;
                                     enemy[k].hp := enemy[k].hp div 2;
                                     DisplayEnemies(FALSE);
                                     dec(party.crystal[5]);
                                  end
                                  else begin
                                     Clear;
                                     Print(7,' Ða»¡ e ÇaŸ¡¯aÈi·e ¸åÑa ¤e·w·i ¥¡·¡»¡ ´g´v”a.');
                                  end;
                                  PressAnyKey;
                               end;
                               6 :
                               begin
                                  battle[person,1] := 7;
                                  battle[person,2] := 11;
                                  battle[person,3] := 11;
                                  dec(party.crystal[6]);
                               end;
                               7 :
                               begin
                                  for i := 1 to 6 do begin
                                     if player[i].name <> '' then begin
                                        if player[i].dead = 0 then begin
                                           player[i].unconscious := 0;
                                           player[i].hp := player[i].endurance * player[i].level * 10;
                                        end else begin
                                           player[i].dead := 0;
                                           player[i].unconscious := 0;
                                           player[i].hp := 1;
                                        end;
                                     end;
                                  end;
                                  Clear;
                                  Print(7,' µAá»¡ ÇaŸ¡¯aÈi·e ˆwÐe µAá»¡Ÿi  ¶Ÿ¡ ”¶¥');
                                  Print(7,'—i· ¡±­¢·a¡  ¤wÂ‰Ðaµv‰¡  ‹a µAá»¡Ÿi ÂáÐe');
                                  Print(7,'”¶¥—i·e ¡¡– ¶¥œ· ‹¡¶…·i –AÀx´v”a.');
                                  Display_Condition;
                                  PressAnyKey;
                                  dec(party.crystal[7]);
                               end;
                            end;
                         end;
                      end;
                   end
                   else Use_Item(5);
                end;
            10: case player[person].classtype of
                   sword : begin
                              battle[person,1] := 1;
                              battle[person,2] := player[person].weapon;
                              battle[person,3] := 1;
                           end;
                   magic : begin
                              if (player[person].attack_magic > 9) and
                               (player[person].sp > player[person].attack_magic) then begin
                                 battle[person,1] := 2;
                                 battle[person,2] := (i div 20) + 1;
                                 battle[person,3] := 1;
                              end
                              else begin
                                 battle[person,1] := 1;
                                 battle[person,2] := player[person].weapon;
                                 battle[person,3] := 1;
                              end
                           end;
                end;
         end;
      end;
      battle[6,1] := 1;
      battle[6,3] := 1;
      Pause(FALSE);
      for person := 1 to 5 do
      if exist(person) then begin
         s := ReturnMessage(person,battle[person,1],battle[person,2],battle[person,3]);
         if battle[person,1] in [0,4,6,7,9] then Print(15,s);
         if player[person].weapon-1 >= 0 then i := (player[person].weapon-1) div 7
         else i := 0;
         if i = 3 then begin
            if party.arrow > 0 then dec(party.arrow)
            else goto Skip_Attack;
         end;
         case battle[person,1] of
            1 : AttackOne;
            2 : CastOne;
            3 : CastAll;
            4 : CastSpecial;
            6 : BattleESP;
            7 : Summon;
            9 : begin
                   ok := RunAway;
                   if ok then begin
                      party.etc[6] := 2;
                      c := ReadKey; Clear; Scroll(TRUE);
                      exit;
                   end;
                end;
         end;
Skip_Attack:
         Print(7,'');
      end;
      Assist_Attack;
      DisplayEnemies(FALSE);
      for person := 1 to 6 do
      with player[person] do
      if (name <> '') and (poison > 0) then begin
         if dead > 0 then begin
            if dead < 10000 then dead := dead + poison;
         end
         else if unconscious > 0 then begin
            unconscious := unconscious + poison;
            if unconscious > endurance * level * 10 then dead := 1;
         end
         else begin
            hp := hp - poison;
            if hp <= 0 then unconscious := 1;
         end;
      end;
      print(7,'');
      PressAnyKey;
loop:
      for person := 1 to enemynumber do
      with enemy[person] do begin
         if poison then begin
            if unconscious then dead := TRUE
            else begin
               hp := hp - 50;
               if hp <= 0 then unconscious := TRUE;
            end;
         end;
         if aux_hp > 0 then begin
            unconscious := FALSE;
            dead := FALSE;
            while (aux_hp > 0) and (hp < 30000) do begin
               dec(aux_hp);
               hp := hp + 1000;
            end;
         end;
         if not (dead or unconscious) then EnemyAttack;
      end;
      SimpleDisCond;
      ok := EndBattle(i);
      if not ok then begin
         Print(7,'');
         PressAnyKey;
      end;
      Clear;
   end;
   until ok;
   case i of
      0 : begin
             Clear;
             PlusGold;
          end;
      1 : if AutoEnd then begin
             GameOver;
             Pause(TRUE);
             exit;
          end;
   end;
   Pause(TRUE);
   party.etc[6] := 0;
   if AutoEnd then Scroll(TRUE);
end;

Procedure randomenemy(var enemynumber: integer);
var
   range,plus : byte;
begin
   if      (mapname = 'Ground2' ) and (not getbit(3)) then begin range :=  3; plus := 18; end
   else if (mapname = 'Ground3' ) and (not getbit(4)) then begin range :=  4; plus := 25; end
   else if (mapname = 'Ground4' ) and (not getbit(5)) then begin range :=  3; plus := 35; end
   else if (mapname = 'Ground5' ) and (not getbit(6)) then begin range :=  2; plus := 48; end
   else if (mapname = 'UnderGrd')                     then begin range :=  4; plus :=  6; end
   else if (mapname = 'TrolTown') and (not getbit(4)) then begin range :=  2; plus := 31; end
   else if (mapname = 'OrcTown' ) and (not getbit(3)) then begin range :=  4; plus := 18; end
   else if (mapname = 'Vesper'  ) and (not getbit(4)) then begin range :=  3; plus := 26; end
   else if (mapname = 'Kobold'  ) and (not getbit(5)) then begin range :=  3; plus := 35; end
   else if (mapname = 'DracTown') and (not getbit(6)) then begin range :=  2; plus := 48; end
   else begin range := 0; plus := 0; end;
   enemynumber := random(range) + plus;
end;

Procedure EncounterEnemy;
var
   assualt : boolean;
   plus : longint;
begin
   if position = town then exit;
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
   BattleMode(assualt,TRUE);
end;

end.