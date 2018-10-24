program Main_Program_of_The_Codex_of_Another_Lore ;
 {$M 20000,0,155360}

Uses
   Crt, Dos, Graph, AdLib, UHanX, Voice, LoreSub, LoreMenu,
   LoreBatt, LoreSpec, LoreEnt, LoreTalk, LoreMain, LoreHelp;

Procedure EgaVga; external;
   {$L EGAVGA.OBJ}

begin { Main }

   i := RegisterBGIDriver(@EgaVga);
   CheckBreak := FALSE;

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

   i := VGA;
   j := VGAMed;
   InitGraph(i,j,'');

   GetMem(font,13776); GetMem(chara,13776);
   SetFont(2);
   Set_All;

   if not AdLibOn then while TRUE do Main;
   LoadBank('Lore.Cmd');
   while TRUE do begin
      QuitPlay := false;
      LoadSong(ExistFile);
      PlaySong(Main);
      PlayOff;
   end;
end. { Main }