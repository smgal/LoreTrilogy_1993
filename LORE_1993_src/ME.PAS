program Map_Editor;
uses
   crt,graph;
type
   draw = array[1..246] of byte;
var
   i,j,k : integer;
   x0,y0,x,y,x1,y1 : integer;
   tab,page,color : integer;
   xmax,ymax,auto : byte;
   filldefault : byte;
   c : char;
   fontfilename,mapfilename,s : string;
   move : boolean;
   fontfile,mapfile : file of byte;
   map : array[0..99,0..99] of byte;
   font : array[0..55] of draw;

procedure putmap;
begin
   randomize;
   for j:= 0 to 99 do for i:= 0 to 99 do map[i,j] := 0;
   for j:= 0 to ymax-1 do for i:= 0 to xmax-1 do map[i,j] := filldefault;
end;

procedure display_color;
var i,j : integer;
begin
   for i:= 0 to 1 do begin
      setactivepage(i);
      for j:= 0 to 6 do
      for k:= j*8 to j*8+7 do
      putimage(450+j*25,145+(k-j*8)*25,font[k],copyput);
   end;
   setactivepage(page);
end;

procedure mini_map;
var
   i,j : integer;
begin
   j := getcolor;
   for i:= 0 to 1 do begin
      setactivepage(i);
      setlinestyle(0,0,3);
      setcolor(15);
      rectangle(449,19,551,121);
      setlinestyle(0,0,1);
      setfillstyle(0,15);
      bar(450,20,550,120);
      setcolor(2);
      rectangle(449,19,450+xmax,20+ymax);
      setcolor(14);
      rectangle(x0+450,y0+20,x0+469,y0+35);
   end;
   setcolor(j);
   setactivepage(page);
end;

procedure map_print;
var
   i,j,k : integer;
begin
   page := 1- page;
   setactivepage(page);
   for j:= 0 to 15 do begin
      for i:= 0 to 19 do begin
         k := map[x0+i,y0+j];
         putimage((i+1)*20,(j+1)*20,font[k],0);
      end;
   end;
   putimage((x+1)*20,(y+1)*20,font[55],XorPut);
   setvisualpage(page);
   setactivepage(page);
   mini_map;
end;

procedure color_position(x,y : integer);
var i,j : integer;
begin
   for i:= 0 to 1 do begin
      setactivepage(i);
      putimage(450+x*25,145+y*25,font[55],XorPut);
   end;
end;

procedure change_color;
var
   c : char;
   i,j,co,x1,y1,x,y : integer;
