function StageObjectsProcess()
{
	if UpdateObjects
	{
		/* Set active object bounds, accurate to the originals (if Width is set to 320px obviously, else adjusted). 
		If you decide to change that, also update instance_activate_range() */
		var LeftBound   = (Camera.ViewX & -128) - 128;
		var RightBound  = (Camera.ViewX & -128) + global.Width + 320;

		with all 
		{	
			switch Obj_UnloadType
			{
				// Destroy object
				case FlagDelete:
				{
					if x < LeftBound or x > RightBound or y > Stage.BottomBoundary or y < Stage.TopBoundary
					{
						instance_destroy();
					}
				}
				break;

				// Deactivate object
				case FlagPause:
				{
					if x < LeftBound or x > RightBound
					{
						if Obj_UnloadData[0] < LeftBound or Obj_UnloadData[0] > RightBound
						{
							instance_deactivate_object(id);
						}
					}
				}
				break;
				
				// Reset object
				case FlagReset:
				{
					if x < LeftBound or x > RightBound
					{
						if Obj_UnloadData[0] < LeftBound or Obj_UnloadData[0] > RightBound
						{
							// Reset data
							x			 = Obj_UnloadData[0];
							y			 = Obj_UnloadData[1];
							image_xscale = Obj_UnloadData[2];
							image_yscale = Obj_UnloadData[3];
							image_index  = Obj_UnloadData[4];
							sprite_index = Obj_UnloadData[5];
							visible      = Obj_UnloadData[6];

							// Reset animation data
							Obj_AnimDuration = 0;
							Obj_AnimTimer    = 0;

							// Perform create event to re-initialise variables and then deactivate object
							event_perform(ev_create, 0);
							instance_deactivate_object(id);
						}
						else
						{
							// Make object "disappear" until its initial position goes off-screen
							x = -128;
							y = -128;
							
							// Call Create event in case object is using its own variables for positioning
							event_perform(ev_create, 0);
						}
					}
				}
				break;
			}
		}
	}

	// Load objects (objects that were deactivated on this frame won't be activated!)
	instance_activate_range(Camera.ViewX);
}