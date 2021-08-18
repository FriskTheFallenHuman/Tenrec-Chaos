function DiscordProcess()
{
	// Exit if Rich Presence support is disabled
	if !Game.RichPresenceSupport
	{
		exit;
	}
	
	// Update Rich Presence
	if !PresenceReady and Game.DiscordEvent == "DiscordReady"
	{	
		np_clearpresence();
		np_setpresence_timestamps(Game.DiscordTime, 0, false);
		np_setpresence_more(MainImageDesc, SmallImageDesc, false);
		np_setpresence(StateString, DetailsString, MainImage, SmallImage);		
		
		PresenceReady = true;
	}
	
	// Call async event
	np_update();
}