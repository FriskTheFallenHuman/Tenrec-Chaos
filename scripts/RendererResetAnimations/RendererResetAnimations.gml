function RendererResetAnimations()
{
	ds_map_destroy(AnimationTime);
	
	AnimationTime = -1;
}