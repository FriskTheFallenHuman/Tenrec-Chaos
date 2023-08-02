function ScreenSegaDraw()
{
	// Get screen centre
	var X = global.Width  / 2;
	var Y = global.Height / 2;
	
	// Draw palette-animated SEGA logo
	switch State
	{
		case 0:
			draw_anisprite(spr_surge_actclear, 12, 1, X, Y);
		break;
		case 1:
			draw_sprite(tex_sega_logo_showup, 0, X, Y);
		break;
		case 2:
			draw_sprite(tex_sega_logo_showup, 4, X, Y);
		break;
		case 3:
			draw_sprite(tex_sega_sonicteam, 0, X, Y);
		break;
	}

	// DEBUG: States
	draw_set_font(Font.FontDefault);
	draw_set_halign(fa_left);

	draw_text(125, 5, StateTimer);
	draw_text(12, 5, "STATETIMER: ");

	// Set font
	draw_set_font(Font.FontDefault);
	draw_set_halign(fa_center);
	draw_set_color(#74c5c1);

	// Draw text
	string_draw(X, Y + 50, "disclaimer_line_1");
	string_draw(X, Y + 65, "disclaimer_line_2");
	
	draw_set_color(c_white);
}