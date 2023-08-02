function PlayerSuperPalettesProcess()
{
	switch global.Character
	{
		case CharSurge:
		{
			// Get colour
			var Colour = palette_get_colour(PalPrimary, 0);
			
			// Regular form
			if !Player.SuperState
			{
				if Colour > 1
				{
					if Colour < 17
					{
						palette_set_colour(PalPrimary, 0, 17);
					}	
					palette_updt_colour(PalPrimary, 0, 1, 21, 4);
				}
			}
			
			// Super form
			else
			{
				if Colour == 1
				{
					palette_updt_colour(PalPrimary, 0, 1, 2, 19);
				}
				else if Colour < 7
				{
					palette_updt_colour(PalPrimary, 0, 6, 7, 4);
				}
				else
				{
					palette_updt_colour(PalPrimary, 0, 7, 16, 8);
				}
			}
			
			// Sync other colours
			palette_sync_colour(PalPrimary,   1, 3, PalPrimary, 0);
			palette_sync_colour(PalSecondary, 0, 3, PalPrimary, 0);
		}
		break;
	}
}