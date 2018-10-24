Unit LoreCret;

INTERFACE

Uses
   Crt, Dos, Graph, AdLib, UHanX, LoreSub;
Const
   CharacterName : array[1..10] of string[17] = ('Hercules','Titan','Merlin','Betelgeuse',
         'Genius Kie','Bellatrix','Regulus','Procyon','Arcturus','Algol');
   Character : array[1..10,1..10] of byte = (
              {   S C St Me Co En Re Ag Ac Lu   }
                ( 0,1,17,05,05,17,11,15,15,10 )
               ,( 0,1,14,05,07,14,14,16,17,07 )
               ,( 0,2,11,19,14,05,05,07,18,15 )
               ,( 1,2,14,17,05,07,07,11,15,14 )
               ,( 0,4,14,11,07,11,11,11,20,09 )
               ,( 1,4,14,11,05,11,14,14,15,11 )
               ,( 0,5,19,05,05,17,07,15,13,11 )
               ,( 0,5,17,05,05,17,11,17,14,09 )
               ,( 0,6,07,05,11,11,19,18,07,15 )
               ,( 1,6,11,05,07,14,17,17,09,16 ));
var
   transdata : array[1..10] of byte;

 Function CreateCharacter : boolean;


IMPLEMENTATION

Procedure WhatClass(i : integer;var s : string);
begin
   case i of
      1 : s := '‹¡¬a';
      2 : s := ' a¤ó¬a';
      3 : s := 'µA¯aÌá';
      4 : s := '¸å¬a';
      5 : s := '¸åÊ¯w';
      6 : s := '“¥¸a';
      7 : s := '¬a·Ž…';
      8 : s := '˜á•©·¡';
      9 : s := 'Ñ¥w';
      10 : s := '¤e¯¥'
      else s := '¦‰ÑÂ¯©Ðq';
   end;
end; { WhatClass }

Procedure Display;
begin
   RGB(1,0,0,31);
   SetPalette(1,1);
   SetBkColor(1);
   ClearDevice;
   RGB(9,0,0,31);
   SetPalette(9,9);
   SetColor(9);
   Rectangle(1,1,639,479);
   Rectangle(3,3,637,477);
   Rectangle(4,4,636,476);
   Rectangle(6,6,634,474);
   Rectangle(9,150,631,153);
   for i:=0 to 63 do begin
      RGB(9,i,0,32- i div 2);
      Delay(20);
   end;
   for i:=0 to 63 do begin
      RGB(9,63-i,0,i);
      Delay(20);
   end;
   RGB(5,0,0,31);
   RGB(13,0,0,31);
   RGB(11,0,0,31);
   SetPalette(13,13);
   SetPalette(11,11);
   s := '™¡”aŸe »¡¯¢· ¬÷¸å  ¹A 1 ¦';
   SetColor(5);
   eHPrint(110,45,s);
   SetColor(13);
   eHPrint(108,35,s);

   SetColor(11);
   bHPrint(169,100,'ÄŸ¢Èá  e—i‹¡ Ïa¡‹aœ‘   ¹A 1.5 Èe');
   for i:=0 to 31 do begin
      RGB(5,i,0,31);
      RGB(13,i*2,0,31+i);
      RGB(11,0,i*2,31+i);
      RGB(1,0,i div 3,31 - i div 3);
      Delay(80);
   end;
end; { Display }

