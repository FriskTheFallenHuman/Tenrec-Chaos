function MenuOptionSelect()
{
	// Navigate between options
	if (Input.DownPress) MenuOption++;
	if (Input.UpPress)   MenuOption--;
		
	// Loop through options. This is important when you add new lines to the menus. (If there are 4 lines then value is 4, not 3)
	var LinesCount;
	switch MenuState
	{
		case Main:			   LinesCount = 4  break;
		case DataSelect:	   LinesCount = 7  break;
		case Options:		   LinesCount = 4  break;
		case FrameworkConfig:  LinesCount = 4  break;
		case AudioVideoConfig: LinesCount = 6  break;
		case InputConfig:	   LinesCount = 10 break;
		case StageSelect:	   LinesCount = 4  break;
		case CharacterSelect:  LinesCount = 4  break;
	}
	MenuOption = loop_value(MenuOption, 0, LinesCount);
		
	// React to key A and key start
	if Input.APress or Input.StartPress
	{
		switch MenuState
		{
			case Main:
			{
				switch MenuOption
				{	
					case 0: menu_goto(StageSelect, 0); break; // Go to stage select screen
					case 1: menu_goto(DataSelect, 0);  break; // Go to data select screen
					case 2: menu_goto(Options, 0);     break; // Go to options screen
					case 3: game_end();				   break; // Exit the game
				}
			}
			break;
			case DataSelect:
			{
				// Ignore all savefile manipulations and go straight to character select if
				// selected "no save" slot
				if MenuOption = 0
				{
					menu_goto(CharacterSelect, 0);
					SaveNewData = false;
				}
				else if MenuOption < 5
				{	
					// Define the saveslot we selected
					Game.ActiveSave = MenuOption - 1;
					
					// Check if we're not trying to delete a save
					if !DataDeleteMode
					{
						// Check if savefile exists
						if Saveslot[Game.ActiveSave] != 0
						{	
							// Load the data
							Game.GlobalCharacter = Saveslot[Game.ActiveSave][SavedChar];
							Game.GlobalScore	 = Saveslot[Game.ActiveSave][SavedScore];
							Game.GlobalLives	 = Saveslot[Game.ActiveSave][SavedLives];
							Game.GlobalEmeralds  = Saveslot[Game.ActiveSave][SavedEmeralds];
							Game.GlobalConts     = Saveslot[Game.ActiveSave][SavedConts];
						
							// Load the Zone using its ID
							switch Saveslot[Game.ActiveSave][SavedZone]
							{	
								case 0: room_goto(MBZ); break;
								case 1: room_goto(HHZ); break;
							}
							break;
						}
					
						// Else create new and go to character select
						else
						{
							menu_goto(CharacterSelect, 0);
							SaveNewData = true;
						}
					}
					
					// Else delete the savefile
					else
					{
						file_delete("saveslot" + string(Game.ActiveSave) + ".txt");
						Saveslot[Game.ActiveSave] = 0;
						DataDeleteMode = false;
					}
				}
				else
				{
					switch MenuOption
					{	
						// Enable save delete mode
						case 5: DataDeleteMode = true; break;
						case 6: 
						{
							// Go back to main menu
							DataDeleteMode = false; 
							menu_goto(Main, 0);
						}
						break;
					}
				}
			}
			break;
			case CharacterSelect:
			{
				if MenuOption < 3
				{
					// Get our character
					Game.GlobalCharacter = MenuOption;
								
					// Save the new game if we did not select "no save" slot
					if SaveNewData
					{
						gamedata_save(Game.ActiveSave, Game.GlobalCharacter, 0, 0, 0, 3, 0);
					}
					
					// Load MBZ
					room_goto(MBZ);
				}
				else
				{	
					// Return to data select
					menu_goto(DataSelect, Game.ActiveSave + 1); 
					SaveNewData = false; 
				}
			}
			break;
			case Options:
			{
				switch MenuOption
				{	
					case 0: menu_goto(FrameworkConfig, 0);			 break; // Go to framework options
					case 1: menu_goto(AudioVideoConfig, 0);			 break; // Go to video and audio options
					case 2: menu_goto(InputConfig, 0);				 break; // Go to input options
					case 3: menu_goto(Main, 1); gamesettings_save(); break; // Return to main menu
				}
			}
			break;
			case FrameworkConfig: 
			{	
				// Go back
				if MenuOption = 3
				{
					menu_goto(Options, 0)
				}
			}
			break;
			case AudioVideoConfig:
			{
				// Go back
				if MenuOption = 5
				{
					menu_goto(Options, 1);
				}
			}
			break;
			case InputConfig: 
			{
				// Go back
				if MenuOption = 9 
				{
					menu_goto(Options, 2);
				}
			}
			break;
			case StageSelect:
			{
				switch MenuOption
				{
					case 0:	room_goto(MBZ);     break; // Load MBZ1
					case 1:	room_goto(MBZ2);    break; // Load MBZ2
					case 2:	room_goto(HHZ);     break; // Load HHZ
					case 3: menu_goto(Main, 0); break; // Return to main menu
				}
			}
			break;
		}
	}
}