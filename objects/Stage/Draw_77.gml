/// @description Insert description here
// You can write your code in this editor
	
	if Input.StartPress and !GamePaused
	{
		GamePaused          = true;
		Input.StartPress    = false;
		Screen.PauseSurface = sprite_create_from_surface(application_surface, 0, 0, Game.ResolutionWidth, Game.ResolutionHeight, false, false, 0, 0);

		// Do code from object side
		with all
		{
			// Exit the code if object is the one to ignore
			var IgnoreList = [Framework, Player, Input, Screen, Stage, Discord, Spawnpoint];
			for (var i = 0; i < array_length(IgnoreList); i++)
			{
				if object_index == IgnoreList[i]
				{
					exit;
				}
			}	
			instance_deactivate_object(self);
		}
	}