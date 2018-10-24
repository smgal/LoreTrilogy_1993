{  AdLib.PAS v3.00  (Turbo PASCAL v5.0 or higher)            }
{    Unit for playing AdLib song files via Sound.com driver  }
{  Written by Lee, Hun Bok (KETEL,PC-Serve ID: hubolee)      }

{$A-,B-,D-,F-,I-,L-,N-,O-,R-,S-,V-}

UNIT AdLib;

INTERFACE

USES DOS;

CONST
  SOUND_INTR = $65;
  ON = 1;
  OFF = 0;
  MAX_BNK_INS = 5460; { origin 5460 }
  MAX_BNK_DAT = 2183; { origin 2183 }
  MAX_INS = 128;

TYPE
  Inst = array[1..28] of word;   { Timbre Parameters }
  Bank_Header_Rec = record          { Header Record for Bank Files }
    one       :word;                { Always 1 }
    str       :array[1..6] of char; { must be 'ADLIB-' }
    num       :word;                { Number of Ins. }
    max       :word;                { Maximum No. Ins possible }
    name_offs :longint;             { Offset to Name List }
    data_offs :longint;             { Offset to Ins. Data }
    end;
  ins_name = array[1..9] of char;
  Bank_Rec = record   { Record for Inst. List }
    N     :word;      { Number }
    index :byte;      { Index to Buffer }
    name  :ins_name;  { Name of Ins }
    end;
  Bank_Rec_Array = array[1..MAX_BNK_INS] of Bank_Rec;
  Inst_Rec = record     { Record for Inst. Buf }
    mode  :byte;                 { Mode of Ins }
    pvn   :byte;                 { perc. voice # }
    ins   :array[1..28] of byte; { Timbre Data }
    end;
  Inst_Data_Array = array[0..MAX_BNK_DAT] of Inst_Rec;
  KbdProc = PROCEDURE;

VAR
  bank_header :Bank_Header_Rec;  { Header of Current Bank File }
  ins_list :^Bank_Rec_Array;     { Inst. Record data }
  ins_data :^Inst_Data_Array;    { Inst. Data Buffer }
  timbres :array[1..MAX_INS] of Inst;
  num_ins :word;
  bad_ins :byte;
  bad_ins_list :array[1..51] of ins_name;
  disk_bank :boolean;
  Bank_File_Name :string;
  TPB, BPM :word;
  Drums :byte;
  Tempo :real;
  AdLib_Error :word;
  QuitPlay :boolean;

FUNCTION DetectSound :word;
PROCEDURE InitSound;
PROCEDURE InitDriver;
PROCEDURE Init_Driver;
PROCEDURE DISABLE_Driver;
PROCEDURE SetStartTime(TimeDen, TimeNum :word);
PROCEDURE PlayState(state :word);
FUNCTION GetState :word;
PROCEDURE SoundOff;
PROCEDURE DrumMode(mode :word);
FUNCTION GetMode :word;
PROCEDURE SetVolume(TimeDen, TimeNum :word; VolDen, VolNum :integer);
PROCEDURE SetTempo(TimeDen, TimeNum, Tempo :word);
PROCEDURE SetTranspos(DSemiTone :integer);
FUNCTION GetTranspos :integer;
PROCEDURE ActiveVoice(Voice :word);
FUNCTION GetVoice :word;
PROCEDURE PutNoteDelay(DelD,DelN,LenD,LenN :word; Pitch :integer);
PROCEDURE PutNote(LenDen, LenNum :word; Pitch :integer);
PROCEDURE SetTimbre(TimeDen, TimeNum :word; Tptr :pointer);
PROCEDURE SetPitch(TimeD, TimeN :word; DltD, DltN, DltOc :integer);
PROCEDURE SetTPB(TPB :word);
PROCEDURE DirectNoteOn(Pitch :integer; Voice :word);
PROCEDURE DirectNoteOff(Voice :word);
PROCEDURE DirectTimbre(Tptr :pointer; Voice :word);
PROCEDURE SetWhat(what :word);
PROCEDURE WaveForm(enable :word);
FUNCTION ToLwrCh(c :char) :char;
FUNCTION ToUprCh(c :char) :char;
PROCEDURE MakeInsName(var s :ins_name);
FUNCTION Str9Cmp(s1, s2 :ins_name) :integer;
FUNCTION FindIns(insname :ins_name) :word;
FUNCTION GetInst(n :word) :word;
PROCEDURE LoadBank(BankFile :string);
PROCEDURE LoadSong(FileSpec :string);
PROCEDURE PlaySong(Keybd :KbdProc);
PROCEDURE PlayOff;
PROCEDURE PlayPause(status :word);
FUNCTION EstimTime :word;

IMPLEMENTATION

CONST
  MAXSIZE = 65521;  { origin 65521 }
  MAXNOTE = MAXSIZE div 2;
  MAXREAL = MAXSIZE div 4;
  NOTE_END = $FFFF;
  SIZBNKH = SizeOf(Bank_Header_Rec);
  SIZBNKR = SizeOf(Bank_Rec);
  SIZINSR = SizeOf(Inst_Rec);
  MAXINS = MAXSIZE div SIZBNKR;
  MAXROLSZ = 131298;
  MOREINS: ins_name = '..more..'#0;

TYPE
  Float = array[1..4] of byte;
  Index_Type = array[0..10] of word;
  Wbuf_Type = array[1..MAXNOTE] of word;
  RBuf_Type = array[1..MAXREAL] of Float;

VAR
  Snd_Buf_Stat :byte;
  NoteP, NoteL, NoteT :^Wbuf_Type;
  NoteV :^Rbuf_Type;
  etim, indx0, idxI0, idxV0, idxP0 :Index_Type;
  bank_ptr, rol_ptr :pointer;

{$I SOUNDRV.PAS}

{$F+} FUNCTION HeapEF(size :word) :integer; {$F-}
begin
HeapEF := 1;
end;

FUNCTION ToLwrCh(c :char) :char;
begin
if (c<'A') or (c>'Z') then
  ToLwrCh := c
else
  ToLwrCh := Chr(Ord(c) or $20);
end;

FUNCTION ToUprCh(c :char) :char;
begin
if (c<'a') or (c>'z') then
  ToUprCh := c
else
  ToUprCh := Chr(Ord(c) and $DF);
end;

FUNCTION DetectSound :word;
TYPE
  Dword = record
    hi :word;
    lo :word;
    end;
VAR
  DriverIntVec :pointer;
  DriverSeg, DriverOfs :word;
  ID_string :string[19];
  no_drv :boolean;
  i :byte;
begin
AdLib_Error := 0;
ID_string := 'SOUND-DRIVER-AD-LIB';
GetIntVec(SOUND_INTR,DriverIntVec);
DriverSeg := Dword(longint(DriverIntVec)).lo;
DriverOfs := Dword(longint(DriverIntVec)).hi - 23;
no_drv := FALSE;
for i := 1 to 19 do
  if ID_string[i] <> Chr(Mem[DriverSeg:DriverOfs+i]) then no_drv := TRUE;
if no_drv then
  begin
  AdLib_Error := 1;
  DriverSeg := 0;
  end;
DetectSound := DriverSeg;
end;

PROCEDURE InitDriver;
begin
Init_Driver;
WaveForm(ON);
end;

PROCEDURE InitSound;
begin
bank_ptr := nil;
rol_ptr := nil;
disk_bank := FALSE;
if DetectSound<>0 then InitDriver;
end;

PROCEDURE MakeInsName(var s :ins_name);
VAR
  i :byte;
  eos :boolean;
begin
eos := FALSE;
for i := 1 to 9 do
  if eos then
    s[i] := #0
  else if s[i] = #0 then
    eos := TRUE
  else
    s[i] := ToLwrCh(s[i]);
end;

FUNCTION Str9Cmp(s1, s2 :ins_name) :integer;
VAR
  r :integer;
  i :byte;
begin
r := 0;
i := 0;
repeat
  Inc(i);
  if s1[i] > s2[i] then r := 1
  else if s1[i] < s2[i] then r := -1;
until (r<>0) or (s1[i]=#0);
Str9Cmp := r;
end;

PROCEDURE Add_Bad_Ins(ins :ins_name);
VAR
  i :byte;
  alrdy :boolean;
begin
if bad_ins > 50 then Exit;
alrdy := FALSE;
for i := 1 to bad_ins do
  if Str9Cmp(ins, bad_ins_list[i])=0 then alrdy := TRUE;
if not alrdy then
  begin
  Inc(bad_ins);
  if bad_ins > 50 then
    bad_ins_list[51] := MOREINS
  else
    for i := 1 to 9 do
      bad_ins_list[bad_ins][i] := ins[i];
  end;
end;

FUNCTION FindIns(insname :ins_name) :word;
VAR
  cmp :integer;
  Lp, Rp, Mp :word;
begin
MakeInsName(insname);
Lp := 0;
Rp := bank_header.num + 1;
repeat
  Mp := (Rp + Lp) div 2;
  cmp := Str9Cmp(insname,ins_list^[Mp].name);
  if cmp > 0 then
    Lp := Mp
  else
    Rp := Mp;
until (cmp=0) or ((Rp-Lp) = 1);
if cmp=0 then
  FindIns := Mp
else
  begin
  Add_Bad_Ins(insname);
  FindIns := 0;
  end;
end;

FUNCTION GetInst(n :word) :word;
VAR
  i :byte;
  buf :array[-1..28] of byte;
  f :file;
begin
if n=0 then n := FindIns('PIANO1'#0#0#0);
if n=0 then n := 1;
if ins_list^[n].index = 0 then
  begin
  Inc(num_ins);
  ins_list^[n].index := num_ins;
  if disk_bank then
    begin
    Assign(f,Bank_File_Name);
    Reset(f,1);
    Seek(f,(bank_header.data_offs+ins_list^[n].N*30));
    BlockRead(f,buf,30);
    Close(f);
    for i := 1 to 28 do
      timbres[num_ins][i] := buf[i];
    end
  else
    for i := 1 to 28 do
      timbres[num_ins][i] := ins_data^[ins_list^[n].N].ins[i];
  end;
GetInst := ins_list^[n].index;
end;

PROCEDURE LoadBank(BankFile :string);
LABEL
  700, 800;
VAR
  i :word;
  f :file;
  ins_buf_size : longint;
begin
AdLib_Error := 0;
num_ins := 0;
Bank_File_Name := BankFile;
Assign(f,BankFile);
Reset(f,1);
BlockRead(f,bank_header,SIZBNKH);
if IOResult<>0 then
  begin
  AdLib_Error := 5;
  Exit;
  end;
if bank_header.num > MAXINS then
  begin
  AdLib_Error := 6;
  Exit;
  end;
ins_buf_size := SIZBNKR*bank_header.num;
if bank_ptr<>nil then Release(bank_ptr);
Mark(bank_ptr);
GetMem(ins_list,ins_buf_size);
if ins_list=nil then
  begin
  AdLib_Error := 7;
  goto 700;
  end;
Seek(f,bank_header.name_offs);
BlockRead(f,ins_list^,ins_buf_size);
if IOResult<>0 then goto 800;
ins_buf_size := SIZINSR*bank_header.num;
if (ins_buf_size<=MAXSIZE) and (MemAvail>(ins_buf_size+MAXROLSZ))
    and (MaxAvail>ins_buf_size) then
  begin
  GetMem(ins_data,ins_buf_size);
  Seek(f,bank_header.data_offs);
  BlockRead(f,ins_data^,ins_buf_size);
  if IOResult<>0 then goto 800;
  end
else
  disk_bank := TRUE;
Close(f);
for i := 1 to bank_header.num do
  begin
  MakeInsName(ins_list^[i].name);
  ins_list^[i].index := 0;
  end;
Exit;
800: AdLib_Error := 8;
Release(bank_ptr);
700: Close(f);
end;

PROCEDURE Clear_Inst;
VAR
  i :word;
begin
for i := 1 to bank_header.num do
  begin
  ins_list^[i].index := 0;
  end;
bad_ins := 0;
num_ins := 0;
end;

FUNCTION Float2Real(b :Float) :real;
  { Real #'s stored in ROL files are 4 byte floating point #'s }
  { (ref : float format of C or Single format of Turbo Pascal) }
  { Float2Real converts it to 6 byte real format of Turbo's    }
VAR
  e, i :integer;
  f :longint;
  r :real;
begin
e := b[4];
e := (e shl 1) + (b[3] shr 7);
if e <> 0 then
  begin
  f := b[3] and $7F;
  f := (f shl 8) + b[2];
  f := (f shl 8) + b[1];
  r := f;
  for i := 1 to 23 do
    r := r / 2;
  r := r + 1;
  e := e - 127;
  if e > 0 then
    for i := 1 to e do
      r := r * 2
  else
    for i := e to -1 do
      r := r / 2;
  Float2Real := r;
  end
else
  Float2Real := 0;
end;

PROCEDURE LoadSong(FileSpec :string);
LABEL
  700, 900;
TYPE
  Buf_Type = array[1..MAXSIZE] of byte;
VAR
  i, n, v :word;
  File_buf :^Buf_Type;
  Buf_ptr :word;
  nbuf_size, f_size, Fbuf_size :longint;
  n_ptr, v_ptr :word;
  f :file;

  PROCEDURE Block_Read;
  VAR
    n :longint;
  begin
  n := f_size - FilePos(f);
  if n < Fbuf_size then
    BlockRead(f,File_buf^,n)
  else
    BlockRead(f,File_buf^,Fbuf_size);
  if IOResult<>0 then AdLib_Error := 8;
  end;

  PROCEDURE InitBuf;
  begin
  if f_size < MAXSIZE then
    Fbuf_size := f_size
  else
    Fbuf_size := MAXSIZE;
  if (MemAvail<(f_size+Fbuf_size)) or (MaxAvail<Fbuf_size) then
    Fbuf_size := 256;
  GetMem(File_buf,Fbuf_size);
  if File_buf=nil then Exit;
  Block_Read;
  Buf_ptr := 1;
  end;

  PROCEDURE CheckBuf;
  begin
  if Buf_ptr > Fbuf_size then
    begin
    Block_Read;
    Buf_ptr := Buf_ptr - Fbuf_size;
    end;
  end;

  PROCEDURE SkipBytes(nb :word);
  begin
  Buf_ptr := Buf_ptr + nb;
  CheckBuf;
  end;

  FUNCTION ByteRead :byte;
  begin
  ByteRead := File_buf^[Buf_ptr];
  Inc(Buf_ptr);
  CheckBuf;
  end;

  FUNCTION WordRead :word;
  VAR
    b1, b2 :byte;
  begin
  b1 := ByteRead;
  b2 := ByteRead;
  WordRead := b1 + b2*256;
  end;

  FUNCTION TempoRead :real;
  VAR
    b :Float;
  begin
  b[1] := ByteRead;
  b[2] := ByteRead;
  b[3] := ByteRead;
  b[4] := ByteRead;
  TempoRead := Float2Real(b);
  end;

  PROCEDURE FloatRead(var b :Float);
  begin
  b[1] := ByteRead;
  b[2] := ByteRead;
  b[3] := ByteRead;
  b[4] := ByteRead;
  end;

  PROCEDURE InstRead(var b :Float);
  VAR
    s :ins_name;
    i :byte;
    n :word;
  begin
  for i := 1 to 9 do
    s[i] := Chr(ByteRead);
  n := GetInst(FindIns(s));
  b[1] := Lo(n);
  b[2] := Hi(n);
  SkipBytes(1);
  b[3] := ByteRead;
  b[4] := ByteRead;
  end;

begin
AdLib_Error := 0;
Clear_Inst;
Assign(f,FileSpec);
Reset(f,1);
if IOResult<>0 then
  begin
  AdLib_Error := 2;
  goto 900;
  end;
f_size := FileSize(f);
nbuf_size := f_size div 2;
if nbuf_size>MAXSIZE then
  begin
  AdLib_Error := 3;
  goto 900;
  end;
if rol_ptr<>nil then Release(rol_ptr);
Mark(rol_ptr);
GetMem(NoteP,nbuf_size);
if NoteP=nil then goto 700;
GetMem(NoteL,nbuf_size);
if NoteL=nil then goto 700;
GetMem(NoteT,nbuf_size);
if NoteT=nil then goto 700;
GetMem(NoteV,nbuf_size);
if NoteV=nil then goto 700;
n_ptr := 1;
v_ptr := 1;
InitBuf;
if AdLib_Error=8 then goto 900;
if File_buf=nil then goto 700;
SkipBytes(44);
TPB := WordRead;
BPM := WordRead;
SkipBytes(5);
Drums := 1 - ByteRead;
SkipBytes(143);
Tempo := TempoRead;
n := WordRead;
for i := 1 to n do
  begin
  NoteT^[v_ptr] := WordRead;
  FloatRead(NoteV^[v_ptr]);
  Inc(v_ptr);
  end;
NoteT^[v_ptr] := NOTE_END;
Inc(v_ptr);
for v := 0 to 10 do
  begin
  SkipBytes(15);
  etim[v] := WordRead;
  n := 0;
  while (n < etim[v]) do
    begin
    NoteP^[n_ptr] := WordRead;
    NoteL^[n_ptr] := WordRead;
    n := n + NoteL^[n_ptr];
    Inc(n_ptr);
    end;
  indx0[v] := n_ptr;
  SkipBytes(15);
  idxI0[v] := v_ptr;
  n := WordRead;
  for i := 1 to n do
    begin
    NoteT^[v_ptr] := WordRead;
    InstRead(NoteV^[v_ptr]);
    if etim[v] <> 0 then Inc(v_ptr);
    end;
  NoteT^[v_ptr] := NOTE_END;
  Inc(v_ptr);
  SkipBytes(15);
  idxV0[v] := v_ptr;
  n := WordRead;
  for i := 1 to n do
    begin
    NoteT^[v_ptr] := WordRead;
    FloatRead(NoteV^[v_ptr]);
    Inc(v_ptr);
    end;
  if (etim[v]=0) and (n>0) then Dec(v_ptr);
  NoteT^[v_ptr] := NOTE_END;
  Inc(v_ptr);
  SkipBytes(15);
  idxP0[v] := v_ptr;
  n := WordRead;
  for i := 1 to n do
    begin
    NoteT^[v_ptr] := WordRead;
    FloatRead(NoteV^[v_ptr]);
    Inc(v_ptr);
    end;
  if (etim[v]=0) and (n>0) then Dec(v_ptr);
  NoteT^[v_ptr] := NOTE_END;
  Inc(v_ptr);
  end;
Close(f);
Exit;
700: AdLib_Error := 7;
900: Close(f);
Release(rol_ptr);
end;

FUNCTION EstimTime :word;
VAR
  time :real;
  i, Etik, Ltik :word;
begin
time := 0.0;
Etik := 0;
Ltik := 0;
for i := 0 to 10 do
  if etim[i] > Ltik then Ltik := etim[i];
i := 1;
repeat
  Inc(i);
  if NoteT^[i]<Ltik then
    begin
    time := time+(NoteT^[i]-NoteT^[i-1])*60.0/TPB/Float2Real(NoteV^[i-1])/Tempo;
    Etik := NoteT^[i];
    end
  else
    NoteT^[i] := NOTE_END;
until NoteT^[i]=NOTE_END;
EstimTime := Round(time+(Ltik-Etik)*60.0/TPB/Float2Real(NoteV^[i-1])/Tempo);
end;

PROCEDURE PlayOff;
begin
PlayState(OFF);
SoundOff;
end;

PROCEDURE PlaySong(Keybd :KbdProc);
VAR
  ctim, mtim, v, idxT :word;
  ptim, indx, idxI, idxV, idxP :Index_Type;
  n, cnt :integer;
  rdy, play :boolean;

  FUNCTION InstNum(b :Float) :word;
  begin
  InstNum := b[1]+b[2]*256;
  end;

begin
AdLib_Error := 0;
InitDriver;
DrumMode(Drums);
SetTPB(TPB);
SetStartTime(TPB,0);
play := FALSE;
rdy := TRUE;
cnt := 0;
idxT := 1;
indx[0] := 1;
for v := 0 to 10 do
  begin
  if etim[v] = 0 then
    ptim[v] := NOTE_END
  else
    ptim[v] := 0;
  if v > 0 then indx[v] := indx0[v-1];
  idxI[v] := idxI0[v];
  idxV[v] := idxV0[v];
  idxP[v] := idxP0[v];
  end;
QuitPlay := FALSE;
ctim := 0;
repeat
  mtim := NOTE_END;
  if (NoteT^[idxT]=ctim) and (ctim<NOTE_END) then
    begin
    SetTempo(TPB,ctim,Round(Float2Real(NoteV^[idxT])*Tempo));
    if Snd_Buf_Stat<>0 then Inc(idxT);
    if rdy then Inc(cnt);
    end;
  if mtim > NoteT^[idxT] then mtim := NoteT^[idxT];
  for v := 0 to 10 do
    if ctim<=etim[v] then
      begin
      ActiveVoice(v);
      if NoteT^[idxI[v]] = ctim then
        begin
        SetTimbre(TPB,ctim,@timbres[InstNum(NoteV^[idxI[v]])]);
        if Snd_Buf_Stat<>0 then Inc(idxI[v]);
        if rdy then Inc(cnt);
        end;
      if mtim > NoteT^[idxI[v]] then mtim := NoteT^[idxI[v]];
      if NoteT^[idxV[v]] = ctim then
        begin
        n := Round(100*Float2Real(NoteV^[idxV[v]]));
        SetVolume(TPB,ctim,100,n);
        if rdy and (n<>0) then play := TRUE;
        if Snd_Buf_Stat<>0 then Inc(idxV[v]);
        if rdy then Inc(cnt);
        end;
      if mtim > NoteT^[idxV[v]] then mtim := NoteT^[idxV[v]];
      if NoteT^[idxP[v]] = ctim then
        begin
        SetPitch(TPB,ctim,100,Round(100*Float2Real(NoteV^[idxP[v]]))-100,0);
        if Snd_Buf_Stat<>0 then Inc(idxP[v]);
        if rdy then Inc(cnt);
        end;
      if mtim > NoteT^[idxP[v]] then mtim := NoteT^[idxP[v]];
      if ptim[v] = ctim then
        begin
        if (NoteP^[indx[v]]=0) or (rdy and (not play)) then
          PutNoteDelay(TPB,NoteL^[indx[v]],TPB,0,0)
        else
          PutNote(TPB,NoteL^[indx[v]],NoteP^[indx[v]]-60);
        if Snd_Buf_Stat<>0 then
          begin
          ptim[v] := ptim[v] + NoteL^[indx[v]];
          Inc(indx[v]);
          if ptim[v] >= etim[v] then
            ptim[v] := NOTE_END;
          end;
        if rdy then Inc(cnt);
        end;
      if mtim > ptim[v] then mtim := ptim[v];
      end;
  if play and ((cnt>200) or (mtim=NOTE_END)) then
    begin
    if Snd_Buf_Stat=0 then
      begin
      AdLib_Error := 4;
      Exit;
      end;
    PlayState(ON);
    rdy := FALSE;
    play := FALSE;
    end;
  ctim := mtim;
  Keybd;
until QuitPlay  or ((ctim=NOTE_END) and (GetState=OFF));
PlayOff;
end;

PROCEDURE PlayPause(status :word);
VAR
  v :word;
begin
if status=ON then
  begin
  PlayState(OFF);
  for v := 0 to 10 do
    DirectNoteOff(v);
  end
else
  PlayState(ON);
end;

begin
HeapError := @HeapEF;
end.
