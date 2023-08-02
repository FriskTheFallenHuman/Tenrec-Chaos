function InputHotkeysProcess()
{
	// Toggle fullscreen (F4)
	if keyboard_check_pressed(vk_f4)
	{
		window_set_fullscreen(!window_get_fullscreen());
	}

	// Debug keys (ESC -> F3, F5 -> F10)
	if global.DevMode
	{
		if keyboard_check_pressed(vk_escape)
		{
			// Reset data
			global.StarPostData    = [];
			global.BonusStageData  = [];
			global.SpecialRingData = [];
			global.SpecialRingList = [];
			
			room_goto(Screen_DevMenu);
		}
		else if keyboard_check_pressed(vk_f1) 
		{
			game_restart();
		}
		else if keyboard_check_pressed(vk_f2)
		{	
			// Reset data
			global.StarPostData    = [];
			global.BonusStageData  = [];
			global.SpecialRingData = [];
			
			room_restart();
		}
		else if keyboard_check_pressed(vk_f3) 
		{
			if game_get_speed(gamespeed_fps) == 60
			{
				game_set_speed(2, gamespeed_fps);
			}
			else
			{
				game_set_speed(60, gamespeed_fps);
			}
		}
		
		if instance_exists(Interface)
		{
			if keyboard_check_pressed(vk_f5) 
			{
				Interface.DebugPositions = !Interface.DebugPositions;
			}
			else if keyboard_check_pressed(vk_f6)
			{
				Interface.DebugSolids = !Interface.DebugSolids;
			}
			else if keyboard_check_pressed(vk_f7)
			{
				Interface.DebugHitboxes = !Interface.DebugHitboxes;
			}
			else if keyboard_check_pressed(vk_f8)
			{
				Interface.DebugTriggers = !Interface.DebugTriggers;
			}
			else if keyboard_check_pressed(vk_f9)
			{
				Interface.DebugFPS = !Interface.DebugFPS;
			}
			else if keyboard_check_pressed(vk_f10)
			{
				Interface.DebugVariables = !Interface.DebugVariables;
			}
		}
	}
}