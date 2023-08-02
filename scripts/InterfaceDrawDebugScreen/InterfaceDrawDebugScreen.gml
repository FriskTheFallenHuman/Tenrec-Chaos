function InterfaceDrawDebugScreen()
{
	if DebugFPS
	{
		draw_set_halign(fa_left);
		draw_set_font(Font.FontDefault);
		
		draw_text_transformed(8, global.Height - 4, "FPS: " + string(floor(fps_real)), 0.5, 0.5, 0);
	}
}