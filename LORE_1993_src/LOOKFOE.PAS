program LookFoe;
uses
   crt;
type
   enemydata = record
                  name : string[16];
                  strength : byte;
                  mentality : byte;
                  endurance : byte;
                  resistance : byte;
                  agility : byte;
                  accuracy : array[1..2] of byte;
                  ac : byte;
                  special : byte;
                  castlevel : byte;
                  specialcastlevel : byte;
                  level : byte;
               end;
var
   i,k : integer;
   c : char;
   filename : file of enemydata;
   enemy : array[1..75] of enemydata;
   save : text;

begin { Main }
   assign(filename,'foedata.dat');
   reset(filename);
   for i := 1 to 75 do read(filename,enemy[i]);
   close(filename);
   assign(save,'Foe.lst');
   rewrite(save);
   writeln(save,'Enemy data ========>>');
   for k := 1 to 75 do with enemy[k] do begin
      writeln(save,'');
      writeln(save,'==================================================');
      writeln(save,'Enemy Number     : ',k : 2);
      writeln(save,'Enemy Name       : ',name);
      writeln(save,'Level            : ',level : 2);
      writeln(save,'--------------------------------------------------');
      write(save,'Strength         : ',strength : 3);
      writeln(save,'    Mentality          : ',mentality);
      write(save,'Endurance        : ',endurance : 3);
      writeln(save,'    Resistance         : ',resistance);
      writeln(save,'Agility          : ',agility : 3);
      write(save,'Accuracy of arms : ',accuracy[1] : 3);
      writeln(save,'    Accuracy of magic  : ',accuracy[2]);
      write(save,'Armor Class      : ',ac : 3 );
      writeln(save,'    Special Attack     : ',special);
      write(save,'Cast Level       : ',castlevel : 3);
      writeln(save,'    Special Cast Level : ',specialcastlevel);
      if c = #27 then halt;
   end;
   close(save);
end.