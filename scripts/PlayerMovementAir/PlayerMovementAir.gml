function PlayerMovementAir()
{	
	// Exit if gliding (ignoring GlideDrop state) or climbing
	if GlideState == GlideActive or GlideState == GlideStop or ClimbState
	{
		exit;
	}
	
	// Handle air movement
	if !(RollJumping and !Game.RolljumpControl) and !NoControls
	{
		if Input.Left 
		{	
			// Decelerate
			if Xsp > 0 
			{
				Xsp -= AirAcc;
			} 
			
			// Accelerate
			else if !Game.AirSpeedcap and Xsp > -TopAcc or Game.AirSpeedcap
			{
				Xsp -= AirAcc;
				if Xsp <= -TopAcc
				{
					Xsp = -TopAcc;
				}
			}
			Facing = DirectionLeft;
		}
		if Input.Right 
		{	
			// Decelerate
			if Xsp < 0 
			{
				Xsp += AirAcc;
			} 
			
			// Accelerate
			else if (!Game.AirSpeedcap and Xsp < TopAcc) or Game.AirSpeedcap
			{
				Xsp += AirAcc;
				if Xsp >= TopAcc
				{
					Xsp = TopAcc;
				}
			}
			Facing = DirectionRight;
		}	
	}
	
	// Apply air drag
	if Ysp < 0 and Ysp > -4 and !Hurt
	{
		Xsp -= floor(Xsp/0.125) / 256;
	}
	
	// Handle spring animation
	if Animation = AnimSpring and Ysp > 0
	{
		Animation = AnimWalk;
	}
}