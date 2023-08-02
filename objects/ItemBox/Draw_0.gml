/// @description Draw
// You can write your code in this editor
	
	// Draw itembox
	draw_self();
	
	// Draw item card
	if !State and Timer > 1
	{
		if CardSprite != 11
		{
			if CardSpecialType == 1
				draw_sprite(character_get_asset_name("spr_obj_itembox_card_"), CardSprite, floor(CardX), floor(CardY));
			else if CardSpecialType == 2
				draw_sprite(spr_obj_itembox_emeralds_card, global.Emeralds, floor(CardX), floor(CardY));
			else
				draw_sprite(spr_obj_itembox_card, CardSprite, floor(CardX), floor(CardY));
		}
	}
	else if State and State < 3
	{
		if CardSprite != 11
		{
			if CardSpecialType == 1
				draw_sprite(character_get_asset_name("spr_obj_itembox_card_"), CardSprite, floor(CardX), floor(CardY));
			else if CardSpecialType == 2
				draw_sprite(spr_obj_itembox_emeralds_card, global.Emeralds, floor(CardX), floor(CardY));
			else
				draw_sprite(spr_obj_itembox_card, CardSprite, floor(CardX), floor(CardY));
		}
	}