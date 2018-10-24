program Cheat_File_ver2_0;
uses
   crt;
type
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
var
   i,k : integer;
   c : char;
   playerfile : file of lore;
   partyfile : file of loreplayer;
   player : array[1..6] of lore;
   party : loreplayer;

function return(x,y : byte; high,answer : integer; s : string) : byte;
const
   low = 0;
var
   y1 : shortint;
begin
   textcolor(7);
   gotoxy(x,y);
   write(s+' : ');
   textcolor(15);
   gotoxy(x+length(s)+3,y);
   write(answer : 3);
   while true do begin
      y1 := 0;
      c := readkey;
      if c = #0 then begin
         c := readkey;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1;
         end;
      end;
      if c = #13 then begin
         return := answer;
         exit;
      end;
      if c = #27 then begin
         clrscr;
         halt;
      end;
      if y1 <> 0 then begin
         answer := answer + y1;
         if answer<low then answer := low;
         if answer>high then answer := high
         else begin
            gotoxy(x+length(s)+3,y);
            write(answer : 3);
         end;
      end;
   end;
end;

begin
   textbackground(0);
   clrscr;
   textcolor(10);
   gotoxy(10,2); write('<< The Codex of Another Lore''s cheating file maker >>');
   gotoxy(27,3); write('copyright 1993.1.27');
   gotoxy(18,4); write('made by Ahn Young-Kie ( the Genius )');
   window(5,8,75,22);

   Assign(partyfile,'party4.dat');
   ReSet(partyfile);
   read(partyfile,party);
   Close(partyfile);
   party.food := return(1,1,255,party.food,'Party''s Foods');
   party.gold := return(35,1,255,party.gold div 1000,'Party''s Golds (x1000)');
   party.gold := party.gold * 1000;
   Assign(partyfile,'party4.dat');
   ReWrite(partyfile);
   write(partyfile,party);
   Close(partyfile);
   Assign(playerfile,'player4.dat');
   ReSet(playerfile);
   for i := 1 to 6 do read(playerfile,player[i]);
   Close(playerfile);
   for k := 1 to 6 do
   with player[k] do begin
      textcolor(11);
      gotoxy(1,2); write('<< '+name+' >>                 ');
      strength := return(1,3,20,strength,'Strength');
      mental := return(1,4,20,mental,'Mental Ability');
      concentration := return(1,5,20,concentration,'Concentration');
      endurance := return(1,6,20,endurance,'Endurance');
      resistance := return(1,7,20,resistance,'Resistance');
      agility := return(1,8,20,agility,'Agility');
      accuracy[1] := return(35,3,20,accuracy[1],'Accuracy of Arm');
      accuracy[2] := return(35,4,20,accuracy[2],'Accuracy of Mentality');
      accuracy[3] := return(35,5,20,accuracy[3],'Accuracy of Extrasense');
      luck := return(35,6,20,luck,'Luck');
      poison := return(35,7,255,poison,'Poison');
      if unconscious > 255 then unconscious := 255;
      unconscious := return(35,8,255,unconscious,'Unconscious');
      if dead > 255 then dead := 255;
      dead := return(35,9,255,dead,'Dead');
      level[1] := return(1,11,20,level[1],'Battle Level');
      level[2] := return(1,12,20,level[2],'Magic Level');
      level[3] := return(1,13,20,level[3],'Extrasense Level');
      hp := level[1] * endurance;
      sp := level[2] * mental;
      esp := level[3] * concentration;
      weapon := return(35,11,9,weapon,'Weapon');
      shield := return(35,12,5,shield,'Shield');
      armor := return(35,13,5,armor,'Armor');
      case weapon of
         0 : i := 2;
         1 : i := 5;
         2 : i := 7;
         3 : i := 9;
         4 : i := 10;
         5 : i := 15;
         6 : i := 20;
         7 : i := 30;
         8 : i := 40;
         9 : i := 50;
      end;
      wea_power := i;
      shi_power := shield;
      arm_power := armor + 1;
      ac := shield + armor;
      clrscr;
   end;
   Assign(playerfile,'player4.dat');
   ReWrite(playerfile);
   for i:= 1 to 6 do write(playerfile,player[i]);
   Close(playerfile);
   writeln;
   writeln('Changed Completely');
   writeln;
end.