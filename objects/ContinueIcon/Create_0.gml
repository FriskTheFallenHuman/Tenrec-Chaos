/// @description Startup
// You can write your code in this editor
	
	/* This object isn't used during the Results,
	the sprite is drawn instead */
	
	switch global.Character
	{
		case CharSurge:
			sprite_index = gui_icon_surge;
		break;
	}
	animation_play(sprite_index, 16, 0);