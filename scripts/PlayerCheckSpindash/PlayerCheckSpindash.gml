function PlayerCheckSpindash()
{	
	// Check if spindash is enabled
	if Game.SpindashEnabled = false exit;
	
	// Charge spindash
	if Inertia = 0 and Input.Down and Input.ABCPress 
	{	
		Animation = AnimSpindash;
		if (SpindashRev < 8) SpindashRev += 2;
		
		audio_sfx_play(sfxCharge, false);
	}
	
	// Decrease spindash force
	if SpindashRev > 0 
	{
		SpindashRev -= floor(SpindashRev/0.125) / 256;
	}
	
	// Release 
	if SpindashRev >= 0 and !Input.Down 
	{
		Screen.ScrollDelay = 24 - floor(SpindashRev);
		Inertia			   = (8 + floor(SpindashRev) / 2) * Facing;
		SpindashRev        = -2;
		
		// Update radiuses
		yRadius = yRadiusRoll;
		xRadius	= xRadiusRoll;
		PosY   += yRadiusDefault - yRadiusRoll;
		
		// Start rolling
		Rolling	= true;
		
		// Set animation
		Animation = AnimRoll;
		
		// Play sound
		audio_sfx_stop(sfxCharge);
		audio_sfx_play(sfxRelease, false);
	}
}