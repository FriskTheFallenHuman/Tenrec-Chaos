function GameRoomSetup()
{	
	// Enable room viewport and make it visible
	view_enabled[0] = true;
	view_visible[0] = true;
	
	// Adjust the room to our game resolution
	camera_set_view_size(view_camera[0], Game.ResolutionWidth, Game.ResolutionHeight);
	surface_resize(application_surface,  Game.ResolutionWidth, Game.ResolutionHeight);
}