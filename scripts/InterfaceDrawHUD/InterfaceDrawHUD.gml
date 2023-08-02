function InterfaceDrawHUD()
{
	if Enabled
	{
		var X = OffsetX + global.ScreenBuffer;
		var Y = OffsetY;

		draw_set_font(Font.FontDigits1);

		// Handle stage timer
		if Stage.Time < 35999
		{
			var Min	= Stage.Time div 3600;
			var Sec	= (Stage.Time - Min * 3600) div 60;
			var Msc = floor(Stage.Time mod 60 / 3 * 5);
		} 
		else
		{
			var Min	= 9;
			var Sec = 59;
			var Msc = 99;
		}
	
		// Draw SCORE
		draw_sprite(gui_hud_score, 0, X + 66, Y + 14);

		draw_set_halign(fa_right);	
		draw_text(X + 113, Y + 9, Player.Score);

		// Draw TIME
		if Stage.Time > 32400
		{
			draw_anisprite(gui_hud_time, 8, true, X + 64, Y + 30);
		}
		else
		{
			draw_sprite(gui_hud_time, 0, X + 64, Y + 30);
		}
		if !global.CDStageTimer
		{
			var TimeString = string(Min) + ":" + (Sec > 9 ? "" : "0") + string(Sec);
		}
		else
		{
			var TimeString = string(Min) + "'" + (Sec > 9 ? "" : "0") + string(Sec) + ";" + (Msc > 9 ? "" : "0") + string(Msc);
		}
		draw_set_halign(fa_left);

		draw_text(X + 57, Y + 25, TimeString);

		// Draw RINGS
		if !Player.Rings
		{
			draw_anisprite(gui_hud_rings, 8, true, X + 56, Y + 46);
		}
		else
		{
			draw_sprite(gui_hud_rings, 0, X + 56, Y + 46);
		}	
		draw_set_halign(fa_right);

		// Draw Combine Ring Indicator
		if !Player.IsCombiRingsEnable
		{
			draw_text(X + 89, Y + 41, Player.Rings);
		}
		else
		{
			draw_set_color(#30a0f0);
			draw_text(X + 89, Y + 41, Player.Rings);
			draw_sprite(gui_hud_combine_ring, 0, X + 97, Y + 46);
			draw_set_color(c_white);
		}

		// Draw LIVES
		draw_set_font(Font.FontDigits2);
		draw_text(X + 65, Y + global.Height - 24, Player.Lives);
		
		draw_sprite(character_get_asset_name("gui_hud_lives_"), 0, X + 40, Y + global.Height - 26);
	}
}