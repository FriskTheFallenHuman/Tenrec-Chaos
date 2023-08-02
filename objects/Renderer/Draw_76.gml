/// @description Init. Surfaces & Process Effects
// You can write your code in this editor
	
	#region Create Surfaces
	RendererCreateSurfaces();
	#endregion
	
	#region Process Distortion
	RendererProcessDistortion();
    #endregion
	
	// Call main shader
	shader_set(ShaderMain);