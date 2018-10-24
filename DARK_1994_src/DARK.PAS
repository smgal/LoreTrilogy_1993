program Main_Program_of_The_Codex_of_Another_Lore ;
 {$M 20000,0,100000}

Uses
   Crt, Dos, Graph, AdLib, UHanX, DarkSub, DarkMain, DarkTitl;


Procedure EgaVga; external;
   {$L EGAVGA.OBJ}

begin { Main }

   i := RegisterBGIDriver(@EgaVga);
   CheckBreak := FALSE;

   i := VGA;
   j := VGAHi;
   InitGraph(i,j,'');
   Loading_SaveGame := TRUE;

   if paramcount > 0 then s := paramstr(1) else s := '';

   if (s <> '/m') and (s <> '/M') then begin
      ExistFile := FSearch('Init.cmd','');
      if ExistFile <> '' then begin
         Assign(FileName,'Init.cmd');
         Rename(FileName,'Init.com');
         exec(getenv('COMSPEC'),'/cInit.com > nul');
         Rename(FileName,'Init.cmd');
      end;
      InitSound;
      if AdLib_Error = 0 then AdLibOn := TRUE else AdLibOn := FALSE;
   end
   else AdLibOn := FALSE;

   if (s <> '/g') and (s <> '/G') then Title_Menu;

   new(font); new(chara);  { 16464 }
   new(map); new(enemydata);
   SetFont(2);
   Set_All;
{   Restore_Palette;}

   if not AdLibOn then while TRUE do Main;
   LoadBank('Dark.Cmd');
   while TRUE do begin
      QuitPlay := false;
      LoadSong(ExistFile);
      PlaySong(Main);
      PlayOff;
   end;
end. { Main }