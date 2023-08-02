function PlayerHitboxUpdate()
{
	// Player's hitbox
	if Animation != AnimCrouch
	{
		HitboxData[0] = [floor(PosX - 8), floor(PosY - RadiusY + 3), floor(PosX + 8), floor(PosY + RadiusY - 3)];
	}
	
	// Double spin attack hitbox
	HitboxData[1] = [floor(PosX - 24), floor(PosY - 24), floor(PosX + 24), floor(PosY + 24)];
}