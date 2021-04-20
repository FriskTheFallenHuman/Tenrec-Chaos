function ObjRingScript()
{
	// Check if ring is physical (being lost by player)
	if Physical
	{
		// Play animation
		animation_play(sprite_index, 2 + floor(128 / Timer), 1);
		
		// Do timer stuff
		if (PickupTimeout > 0) PickupTimeout--;
		CollisionCheck++;
		Timer--;
		
		// Check for timeout
		if !Timer
		{
			instance_destroy(self);
			exit;
		}
	
		// Apply gravity
		Ysp += Grv;
	
		// Update code position
		PosX += Xsp;
		PosY += Ysp;
	
		// Do tile collision every four frames
		if CollisionCheck mod 4 == 0
		{
			// Check if ring found the tile
			if tile_meeting(floor(PosX), floor(PosY + 8), LayerA)
			or tile_meeting(floor(PosX), floor(PosY + 8), LayerB)
			{
				// Invert its speed
				Ysp = min(Ysp * -0.75, -2);
			}	
		}
		
		// Update real position
		x = floor(PosX);
		y = floor(PosY);
		
		// Check if ring is outside the camera X view
		if x < Screen.RenderX - 8 or x > Screen.RenderX + Screen.Width + 8
		{
			// Delete it
			instance_destroy(self);
			exit;
		}
	}
	
	// If ring is static, just play its animation
	else
	{
		// Play animation
		animation_play(sprite_index, 4, 1);
	}
	
	// Check for hitbox collision
	if !PickupTimeout and object_check_overlap(CollisionHitbox)
	{	
		// Add 1 to ring counter
		Player.Rings++;
	
		// Create shine object (depth will be set on RingSparkle creation)
		instance_create_depth(x, y, depth, RingSparkle);	
	
		// Play sound, switch left and right channels every ring
		audio_sfx_play(Player.Rings mod 2 == 0 ? sfxRingLeft : sfxRingRight, false, false);
	
		// Delete ring
		instance_destroy(self);		
	}
}