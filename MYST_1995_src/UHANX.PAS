Unit UHanX;

INTERFACE

Uses
   Crt, Dos, Graph;
Const
   On = TRUE; off = FALSE;
Type
   HanData = array[0..31] of byte;
   FontData = array[0..223,0..31] of byte;
   AsciiFontData = array[0..95,0..15] of byte;
Var
   first, second, third, number : byte;
   hanx, hany, hwinx1, hwiny1, hwinx2, hwiny2 : integer;
   regs : registers;
   scrollpause : boolean;
   font : fontdata;
   AsciiFont : AsciiFontData;
   FontFile : file of FontData;
   AsciiFontFile : file of AsciiFontData;

 Procedure SetFont(Num : byte);
 Procedure InitHan;
 Procedure HWindow(x1,y1,x2,y2 : integer);
 Procedure HGotoXY(x,y : integer);
 Procedure Pause(ok : boolean);
 Procedure PutHan(x,y,order : integer);
 Procedure AsciiXY(x,y,order : integer);
 Procedure HPrint(s : string);
 Procedure HPrintXY(x,y : integer; s : string);
 Procedure HPrintXY4Select(x,y : integer; s : string);
 Procedure OutHPrintXY(x,y : integer; s : string; extension : boolean);
 Procedure bHPrint(x,y : integer; s : string);
 Procedure cHPrint(x,y : integer; s : string);
 Procedure eHPrint(x,y : integer; s : string);


IMPLEMENTATION

Procedure SetFont(Num : byte);
var
   s : string[5];
begin
   assign(FontFile,'lore'+chr(48+Num)+'.fnt');
   reset(FontFile);
   read(FontFile,Font);
   close(FontFile);
end;

Procedure InitHan;
var
   i, j : byte;
begin
   assign(AsciiFontFile,'ascii.fnt');
   reset(AsciiFontFile);
   read(AsciiFontFile,AsciiFont);
   close(asciiFontFile);
   SetFont(0);
   Pause(On);
   hwinx1 := 0;
   hwiny1 := 0;
   hwinx2 := 640;
   hwiny2 := 480;
   hanx := 0; hany := 0;
end;

Procedure HWindow(x1,y1,x2,y2 : integer);
begin
   hwinx1 := x1;
   hwiny1 := y1;
   hwinx2 := x2;
   hwiny2 := y2;
   hanx := hwinx1; hany := hwiny1;
end;

Procedure HGotoXY(x,y : integer);
begin
   hanx := x; hany := y;
end;

Procedure Pause(ok : boolean);
begin
   if ok then scrollpause := On else scrollpause := Off;
end;

Procedure hscroll;
var
   i : word;
   k : word;
begin
   if scrollpause then begin
      regs.ah := 7;
      msdos(regs);
      if regs.al = 0 then begin
         regs.ah := 7;
         msdos(regs);
      end;
   end;
   i := 263;
   k := 80 * 48 + 31;

   asm
      push ds
      push si
      push di

      mov dx, $3ce
      mov al, 5
      mov ah, 1
      out dx, ax
      mov dx, $3C4
      mov ax, $0F02
      out dx, ax

      mov ax, $0A000
      mov es, ax
      mov ds, ax
      mov cx, i
      mov si, k
      mov di, k
      sub di, 80*16
@JUMP1:
      push cx
      mov cx, 48
      rep movsb
      add si,80 - 48
      add di,80 - 48
      pop cx
      loop @JUMP1

      pop di
      pop si
      pop ds
   end;
   setfillstyle(1,8);
   Bar(245,255,610,288);
end;

function readhan(st : string; var count : byte): boolean;
var
   data, auxdata : byte;
begin
   readhan := FALSE;
   if count > length(st) -1 then exit;
   data := ord(st[count]);
   if data shr 7 = 0 then exit;
   readhan := TRUE;
   first := 0; second := 0; third := 0;
   auxdata := ord(st[count+1]);
   first := (data and $7C) shr 2;
   second := ((data and $3) shl 3)+((auxdata and $E0) shr 5);
   third := auxdata and $1F;
   count := count + 2;
