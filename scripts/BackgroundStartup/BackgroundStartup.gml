function BackgroundStartup()
{
	BGSprites = [];
	BGValues  = [];
	BGColour  = c_gray;

	// Create a background layer
	var Layer = layer_create(9999, "Background");
	depth	  = layer_get_depth(Layer);
	layer	  = Layer;
}