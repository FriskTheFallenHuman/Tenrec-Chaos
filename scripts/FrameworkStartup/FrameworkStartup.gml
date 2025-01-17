function FrameworkStartup()
{
	// Load the localization controller
	instance_create(x,y, Localization);

	// Load Discord contoller
	instance_create(x, y, Discord);
	
	// If not in initialisation room, load other controllers
	if room != Screen_Startup
	{
		instance_create(x, y, Background);
		instance_create(x, y, Palette);		
		instance_create(x, y, Renderer);
		instance_create(x, y, Camera);
		instance_create(x, y, Audio);
		instance_create(x, y, Input);
	}
}