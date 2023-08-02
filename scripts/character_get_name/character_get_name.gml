/// @function character_get_name(character)
function character_get_name(character)
{
	var name = noone;

	// return the character's name has an string
	switch character
	{
		case CharSurge:
			name = "surge";
		break;
	}

	// If we get an invalid character, bail.
	if ( name == noone )
		throw "Invalid player character, How do we even get here?";
		
	return name;
}