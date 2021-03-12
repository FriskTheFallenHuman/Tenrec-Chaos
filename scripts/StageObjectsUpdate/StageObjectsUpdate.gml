function StageObjectsUpdate() 
{	
	// Deactivate and activate object based on camera position rounded back to nearest 128
	instance_deactivate_object(Objects);
	if State != ActStateLoading
	{
		var Boundary128 = Screen.RenderX div 128 * 128;
		instance_activate_region(Boundary128, 0, Boundary128 + ceil(Screen.Width / 128) * 128, room_height, true);
	}
	
	// Adjust object's origin if its hitbox was configured with object_set_hitbox function
	with Objects
	{
		if variable_instance_exists(id, "AutomaticHitbox")
		{	
			// Get sprite centre
			var CenterX = sprite_width / 2;
			var CenterY = sprite_height / 2;
			
			// Set origin to sprite centre if it has not been set already
			if sprite_get_xoffset(sprite_index) != CenterX
			or sprite_get_yoffset(sprite_index) != CenterY
			{		
				sprite_set_offset(sprite_index, CenterX, CenterY);
			}
		}
	}
	
	// Stop all objects on player death
	if State = ActStatePlayerDeath
	{	
		with Objects if instance_exists(self)
		{	
			// Create layer and sprites on it
			layer_create(Player.DrawOrder + 1, "tempObjLayer");
			var Sprite = layer_sprite_create("tempObjLayer", x, y, sprite_index);
			layer_sprite_index(Sprite, image_index);

			// Set sprite speed
			sprite_set_speed(sprite_index, 0, spritespeed_framespersecond);
			
			// Destroy objects
			instance_destroy(self);
		}
	}
}