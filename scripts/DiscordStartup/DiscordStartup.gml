function DiscordStartup()
{  
	// Initialise Rich Presence
	if np_initdiscord(global.RichPresenceID, true, "0")
	{
		return;
	}
	if os_type == os_windows or os_type == os_linux or os_type == os_macosx
	{
		return;
	}
	global.RichPresenceSupport = false;
}