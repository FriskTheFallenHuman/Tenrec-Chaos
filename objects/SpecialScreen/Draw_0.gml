/// @description Draw
// You can write your code in this editor
	
	if !global.SpecialState or State == 3
	{
		return;
	}
	
	// Set text properties
	draw_set_font(Font.FontCard);
	draw_set_halign(fa_center);
	
	var CentreX	= global.Width  / 2;
	var CentreY = global.Height / 2;
	var ShiftY  = floor(Offset[3]);
	
	// Display win messages
	if global.SpecialState == 1
	{
		// All emeralds
		if global.Emeralds == 7
		{		
			string_draw(CentreX + 12 + Offset[0], CentreY - 44 + ShiftY, State ? "special_stage_super_" + character_get_name(global.Character) : "special_stage_all_emeralds_" + character_get_name(global.Character)  );
			string_draw(CentreX + 12 + Offset[1], CentreY - 20 + ShiftY, State ? "special_stage_complete_all_emeralds_" + character_get_name(global.Character) : "special_stage_complete_got_them_all");
		}
		
		// Collecting emeralds...
		else
		{	
			string_draw(CentreX + 12 + Offset[0], CentreY - 44 + ShiftY, "special_emeral_get_" + character_get_name(global.Character));
			string_draw(CentreX + 12 + Offset[1], CentreY - 20 + ShiftY, "special_emeral_get_chaos_emerald");
		}
	}
	
	// Display lose messages
	else if global.SpecialState == 2
	{
		string_draw(CentreX + 12 + Offset[1], CentreY - 20 + ShiftY, "special_stage_title");
	}
	draw_sprite(gui_results_score,     0, CentreX - 80 + 22 + Offset[4], CentreY + 35);
	draw_sprite(gui_results_ringbonus, 0, CentreX - 80 + 42 + Offset[5], CentreY + 51);
	
	// Display counters
	draw_set_font(Font.FontDigits1);
	draw_set_halign(fa_right);

	draw_text(CentreX + 80 + Offset[4], CentreY + 33, global.Score);
	draw_text(CentreX + 80 + Offset[5], CentreY + 49, global.SpecialScore);
	
	// Display emeralds
	if RenderFlag
	{
		for (var i = 0; i < global.Emeralds; i++)
		{
			draw_sprite(tex_sstage_reward, i, CentreX - 58 + 20 * i, CentreY);
		}
	}