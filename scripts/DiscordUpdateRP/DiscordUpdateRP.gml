function DiscordUpdateRP()
{
	// Send information to Discord
	np_setpresence(BottomString, TopString, MainImage, SmallImage);
	np_setpresence_more(SmallImageDesc, MainImageDesc, false);
	np_setpresence_timestamps(global.GameStartTime, 0, false); // <- comment this if you don't want to display the playtime
	np_update();
}