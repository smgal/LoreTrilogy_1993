Unit Voice;

INTERFACE

var
   i : integer;
   f : file of byte;
   screamdata1 : array[1..2895] of byte;
   screamdata2 : array[1..4529] of byte;
   hitdata : array[1..3673] of byte;

 procedure scream1;
 procedure scream2;
 procedure hit;

IMPLEMENTATION

procedure voicemain(data : byte; speed : integer);
var
   delay : Integer;
   a : Byte;
begin
   a := port[$61];
   a := a and $fc;
   port[$61] := a;
   if data > 128 then begin
      a := a or $02;
      port[$61] := a;
   end
   else begin
      a := a and $fd;
      port[$61] := a;
   end;
   for delay := 1 to speed do;
end;

procedure scream1;
begin
   for i := 1 to 2895 do voicemain(screamdata1[i],250);
end;

procedure scream2;
begin
   for i := 1 to 2895 do voicemain(screamdata2[i],150);
end;

procedure hit;
begin
   for i := 1 to 3672 do voicemain(hitdata[i],50);
end;

begin
   Assign(f,'scream1.voc');
   reset(f);
   for i := 1 to 2895 do read(f,screamdata1[i]);
   close(f);
   assign(f,'scream2.voc');
   reset(f);
   for i := 1 to 4529 do read(f,screamdata2[i]);
   close(f);
   assign(f,'hit.voc');
   reset(f);
   for i := 1 to 3673 do read(f,hitdata[i]);
   close(f);
end.