Procedure Name;
begin
   DirectVideo := FALSE;
   TextColor(14);
   SetBkColor(1);
   SetColor(14);
   cHPrint(15,177,'”w¯¥· ·¡Ÿq·e :');
   gotoxy(19,12); write('[]');
   s := '';
   i := 0;
   repeat begin
      inc(i);
      c := ReadKey;
      if c=#0 then begin
         c := ReadKey;
         c := #0;
         dec(i);
      end;
      if c=#8 then begin
         c := #0;
         dec(i);
      end;
      if (c<>#13) and (c<>#27) and (c<>#0) then begin
         s := s + c;
         GotoXY(19+i,12); write(c,']');
      end;
      if (c=#27) or (i>16) then begin
         i := 0; s := '';
         SetFillStyle(1,1);
         Bar(138,176,350,191);
         GotoXY(19,12); write('[]');
      end;
      if (c=#13) and (s='') then begin
         c := #0; i := 0;
      end;
   end;
   until c=#13;
   SetFillStyle(1,1);
   Bar(30,176,350,196);
   SetColor(10);
   cHPrint(15,177,'”w¯¥·e '+s+' ·³“¡”a.');
   player[1].name := s;
   SetColor(14);
   cHPrint(15,197,'”w¯¥· ¬÷¥i·e : [ q¬÷ (M), µa¬÷ (F) ] ');
   repeat c := UpCase(ReadKey) until (c='M') or (c='F');
   player[1].sex := male; s := 'q¬÷';
   if c='F' then begin
      player[1].sex := female;
      s := 'µa¬÷';
   end;
   SetColor(10);
   Bar(118,196,350,216);
   cHPrint(15,197,'”w¯¥· ¬÷¥i·e '+s+' ·³“¡”a.');
end; { Name }

Procedure Profile(number : integer);
var
   c : char;
begin
   SetFillStyle(0,1);
   Bar(310,160,630,400);
   SetColor(15);
   bHPrint(320,165,'‹a ¬aœq· “wb ®Ã¡ ---');
   SetColor(14);
   cHPrint(344,200,'# ·¡Ÿq : ' + charactername[number]);
   s := 'q¬÷';
   if character[number,1] = 1 then s := 'µa¬÷';
   cHPrint(344,216,'# ¬÷¥i : ' + s);
   WhatClass(character[number,2],s);
   cHPrint(344,232,'# ‰‹s : ' + s);
   SetColor(11);
   str(character[number,3],s);
   OutHPrintXY(330,270,'ÁA  b : '+s,FALSE);
   str(character[number,4],s);
   OutHPrintXY(330,286,'¸÷¯¥b : '+s,FALSE);
   str(character[number,5],s);
   OutHPrintXY(330,302,'»³º—b : '+s,FALSE);
   str(character[number,6],s);
   OutHPrintXY(330,318,'·¥b : '+s,FALSE);
   str(character[number,7],s);
   OutHPrintXY(330,334,'¸áÐwb : '+s,FALSE);
   str(character[number,8],s);
   OutHPrintXY(500,286,'£¥Àó¬÷ : '+s,FALSE);
   str(character[number,9],s);
   OutHPrintXY(500,302,'¸÷ÑÂ¬÷ : '+s,FALSE);
   str(character[number,10],s);
   OutHPrintXY(500,318,'Ð—  ¶… : '+s,FALSE);
   str(character[number,6],s);
   OutHPrintXY(330,360,'ÁAb   »¡® : '+s,FALSE);
   str(character[number,4],s);
   OutHPrintXY(330,376,' a¤ó   »¡® : '+s,FALSE);
   str(character[number,5],s);
   OutHPrintXY(330,392,'Á¡ˆqˆb »¡® : '+s,FALSE);
   OutHPrintXY(330,408,'‰w Ðñ »¡ ® : 0',FALSE);
   OutHPrintXY(330,424,'¸å Ê A ¥I : 1',FALSE);
   repeat until KeyPressed;
   c := ReadKey;
end; { Profile }

Procedure First;

 Procedure Which;
 begin
    repeat c := readkey;
    until c in ['1'..'3'];
 end;

 Procedure erase;
 begin
    Bar(80,320,630,450);
 end;

begin
   SetColor(15);
   SetFillStyle(0,1);
   for i := 1 to 5 do transdata[i] := 0;
   OutHPrintXY(160,250,'»¡‹q ¦Èá“e ¢ˆ“e  iµA ””s·i Ð º¯³¯¡µ¡.',FALSE);
   OutHPrintXY(120,270,'‹aŸ¡‰¡, ¸a¯¥µA‰A  x“e ”s·i ­¡¯¥·¶‰A ’‰œá º¯³¯¡µ¡.',FALSE);
   SetColor(11);
   OutHPrintXY(80,320,'”w¯¥·¡ Ðe ¤qº—µA ‰·¦Ða‰¡ ·¶·i˜ ¤cµA¬á ¢¯e ­¡Ÿ¡ˆa —iv”a',FALSE);
   OutHPrintXY(160,350,'1] ¤c·a¡ aˆa¬á ´i´a¥¥”a',FALSE);
   OutHPrintXY(160,370,'2] ‹a ­¡Ÿ¡ˆa ¢´õ·©Œa ¬—ˆb·i Ðe”a',FALSE);
   OutHPrintXY(160,390,'3] ‰·¦µA e µiº—Ðe”a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[3]);
   Erase;
   OutHPrintXY(80,320,'”w¯¥·e ÁAb¸w µ¡œ”iŸ¡‹¡µA¬á Í¡‹¡Ði ® ´ô“e Ðe ¤aÆáŸi q‰a ‘½‰¡',FALSE);
   OutHPrintXY(80,340,'ˆá· Èi»¥ ¬wÈˆa –A´ö”a',FALSE);
   OutHPrintXY(160,370,'1] Ó±·a¡ £©‰¡ aˆe”a',FALSE);
   OutHPrintXY(160,390,'2] ¸÷¯¥b·a¡ ¤áË¡¡a ”iŸ¥”a',FALSE);
   OutHPrintXY(160,410,'3] ‹aœ•¡ µaÈŒa»¡µÁ  aÀeˆa»¡¡ ”iŸ¥”a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[4]);
   Erase;
   OutHPrintXY(80,320,'”w¯¥·e ·¡ ‰A·± ­¢µA¬á ¸â—iµA‰A µÅ¸åÓ¡ Í¡¶á–A´á ¯w¬e ´ô·¡ °a¶‰¡',FALSE);
   OutHPrintXY(80,340,'·¶”a',FALSE);
   OutHPrintXY(160,370,'1] Ó±·¡ q´a ·¶“eÐe º‚·i˜Œa»¡ °a¶…”a',FALSE);
   OutHPrintXY(160,390,'2] Ðeˆa»¡œa•¡ ÈiÂ‰Ði ˆa“w¬÷·i Àx“e”a',FALSE);
   OutHPrintXY(160,410,'3] ·©”e °a¶¡e¬á µaœá ¤w¤ó·i ¬—ˆbÐe”a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[2]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'”w¯¥·e  ¶ ¥¢¸sÐe  —s·i Î‰´á´¡Ða“e ·©·¡ ¬—‰v”a',FALSE);
   OutHPrintXY(160,350,'1] Äi¡  —s·i ¸iœa ¤áŸ¥”a',FALSE);
   OutHPrintXY(160,370,'2]  —s· {¦¦… ¦Èá Àa‹eÀa‹e Ò´á¥¥”a',FALSE);
   OutHPrintXY(160,390,'3] ´á¼–—e ‰­¢ Î‰a‰¡ ­¥·i ‘©Ÿ¥”a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[4]);
   Erase;
   OutHPrintXY(80,320,'ÐáÐá ¤éÌe·i ˆé´áˆa”å ”w¯¥·e ˆs¸b¯aœå ¶¤b·i  ee”a',FALSE);
   OutHPrintXY(160,350,'1] ”wÐwÐe a á»¡ Ï¡Ði‰µ·i Àx´a šå”a',FALSE);
   OutHPrintXY(160,370,'2] Ã±ÀbÐa‰A º¶áŸi ¬iÍa ´e¸åÐe‰µ·i Àx“e”a',FALSE);
   OutHPrintXY(160,390,'3] ¶¤b ¸÷•¡“e ‹a· ‰e—¥”a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'»³´eµA ¦‰·¡a¬á ÈiÂ‰Ðaa“e•A a¢¡  e—e ¢…·¡ ¹±Àáœñ µiŸ¡»¡',FALSE);
   OutHPrintXY(80,340,'´g“e”a',FALSE);
   OutHPrintXY(160,370,'1] ”aŸe ÈiÂ‰ŠŸi Àx´aˆe”a',FALSE);
   OutHPrintXY(160,390,'2] 1] ¤å‰Á ˆ{·e ¦‰ÑÂ¯©Ðe •¡¸å·i Ða“eˆõ ¥¡”a“e ÑÂ¯©Ðe ',FALSE);
   OutHPrintXY(160,410,'   ÈiÂ‰Š·¥ ·¡ ¢…·i {Œa»¡ µiaÐe”a',FALSE);
   OutHPrintXY(160,430,'3] a¢¢…·¡ Èa¬á Š ÷·¡ ¬—‹©˜Œa»¡ ‹¡”aa ÈiÂ‰Ðe”a',FALSE);
   Which;
   if c = '1' then inc(transdata[1]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'‰¡”µA È´áe ”w¯¥·e, Ðei ”w¯¥· ’…´|µA¬á ¢‰ÁAˆa ¬aœa»¡“e',FALSE);
   OutHPrintXY(80,340,' a®‰·i ¥¡´v·i˜ ”w¯¥· Ð¬â·e ?',FALSE);
   SetColor(11);
   OutHPrintXY(160,370,'1] ·¡ˆõ·e  a¤ó·¡”a',FALSE);
   OutHPrintXY(160,390,'2] ·¡ˆõ·e ¬aœq· ¬¡¶… “wb·¡”a',FALSE);
   OutHPrintXY(160,410,'3] ”e®…Ðe ¬aœq· ’…­¢·±·¡”a',FALSE);
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[4]);
   Erase;
   OutHPrintXY(80,320,'¯¡Ðñ ‹¡ˆeµA ”w¯¥·¡ •¡¬á‰ÅµA¬á ‰·¦Ÿi Ðaa“e•A º¶áˆa á¢',FALSE);
   OutHPrintXY(80,340,'¯¡aœó”a',FALSE);
   OutHPrintXY(160,370,'1] ¬w‰Å´ô·¡ Àq·a¡a ‰·¦Ðe”a',FALSE);
   OutHPrintXY(160,390,'2] á¢ ‰·¦Ÿi µi¯±Ó¡Ð¬á ‹aœå ­¡Ÿ¡ˆa ´e —iŸ¥”a',FALSE);
   OutHPrintXY(160,410,'3] ¯¡aœá¶‘µA ”ÐwÐa“e  a·q·a¡ ‰·¦Ðe”a',FALSE);
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[3]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'»¢¸w ¬—ÑÉ·i Ða”å ”w¯¥·e ´a¢ ·¡·A´ô·¡ ¬w‰ÅµA‰A ¯±Ðe ¶b·i —i´ö”a',FALSE);
   OutHPrintXY(160,350,'1] ˆû·a¡“e ®…¹·Ða¡e¬á ­¢·a¡“e ˆq¸÷·i ¬}“e”a',FALSE);
   OutHPrintXY(160,370,'2] ¶Å eÐa¡e Àq‰¡ ñ‹¥”a',FALSE);
   OutHPrintXY(160,390,'3] ¬w‰Å·¥ˆé ¢¯¡Ða‰¡ ·¡·AŸi —iœa¡a ”—e”a',FALSE);
   Which;
   if c = '1' then inc(transdata[2]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Erase;
   OutHPrintXY(80,320,'”w¯¥·¡ ¬¡¶… Ïa¡‹aœ‘·i ¼a”åº— ´i®´ô“e µ¡ŸAˆa ¬—‰v”a',FALSE);
   OutHPrintXY(160,350,'1] Àa‹eÀa‹e ®…¬á•¡Ÿi ¬—ˆbÐa¡a µ¡ŸAŸi Àx“e”a',FALSE);
   OutHPrintXY(160,370,'2] µaœá¤å ¯©Ð— ¯¡Ç¡¡a µ¡ŸAŸi Àx“e”a',FALSE);
   OutHPrintXY(160,390,'3] µ¡ŸAˆa ¸b·a¡e ‹a· ¬a¶wÐe”a',FALSE);
   Which;
   if c = '1' then inc(transdata[3]);
   if c = '2' then inc(transdata[4]);
   if c = '3' then inc(transdata[5]);
   Bar(80,250,630,450);
   for i:= 1 to 5 do begin
      j := transdata[i];
      case j of
         0 : transdata[i] := 5;
         1 : transdata[i] := 7;
         2 : transdata[i] := 11;
         3 : transdata[i] := 14;
         4 : transdata[i] := 17;
         5 : transdata[i] := 19;
         6 : transdata[i] := 20
         else transdata[i] := 10;
      end;
   end;
   with player[1] do begin
      strength := transdata[1];
      mentality := transdata[2];
      concentration := transdata[3];
      endurance := transdata[4];
      resistance := transdata[5];
   end;
   j := 4;
   with player[1] do
   if sex = male then begin
      strength := strength + j;
      if strength <= 20 then j := 0
      else begin
         j := strength - 20;
         strength := 20;
      end;
      endurance := endurance + j;
      if endurance <= 20 then j := 0
      else begin
         j := endurance - 20;
         endurance := 20;
      end;
      resistance := resistance + j;
      if resistance > 20 then resistance := 20;
   end
   else begin
      mentality := mentality + j;
      if mentality <= 20 then j := 0
      else begin
         j := mentality - 20;
         mentality := 20;
      end;
      concentration := concentration + j;
      if concentration <= 20 then j := 0
      else begin
         j := concentration - 20;
         concentration := 20;
      end;
      resistance := resistance + j;
      if resistance > 20 then resistance := 20;
   end;
   SetColor(11);
   with player[1] do begin
      SetColor(11);
      str(strength,s);
      OutHPrintXY(15,260,chr(4)+' ÁA  b : '+s,FALSE);
      str(mentality,s);
      OutHPrintXY(15,280,chr(4)+' ¸÷¯¥b : '+s,FALSE);
      str(concentration,s);
      OutHPrintXY(15,300,chr(4)+' »³º—b : '+s,FALSE);
      str(endurance,s);
      OutHPrintXY(15,320,chr(4)+' ·¥b : '+s,FALSE);
      str(resistance,s);
      OutHPrintXY(15,340,chr(4)+' ¸áÐwb : '+s,FALSE);
      SetColor(3);
      hp := endurance;
      str(hp,s);
      OutHPrintXY(23,380,'ÁAb   »¡® : '+s,FALSE);
      sp := mentality;
      str(sp,s);
      OutHPrintXY(23,400,' a¤ó   »¡® : '+s,FALSE);
      esp := concentration;
      str(esp,s);
      OutHPrintXY(23,420,'Á¡ˆqˆb »¡® : '+s,FALSE);
      OutHPrintXY(23,440,'A       ¥I : 1',FALSE);
   end;
   RGB(8,0,10,21);
   SetPalette(8,8);
   SetColor(8);
   Rectangle(305,156,308,472);
   for i:= 23 to 63 do begin
      RGB(8,40,10-((i-23) div 4),i);
      delay(20);
   end;
   for i:= 23 to 63 do begin
      RGB(8,63-i,0,63);
      delay(20);
   end;
   SetColor(9);
   Rectangle(305,156,308,472);
end; { First }

Procedure Second;
begin
   SetColor(15);
   OutHPrintXY(320,170,'¬åÈ‚ Ða¯¡µ¡ ...',FALSE);
   SetColor(10);
   OutHPrintXY(320,225,'q´a·¶“e »¡® : ',FALSE);
   TextColor(15);
   gotoxy(57,15); write('40');
   SetColor(14);
   OutHPrintXY(350,256,'£¥Àó¬÷  ==>',FALSE);
   OutHPrintXY(350,272,'¸÷ÑÂ¬÷  ==>',FALSE);
   OutHPrintXY(350,288,'Ð—  ¶…  ==>',FALSE);
   SetColor(15);
   GotoXY(42,17); write(^Z);
   for i := 17 to 19 do begin
      GotoXY(57,i); write('0');
   end;
   j := 17; k := 40;
   for i:= 1 to 3 do transdata[i] := 0;
   repeat begin
      repeat until KeyPressed;
      c := ReadKey;
      x1 := 0; y1 := 0;
      if c=#0 then begin
         c := ReadKey;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1;
            #75 : x1 := -1;
            #77 : x1 := 1;
         end;
      end;
      if (y1<>0) then begin
         j := j + y1;
         if (j<17) or (j>19) then j := j - y1;
         GotoXY(42,j-y1); write(' ');
         GotoXY(42,j); write(^Z);
      end;
      if (x1<>0) then begin
         transdata[j-16] := transdata[j-16] + x1;
         k := k - x1;
         if (transdata[j-16]<0) or (transdata[j-16]>20) or (k<0) or (k>40) then
         begin
            transdata[j-16] := transdata[j-16] - x1;
            k := k + x1;
         end;
         GotoXY(57,15); write('  ');
         GotoXY(57,15); write(k);
         GotoXY(57,j); write('  ');
         GotoXY(57,j); write(transdata[j-16]);
      end;
   end;
   until (c=#13) and (k=0);
   player[1].agility := transdata[1];
   player[1].accuracy[1] := transdata[2];
   player[1].luck := transdata[3];
   SetColor(3);
   with player[1] do begin
      str(agility,s);
      OutHPrintXY(150,260,chr(4)+' £¥Àó¬÷ : '+s,FALSE);
      str(accuracy[1],s);
      OutHPrintXY(150,280,chr(4)+' ¸÷ÑÂ¬÷ : '+s,FALSE);
      str(luck,s);
      OutHPrintXY(150,300,chr(4)+' Ð—  ¶… : '+s,FALSE);
   end;
   Bar(310,160,630,400);
end; { Second }

Procedure Third;
begin
   SetColor(15);
   OutHPrintXY(320,170,'”w¯¥· ¶¥Ða“e ‰‹s·i ‰¡Ÿa¯¡µ¡',FALSE);
   RGB(8,15,15,15);
   for i:= 1 to 8 do transdata[i] := 0;
   with player[1] do begin
      SetColor(8);
      if (strength>13)and(endurance>13)and(agility>11)and(accuracy[1]>11) then begin
         SetColor(7);
         transdata[1] := 1;
      end;
      OutHPrintXY(400,235,'1] ‹¡  ¬a',FALSE);
      SetColor(8);
      if (mentality>13)and(accuracy[1]>14) then begin
         SetColor(7);
         transdata[2] := 1;
      end;
      OutHPrintXY(400,255,'2]  a¤ó¬a',FALSE);
      SetColor(8);
      if (mentality>10)and(concentration>13)and(accuracy[1]>12) then begin
         SetColor(7);
         transdata[3] := 1;
      end;
      OutHPrintXY(400,275,'3] µA¯aÌá',FALSE);
      SetColor(8);
      if (strength>13)and(mentality>10)and(endurance>10)and(resistance>10)
         and(accuracy[1]>13) then begin
         SetColor(7);
         transdata[4] := 1;
      end;
      OutHPrintXY(400,295,'4] ¸å  ¬a',FALSE);
      SetColor(8);
      if (strength>16)and(agility>13)and(accuracy[1]>11) then begin
         SetColor(7);
         transdata[5] := 1;
      end;
      OutHPrintXY(400,315,'5] ¸åÊ¯w',FALSE);
      SetColor(8);
      if (resistance>16)and(agility>16)and(luck>9) then begin
         SetColor(7);
         transdata[6] := 1;
      end;
      OutHPrintXY(400,335,'6] “¥  ¸a',FALSE);
      SetColor(8);
      if accuracy[1] > 18 then begin
         SetColor(7);
         transdata[7] := 1;
      end;
      OutHPrintXY(400,355,'7] ¬a·Ž…',FALSE);
      SetColor(7);
      transdata[8] := 1;
      OutHPrintXY(400,375,'8] ˜á•©·¡',FALSE);
   end;
   ok := FALSE;
   repeat
      i := 31; j := 1;
      repeat begin
         if i = 40 then j := -1;
         if i = 20 then j := 1;
         i := i + j;
         RGB(7,i,i,i);
         delay(10);
      end;
      until KeyPressed;
      while KeyPressed do c := ReadKey;
      i := ord(c)-48;
      if (i>0) and (i<9) then begin
         if transdata[i] = 1 then begin
            player[1].class := i;
            ok := TRUE;
         end
         else begin
            Sound(100);
            Delay(100);
            NoSound;
         end;
      end;
   until ok;
   WhatClass(player[1].class,s);
   SetColor(10);
   cHPrint(15,217,'”w¯¥· ‰‹s·e '+s+' ·³“¡”a.');
   Bar(310,160,630,400);
   SetColor(8);
   bHPrint(370,250,'´a¢Ç¡a ’Ÿa¯³¯¡µ¡ ....');
   i := 15;
   repeat begin
      inc(i);
      if i > 63 then i := 15;
      RGB(8,i,i,i);
      Delay(50);
   end;
   until KeyPressed;
   c := ReadKey;
   Bar (10,160,304,460); Bar(310,160,630,460);
   RGB(8,15,15,15);
end; { Third }

Procedure Fourth;
begin
   RGB(8,20,20,20);
   SetColor(10);
   bHPrint(30,165,'”w¯¥‰Á •·Ð—Ða‰A–I 4 ¡w· ¶w¬aŸi');
   bHPrint(40,190,'´aœµA¬á ‰©œaº¯³¯¡µ¡.');
   TextColor(15);
   for i := 1 to 10 do begin
      GotoXY(10,i + 15); write(charactername[i]);
   end;
   for i:= 1 to 10 do transdata[i] := 0;
   ok := FALSE;
   k := 16;
   GotoXY(8,k); write(^Z);
   repeat begin
      repeat until KeyPressed;
      c := ReadKey;
      y1 := 0;
      if c = #0 then begin
         c := ReadKey;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1;
         end;
      end;
      if y1 <> 0 then begin
         k := k + y1;
         if (k<16) or (k>25) then k := k - y1;
         GotoXY(8,k-y1); write(' ');
         GotoXY(8,k); write(^Z);
      end;
      if (c = #13) and (transdata[k-15] = 0) then begin
         SetColor(13);
         bHPrint(360,200,'1] ·©Ð—µA Àq¬â ¯¡Ç¥”a');
         bHPrint(360,230,'2] ‹a ¬aœq· “wb·i ¥¥”a');
         repeat begin
            repeat until KeyPressed;
            c := ReadKey;
            if c = '1' then begin
               transdata[k-15] := 1;
               TextColor(8);
               GotoXY(10,k); write(charactername[k-15]);
               TextColor(15);
               Sound(800); Delay(100);
               Sound(500); Delay(70);
               NoSound;
            end;
            if c = '2' then begin
               Profile(k-15);
               SetColor(10);
               SetColor(15);
            end;
         end;
         until (c='1') or (c='2') or (c=#27);
         SetFillStyle(0,1);
         Bar(310,160,630,450);
      end;
      j := 0;
      for i := 1 to 10 do j := j + transdata[i];
      if j = 4 then ok := TRUE;
   end;
   until ok;
   j := 1;
   for i := 1 to 10 do
      if transdata[i] = 1 then begin
         transdata[j] := i;
         j := j + 1;
      end;
   for i:= 1 to 4 do
      with player[i+1] do begin
         j := transdata[i];
         name := charactername[j];
         if character[j,1] = 0 then sex := male else sex := female;
         class := character[j,2];
         strength := character[j,3];
         mentality := character[j,4];
         concentration := character[j,5];
         endurance := character[j,6];
         resistance := character[j,7];
         agility := character[j,8];
         accuracy[1] := character[j,9];
         luck := character[j,10];
         hp := endurance;
         sp := mentality;
         esp := concentration;
      end;
   for i:= 1 to 5 do
      with player[i] do begin
         poison := 0;
         unconscious := 0;
         dead := 0;
         for j := 1 to 3 do level[j] := 1;
         ac := 0;
         if class = 1 then ac := 1;
         experience := 0;
         weapon := 0;
         shield := 0;
         armor := 0;
         wea_power := 2;
         if class = 1 then wea_power := 3;
         if class = 5 then wea_power := 12;
         shi_power := 0;
         arm_power := 0;
         k := class;
         j := accuracy[1];
         case k of
            1,5,7,8 : begin
                         accuracy[2] := 5;
                         accuracy[3] := 5;
                      end;
            2 : begin
                   accuracy[1] := 5;
                   accuracy[2] := j;
                   accuracy[3] := 5;
                end;
            3 : begin
                   accuracy[1] := 5;
                   accuracy[2] := 5;
                   accuracy[3] := j;
                end;
            4 : begin
                   accuracy[2] := j;
                   accuracy[3] := 8;
                end;
            6 : begin
                   accuracy[2] := 5;
                   accuracy[3] := j;
                end
            else begin
                    accuracy[2] := 5;
                    accuracy[3] := 5;
                 end;
         end;
      end;
   player[6].name := '';
   SetColor(15);
   bHPrint(320,180,'”w¯¥ ·©Ð—· Š¬÷¶¥—i');
   TextColor(14);
   for i:= 1 to 5 do begin
      GotoXY(46,14+i); write(player[i].name);
   end;
   SetColor(12);
   bHPrint(320,380,' e´¢ ·¡ ·©Ð—·¡  a·qµA —i»¡ ´g“e”a¡e');
   bHPrint(320,396,'¹ÁÃb ¬w”e· Esc] Ÿi ’Ÿa¯¡µ¡.');
   c := ReadKey;
end; { Fourth }

Procedure Last;
begin
   with party do begin
      map := 6;
      xaxis := 51;
      yaxis := 31;
      food := 20;
      gold := 2000;
      for i:= 1 to 100 do etc[i] := 0;
   end;
   for LoadNo := '1' to '4' do begin
      Assign(partyfile,'party'+LoadNo+'.dat');
      ReWrite(partyfile);
      write(partyfile,party);
      Close(partyfile);
      Assign(playerfile,'player'+LoadNo+'.dat');
      ReWrite(playerfile);
      for i:= 1 to 6 do write(playerfile,player[i]);
      Close(playerfile);
      ExistFile := FSearch('Save'+LoadNo+'.map','');
      if ExistFile <> '' then begin
         Assign(filename,'Save'+LoadNo+'.map');
         {$I-}
         Erase(filename);
         {$I+}
         if IOResult <> 0 then begin
            Closegraph;
            TextColor(7);
            TextBackGround(0);
            ClrScr;
            TextColor(12);
            Writeln('Can''t delete " Save?.map ".');
            Halt;
         end;
      end;
   end;
   TextColor(7);
   TextBackGround(0);
end; { Last }

Function CreateCharacter : boolean;
begin
   Display;
   Name;
   First;
   Second;
   Third;
   Fourth;
   if c<>#27 then begin
      Last;
      CreateCharacter := TRUE;
   end
   else CreateCharacter := FALSE;
end;

begin
end.