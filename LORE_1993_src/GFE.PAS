program Genius_Font_Editor_ver1_1;
uses
   crt, graph;
label
   loop;
const
   max_data = 55;
   menu : array[1..7] of string[12] = (
             'Change  Font',
             ' Move  Font ',
             'Set  Palette',
             '  New Font  ',
             ' Load  Font ',
             ' Save  Font ',
             'Exit to  DOS'           );
type
   draw = array[0..max_data,1..246] of byte;
   palettetype = array[0..15,1..3] of byte;
var
   i,j,k : integer;
   b,selectbyte : byte;
   c1 : char;
   fontfilename : string[12];
   s : string;
   x,y,x1,y1,color,fontxy : integer;
   move : boolean;
   fontfile : file of draw;
   font : ^draw;
   palettefile : file of palettetype;
   palette : palettetype;
   map : array[0..20,0..20] of byte;

function inkey : byte;
var
   temp : byte;
begin
   asm
      mov ah,0
      int $16
      mov temp,ah
   end;
   inkey := temp;
end;

Procedure RGB(Color, Red, Green, Blue : byte); assembler;
asm
   mov dx,$3c8;
   mov al,Color;
   out dx,al;
   inc dx;
   mov al,Red;
   out dx,al;
   mov al,Green;
   out dx,al;
   mov al,Blue;
   out dx,al;
end;

procedure removedisplay;
var
   i : integer;
begin
   i := getcolor;
   setcolor(7);
   rectangle(x*6,y*5,x*6+6,y*5+5);
   setcolor(i);
end;

procedure display;
var
   i : integer;
begin
   i := getcolor;
   setcolor(15);
   rectangle(x*6,y*5,x*6+6,y*5+5);
   setcolor(i);
end;

procedure setfont(fontnum : integer);
var
   i,j,colorcode : integer;
begin
   putimage(130,10,font^[fontnum],copyput);
   for j:= 0 to 19 do begin
      for i:= 0 to 19 do begin
         colorcode := getpixel(i+130,j+10);
         setfillstyle(1,colorcode);
         bar(i*6+1,j*5+1,i*6+5,j*5+4);
      end;
   end;
end;

procedure displayfont;
var
   i,j : integer;
begin
   for j:= 0 to 6 do
   for k:= j*8 to j*8+7 do
   putimage(224+j*25,8+(k-j*8)*25,font^[k],copyput);
end;

procedure fontposition(x,y : integer);
var
   i,j : integer;
begin
   putimage(224+x*25,8+y*25,font^[max_data],XorPut);
end;

function changefont : byte;
var
   b : byte;
   i,j,co,color,x1,y1,x,y,old_fontxy : integer;
   move_ok : boolean;
begin
   old_fontxy := fontxy;
   color := getcolor;
   co := fontxy;
   x := trunc(fontxy/8);
   y := fontxy - 8*x;
   repeat
      repeat
         x1 := 0; y1 := 0;
         b := inkey;
         move_ok := true;
         case b of
            72 : y1 := -1;
            80 : y1 := 1;
            75 : x1 := -1;
            77 : x1 := 1
            else move_ok := false;
         end;
         if b in [1,28] then move_ok := true;
      until move_ok;
      if b <> 28 then begin
         putimage(224+x*25,8+y*25,font^[co],CopyPut);
         x := x + x1;
         y := y + y1;
         if (x<0) or (x>6) or (y<0) or (y>7) then begin
            x := x - x1; y := y - y1;
         end;
         co := y + x * 8;
         fontposition(x,y);
      end;
   until b in [1,28];
   if b = 1 then begin
      putimage(224+x*25,8+y*25,font^[co],CopyPut);
      fontxy := old_fontxy;
      x := trunc(fontxy/8);
      y := fontxy - 8*x;
      fontposition(x,y);
   end
   else fontxy := co;
   setcolor(color);
   changefont := b;
end;

procedure displaycolor;
var
   i,j : integer;
begin
   for i := 0 to 15 do begin
      setfillstyle(1,i);
      bar(128,36+i*6,151,40+i*6);
      if i = color then begin
         j := getcolor;
         setcolor(15);
         rectangle(126,36+i*6,153,40+i*6);
         setcolor(j);
      end;
   end;
end;

procedure moving;
begin
   removedisplay;
   if x+x1 < 0 then x := 20;
   if y+y1 < 0 then y := 20;
   if x+x1 > 19 then x := -1;
   if y+y1 > 19 then y := -1;
   x := x + x1; y := y + y1;
   display;
end;

