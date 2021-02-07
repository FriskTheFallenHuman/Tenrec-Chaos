function PlayerLevelBound()
{
	// Keep the player inside of stage boundaries using our next position
	if PosX + Xsp < Stage.LeftBoundary + 16 
	{
		PosX     = Stage.LeftBoundary + 16;
		Xsp      = 0;
		Inertia  = 0;
	}
	if PosX + Xsp > Stage.RightBoundary - 24 
	{
		PosX     = Stage.RightBoundary - 24;
		Xsp      = 0;
		Inertia  = 0;
	}
}