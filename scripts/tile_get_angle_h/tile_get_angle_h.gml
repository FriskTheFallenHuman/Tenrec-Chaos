/// @function tile_get_angle_h(X, Y, toPositive, noSolidTop, Layer)
function tile_get_angle_h(X, Y, toPositive, noSolidTop, Layer)
{
	if X < 0 or Y < 0 or X > room_width or Y > room_height exit;	

	// Get tile and read its width
	var Tile  = tilemap_get(Stage.TileLayer[Layer], X div TileSize, Y div TileSize);
	var Index = tile_get_index(Tile) mod TileAmount;
	var Width = Game.WidthValueOf[Index][tile_get_flip(Tile) ? TileSize - 1 - Y mod TileSize : Y mod TileSize];
	
	// Use current tile
	var Tile2 = 0;
	
	// Use a tile to the right if this tile width is 0
	if !Width
	{
		Tile2 = +TileSize;
	}
	
	// Use a tile to the left if this tile width is 16 and we're checking for the distance
	else if Width = TileSize 
	{
		if !noSolidTop
		{
			Tile2 = -TileSize;
		}
	}
	
	// Check if we need to invert our calculations
	var Invert = toPositive ? 1 : -1;
	
	// Get second tile properties if we're using it
	if Tile2 != 0
	{	
		Tile2 *= Invert;
		Tile   = tilemap_get(Stage.TileLayer[Layer], (X + Tile2) div TileSize, Y div TileSize);
		Index  = tile_get_index(Tile) mod TileAmount;
		Width  = Game.WidthValueOf[Index][tile_get_flip(Tile) ? TileSize - 1 - Y mod TileSize : Y mod TileSize];
	}
		
	// Return cardinal angles for empty and full tiles
	if (Tile = 0 or Tile = 1) return toPositive ? 90 : 270;
		
	// Return cardinal angle for mirrored tiles
	var Mirr = tile_get_mirror(Tile);
	if toPositive and Mirr 
	{
		return 90;
	}
	else if !toPositive and !Mirr 
	{
		return 270; 
	}
		
	// Get angle of regular tiles
	Index   = tile_get_index(Tile) mod TileAmount
	var Ang = Game.AngleValueOf[Index];
    
	// Adjust the angle and return it
	if tile_get_flip(Tile)
	{
		Ang = (540 - Ang) mod 360;
	}
	return Mirr ? 360 - Ang : Ang;
}