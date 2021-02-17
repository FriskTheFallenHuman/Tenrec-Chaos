function PlayerCheckPeelout()
{	
	// Check if peelout is enabled
	if Game.PeeloutEnabled = false exit;
	
	// Start peelout
	if Inertia = 0 and PeeloutRev = -2
	{
		if Input.APress and Input.Up
		{
			PeeloutRev = 0;
		}
	}
	
	// Charge it
	if Input.Up
	{
		if PeeloutRev >= 0
		{
			PeeloutRev++;
			if (PeeloutRev > 30) PeeloutRev = 30;
			
			Animation = AnimPeelout;
		}
	}
	
	// Release
	else if PeeloutRev = 30
	{
		PeeloutRev = -2;
		Inertia    = 12 * Facing;
	}	
}