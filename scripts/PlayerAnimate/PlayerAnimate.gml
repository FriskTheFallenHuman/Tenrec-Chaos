function PlayerAnimate()
{	
	static AnimSpringTime  = 0;
	static AnimBreatheTime = 0;
	static AnimStandTime   = 0;
	static AnimSkidTime    = 0;
	
	// Update statics
	if Animation != AnimBreathe
	{
		AnimBreatheTime = 24;
	}
	if Animation != AnimSpring
	{
		AnimSpringTime = 48;
	}
	if Animation != AnimDropStand and Animation != AnimGlideStand
	{
		AnimStandTime = 16;
	}
	if Grounded and Gsp > 0 and Input.Left or Gsp < 0 and Input.Right
	{
		AnimSkidTime = global.Character == CharSurge ? 24 : 16;
	}
	
	// Animate character
	switch global.Character
	{	
		#region Surge
		case CharSurge:
		{	
		if !SuperState then switch Animation
		{
			case AnimIdle:
			{
				animation_play(spr_surge_idle, [288, 24, 48, 24, 24, 24, 24, 24, 24], 4);
			}
			break;
			case AnimMove:	
			{
				if abs(Gsp) < 6
				{
					animation_play(spr_surge_walk, floor(max(1, 9 - abs(Gsp))), 0);
				}
				else
				{
					if global.PeeloutEnabled
					{
						var Sprite = abs(Gsp) < 10 ? spr_surge_run : spr_sonic_peelout;
					}
					else
					{
						var Sprite = spr_surge_run;
					}
					animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
				}
			}
			break;
			case AnimPeelout:
			{
				if abs(PeeloutRev) < 6
				{
					var Sprite = spr_surge_walk;
				}
				else if abs(PeeloutRev) < 10
				{
					var Sprite = spr_surge_run;
				}
				else
				{
					var Sprite = spr_sonic_peelout;
				}	
				animation_play(Sprite, floor(max(1, 8 - abs(PeeloutRev))), 0);
			}
			break;
			case AnimSpin:
			{
				if abs(Gsp) < 6
				{
					var Sprite = spr_surge_spin;
				}
				else
				{
					var Sprite = spr_surge_spin_fast;
				}
				animation_play(Sprite, floor(max(1, 5 - abs(Gsp))), 0);
			}
			break;
			case AnimSpindash:
				animation_play(spr_surge_spindash, 1, 0);
			break;
			case AnimCrouch:
				animation_play(spr_surge_crouch, 4, 1);
			break;
			case AnimLookup:
				animation_play(spr_surge_lookup, 4, 1);
			break;
			case AnimSkid:
			{
				if !(--AnimSkidTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_play(spr_surge_skid, 6, 2);
				}
			}
			break;
			case AnimPush:
				animation_play(spr_surge_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
			break;
			case AnimHurt:
				animation_set(spr_surge_hurt, 0);
			break;
			case AnimDeath:
				animation_set(spr_surge_death, 0);
			break;	
			case AnimDrown:
				animation_set(spr_surge_drown, 0);
			break;
			case AnimBalance:
				animation_play(spr_sonic_balance, 16, 0);
			break;
			case AnimBalanceFlip:
				animation_play(spr_sonic_balance_flip, 16, 0);
			break;
			case AnimBalancePanic:
				animation_play(spr_sonic_balance_panic, 4, 0);
			break;
			case AnimBalanceTurn:
				animation_set(spr_sonic_balance_turn, 0);
			break;
			case AnimSpring:
			{
				if !(--AnimSpringTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_set(spr_surge_spring, 0);
				}
			}
			break;
			case AnimBreathe:
			{
				if !(--AnimBreatheTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_set(spr_surge_breathe, 0);
				}
			}
			break;
			case AnimDropdash:
				animation_play(spr_surge_dropdash, 1, 16);
			break;
			case AnimClear:
				animation_play(spr_surge_actclear, 12, 0);
			break;
			case AnimClearAlt:
				//animation_play(spr_sonic_actclearalt, [14, 18, 2, 4, 4, 6, 6, 1], 7);
				animation_play(spr_surge_actclear, 12, 0);
			break;
		}
		#endregion
		
		#region Super Surge
		else switch Animation
		{
			case AnimTransform:
				animation_play(spr_supersonic_transform, [6, 6, 3, 3, 3], 3);
			break;
			case AnimIdle:
				animation_play(spr_supersonic_idle, 8, 0);
			break;
			case AnimMove:	
			{
				if abs(Gsp) < (IsUnderwater ? 6 : 8)
				{
					var Sprite = spr_supersonic_walk;
				}
				else
				{
					var Sprite = spr_supersonic_fly;
				}
				animation_play(Sprite, floor(max(1, 9 - abs(Gsp))), 0);
			}
			break;
			case AnimPeelout:
			{
				if abs(PeeloutRev) < 8
				{
					var Sprite = spr_supersonic_walk;
				}
				else
				{
					var Sprite = spr_supersonic_fly
				}
				animation_play(Sprite, floor(max(1, 8 - abs(PeeloutRev))), 0);
			}
			break;
			case AnimSpin:
			{
				if abs(Gsp) < 6
				{
					var Sprite = spr_surge_spin;
				}
				else
				{
					var Sprite = spr_surge_spin_fast;
				}
				animation_play(Sprite, floor(max(1, 5 - abs(Gsp))), 0);
			}
			break;
			case AnimSpindash:
				animation_play(spr_surge_spindash, 1, 0); 
			break;
			case AnimCrouch:
				animation_play(spr_supersonic_crouch, [4, 8, 8, 8, 8], 1);
			break;
			case AnimLookup:
				animation_play(spr_supersonic_lookup, [4, 8, 8, 8, 8], 1);
			break;
			case AnimSkid:
			{
				if !(--AnimSkidTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_play(spr_supersonic_skid, 3, 4);
				}
			}
			break;
			case AnimPush:
				animation_play(spr_supersonic_push, floor(max(1, 8 - abs(Gsp)) * 4), 0);
			break;
			case AnimHurt:
				animation_set(spr_supersonic_hurt, 0);
			break;
			case AnimDeath:
				animation_set(spr_supersonic_death, 0);
			break;	
			case AnimDrown:
				animation_set(spr_supersonic_drown, 0);
			break;
			case AnimBalance:
				animation_play(spr_supersonic_balance, 10, 0);
			break;
			case AnimBalanceFlip:
				animation_play(spr_supersonic_balance_flip, 10, 0);
			break;
			case AnimSpring:
			{
				if !(--AnimSpringTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_play(spr_supersonic_spring, 4, 0);
				}
			}
			break;
			case AnimBreathe:
			{	
				if !(--AnimBreatheTime)
				{
					Animation = AnimMove;
				}
				else
				{
					animation_set(spr_supersonic_breathe, 0);
				}
			}
			break;
			case AnimDropdash:
				animation_play(spr_surge_dropdash, 1, 0);
			break;
		}
		}
		break;
		#endregion
	}
}