begin
   co := color;
   x := trunc(color/8);
   y := color - 8*x;
   repeat begin
      repeat begin
         repeat until keypressed;
         x1 := 0; y1 := 0;
         i := 0;
         c := readkey;
         if c = #0 then begin
            c := readkey;
            i := 1;
            case c of
               #72 : y1 := -1;
               #80 : y1 := 1;
               #75 : x1 := -1;
               #77 : x1 := 1
               else i:=0;
            end;
         end;
      end;
      until (i=1) or (c=#13);
      if i = 1 then begin
         for j:= 0 to 1 do begin
            setactivepage(j);
            putimage(450+x*25,145+y*25,font[co],CopyPut);
         end;
         x := x + x1;
         y := y + y1;
         if (x<0) or (x>6) or (y<0) or (y>7) then begin
            x := x - x1; y := y - y1;
         end;
         co := y + x * 8;
         color_position(x,y);
      end;
   end;
   until c = #13;
   color := co;
   color_position(x,y);
   setcolor(15);
   color_position(x,y);
end;

procedure tilemove;
begin
   x := x + x1;
   y := y + y1;
   if (x<0) or (y<0) or (x>19) or (y>15) then begin
      x := x - x1;
      y := y - y1;
      exit;
   end;
   putimage((x+1)*20,(y+1)*20,font[55],XorPut);
   putimage((x-x1+1)*20,(y-y1+1)*20,font[map[x0+x-x1,y0+y-y1]],CopyPut);
end;

procedure entertile;
begin
   map[x0+x,y0+y] := color;
   putimage((x+1)*20,(y+1)*20,font[color],CopyPut);
   if auto = 1 then begin
      x := x + 1;
      if x>19 then begin
         x := 0;
         y := y + 1;
      end;
      if y >15 then y := 15;
   end;
   if auto = 2 then begin
      y := y + 1;
      if y > 15 then begin
         y := 0;
         x := x + 1;
      end;
      if x > 19 then x := 19;
   end;
   putimage((x+1)*20,(y+1)*20,font[55],XorPut);
end;

procedure movemap(xwidth, ywidth : integer);
begin
   x0 := x0 + xwidth;
   y0 := y0 + ywidth;
   if x0<0 then x0 := 0;
   if y0<0 then y0 := 0;
   if x0>xmax-20 then x0 := xmax-20;
   if y0>ymax-16 then y0 := ymax-16;
   map_print;
end;

procedure viewxy;
begin
   setfillstyle(0,0);
   setcolor(14);
   for i:= 0 to 1 do begin
      setactivepage(i);
      bar(450,125,499,144);
      str(x+x0,s);
      outtextxy(450,125,'X = '+s);
      str(y+y0,s);
      outtextxy(450,135,'Y = '+s);
   end;
end;

procedure autoput;
begin
   auto := auto + 1;
   if auto = 3 then auto := 0;
   setfillstyle(0,0);
   setcolor(11);
   for i := 0 to 1 do begin
      setactivepage(i);
      bar(515,130,560,140);
      moveto(515,130);
      case auto of
         0 : outtext(chr(4));
         1 : outtext(chr(26));
         2 : outtext(chr(25));
      end;
   end;
end;

procedure save;
begin
   assign(mapfile,mapfilename);
   rewrite(mapfile);
   write(mapfile,xmax);
   write(mapfile,ymax);
   for j:=1 to ymax do for i:=1 to xmax do write(mapfile,map[i-1,j-1]);
   close(mapfile);
end;

procedure load;
begin
   assign(mapfile,mapfilename);
   reset(mapfile);
   read(mapfile,xmax);
   read(mapfile,ymax);
   for j:=1 to ymax do for i:=1 to xmax do read(mapfile,map[i-1,j-1]);
{   for j:=0 to ymax-1 do for i:=0 to xmax-1 do
   if map[i,j] = 49 then map[i,j] := 50;}
   close(mapfile);
   movemap(-100,-100);
end;

procedure set_all;
begin
   x := 0; y := 0;
   x0 := 0; y0 := 0;
   page := 0;
   color := 0;
   writeln;
   write('Input Map Name (*.map) : '); readln(mapfilename);
   if mapfilename = '' then mapfilename := 'map';
   mapfilename := mapfilename + '.map';
   write('Input Font Name (*.fnt) : '); readln(fontfilename);
   if fontfilename = '' then fontfilename := 'font';
   fontfilename := fontfilename + '.fnt';
   write('XMax ( default = 100 ) : '); readln(s);
   val(s,xmax,i);
   if not (xmax in [20..100]) then xmax := 100;
   write('YMax ( default = 100 ) : '); readln(s);
   val(s,ymax,i);
   if not (ymax in [16..100]) then ymax := 100;
   write('Tab Size ( default = 7 ) : '); readln(s);
   val(s,tab,i);
   if not (tab in [1..20]) then tab := 7;
   write('Fill Default ( default = 0 ) : '); readln(s);
   val(s,filldefault,i);
   if not (filldefault in [0..55]) then filldefault := 0;
   putmap;
   i := VGA;
   j := VGAMed;
   initgraph(i,j,'');
   setvisualpage(page);
   setactivepage(page);
   assign(fontfile,fontfilename);
   reset(fontfile);
   for j:= 0 to 55 do for i:= 1 to 246 do
      read(fontfile,font[j,i]);
   close(fontfile);
   cleardevice;
   setlinestyle(0,0,3);
   setcolor(15);
   for i:= 0 to 1 do begin
      setactivepage(i);
      rectangle(19,19,420,340);
      settextstyle(0,0,2);
      outtextxy(140,1,'Visual Map');
      settextstyle(0,0,1);
      outtextxy(465,7,'Whole Map');
   end;
   setactivepage(page);
   display_color;
   color_position(0,0);
   map_print;
end;

begin { Main }
   set_all;
   auto := 2; autoput;
   viewxy;
   while true <> false do begin
      c := readkey;
      move := false;
      x1 := 0; y1 := 0;
      if c = #0 then begin
         c := readkey;
         move := true;
         case c of
            #72 : y1 := -1;
            #80 : y1 := 1;
            #75 : x1 := -1;
            #77 : x1 := 1;
            #71 : movemap(-xmax,-ymax);
            #79 : movemap(xmax,ymax);
            #115 : movemap(-tab,0);
            #116 : movemap(tab,0);
            #73 : movemap(0,-tab);
            #81 : movemap(0,tab)
            else move := false;
         end;
      end;
      if (x1<>0) or (y1<>0) then c := #0;
      case upcase(c) of
         #0 : tilemove;
         #32 : entertile;
         #27 : begin
                  closegraph;
                  halt(0);
               end;
         #13 : change_color;
         #12 : load;
         #19 : save;
         #1 : autoput;
         else begin
                 sound(100);
                 delay(100);
                 nosound;
              end;
      end;
      viewxy;
      setvisualpage(page);
      setactivepage(page);
   end;
end.