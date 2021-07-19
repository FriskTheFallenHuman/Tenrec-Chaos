function BackgroundSystemSetup()
{
	// Automaticly setup width and texel for the background
	var BackgroundParts = array_length(BackgroundSprites);
	for (var i = 0; i < BackgroundParts; i++)
	{
		BackgroundValues[i][11] = sprite_get_width(BackgroundSprites[i]);
		BackgroundValues[i][12] = texture_get_texel_width(sprite_get_texture(BackgroundSprites[i], 0));
	}
	
	// Render background behind everything
	depth = 9999;
}