procedure puttile;
begin
   setfillstyle(1,color);
   bar(x*6+1,y*5+1,x*6+5,y*5+4);
   putpixel(130+x,10+y,color);
   map[x,y] := color;
end;

procedure changecolor;
var
   i,j : integer;
   b : byte;
begin
   removedisplay;
   displaycolor;
   repeat
      b := inkey;
      case b of
         72 : if color > 0 then begin
                  setfillstyle(1,0);
                  bar(126,36+color*6,153,40+color*6);
                  setfillstyle(1,color);
                  bar(128,36+color*6,151,40+color*6);
                  color := color - 1;
                  setcolor(15);
                  rectangle(126,36+color*6,153,40+color*6);
               end;
         80 : if color < 15 then begin
                  setfillstyle(1,0);
                  bar(126,36+color*6,153,40+color*6);
                  setfillstyle(1,color);
                  bar(128,36+color*6,151,40+color*6);
                  color := color + 1;
                  setcolor(15);
                  rectangle(126,36+color*6,153,40+color*6);
               end;
      end;
   until b = 28;
   setfillstyle(1,0);
   bar(126,36,153,130);
   setfillstyle(1,color);
   bar(5,125,115,130);
   display;
end;

procedure removefontnumber;
begin
   setfillstyle(1,0);
   bar(0,140,150,160)
end;

procedure change;
var
   escape_code : byte;
begin
   setcolor(2);
   outtextxy(1,140,'Change ---');
   escape_code := changefont;
   if escape_code <> 1 then setfont(fontxy);
   removefontnumber;
end;

procedure move_paste;
var
   escape_code : byte;
   x,y : integer;
begin
   setcolor(6);
   outtextxy(1,140,'Move -----');
   sound(500);
   delay(100);
   sound(700);
   delay(50);
   nosound;
   escape_code := changefont;
   if escape_code <> 1 then begin
      getimage(130,10,149,29,font^[fontxy]);
      x := trunc(fontxy/8);
      y := fontxy - 8*x;
      putimage(224+x*25,8+y*25,font^[fontxy],copyput);
      putimage(224+x*25,8+y*25,font^[max_data],xorput);
   end;
   removefontnumber;
end;

procedure setpal;
var
   x1, y1 : shortint;
   temp_pal : array[1..3] of byte;
   b, num : byte;
begin
   for i := 1 to 3 do temp_pal[i] := palette[color,i];
   setcolor(10);
   outtextxy(5,140,'Red   :');
   setcolor(7);
   outtextxy(5,150,'Green :');
   outtextxy(5,160,'Blue  :');
   for i := 1 to 3 do
   if palette[color,i] <> 0 then begin
      if i = 1 then setcolor(10) else setcolor(7);
      line(77,135+i*10,76+2*palette[color,i],135+i*10);
   end;
   num := 1;
   repeat
      setpalette(color,color);
      RGB(color,palette[color,1],palette[color,2],palette[color,3]);
      setcolor(10);
      case num of
         1 : outtextxy(5,140,'Red   :');
         2 : outtextxy(5,150,'Green :');
         3 : outtextxy(5,160,'Blue  :');
      end;
      if palette[color,num] <> 0 then
         line(77,135+num*10,76+2*palette[color,num],135+num*10);
      x1 := 0; y1 := 0;
      b := inkey;
      case b of
         72 : y1 := -1;
         80 : y1 := 1;
         75 : x1 := -1;
         77 : x1 := 1
      end;
      if y1 <> 0 then begin
         setcolor(7);
         case num of
            1 : outtextxy(5,140,'Red   :');
            2 : outtextxy(5,150,'Green :');
            3 : outtextxy(5,160,'Blue  :');
         end;
         if palette[color,num] <> 0 then
            line(77,135+num*10,76+2*palette[color,num],135+num*10);
         num := num + y1;
         if num < 1 then num := 3;
         if num > 3 then num := 1;
      end;
      if x1 <> 0 then
      if not ((palette[color,num] + x1) in [64..255]) then begin
         palette[color,num] := palette[color,num] + x1;
         if x1 > 0 then begin
            putpixel(75+2*palette[color,num],135+num*10,15);
            putpixel(76+2*palette[color,num],135+num*10,15);
         end
         else begin
            putpixel(77+2*palette[color,num],135+num*10,0);
            putpixel(78+2*palette[color,num],135+num*10,0);
         end;
      end;
   until (b = 28) or (b = 1);
   if b = 1 then begin
      for i := 1 to 3 do palette[color,i] := temp_pal[i];
      setpalette(color,color);
      RGB(color,palette[color,1],palette[color,2],palette[color,3]);
   end;
   setfillstyle(1,0);
   bar(5,140,210,170);
