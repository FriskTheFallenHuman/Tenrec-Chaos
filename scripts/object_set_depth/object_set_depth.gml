/// @function object_set_depth(relObject, renderAbove)
function object_set_depth(relObject, renderAbove)
{
	// Apply depth relative to the player
	if relObject = Player
	{
		depth = layer_get_depth("Objects") - (renderAbove ? 1 : -1);
	}
	
	// Apply depth relative to another object
	else
	{
		depth = relObject.depth - (renderAbove ? 1 : -1);
	}
}