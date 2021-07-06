function MenuFunctions()
{
	/// @function menu_add_option(listid,optionid, optionname,loadlist)
	function menu_add_option(listid, optionid, optionname, loadlist)
	{
		// Define menu size
		MenuSize[listid]  += 1;
		
		// Set option name and target menu
		MenuOption[listid][optionid] = optionname;
		MenuAction[listid][optionid] = loadlist;	
	}
	
	/// @function menu_update_option(listid,optionid,newname)
	function menu_update_option(listid, optionid, newname)
	{
		// Update option name
		MenuOption[listid][optionid] = newname;
	}
	
	/// @function menu_add_header(listid,header)
	function menu_add_header(listid,header)
	{
		// Set header
		MenuHeader[listid] = header;	
	}
}