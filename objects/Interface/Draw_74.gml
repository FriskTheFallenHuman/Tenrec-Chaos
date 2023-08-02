/// @description Draw Overlay
// You can write your code in this editor

	#region Pause Process
	InterfacePauseProcess();
	#endregion

	/* Low plane is rendered below the fade. Please note that you have
	to add global.ScreenBuffer to your X positions here */
	
	#region Low Plane Process
	InterfaceLowPlaneProcess();
	#endregion
	
	#region Draw HUD
	InterfaceDrawHUD();
	#endregion
	
	#region Draw Results
	InterfaceDrawResults();
	#endregion
	
	#region Draw GameOver
	InterfaceDrawGameOver();
	#endregion
	
	#region Draw Pause
	InterfaceDrawPause();
	#endregion
	
	#region Update Plane
	InterfaceUpdatePlane(false);
	#endregion

	/* High plane is rendered above the fade. No need to
	add global.ScreenBuffer here! */
	
	#region High Plane Process
	InterfaceHighPlaneProcess();
	#endregion
	
	#region Draw Card
	InterfaceDrawCard();
	#endregion
	
	#region Update Plane
	InterfaceUpdatePlane(true);
	#endregion