// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AudioStartup()
{
	/* Value Table Reference
	------------------------
	[0] - Event
	[1] - Track ID - Not asset ID!
	[2] - Event Time
	[3] - Loop Data (Primary) / 2nd Channel (Secondary)
	[4] - 2nd Channel ID - Not asset ID!
	------------------------
	*/

	// Set channels data
	PrimaryTrack[0]   = EventIdle;
	PrimaryTrack[1]   = noone;
	PrimaryTrack[2]   = 0;
	PrimaryTrack[3]   = [];
	PrimaryTrack[4]   = noone;
	SecondaryTrack[0] = EventIdle;
	SecondaryTrack[1] = noone;
	SecondaryTrack[2] = 0;
	SecondaryTrack[3] = noone;

	// Create data structures
	TrackLoopData = ds_map_create();
	SubTrackData  = ds_map_create();
}