function ContinueScreenSetup()
{
	// Get room centre
	RoomX = Game.ResolutionWidth / 2;
	RoomY = Game.ResolutionHeight / 2;
	
	// Set countdown to 11 seconds - 1 frame
	Countdown = 659;
	
	// Define character sprite to use
	switch Game.Character
	{
		case CharSonic:
			CharSprite = [spr_obj_cont_sonic_wait, spr_obj_cont_sonic_action];
			CharSpeed  = [18, 0];
		break;
		case CharTails:
			CharSprite = [spr_obj_cont_sonic_wait, spr_obj_cont_sonic_action];
			CharSpeed  = [18, 0];
		break;
		case CharKnuckles:
			CharSprite = [spr_obj_cont_knux_wait, spr_obj_cont_knux_action];
			CharSpeed  = [12, 0];
		break;
	}
	var WaitSprite = CharSprite[0];
	
	// Create character object
	CharObject = instance_create(RoomX, RoomY + 52, ContinueCharacter);
	with CharObject
	{
		animation_set_frame(WaitSprite, 1);
	}
	
	// Create continue objects
	for (var i = 0; i < Game.Continues; i++)
	{
		ContObject[i] = instance_create(RoomX + 21 * i - max(Game.Continues - 1, 0) * 11, RoomY - 20, ContinueIcon);
	}
	
	// Perfrom fade and play music
	fade_perform(from, black, 36);
	audio_play_sound(ContinueMusic, 0, false);
}