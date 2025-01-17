function FrameworkShadersStartup()
{
	// Setup fade module
	Shader.PalFadeValue  = shader_get_uniform(ShaderFade, "u_step");
	Shader.PalFadeMode   = shader_get_uniform(ShaderFade, "u_mode");
	Shader.PalFadeColour = shader_get_uniform(ShaderFade, "u_colour");

	// Setup palette module
	Shader.PalBoundary   = shader_get_uniform(ShaderMain,	    "u_bound");
	Shader.PalTexelSize1 = shader_get_uniform(ShaderMain,	    "u_texSizeFst");
	Shader.PalUVs1	     = shader_get_uniform(ShaderMain,	    "u_UVsFst");
	Shader.PalIndex1	 = shader_get_uniform(ShaderMain,	    "u_indFst");
	Shader.PalTex1		 = shader_get_sampler_index(ShaderMain, "u_texFst");
	Shader.PalTexelSize2 = shader_get_uniform(ShaderMain,	    "u_texSizeSnd");
	Shader.PalUVs2       = shader_get_uniform(ShaderMain,	    "u_UVsSnd");
	Shader.PalIndex2	 = shader_get_uniform(ShaderMain,	    "u_indSnd");
	Shader.PalTex2       = shader_get_sampler_index(ShaderMain, "u_texSnd");

	// Setup parallax module
	Shader.PrlActive    = shader_get_uniform(ShaderMain, "u_parallaxActive");
	Shader.PrlPos       = shader_get_uniform(ShaderMain, "u_pos");
	Shader.PrlWidth     = shader_get_uniform(ShaderMain, "u_width");
	Shader.PrlHeight    = shader_get_uniform(ShaderMain, "u_height");
	Shader.PrlScaleY    = shader_get_uniform(ShaderMain, "u_scaleY");
	Shader.PrlOffset	= shader_get_uniform(ShaderMain, "u_offset");
	Shader.PrlIncHeight = shader_get_uniform(ShaderMain, "u_ilHeight");
	Shader.PrlIncStep   = shader_get_uniform(ShaderMain, "u_ilStep");
	Shader.PrlMapSize   = shader_get_uniform(ShaderMain, "u_mapSize");
}