/// @function
function BackgroundSetup()
{
	// Render background behind everything
	depth = 9999;
	
	// Setup parallax
	switch room
	{
		// Setup example
		/* DummyValues[bg_sprite] = [PosX, PosY, ScrollX, ScrollY, OffsetX, OffsetY, RenderTop, RenderBottom, IncHeight, IncForce]; */
		
		case MQZ1:
		case MQZ2:
		{
			// Background sprites
			//BackgroundSprites = [tex_mqz_bg00, tex_mqz_bg00, tex_mqz_bg01, tex_mqz_bg02, tex_mqz_bg02, tex_mqz_bg02];
			BackgroundSprites = [noone];
			
			// tex_mqz_bg00
			BackgroundValues[0] = [0, 0, 0,    0,    0, 0, 0,   167, 0, 0];
			BackgroundValues[1] = [0, 0, 0.15, 0.01, 0, 0, 168, 301, 2, 0.3];
			BackgroundValues[2] = [0, 0, 0.1,  0.01, 0, 0, 0,   301, 0, 0];
			BackgroundValues[3] = [0, 0, 0.01, 0.01, 0, 0, 0,   71,	 0, 0];
			BackgroundValues[4] = [0, 0, 0.2,  0.01, 0, 0, 72,  175, 0, 0];
			BackgroundValues[5] = [0, 0, 0.5,  0.01, 0, 0, 176, 301, 0, 0];
		}
		break;
		default: 
		{
			// Background objects
			BackgroundSprites = [noone];
			
			// background_sprite_1
			BackgroundValues[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
		}
		break;
	}
}