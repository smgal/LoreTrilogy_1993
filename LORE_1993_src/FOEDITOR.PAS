program foe_edit;
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
const
   data : array[1..12] of string = (
          'Strength','Mentality','Endurance','Resistance','Agility','Accuracy 1'
          ,'Accuracy 2','AC','Level','Special','Cast Level','Sp Cast Lv');
var
   i,j,k : integer;
   number : byte;
   c : char;
   s : string;
   filename : file of enemydata;
   name : array[1..16] of char;
   enemy : array[1..75] of enemydata;

procedure ch(x,y,count : integer; put : char);
var i : integer;
begin
   gotoxy(x,y);
   for i := 1 to count do write(put);
end;

procedure st(x,y : integer; put : string);
begin
   gotoxy(x,y);
   write(put);
end;

procedure screen_setup;
begin
   number := 0;
   textbackground(1);
   clrscr;
   textbackground(6);
   ch(4,2,33,' ');
   textcolor(15);
   st(12,2,'Foe Editor ver 1.0');
end;

procedure display(number : integer);
begin
   if number > 75 then number := 1;
   textcolor(7);
   ch(4,5,13,' ');
   st(5,5,'Number :');
   ch(4,7,25,' ');
   st(5,7,'Name :');
   for i:= 1 to 7 do begin
      ch(4,8+i,20,' ');
      st(5,8+i,data[i]);
      st(16,8+i,':');
   end;
   for i:= 8 to 12 do begin
      ch(4,9+i,20,' ');
      st(5,9+i,data[i]);
      st(16,9+i,':');
   end;
   textcolor(6);
   textbackground(7);
   with enemy[number] do begin
      str(number,s); st(14,5,s);
      st(12,7,name);
      str(strength,s); st(18,9,s);
      str(mentality,s); st(18,10,s);
      str(endurance,s); st(18,11,s);
      str(resistance,s); st(18,12,s);
      str(agility,s); st(18,13,s);
      str(accuracy[1],s); st(18,14,s);
      str(accuracy[2],s); st(18,15,s);
      str(ac,s); st(18,17,s);
      str(level,s); st(18,18,s);
      str(special,s); st(18,19,s);
      str(castlevel,s); st(18,20,s);
      str(specialcastlevel,s); st(18,21,s);
   end;
end;

function inputsub(x,y : integer) : byte;
var
   i,code : integer;
   ok : boolean;
begin
   ch(x,y,3,' ');
   gotoxy(x,y);
   write(c);
   s := c;
   ok := false;
   repeat begin
      repeat until keypressed;
      c := readkey;
      if c = #13 then ok := true;
      if not ok then begin
         write(c);
         s := s + c;
      end;
   end;
   until ok;
   val(s,i,code);
   inputsub := i;
   if code <> 0 then inputsub := 0;
end;

procedure input;
label 1;
begin
1:
   textcolor(7);
   textbackground(6);
   number := number +1;
   if number > 75 then number := 1;
   display(number);
   textcolor(7);
   textbackground(6);
   str(number,s);
   k := length(s);
   gotoxy(14+k,5);
   repeat until keypressed;
   c := readkey;
   if c <> #13 then begin
      number := inputsub(14,5) - 1;
      if (number<0) or (number>74) then number := 0;
      goto 1;
   end;
   k := length(enemy[number].name);
   gotoxy(12+k,7);
   repeat until keypressed;
   ch(12,7,17,' ');
   gotoxy(12,7);
   readln(s);
   if s = '' then st(12,7,enemy[number].name)
   else enemy[number].name := s;
   with enemy[number] do begin
      str(strength,s);
      k := length(s);
      gotoxy(18+k,9);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then strength := inputsub(18,9);
      str(mentality,s);
      k := length(s);
      gotoxy(18+k,10);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then mentality := inputsub(18,10);
      str(endurance,s);
      k := length(s);
      gotoxy(18+k,11);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then endurance := inputsub(18,11);
      str(resistance,s);
      k := length(s);
      gotoxy(18+k,12);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then resistance := inputsub(18,12);
      str(agility,s);
      k := length(s);
      gotoxy(18+k,13);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then agility := inputsub(18,13);
      str(Accuracy[1],s);
      k := length(s);
      gotoxy(18+k,14);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then accuracy[1] := inputsub(18,14);
      str(accuracy[2],s);
      k := length(s);
      gotoxy(18+k,15);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then accuracy[2] := inputsub(18,15);
      str(ac,s);
      k := length(s);
      gotoxy(18+k,17);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then ac := inputsub(18,17);
      str(level,s);
      k := length(s);
      gotoxy(18+k,18);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then level := inputsub(18,18);
      str(special,s);
      k := length(s);
      gotoxy(18+k,19);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then special := inputsub(18,19);
      str(castlevel,s);
      k := length(s);
      gotoxy(18+k,20);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then castlevel := inputsub(18,20);
      str(specialcastlevel,s);
      k := length(s);
      gotoxy(18+k,21);
      repeat until keypressed;
      c := readkey;
      if c <> #13 then specialcastlevel := inputsub(18,21);
   end;
   repeat until keypressed;
   c := readkey;
end;

begin { Main }
   textmode(co40);
   screen_setup;
   assign(filename,'foedata.dat');
   reset(filename);
   for i := 1 to 75 do read(filename,enemy[i]);
   close(filename);
   display(number);
   repeat input;
   until c = #27;
   assign(filename,'foedata.dat');
   rewrite(filename);
   for i:= 1 to 75 do write(filename,enemy[i]);
   close(filename);
end.