Unit LoreMain;

INTERFACE

Uses
   Crt, Dos, Graph, AdLib, UHanX, LoreSub, LoreMenu,
   Voice, LoreBatt, LoreSpec, LoreEnt, LoreTalk, LoreCret;

 Procedure Enter_Water;
 Procedure Enter_Swamp;
 Procedure Enter_Lava;
 Procedure Move_Mode;
 Procedure Main;


IMPLEMENTATION


Procedure enter_water;
begin
   if party.etc[2] > 0 then begin
      dec(party.etc[2]);
      Scroll(true);
      if Random(encounter^*30)=0 then EncounterEnemy;
   end
   else originposition;
end;

Procedure enter_swamp;
begin
   Scroll(true);
   j := 0;
   for person := 1 to 6 do with player[person] do
   if name <> '' then begin
      if poison > 0 then inc(poison);
      if poison > 10 then begin
         poison := 1;
         if (dead>0) and (dead<100) then inc(dead)
         else if unconscious > 0 then begin
            inc(unconscious);
            if unconscious > endurance * level[1] then dead := 1;
         end
         else begin
            dec(hp);
            if hp <= 0 then unconscious := 1;
         end;
         inc(j);
      end;
   end;
   if party.etc[3] > 0 then dec(party.etc[3])
   else begin
      Clear;
      for i := 1 to 6 do m[i] := '';
      for i := 1 to 6 do
      if random(20)+1 >= player[i].luck then m[i] := '!';
      for i := 0 to 1 do begin
         yline := 30; hany := 32;
         page := 1 - page;
         setactivepage(page);
         Print(12,'·©Ð—·e •¢·¡ ·¶“e “|µA —i´áˆv”a !!!');
         Print(7,'');
         for person := 1 to 6 do with player[person] do
         if (name<>'') and (m[person]='!') then begin
            Print(13,name+'“e º—•¢ –A´ö”a.');
            if poison = 0 then poison := 1;
         end;
      end;
      DisplayCondition;
   end;
   if j > 0 then begin
      displayHP;
      displayCondition;
   end;
   DetectGameOver;
end;

Procedure enter_lava;
begin
   Scroll(true);
   Clear;
   for i := 1 to 6 do m[i] := '';
   for i := 1 to 6 do begin
      j := random(40)+40 - 2*random(player[i].luck);
      str(j,m[i]);
   end;
   for i := 0 to 1 do begin
      yline := 30; hany := 32;
      page := 1 - page;
      setactivepage(page);
      Print(12,'·©Ð—·e ¶w´q»¡”¡ —i´á¬ö”a !!!');
      Print(7,'');
      for person := 1 to 6 do with player[person] do
      if name<>'' then Print(13,name+'“e '+m[person]+'· Ï¡ÐŸi ·³´ö”a !');
   end;
   for person := 1 to 6 do with player[person] do begin
      val(m[person],j,k);
      if (hp>0) and (unconscious=0) then begin
         hp := hp - j;
         if hp <= 0 then unconscious := 1;
      end
      else if (hp>0) and (unconscious>0) then hp := hp - j
      else if (unconscious>0) and (dead=0) then begin
         unconscious := unconscious + j;
         if unconscious > endurance*level[1] then dead := 1;
      end
      else if dead > 0 then
      if dead + j > 30000 then dead := 30000 else dead := dead + j;
   end;
   SimpleDisCond;
   DetectGameOver;
end;

Procedure Move_Mode;
begin
   Scroll(true);
   j := 0;
   for person := 1 to 6 do with player[person] do
   if name <> '' then begin
      if poison > 0 then inc(poison);
      if poison > 10 then begin
         poison := 1;
         if (dead>0) and (dead<100) then inc(dead)
         else if unconscious > 0 then begin
            inc(unconscious);
            if unconscious > endurance * level[1] then dead := 1;
         end
         else begin
            dec(hp);
            if hp <= 0 then unconscious := 1;
         end;
         inc(j);
      end;
   end;
   if j > 0 then begin
      displayHP;
      displayCondition;
   end;
   DetectGameOver;
   if party.etc[5] > 0 then dec(party.etc[5]);
   if Random(encounter^*20)=0 then EncounterEnemy;
end;

{$F+} Procedure Main; {$F-}
begin
   ok:=false; x1:=0; y1:=0;
   if keypressed then begin
      c := ReadKey;
      if upcase(c) in ['P','V','Q','C','E','R','G'] then begin
         clear;
         case upcase(c) of
            'P' : ViewParty;
            'V' : ViewCharacter;
            'Q' : QuickView;
            'C' : CastSpell;
            'E' : Extrasense;
            'R' : Rest;
            'G' : GameOption;
         end;
         x1 := 0; y1 := 0;
         ok := true;
      end;
      if c = #0 then begin
         ok := false;
         c := ReadKey;
         if c in [#72,#75,#77,#80] then ok := true;
         case c of
            #72 : begin
                     y1 := -1;
                     if position = town then face := 1 else face := 5;
                  end;
            #80 : begin
                     y1 := 1;
                     if position = town then face := 0 else face := 4;
                  end;
            #75 : begin
                     x1 := -1;
                     if position = town then face := 3 else face := 7;
                  end;
            #77 : begin
                     x1 := 1;
                     if position = town then face := 2 else face := 6;
                  end;
         end;
         if party.map = 26 then face := face + 4;
      end;
      if c = #32 then begin
         party.etc[6] := 0;
         SelectMode;
         x1 := 0; y1 := 0;
         ok := true;
      end;
      if c = #9 then
      asm
         mov ah,16;
         mov al,27;
         mov bx,0;
         mov cx,255;
         int $10;
      end;
      if c = #8 then soundon := not soundon;
      if c = #255 then for i := 5 to 246 do font^[0,i] := 0;
      if ok then begin
         x := x+x1;
         y := y+y1;
         if (x>4) and (x<xmax-3) and (y>4) and (y<ymax-3) and (c<>#27) then begin

            if position = town then
            case map[x,y] of
               0 : specialevent;
               1..21 : originposition;
               22 : begin
                       originposition;
                       entermode;
                    end;
               23 : begin
                       originposition;
                       sign;
                    end;
               24 : enter_water;
               25 : enter_swamp;
               26 : enter_lava;
               27..47 : move_mode
               else begin
                       originposition;
                       talkmode;
                    end;
            end;

            if position = ground then
            case map[x,y] of
               0 : specialevent;
               1..21 : originposition;
               22 : begin
                       originposition;
                       sign;
                    end;
               48 : enter_water;
               23,49 : enter_swamp;
               50 : enter_lava;
               24..47 : move_mode
               else begin
                       originposition;
                       entermode;
                    end;
            end;

            if position = den then
            case map[x,y] of
               0,52 : specialevent;
               1..40,51 : originposition;
               53 : begin
                       originposition;
                       sign;
                    end;
               48 : enter_water;
               49 : enter_swamp;
               50 : enter_lava;
               54 : begin
                       originposition;
                       entermode;
                    end;
               41..47 : move_mode
               else begin
                       originposition;
                       talkmode;
                    end;
            end;

            if position = keep then
            case map[x,y] of
               0,52 : specialevent;
               1..39,51 : originposition;
               53 : begin
                       originposition;
                       sign;
                    end;
               48 : enter_water;
               49 : enter_swamp;
               50 : enter_lava;
               54 : begin
                       originposition;
                       entermode;
                    end;
               40..47 : move_mode
               else begin
                       originposition;
                       talkmode;
                    end;
            end;
         end else originposition;
      end;
   end;
end;

begin
end.