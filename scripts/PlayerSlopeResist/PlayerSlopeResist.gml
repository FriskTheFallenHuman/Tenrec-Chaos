function PlayerSlopeResist()
{	
	// Set slope gravity	
	if !Game.StrongerSlopeGravity and (Angle >= 46 and Angle <= 315) 
	or  Game.StrongerSlopeGravity and (Angle >= 35 and Angle <= 326)
	{
		SlopeGravity = 0.125;				
	} 
	else 
	{	
		SlopeGravity = (Inertia != 0) * 0.125;
	}
	
	// Update inertia
	Inertia -= SlopeGravity * dsin(Angle);
}