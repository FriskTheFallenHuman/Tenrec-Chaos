function StagePlayerCheck()
{
	// Load back into the devmenu if no Player Object was found
	if !instance_exists(Player)
	{
		show_message("NO PLAYER OBJECT FOUND! \nPlease, add a player to the stage in order to play it");
		room_goto(Screen_DevMenu);
	}
}