end;

Procedure InputHan(x,y : integer; var order : HanData);
Var
   i, j, Primary, Secondary : byte;
begin
   for j := 0 to 15 do
   for i := 0 to 1 do begin
      Primary := order[j*2+i];
      for Secondary := 0 to 7 do if ((Primary shr Secondary) and 1) = 1 then
         PutPixel(x+i*8+7-Secondary,y+j,GetColor);
   end;
end;

Procedure PutHan(x,y,order : integer);
Var
   i, j, Primary, Secondary : byte;
begin
   for j := 0 to 15 do
   for i := 0 to 1 do begin
      Primary := Font[order,j*2+i];
      for Secondary := 0 to 7 do if ((Primary shr Secondary) and 1) = 1 then
         PutPixel(x+i*8+7-Secondary,y+j,GetColor);
   end;
end;

Procedure asciixy(x,y,order : integer);
Var
   j, Primary, Secondary : byte;
begin
   if order < 27 then order := 31;
   if order > 126 then order := 32;
   for j := 0 to 15 do begin
      Primary := AsciiFont[order-31,j];
      for Secondary := 0 to 7 do if ((Primary shr Secondary) and 1) = 1 then
         PutPixel(x+7-Secondary,y+j,GetColor);
   end;
end;

Procedure puthan_extension(x,y,order : integer);
Var
   i, j, Primary, Secondary : byte;
begin
   for j := 0 to 15 do
   for i := 0 to 1 do begin
      Primary := Font[order,j*2+i];
      for Secondary := 0 to 7 do if ((Primary shr Secondary) and 1) = 1 then begin
         PutPixel(x+i*16-Secondary*2,y+j*2,GetColor);
         PutPixel(x+i*16-Secondary*2+1,y+j*2,GetColor);
         PutPixel(x+i*16-Secondary*2,y+j*2+1,GetColor);
         PutPixel(x+i*16-Secondary*2+1,y+j*2+1,GetColor);
      end;
   end;
end;

Procedure asciixy_extension(x,y,order : integer);
Var
   j, Primary, Secondary : byte;
begin
   if order < 27 then order := 31;
   if order > 126 then order := 32;
   for j := 0 to 15 do begin
      Primary := AsciiFont[order-31,j];
      for Secondary := 0 to 7 do if ((Primary shr Secondary) and 1) = 1 then begin
         PutPixel(x-Secondary*2,y+j*2,GetColor);
         PutPixel(x-Secondary*2+1,y+j*2,GetColor);
         PutPixel(x-Secondary*2,y+j*2+1,GetColor);
         PutPixel(x-Secondary*2+1,y+j*2+1,GetColor);
      end;
   end;
end;

Procedure HPrintsub(s : string; scrolling : boolean);
var
   len,Num : integer;
   i,j,k : byte;
   c : char;
   buf : HanData;
   font_no : array[1..3] of byte;
begin
   while keypressed do c := readkey;
   number := 1;
   if scrolling and (hany>=hwiny2) then begin
      hscroll;
      hany := 256;
   end;
   len := length(s);
   for i := 1 to len do begin
      if readhan(s,number) then begin
         if hanx+8 >= hwinx2 then begin
            hanx := hwinx1;
            hany := hany + 16;
            if scrolling and (hany>=hwiny2) then begin
               hscroll;
               hany := 256;
            end;
         end;
         if First > 1 then begin
            if (second < 13) or (second = 29) then Num := 0
            else if second in [13,19,20,26,27] then Num := 1
            else Num := 2;
            if third > 1 then Num := Num + 3;
            font_no[1] := 6*(First-2)+Num;
{            puthan(HanX,HanY,6*(First-2)+Num);}
         end;
         if Second > 2 then begin
            if third > 1 then Num := 1 else Num := 0;
            font_no[2] := 2*(Second-3)+114+Num;
{            puthan(HanX,HanY,2*(Second-3)+114+Num);}
         end;
         if Third > 1 then begin
            if second in [13,19,20,26,27] then Num := 1 else Num := 0;
            font_no[3] := 2*(Third-2)+168+Num;
{            puthan(HanX,HanY,2*(Third-2)+168+Num);}
         end;
         fillchar(buf,32,0);
         if Third > 1 then
            for k := 0 to 31 do buf[k] := Font[font_no[1]][k] or Font[font_no[2]][k] or Font[font_no[3]][k]
         else for k := 0 to 31 do buf[k] := Font[font_no[1]][k] or Font[font_no[2]][k];
         inputhan(HanX,HanY,buf);
         hanx := hanx + 16;
         len := len - 1;
      end
      else if number <= length(s) then begin
         if hanx+8 >= hwinx2 then begin
            hanx := hwinx1;
            hany := hany + 16;
            if scrolling and (hany>=hwiny2) then begin
               hscroll;
               hany := 256;
            end;
         end;
         asciixy(HanX,HanY,ord(s[Number]));
         Number := Number + 1;
         HanX := HanX + 8;
      end;
   end;
