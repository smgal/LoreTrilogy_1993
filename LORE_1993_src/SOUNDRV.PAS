
{ A Portion of AdLib.PAS }

PROCEDURE Init_Driver;
VAR
  r :registers;
begin
r.SI := 0;
Intr(SOUND_INTR,r);
end;

PROCEDURE DISABLE_Driver;
VAR
  r :registers;
begin
r.SI := 1;
Intr(SOUND_INTR,r);
end;

PROCEDURE SetStartTime(TimeDen, TimeNum :word);
VAR
  r :registers;
begin
r.SI := 2;
r.ES := Seg(TimeNum);
r.BX := Ofs(TimeNum);
Intr(SOUND_INTR,r);
end;

PROCEDURE PlayState(state :word);
VAR
  r :registers;
begin
r.SI := 3;
r.ES := Seg(state);
r.BX := Ofs(state);
Intr(SOUND_INTR,r);
end;

FUNCTION GetState :word;
VAR
  r :registers;
begin
r.SI := 4;
Intr(SOUND_INTR,r);
GetState := r.AX;
end;

PROCEDURE SoundOff;
VAR
  r :registers;
begin
r.SI := 5;
Intr(SOUND_INTR,r);
end;

PROCEDURE DrumMode(mode :word);
VAR
  r :registers;
begin
r.SI := 6;
r.ES := Seg(mode);
r.BX := Ofs(mode);
Intr(SOUND_INTR,r);
end;

FUNCTION GetMode :word;
VAR
  r :registers;
begin
r.SI := 7;
Intr(SOUND_INTR,r);
GetMode := r.AX;
end;

PROCEDURE SetVolume(TimeDen, TimeNum :word; VolDen, VolNum :integer);
VAR
  r :registers;
begin
r.SI := 8;
r.ES := Seg(VolNum);
r.BX := Ofs(VolNum);
Intr(SOUND_INTR,r);
Snd_Buf_Stat := r.AL;
end;

PROCEDURE SetTempo(TimeDen, TimeNum, Tempo :word);
VAR
  r :registers;
begin
r.SI := 9;
r.ES := Seg(Tempo);
r.BX := Ofs(Tempo);
Intr(SOUND_INTR,r);
Snd_Buf_Stat := r.AL;
end;

PROCEDURE SetTranspos(DSemiTone :integer);
VAR
  r :registers;
begin
r.SI := 10;
r.ES := Seg(DSemiTone);
r.BX := Ofs(DSemiTone);
Intr(SOUND_INTR,r);
end;

FUNCTION GetTranspos :integer;
VAR
  r :registers;
begin
r.SI := 11;
Intr(SOUND_INTR,r);
GetTranspos := r.AX;
end;

PROCEDURE ActiveVoice(Voice :word);
VAR
  r :registers;
begin
r.SI := 12;
r.ES := Seg(Voice);
r.BX := Ofs(Voice);
Intr(SOUND_INTR,r);
end;

FUNCTION GetVoice :word;
VAR
  r :registers;
begin
r.SI := 13;
Intr(SOUND_INTR,r);
GetVoice := r.AX;
end;

PROCEDURE PutNoteDelay(DelD,DelN,LenD,LenN :word; Pitch :integer);
VAR
  r :registers;
begin
r.SI := 14;
r.ES := Seg(Pitch);
r.BX := Ofs(Pitch);
Intr(SOUND_INTR,r);
Snd_Buf_Stat := r.AL;
end;

PROCEDURE PutNote(LenDen, LenNum :word; Pitch :integer);
VAR
  r :registers;
begin
r.SI := 15;
r.ES := Seg(Pitch);
r.BX := Ofs(Pitch);
Intr(SOUND_INTR,r);
Snd_Buf_Stat := r.AL;
end;

PROCEDURE SetTimbre(TimeDen, TimeNum :word; Tptr :pointer);
VAR
  r :registers;
begin
r.SI := 16;
r.ES := Seg(Tptr);
r.BX := Ofs(Tptr);
Intr(SOUND_INTR,r);
Snd_Buf_Stat := r.AL;
end;

PROCEDURE SetPitch(TimeD, TimeN :word; DltD, DltN, DltOc :integer);
VAR
  r :registers;
begin
r.SI := 17;
r.ES := Seg(DltOc);
r.BX := Ofs(DltOc);
Intr(SOUND_INTR,r);
Snd_Buf_Stat := r.AL;
end;

PROCEDURE SetTPB(TPB :word);
VAR
  r :registers;
begin
r.SI := 18;
r.ES := Seg(TPB);
r.BX := Ofs(TPB);
Intr(SOUND_INTR,r);
end;

PROCEDURE DirectNoteOn(Pitch :integer; Voice :word);
VAR
  r :registers;
begin
r.SI := 19;
r.ES := Seg(Voice);
r.BX := Ofs(Voice);
Intr(SOUND_INTR,r);
end;

PROCEDURE DirectNoteOff(Voice :word);
VAR
  r :registers;
begin
r.SI := 20;
r.ES := Seg(Voice);
r.BX := Ofs(Voice);
Intr(SOUND_INTR,r);
end;

PROCEDURE DirectTimbre(Tptr :pointer; Voice :word);
VAR
  r :registers;
begin
r.SI := 21;
r.ES := Seg(Voice);
r.BX := Ofs(Voice);
Intr(SOUND_INTR,r);
end;

PROCEDURE SetWhat(what :word); { ??? }
VAR
  r :registers;
begin
r.SI := 22;
r.ES := Seg(what);
r.BX := Ofs(what);
Intr(SOUND_INTR,r);
end;

PROCEDURE WaveForm(enable :word);
VAR
  r :registers;
begin
r.SI := 23;
r.ES := Seg(enable);
r.BX := Ofs(enable);
Intr(SOUND_INTR,r);
end;
