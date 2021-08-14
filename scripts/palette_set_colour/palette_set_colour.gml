/// @function palette_set_colour(type, id, range, colourid)
function palette_set_colour(type, id, range, colourid)
{
	var lastcol = id - 1 + range;
	for(var i = id - 1; i < lastcol; i++)
	{
		if type == PaletteSurface
		{
			PaletteIndexDry[id - 1] = colourid;
		}
		else if type = PaletteUnderwater
		{
			PaletteIndexWet[id - 1] = colourid;
		}
	}
}