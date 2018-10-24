Unit Mouse;
{ Genius Mouse ver 1.1 }
INTERFACE
   const
      On = true; Off = false;
   type
      ButtonType = (Left,Right);
   var
      temp, auxtemp : word;

   Function InitMouse : boolean;
   Procedure Cursor(Cursor_On : boolean);   
   Function Button : ButtonType;
   Procedure GetMouse(var x,y : word);
   Procedure SetMouse(x,y : word);
   Procedure MouseWindow(x1,y1,x2,y2 : word);

IMPLEMENTATION

Function InitMouse : boolean;
label
   failure;
begin
   InitMouse := Off;
   asm
      mov ax,0;
      int $33;
      cmp ax,0;
      je failure;
   end;
   InitMouse := On;
failure:
end;

Procedure Cursor(Cursor_On : boolean);
begin
   temp := 2;
   if Cursor_On then dec(temp);
   asm
      mov ax,temp;
      int $33;
   end;
end;

Function Button : ButtonType;
begin
   asm
      mov ax,3;
      int $33;
      mov temp,bx;
   end;
   if odd(temp) then Button := Left;
   if odd(temp shr 1) then Button := Right;
end;

Procedure GetMouse(var x,y : word);
begin
   asm
      mov ax,3;
      int $33;
      mov temp,cx;
      mov auxtemp,dx;
   end;
   x := temp; y := auxtemp;
end;

Procedure SetMouse(x,y : word); assembler;
asm
   mov ax,4;
   mov cx,x;
   mov dx,y;
   int $33;
end;

Procedure MouseWindow(x1,y1,x2,y2 : word); assembler;
asm
   mov ax,7;
   mov cx,x1;
   mov dx,x2;
   int $33;
   mov ax,8;
   mov cx,y1;
   mov dx,y2;
   int $33;
end;

begin
end.