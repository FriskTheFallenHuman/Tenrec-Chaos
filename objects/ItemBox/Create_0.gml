/// @description Startup
// You can write your code in this editor
	
	/* Variable Definitions	
	1. BoxType, default = "Empty"
	*/
	
	PosX	  = x;
	PosY	  = y;
	CardX	  = x;
	CardY	  = y - 5;
	Timer     = 5;
	CardSpeed = 3;
	CardSpecialType = 0;
	IsFalling = 0;
	State	  = 0;
	Ysp		  = 0;

	switch BoxType
	{
		case "10 Rings":
			CardSprite = 0;
		break;
		case "Combine Ring":
			CardSprite = 1;
		break;
		case "Barrier":
			CardSprite = 2;
		break;
		case "Thunder Barrier":
			CardSprite = 3;
		break;
		case "Flame Barrier":
			CardSprite = 4
		break;
		case "Water Barrier":
			CardSprite = 5;
		break;
		case "High Speed":
			CardSprite = 6;
		break;
		case "Invincibility":
			CardSprite = 7;
		break;
		case "Extra Life":
			CardSprite = 8;
			CardSpecialType = 1;
		break;
		case "Eggman":
			CardSprite = 8;
		break;
		case "Super Form":
			CardSprite = 9;
		break;
		case "Emeralds":
			CardSprite = 10;
			CardSpecialType = 2;
		break;
		case "Empty":
			CardSprite = 11;
		break;
	}
	
	// Set object properties
	object_set_unload(FlagReset);
	object_set_depth(Player, 0);
	object_set_hitbox(16, 16);
	
	animation_play(sprite_index, 4, 0);