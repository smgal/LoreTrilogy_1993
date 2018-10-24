program Main_Program_of_Into_the_Mystic ;
 {$M 20000,0,100000}
{$F+}
Uses
   Overlay, Crt, Dos, Graph, AdLib, UHanX, MystSub, MystMain, MystTitl;

{$O MystSpec}
{$O MystTalk}
{$O MystTal1}
{$O MystTal2}
{$O MystEnt}
{$O MystTime}
{$O MystEnd}
{$O MystTitl}
{$O MystCret}

Procedure EgaVga; external;
   {$L EGAVGA.OBJ}

begin { Main }

   OvrInit('Mystic.Dat');
   if OvrResult <> ovrOK then begin
      if OvrResult = ovrNotFound then begin
         writeln('ERROR : Mystic.Dat not found !!');
         halt;
      end;
      writeln('# Overlay ERROR : ',OvrResult);
      Halt;
   end;
   Writeln('Overlay OK !');
   OvrInitEMS;
   if OvrResult <> ovrOK then begin
      case OvrResult of
         ovrNoEMSDriver : writeln('EMS drive not installed.');
         ovrNoEMSMemory : writeln('not enough EMS memory.')
         else writeln('EMS memory not used.');
      end;
   end else writeln('EMS memory used.');
   delay(500);
   i := RegisterBGIDriver(@EgaVga);
   CheckBreak := FALSE;

   i := VGA;
   j := VGAHi;
   InitGraph(i,j,'');
   Loading_SaveGame := TRUE;

   ok := TRUE;
   for i := 1 to paramcount do
      if (paramstr(i) = '/m') or (paramstr(i) = '/M') then ok := FALSE;
   if ok then begin
      ExistFile := FSearch('Init.cmd','');
      if ExistFile <> '' then begin
         Assign(FileName,'Init.cmd');
         Rename(FileName,'Init.com');
         exec(getenv('COMSPEC'),'/cInit.com > nul');
         Rename(FileName,'Init.cmd');
         if doserror > 0 then halt;
      end;
      InitSound;
      if AdLib_Error = 0 then AdLibOn := TRUE else AdLibOn := FALSE;
   end
   else AdLibOn := FALSE;

   ok := TRUE;
   for i := 1 to paramcount do
      if (paramstr(i) = '/g') or (paramstr(i) = '/G') then ok := FALSE;
   if ok then Title_Menu;

   new(font); new(chara);  { 16464 }
   new(map);
   SetFont(2);
   Set_All;
{   Restore_Palette;  }

   if not AdLibOn then while TRUE do Main;

   LoadBank('Mystic.Cmd');
   while TRUE do begin
      QuitPlay := false;
      ok := FALSE;
      if mapname = 'Lore'     then ok := TRUE;
      if mapname = 'Ground2'  then ok := TRUE;
      if mapname = 'OrcTown'  then ok := TRUE;
      if mapname = 'DracTown' then ok := TRUE;
      if mapname = 'Ground4'  then ok := TRUE;
      if mapname = 'UnderGrd' then ok := TRUE;
      if mapname = 'TrolTown' then ok := TRUE;
      if mapname = 'Valhalla' then ok := TRUE;
      if mapname = 'Ground5'  then ok := TRUE;
      if ok then begin
         LoadSong(mapname+'.Bgm');
      end
      else begin
         LoadSong(ExistFile);
      end;
      PlaySong(Main);
      PlayOff;
   end;
end. { Main }