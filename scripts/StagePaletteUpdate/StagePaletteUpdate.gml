function StagePaletteUpdate()
{
	switch room
	{
		case Stage_TSZ:
		{
			palette_updt_colour(PalPrimary,   17, 1,  8, 4);
			palette_sync_colour(PalPrimary,   18, 24, PalPrimary, 17);
			palette_sync_colour(PalSecondary, 55, 62, PalPrimary, 17);
		}
		break;
	}
}