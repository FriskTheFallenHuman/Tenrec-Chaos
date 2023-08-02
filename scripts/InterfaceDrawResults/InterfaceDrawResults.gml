function InterfaceDrawResults()
{
	/* Value Table Reference
	----------------------------
	Value[0]  - Timer
	Value[1]  - Character Head X
	Value[2]  - 'CHARACTER GOT ' X
	Value[3]  - 'THROUGH' X
	Value[4]  - 'SCORE' X
	Value[5]  - 'TIME BONUS' X
	Value[6]  - 'RINGS BONUS' X
	Value[7]  - 'ACT' X
	Value[8]  - State
	Value[9]  - Ring Bonus
	Value[10] - Time Bonus
	Value[11] - Continue flag
	----------------------------
	*/

	if Stage.IsFinished >= 2
	{
		if !fade_check(StateActive)
		{	
			switch ResultsValue[8]
			{
				case 0:
				{
					// Calculate ring bonus
					ResultsValue[9] = Player.Rings * 100;
		
					// Calculate time bonus
					if Stage.Time >= 35940
					{
						ResultsValue[10] = 100000;
					}
					else if Stage.Time < 1800
					{
						ResultsValue[10] = 50000;
					}			
					else if Stage.Time >= 1800 and Stage.Time < 2700
					{
						ResultsValue[10] = 10000;
					}
					else
					{
						switch Stage.Time div 1800
						{
							case 0:			
								ResultsValue[10] = 5000; 
							break;
							case 1:			
								ResultsValue[10] = 5000;  
							break;
							case 2:			
								ResultsValue[10] = 4000;  
							break;
							case 3:			
								ResultsValue[10] = 3000;  
							break;
							case 4: 
							case 5: 
								ResultsValue[10] = 2000;  
							break;
							case 6: 
							case 7: 
								ResultsValue[10] = 1000;  
							break;
							case 8: 
							case 9: 
								ResultsValue[10] = 500;   
							break;
							default:
								ResultsValue[10] = 0;	  
						}
					}			
		
					// Check if we can get a continue
					ResultsValue[11] = (ResultsValue[9] + ResultsValue[10] >= 10000);
		
					// Increment state
					ResultsValue[8]++;
				}
				break;
		
				// State 1
				case 1:
				{
					// Shift assets
					if (++ResultsValue[0]) < 300
					{
						if ResultsValue[2]
						{
							ResultsValue[2] -= 20;
						}
						else if ResultsValue[3]
						{
							ResultsValue[3] -= 20;
						}
						else if ResultsValue[7]
						{
							if ResultsValue[1]
							{
								ResultsValue[1] -= 20;
							}
							ResultsValue[7] -= 20;
						}
						else
						{		
							if ResultsValue[4]
							{
								ResultsValue[4] -= 20;
							}
							if ResultsValue[5] 
							{
								ResultsValue[5] -= 20;
							}
							if ResultsValue[6] 
							{
								ResultsValue[6] -= 20;
							}
						}
					}
					else
					{
						if ResultsValue[0] == 300
						{
							audio_sfx_play(sfxScoreCount, true);
						}
			
						// Count bonuses
						if ResultsValue[10]
						{ 
							ResultsValue[10] -= 100;
							Player.Score     += 100;
						}
						if ResultsValue[9]
						{
							ResultsValue[9] -= 100;
							Player.Score    += 100;
						}
		
						// Score tally
						if ResultsValue[10] == 0 and ResultsValue[9] == 0
						{
							audio_sfx_play(sfxScoreTally, false);
							audio_sfx_stop(sfxScoreCount);
				
							// If earned more than 10000 points, grant continue
							if ResultsValue[11]
							{
								ResultsValue[8] = 3;
								ResultsValue[0] = -1;
							}
				
							// Else don't grant anything
							else
							{
								ResultsValue[8] = 2;
								ResultsValue[0] = 0;
							}
						}
					}
				}
				break;
				case 2:
				{
					// No continue
					if (++ResultsValue[0]) == 180
					{
						fade_perform(ModeInto, BlendBlack, 1);
				
						Stage.UpdateObjects       = false;
						Renderer.UpdateAnimations = false;
					}
				}
				break;
				case 3:
				{
					// Earned continue
					if ResultsValue[0] == -1
					{
						if !audio_sfx_is_playing(sfxScoreTally)
						{
							global.Continues++;
							audio_sfx_play(sfxContinue, false);
					
							// Increment timer
							ResultsValue[0] = 0;
						}
					}
					else if (++ResultsValue[0]) == 260
					{
						fade_perform(ModeInto, BlendBlack, 1);
				
						Stage.UpdateObjects       = false;
						Renderer.UpdateAnimations = false;
					}
				}
				break;
			}
		}

		// Get screen centre
		var CentreX = global.Width  / 2 + global.ScreenBuffer;
		var CentreY = global.Height / 2;
		
		// Draw assets and main text
		draw_set_font(Font.FontCard);
		draw_set_halign(fa_center);
	
		draw_sprite(character_get_asset_name("gui_results_head_"),	   0, CentreX + 53 + ResultsValue[1], CentreY - 25);
		draw_sprite(gui_results_act,	   Stage.ActID,      CentreX + 46 + ResultsValue[7], CentreY - 23);	
		draw_sprite(gui_results_score,	   0,			     CentreX - 58 + ResultsValue[4], CentreY + 15);
		draw_sprite(gui_results_timebonus, 0,			     CentreX - 38 + ResultsValue[5], CentreY + 31);
		draw_sprite(gui_results_ringbonus, 0,			     CentreX - 38 + ResultsValue[6], CentreY + 47);
		
		string_draw(CentreX - 18 - ResultsValue[2], CentreY - 60, "stage_clear_" + character_get_name(global.Character));
		string_draw(CentreX - 19 - ResultsValue[3], CentreY - 40, "stage_clear_through");

		// Draw continue icon
		if ResultsValue[8] == 3
		{
			if ResultsValue[0] >= 0 and ResultsValue[0] mod 32 <= 15
			{
				draw_anisprite( gui_icon_surge, 8, false, CentreX + 96, CentreY + 11);
			}
		}

		// Draw counters
		draw_set_font(Font.FontDigits1);
		draw_set_halign(fa_right);

		draw_text(CentreX + 80 + ResultsValue[4], CentreY + 8,  Player.Score);
		draw_text(CentreX + 80 + ResultsValue[5], CentreY + 24, ResultsValue[10]);
		draw_text(CentreX + 80 + ResultsValue[6], CentreY + 40, ResultsValue[9]);
	}
}