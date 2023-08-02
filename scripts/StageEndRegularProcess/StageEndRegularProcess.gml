function StageEndRegularProcess()
{
	// Exit if stage transition should be performed
	if !(!global.StageTransitions or IsFinalStage)
	{
		return;
	}

	// Wait until we fade out
	if IsFinished and fade_check(StateMax)
	{
		// Buffer and reset data
		global.Score		   = Player.Score;
		global.Lives		   = Player.Lives;
		global.SpecialRingList = [];
		global.StarPostData	   = [];

		// Save our progress at the end of the zone
		if SaveProgress and global.ActiveSave != -1
		{
			if IsFinalStage
			{
				// Mark savefile as completed if this was the last stage
				global.SaveState = 1;
			}
			else
			{
				global.ZoneID++;
			}
	
			// Save our progress
			savedata_save(global.ActiveSave);
		}

		// Load into the next stage
		if NextStage != noone
		{
			room_goto(NextStage);
		}
	}
}