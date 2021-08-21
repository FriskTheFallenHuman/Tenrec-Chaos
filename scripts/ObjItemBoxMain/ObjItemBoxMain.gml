function ObjItemBoxMain()
{
	// Check if itembox is not destoryed
	if !Destroyed
	{
		// Play animation
		animation_play(spr_obj_itembox, 4, 1);		
		
		// Blink item card
		if !CardTimer
		{
			CardTimer = 5;
		}
		else
		{	
			CardTimer--;
		} 
		
		// Check if player is spinning or gliding
		if (Player.Spinning or Player.GlideState == GlideActive) and Player.OnObject != id
		{
			// Check if player is able to destroy the itembox
			if Game.SKItemBoxBehaviour
			{
				if Player.Ysp < 0
				{
					var Check = floor(Player.PosY + 16) >= CardPosY;
				}
				else
				{
					var Check = true;
				}
			}
			else
			{
				var Check = Player.Ysp >= 0;
			}
			if Check
			{
				if object_player_overlap(Hitbox)
				{
					// Inverse player's speed
					if !Player.Grounded
					{
						Player.Ysp = -Player.Ysp;
					}
					
					// Create explosion
					instance_create(floor(PosX), floor(PosY), DustExplosion);
					audio_sfx_play(sfxDestroy, false);
				
					// Temporary do not unload itembox
					object_set_range(RangeFar, false);	
					
					// Set flags
					Destroyed = true;
					CardTimer = 31;	
					CardPosX  = x;
					CardPosY  = y - 4;
				}
				
				// Reset collision
				object_act_solid(false, false, false);
			}
			else
			{
				// Check for bumping into its bottom
				if !Airborne
				{
					if floor(Player.PosY) >= floor(PosY + 16) and object_player_overlap(Hitbox)
					{
						Airborne = true;
						Ysp      = -1.5;
					
						Player.Ysp = -Player.Ysp;
					}
				}
				
				// Do collision
				object_act_solid(true, true, false);
			}
		}	
		
		// Do collision
		else
		{
			object_act_solid(true, true, false);
		}

		// Check if monitor is airborne
		if Airborne
		{
			// Move
			Ysp  += 0.21875;
			PosY += Ysp;
			
			// Update position
			object_update_position(PosX, PosY);
		
			// Collide with floor
			var FindFloor = object_collide_tiles_v(SideCentre, SideBottom, 0, Player.Layer)
			if  FindFloor
			{
				Airborne = false;
			}
		}	
	}
	else
	{
		// Play destroyed animation
		animation_play(spr_obj_itembox_destroyed, 1, 1);
		
		// If card timer ran out, allow unload
		if !CardTimer
		{
			object_set_range(RangeFar, TypeUnload);
		}
		else
		{
			// Move item card
			CardSpeed = min(0, CardSpeed + 0.09375);
			CardPosY += CardSpeed;
			
			// Give bonus
			if CardSpeed == 0 and (--CardTimer) == 30
			{
				switch BoxType
				{
					case "10 Rings":
					{
						// Give 10 rings
						Player.Rings += 10;
						
						// Grant extra life
						if Player.Rings >= 100 and Player.LivesRewards == 0
						or Player.Rings >= 200 and Player.LivesRewards == 1
						{
							Player.Lives++;
							Player.LivesRewards++;
							audio_bgm_play(PriorityHigh, ExtraLifeJingle, noone);
						}
						
						// Play sound
						audio_sfx_play(Player.Rings mod 2 == 0 ? sfxRingLeft : sfxRingRight, false);
					}
					break;
					case "High Speed":
					{
						// Give highspeed bonus for 20 seconds
						Player.HighspeedBonus = 1200;
						
						// Play music
						if !Player.SuperState
						{
							audio_bgm_play(PriorityLow, HighspeedMusic, noone);
						}
					}
					break;
					case "Regular Barrier":
					{
						// Give regular barrier
						Player.BarrierType = BarrierNormal;
						audio_sfx_play(sfxBarrier, false);
						
						// Spawn barrier object
						if !instance_exists(Barrier)
						{
							var  Object = instance_create(floor(Player.PosX), floor(Player.PosY), Barrier);
							with Object
							{
								animation_set(spr_barrier_normal, 1);
							}
						}
					}
					break;
					case "Flame Barrier":
					{
						// Give flame barrier
						Player.BarrierType = BarrierFlame;
						audio_sfx_play(sfxFlameBarrier, false);
						
						// Spawn barrier object
						if !instance_exists(Barrier)
						{
							var  Object = instance_create(floor(Player.PosX), floor(Player.PosY), Barrier);
							with Object
							{
								animation_set(spr_barrier_flame, 1);
							}
						}
					}
					break;
					case "Thunder Barrier":
					{
						// Give thunder barrier
						Player.BarrierType = BarrierThunder;
						audio_sfx_play(sfxThunderBarrier, false);
						
						// Spawn barrier object
						if !instance_exists(Barrier)
						{
							var  Object = instance_create(floor(Player.PosX), floor(Player.PosY), Barrier);
							with Object
							{
								animation_set(spr_barrier_thunder, 1);
							}
						}
					}
					break;
					case "Water Barrier":
					{
						// Give water barrier
						Player.BarrierType = BarrierWater;
						audio_sfx_play(sfxWaterBarrier, false);
						
						// Spawn barrier object
						if !instance_exists(Barrier)
						{
							var  Object = instance_create(floor(Player.PosX), floor(Player.PosY), Barrier);
							with Object
							{
								animation_set(spr_barrier_water, 1);
							}
						}
						
						// Play previous track if running out of air
						if Player.AirTimer <= 720
						{	
							if !Player.SuperState
							{
								if Player.HighspeedBonus
								{
									audio_bgm_play(PriorityLow, HighspeedMusic, noone);
								}
								else if Player.InvincibleBonus
								{
									audio_bgm_play(PriorityLow, InvincibilityMusic, noone);
								}
								else
								{
									audio_bgm_play(PriorityLow, Stage.StageMusic, other);
								}
							}
							else
							{
								audio_bgm_play(PriorityLow, SuperMusic, other);
							}
						}
			
						// Reset air timer
						Player.AirTimer = 1800;
					}
					break;
					case "Invincibility":
					{
						if !Player.SuperState
						{
							// Give invincibility bonus for 20 seconds
							Player.InvincibleBonus = 1200;
						
							// Play music
							audio_bgm_play(PriorityLow, InvincibilityMusic, noone);
						}
					}
					break;
					case "Extra Life":
					{
						// Give player 1 extra life
						Player.Lives += 1;
						
						// Play jingle
						audio_bgm_play(PriorityHigh, ExtraLifeJingle, noone);
					}
					break;
					case "Eggman":
					{
						// Damage player
						player_damage(false, false, false);
					}
					break;
				}
			}
		}
	}
}