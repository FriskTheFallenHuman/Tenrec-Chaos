/// @description Main
// You can call your scripts in this editor
	
	/*
	if PlayerType == "Sonic & Tails" and global.Character == CharKnuckles
	or PlayerType == "Knuckles"		 and global.Character != CharKnuckles
	{
		visible = false;
		return;
	}
	*/
	
	switch State
	{
		// Idle
		case 0:
		{
			if object_check_player(ColTrigger)
			{
				// Make player exit their super form
				if Player.SuperState
				{
					Player.SuperState = false;
					audio_bgm_play(AudioPrimary, Stage.StageMusic);	
				}
				Stage.TimeEnabled = false;
				Stage.IsFinished  = 1;

				audio_sfx_play(sfxClearPanel, false);
				animation_play(SpriteData[0], 1, 0);
				
				// Increment state
				State++;
			}
		}
		break;
		case 1:
		{
			if (++StateTimer) == 62
			{
				// Switch to second animation
				animation_play(SpriteData[1], 1, 0);
			}
			else if StateTimer == 123
			{		
				animation_set(sprite_index, 0);
				
				// Increment state
				State++;
			}
		
			// Create as sparkle every 12th frame
			if StateTimer mod 12 == 0 and SparkleID < 8
			{
				instance_create(x + SparkleX[SparkleID], y + SparkleY[SparkleID], RingSparkle);
				SparkleID++;
			}
		}
		break;
		case 2:
		{
			/* S1 Behaviour */
			
			if !global.StageTransitions
			{
				if Stage.IsFinished < 2
				{
					// Check if the player passed by the right boundary
					if floor(Player.PosX + Player.Xsp) > Stage.RightBoundary - 24
					{
						Stage.IsFinished = 2; 
						audio_bgm_play(AudioPrimary, ActClear);
					}
				
					// Take away control from the player
					if Player.Grounded and !Input.IgnoreInput
					{
						Input.IgnoreInput = true;
					}
				}
				
				// Force player movement
				if Input.IgnoreInput
				{
					Input.Right = true;
				}
			}
			
			/* Transition Behaviour */
			
			else if Player.Grounded
			{
				if Stage.IsFinished < 2
				{
					if global.Character == CharSurge
					{
						ClearAnim = choose(AnimClear, AnimClear, AnimClear, AnimClearAlt);
					}
					else
					{
						ClearAnim = AnimClear;
					}
					
					if ClearAnim == AnimClearAlt
					{
						Player.Xsp		=  1.5 * Player.Facing;
						Player.Ysp		= -3.25;
						Player.Grounded =  false;
						
						// Force animation
						Player.Animation = ClearAnim;
					}
					else
					{
						Player.Xsp = 0;
						Player.Ysp = 0;
					}

					Player.Inertia    = 0;
					Stage.IsFinished  = 2; 
					Input.IgnoreInput = true;
						
					// Play resuts music
					audio_bgm_play(AudioPrimary, ActClear);
				}
				else if Player.Grounded
				{
					Player.Inertia = 0;
					Player.Xsp	   = 0;
					Player.Ysp	   = 0;
					
					// Force animation
					Player.Animation = ClearAnim;
				}
			}
		}
	}
	
	// Update stage boundaries
	if Camera.ViewX > x - global.Width * 1.5 + 64
	{
		if State
		{
			Stage.TargetLeftBoundary = x - (global.Width / 2);
		}
		else
		{
			Stage.TargetLeftBoundary  = x - global.Width * 1.5 + 64;
			Stage.TargetRightBoundary = x + global.Width / 2;
		}
	}