end;

Procedure HPrint(s : string);
begin
   HPrintsub(s,TRUE);
end;

Procedure HPrintXY(x,y : integer; s : string);
var
   len : integer;
begin
   HGotoXY(x,y);
   HPrintsub(s,TRUE);
   hany := hany + 16;
   if hany >= hwiny2 then begin
      hscroll;
      hany := 256;
   end;
   hanx := hwinx1;
end;

Procedure HPrintXY4Select(x,y : integer; s : string);
var
   len : integer;
begin
   HGotoXY(x,y);
   HPrintsub(s,FALSE);
   hany := hany + 16;
   hanx := hwinx1;
end;

Procedure OutHPrintXY(x,y : integer; s : string; extension : boolean);
var
   len, pre_x, pre_y, Num : integer;
   i,j : byte;
begin
   pre_x := hanx; pre_y := hany;
   HGotoXY(x,y);
   number := 1;
   len := length(s);
   for i := 1 to len do begin
      if readhan(s,number) then begin
         if First > 1 then begin
            if (second < 13) or (second = 29) then Num := 0
            else if second in [13,19,20,26,27] then Num := 1
            else Num := 2;
            if third > 1 then Num := Num + 3;
            if extension then puthan_extension(HanX,HanY,6*(First-2)+Num)
            else puthan(HanX,HanY,6*(First-2)+Num);
         end;
         if Second > 2 then begin
            if third > 1 then Num := 1 else Num := 0;
            if extension then puthan_extension(HanX,HanY,2*(Second-3)+114+Num)
            else puthan(HanX,HanY,2*(Second-3)+114+Num);
         end;
         if Third > 1 then begin
            if second in [13,19,20,26,27] then Num := 1 else Num := 0;
            if extension then puthan_extension(HanX,HanY,2*(Third-2)+168+Num)
            else puthan(HanX,HanY,2*(Third-2)+168+Num);
         end;
         if extension then hanx := hanx + 32 else hanx := hanx + 16;
         len := len - 1;
      end
      else if number <= length(s) then begin
         if extension then asciixy_extension(HanX,HanY,ord(s[Number]))
         else asciixy(HanX,HanY,ord(s[Number]));
         number := number + 1;
         if extension then hanx := hanx + 16 else hanx := hanx + 8;
      end;
   end;
   HGotoXY(pre_x,pre_y);
end;

Procedure bHPrint(x,y : integer; s : string); { Bold }
begin
   OutHPrintXY(x,y,s,FALSE); OutHPrintXY(succ(x),y,s,FALSE);
end;

Procedure cHPrint(x,y : integer; s : string); { Color }
begin
   if getcolor > 8 then begin
      setcolor(getcolor - 8);
      OutHPrintXY(x+2,y+1,s,FALSE);
      setcolor(getcolor + 8);
   end;
   OutHPrintXY(x,y,s,FALSE);
end;

Procedure eHPrint(x,y : integer; s : string); { Extension }
begin
   OutHPrintXY(x,y,s,TRUE);
end;

begin
   InitHan;
   HWindow(251,32,608,257);
end.