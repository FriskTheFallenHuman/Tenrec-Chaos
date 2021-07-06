function ObjAnimalStartup()
{
	// Initialize variables
	AnimalType   isAsset;
	State		 isReal;
	PosX		 isReal;
	PosY		 isReal;
	Xsp          isReal;
	Ysp			 isReal;
	Grv			 isReal;
	CapsuleDelay isReal;
	FromCapsule  isBool;
	
	// Set object solidbox
	object_set_solidbox(8, 8);
	
	// Set object depth
	object_set_depth(Player, false);
	
	// Animals list
	AnimalType = choose
	(
		spr_obj_animal_flicky,
		spr_obj_animal_pocky,
		spr_obj_animal_flicky,
		spr_obj_animal_pocky,
	);
	
	// Set default speeds based on animal type
	switch AnimalType
	{
        case spr_obj_animal_flicky: 
		{
			Xsp = 3; 
			Ysp = -4; 
		}
		break;
		case spr_obj_animal_pocky:
		{
			Xsp = 2;
			Ysp = 4;
		}
		break;
    }
	
	// Set default position
	PosX = x;
	PosY = y;
	
	// Set gravity
	Grv = 0.21875;
}