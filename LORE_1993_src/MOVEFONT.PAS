program Move_Font_ver1_0;
uses
   crt, graph, mouse;
const
   maxfont = 55;
   fontsize = 246;
type
   draw = array[1..fontsize] of byte;
var
   i,j,k : integer;
   c : char;
   fontname1,fontname2 : string;
   x,y : word;
   ok : boolean;
   fontfile1 : file of draw;
   fontfile2 : file of draw;
   font : array[1..2,0..maxfont] of draw;
   tile : draw;
   map : array[0..20,0..20] of byte;

procedure load;
begin
   assign(fontfile1,fontname1);
   reset(fontfile1);
   for i := 0 to maxfont do read(fontfile1,font[1,i]);
   close(fontfile1);
   assign(fontfile2,fontname2);
   reset(fontfile2);
   for i := 0 to maxfont do read(fontfile2,font[2,i]);
   close(fontfile2);
end;

procedure save;
begin
   assign(fontfile1,fontname1);
   rewrite(fontfile1);
   for i := 0 to maxfont do write(fontfile1,font[1,i]);
   close(fontfile1);
   assign(fontfile2,fontname2);
   rewrite(fontfile2);
   for i := 0 to maxfont do write(fontfile2,font[2,i]);
   close(fontfile2);
end;

function scope(var vol,num : integer; var xx,yy : word) : boolean;
begin
   getmouse(x,y);
   vol := -1; num := -1;
   if (x>=150) and (x<430) and (y in [50..130]) then vol := 1;
   if (x>=150) and (x<430) and (y in [150..230]) then vol := 2;
   if vol = 1 then begin
      xx := (x-150) div 20; yy := (y-50) div 20;
      num := xx * 4 + yy;
   end;
   if vol = 2 then begin
      xx := (x-150) div 20; yy := (y-150) div 20;
      num := xx * 4 + yy;
   end;
   if vol > 0 then scope := true else scope := false;
end;

procedure set_all;
begin
   for j := 0 to 3 do for i := 0 to 13 do begin
      k := i * 4 + j;
      putimage(i*20+150,j*20+50,font[1,k],copyput);
   end;
   for j := 0 to 3 do for i := 0 to 13 do begin
      k := i * 4 + j;
      putimage(i*20+150,j*20+150,font[2,k],copyput);
   end;
end;


begin { Main }
   writeln;
   write('Font1 name (*.fnt) : ');
   readln(fontname1);
   if fontname1 = '' then fontname1 := 'font1';
   fontname1 := fontname1 + '.fnt';
   write('Font2 name (*.fnt) : ');
   readln(fontname2);
   if fontname2 = '' then fontname2 := 'font2';
   fontname2 := fontname2 + '.fnt';
   i := VGA;
   j := VGAMed;
   InitGraph(i,j,'');
   load;
   set_all;
   if not initmouse then begin
      closegraph;
      write(^G,'Can''t initialize your mouse !!');
      halt;
   end;
   cursor(On);
   setmouse(1,1);
   ok := false;
   repeat begin
      if button = left then
      if scope(j,k,x,y) then begin
         for i := 1 to fontsize do tile[i] := font[j,k,i];
         cursor(off);
         putimage(1,1,tile,copyput);
         cursor(on);
      end;
      if button = right then
      if scope(j,k,x,y) then begin
         for i := 1 to fontsize do font[j,k,i] := tile[i];
         cursor(off);
         putimage(x*20+150,y*20+(j-1)*100+50,tile,copyput);
         cursor(on);
      end;
      if keypressed then begin
         c := readkey;
         if c = 's' then save;
         if c = #27 then ok := true;
      end;
   end;
   until ok;
   closegraph;
end.