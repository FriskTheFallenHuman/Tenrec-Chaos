function DiscordCheck()
{
	if !global.RichPresenceSupport
	{
		// Remove controller if Rich Presence is disabled
		instance_destroy(); return;
	}
	
	np_clearpresence();
}