end;

procedure newmap;
begin
   cleardevice;
   setcolor(7);
   for i := 0 to 20 do begin
      line(0,i*5,120,i*5);
      line(i*6,0,i*6,100);
   end;
   while keypressed do b := inkey;
   x := 0; y := 0;
   selectbyte := 1;
   display;
   for j:= 0 to 20 do for i:= 0 to 20 do map[i,j] := 0;
   rectangle(129,9,150,30);
   setcolor(15);
   rectangle(128,8,151,31);
   setcolor(14);
   outtextxy(8,110,'Current Color');
   setfillstyle(1,color);
   bar(5,125,115,130);
   setcolor(15);
   rectangle(3,180,117,258);
   rectangle(5,178,115,260);
   setcolor(7);
   for i := 1 to 7 do outtextxy(13,(i-1)*10+185,menu[i]);
end;

procedure load;
begin
   for i := 0 to max_data do
   for j := 1 to 246 do font^[i,j] := 0;
   assign(fontfile,fontfilename);
   reset(fontfile);
   read(fontfile,font^);
   close(fontfile);
   assign(palettefile,'block.pal');
   reset(palettefile);
   read(palettefile,palette);
   close(palettefile);
   for i := 0 to 15 do begin
      setpalette(i,i);
      RGB(i,palette[i,1],palette[i,2],palette[i,3]);
   end;
   fontxy := 0;
   setfont(0);
   displayfont;
   fontposition(0,0);
end;

procedure save;
begin
   assign(fontfile,fontfilename);
   rewrite(fontfile);
   write(fontfile,font^);
   close(fontfile);
   assign(palettefile,'block.pal');
   rewrite(palettefile);
   write(palettefile,palette);
   close(palettefile);
end;

function select : byte;
var
   y1 : shortint;
   b, num : byte;
   old_color : word;
begin
   old_color := getcolor;
   removedisplay;
   num := selectbyte;
   if not (num in [1..7]) then num := 1;
   repeat
      setcolor(10);
      outtextxy(13,(num-1)*10+185,menu[num]);
      b := inkey;
      y1 := 0;
      if b = 72 then y1 := -1;
      if b = 80 then y1 := 1;
      if y1 <> 0 then begin
         setcolor(7);
         outtextxy(13,(num-1)*10+185,menu[num]);
         num := num + y1;
         if num < 1 then num := 7;
         if num > 7 then num := 1;
      end;
   until (b = 28) or (b = 1);
   selectbyte := num;
   if b = 1 then select := 0 else select := num;
   setcolor(7);
   outtextxy(13,(num-1)*10+185,menu[num]);
   display;
end;

begin { Main }
   new(font);
   if paramcount > 0 then fontfilename := paramstr(1)
   else fontfilename := '/?';
   if fontfilename = '/?' then begin
      writeln;
      writeln('++ Genius Font Editor  ver 1.1 ++');
      writeln('USAGE : GFE <filename>');
      halt;
   end;
   fontfilename := fontfilename + '.fnt';
   i := VGA;
   j := VGAMed;
   initgraph(i,j,'');
   color := 11;
   setactivepage(1);
   cleardevice;
   setvisualpage(1);
   setactivepage(0);
   newmap;
   load;
   setvisualpage(0);
loop:
   repeat
      b := inkey;
      x1 := 0; y1 := 0;
      move := true;
      case b of
         72 : y1 := -1;
         80 : y1 := 1;
         75 : x1 := -1;
         77 : x1 := 1
         else move := false;
      end;
      if move then moving;
      case b of
         57 : begin
                 puttile;
                 x1 := 1; y1 := 0;
                 if x+x1 > 19 then y1 := 1;
                 moving;
              end;
         28 : changecolor;
         46 : change;
         50 : move_paste;
         15 : begin
                 b := select;
                 case b of
                    1 : change;
                    2 : move_paste;
                    3 : setpal;
                    4 : newmap;
                    5 : load;
                    6 : save;
                    7 : b := 255;
                 end;
              end;
      end;
   until b = 255;
   setcolor(15);
   sound(800);
   delay(50);
   sound(500);
   delay(200);
   nosound;
   outtextxy(8,140,'Are you sure ?');
   b := inkey;
   if b <> 21 then begin
      removefontnumber;
      goto loop;
   end;
   closegraph;
   dispose(font);
end.
