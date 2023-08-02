/// @description Startup
// You can call your scripts in this editor

	/* Variable Definitions	
	1. PlayerType, default = "All"					
	*/
	
	State	   = 0;
	StateTimer = 0;
	SparkleID  = 0;
	SparkleX   = [-24, 8, -16, 24, 0, 16, -24, 24];
	SparkleY   = [-16, 8, 0, -8, -8, 0, 8, 16];
	
	// Define sprites to use
	SpriteData[0] = spr_obj_clearpanel_start_st;
	SpriteData[1] = character_get_asset_name("spr_obj_clearpanel_end_");

	sprite_index = SpriteData[0];
	
	// Set object properties
	object_set_unload(FlagPause);
	object_set_depth(Player, 0);
	object_set_triggerbox(0, 32, -y, room_height - y);