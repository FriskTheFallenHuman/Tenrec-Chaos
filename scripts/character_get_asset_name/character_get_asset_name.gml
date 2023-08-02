/// @function character_get_asset_name(asset)
function character_get_asset_name(asset)
{
	var name = character_get_name(global.Character);

	// return the character's name has an string
	var sprite = asset_get_index(asset + name);

	// If we get an invalid sprite, bail.
	if ( sprite == -1 )
		throw ("Invalid sprite, How do we even get here?");
		
	return sprite;
}