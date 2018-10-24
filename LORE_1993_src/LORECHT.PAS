PROGRAM Cheat_File;
TYPE
   lore = record
             name : string[17];
             sex : (male,female);
             class : byte;
             strength : byte;
             mental : byte;
             concentration : byte;
             endurance : byte;
             resistance : byte;
             agility : byte;
             accuracy : array[1..3] of byte;
             luck : byte;
             poison : byte;
             unconscious : integer;
             dead : integer;
             hp : integer;
             sp : integer;
             esp : integer;
             level : array[1..3] of byte;
             ac : byte;
             experience : longint;
             weapon : byte;
             shield : byte;
             armor : byte;
             wea_power : byte;
             shi_power : byte;
             arm_power : byte;
          END;
   loreplayer = record
                   map : byte;
                   xaxis : byte;
                   yaxis : byte;
                   food : byte;
                   gold : longint;
                   etc : array[1..100] of byte;
                END;
VAR
   i,j,k,h : integer;
   playerfile : file of lore;
   partyfile : file of loreplayer;
   player : array[1..6] of lore;
   party : loreplayer;

BEGIN
   writeln;
   writeln('                copyright 1992.8.4');
   writeln('<< The Codex of Another Lore''s a cheat file maker >>');
   writeln('         made by Ahn Young-Kie ( the Genius )');
   Assign(partyfile,'party4.dat');
   ReSet(partyfile);
   read(partyfile,party);
   Close(partyfile);
   Assign(partyfile,'party4.dat');
   ReWrite(partyfile);
   party.food := 255;
   party.gold := 60000;
   write(partyfile,party);
   Close(partyfile);
   Assign(playerfile,'player4.dat');
   ReSet(playerfile);
   for i := 1 to 6 do read(playerfile,player[i]);
   Close(playerfile);
   for i := 1 to 6 do
   with player[i] do begin
      strength := 20;
      mental := 20;
      concentration := 20;
      endurance := 20;
      resistance := 20;
      agility := 20;
      for j := 1 to 3 do accuracy[j] := 20;
      luck := 20;
      poison := 0;
      unconscious := 0;
      dead := 0;
      hp := 255;
      sp := 255;
      esp := 255;
      for j := 1 to 3 do level[j] := 20;
      ac := 10;
      weapon := 9;
      shield := 5;
      armor := 5;
      wea_power := 50;
      shi_power := 5;
      arm_power := 6;
   end;
   Assign(playerfile,'player4.dat');
   ReWrite(playerfile);
   for i:= 1 to 6 do write(playerfile,player[i]);
   Close(playerfile);
   writeln;
   writeln('Changed Completely');
   writeln;
end.