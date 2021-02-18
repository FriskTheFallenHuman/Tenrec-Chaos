function ScreenCameraOffsetView()
{	
	// Update camera lag delay timer
	if (ScrollDelay > 0) ScrollDelay--;
	
	// Update extended camera offset
	if Game.ExtendedCamera
	{
		if abs(Player.Xsp) >= Player.TopAcc 
		{
			if abs(ExtendedOffset) < 64 
			{
				ExtendedOffset += 2 * sign(Player.Xsp);
			}
		} 
		else 
		{
			ExtendedOffset -= 2 * sign(ExtendedOffset);
		}
	}
	
	// Set vertical spin offset
	if Player.Rolling or (Player.Jumping and Player.Rolling) 
	{
		SpinOffset = Player.yRadiusDefault - Player.yRadiusRoll;
	} 
	else 
	{
		SpinOffset = 0;
	}
	
	// Set up/down shift varaible
	var ShiftDown = Player.Inertia = 0 and Input.Down and Player.SpindashRev < 0 and Player.Grounded;
	var ShiftUp   = Player.Inertia = 0 and Input.Up   and Player.PeeloutRev  < 0 and Player.Grounded;
	
	// Delay up/down shift if spindash or peelout is enabled
	if Game.SpindashEnabled or Game.PeeloutEnabled
	{
		if ShiftUp or ShiftDown 
		{
			if (OverviewDelay > 0) OverviewDelay--;
		} 
		else 
		{
			OverviewDelay = 120;
		}
	} 
	else 
	{
		OverviewDelay = 0;
	}
	
	// Shift up/down
	if OverviewDelay = 0
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
	
	// Shift back to original position
	if OverviewDelay != 0 and OverviewOffset != 0
	{
		OverviewOffset -= 2 * sign(OverviewOffset);
	}	
}