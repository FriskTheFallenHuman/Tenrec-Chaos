function StageWaterSurfaceDraw()
{
	if WaterEnabled
	{
		if UpdateObjects
		{
			WaterOffset	= dcos((Renderer.AnimationTime[? GlobalTime] + 90) / 2 mod 360) * 32;
			WaterLevel -= dsin( Renderer.AnimationTime[? GlobalTime]		   mod 360) / 6.75;
		}
		var Width = sprite_get_width(tex_water_surface);

		// Render water surface
		if (WaterLevel - Camera.ViewY) > -16 and( WaterLevel - Camera.ViewY) < global.Height + 16
		{
			var Length = ceil(global.Width / Width) + 2;
			for (var i = -1; i < Length; i++)
			{
				draw_anisprite(tex_water_surface, 8, true, (floor(Camera.ViewX / Width) + i) * Width + WaterOffset, WaterLevel);
			}
		}
	}
}