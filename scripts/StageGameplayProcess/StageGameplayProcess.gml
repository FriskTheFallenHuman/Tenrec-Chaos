function StageGameplayProcess()
{
	// Process stage timer
	if TimeEnabled
	{
		if (++Time) == 36000
		{
			player_damage(false, false, true);
		}	
	}

	// Process animated graphics
	if AnimatedGraphics != noone
	{	
		var Update  = Renderer.UpdateAnimations;
		var Length  = array_length(AnimatedGraphics);
		var GameFPS = game_get_speed(gamespeed_fps);

		for (var i = 0; i < Length; i += 2)
		{
			if Update
			{
				var AnimSpeed = GameFPS / AnimatedGraphics[i + 1];
			}
			else
			{
				var AnimSpeed = 0;
			}
			sprite_set_speed(AnimatedGraphics[i], AnimSpeed, spritespeed_framespersecond);
		}
	}

	// Process player's death event
	if Player.Death
	{
		Camera.Enabled = false;
		UpdateObjects  = false;
		TimeEnabled    = false;

		/* In Sonic 3 and later, the game checks if player has fallen below */
		if !global.S3DeathRestart and floor(Player.PosY) >= Stage.BottomBoundary + 32
		or  global.S3DeathRestart and floor(Player.PosY) >= Camera.ViewY + global.Height + 32
		{
			if !RestartTimer
			{
				// If ran out of lives or time, start event
				if !(--Player.Lives) or Time == 36000
				{
					RestartEvent = true;

					audio_bgm_stop(AudioSecondary, 0);
					audio_bgm_play(AudioPrimary, GameOver);
				}
			}
			RestartTimer++;

			// Wait for 1 (or 12 if the event was triggered) seconds
			if RestartTimer == RestartEvent * 660 + 60
			{
				fade_perform(ModeInto, BlendBlack, 1);

				audio_bgm_stop(AudioPrimary,   0.5);
				audio_bgm_stop(AudioSecondary, 0.5);

				// Stop animations and background autoscrolling
				Renderer.UpdateAnimations = false;
			}

			// Wait until we fade out
			if fade_check(StateMax)
			{	
				if Player.Lives != 0
				{
					if array_length(global.StarPostData) and RestartEvent
					{
						// Clear saved time on the Star Post if we got time over'ed
						global.StarPostData[2] = 0;
					}
					global.Lives = Player.Lives;

					// Restart the stage
					room_restart();
				}
				else
				{
					// Reset all saved data during the stage
					global.SpecialRingList = [];
					global.StarPostData	   = [];

					if global.Continues
					{
						room_goto(Screen_Continue);
					}
					else
					{
						// Update game data of our save file
						if global.ActiveSave != -1
						{
							// Re-write game data
							global.Lives     = 3;
							global.Score     = 0;
							global.Continues = 0;

							savedata_save(global.ActiveSave);
						}
						room_goto(Screen_SEGA);
					}
				}
			}
		}
	}
}