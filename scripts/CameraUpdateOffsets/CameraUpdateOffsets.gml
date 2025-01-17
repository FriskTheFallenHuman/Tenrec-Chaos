function CameraUpdateOffsets()
{
	// Shake the camera. Not quite accurate to originals, but somewhat close (we hope)
	if ShakeTime
	{
		ShakeX     = irandom_range(8, 15)    * choose(-1, 1) * (1 + ShakeTime / 6) / 128;
		ShakeY     = irandom_range(128, 255) * choose(-1, 1) * (1 + ShakeTime / 6) / 255;
		ShakeTime -= 1;
	}
	else
	{
		ShakeX = 0;
		ShakeY = 0;
	}
	
	if Enabled and instance_exists(Target) and Target == Player
	{
		// Offset camera horizontally, like in CD
		if global.CDCamera
		{
			var ScreenShift	= 64;	// <- default value for 320px width, which is floor(global.Width / 5)
	
			var ScreenSpeed    = floor(ScreenShift / 32);
			var ShiftDirection = Player.Gsp != 0 ? sign(Player.Gsp) : Player.Facing;
	
			if abs(Player.Gsp) >= 6 or Player.PeeloutRev >= 6 or Player.SpindashRev >= 0
			{
				if !ScrollDelay and ExtendedOffset != ScreenShift * ShiftDirection
				{
					ExtendedOffset += ScreenSpeed * ShiftDirection
				}
			}
			else
			{
				ExtendedOffset -= ScreenSpeed * sign(ExtendedOffset);
			}
		}

		// Check for overview delay
		var ShiftDown = Player.Animation == AnimCrouch;
		var ShiftUp   = Player.Animation == AnimLookup;

		if (ShiftUp or ShiftDown) and !Player.DebugMode
		{
			if OverviewDelay
			{
				OverviewDelay--;
			}
		}
		else if global.SpindashEnabled or global.PeeloutEnabled
		{
			OverviewDelay = 120;
		}

		// Offset vertically
		if (ShiftUp or ShiftDown) and !OverviewDelay and !Player.DebugMode
		{
			if ShiftDown and OverviewOffset < 88 
			{
				OverviewOffset += 2;
			}
			if ShiftUp and OverviewOffset > -104 
			{
				OverviewOffset -= 2;
			} 	
		} 
		else if OverviewOffset != 0
		{
			OverviewOffset -= 2 * sign(OverviewOffset);
		}
	}
}