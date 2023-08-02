function PaletteProcessFade()
{
	// Update flag
	if FadeValue == 0
	{
		FadeFlag = StateMax;
	}
	else if FadeValue < 756
	{
		FadeFlag = StateActive;
	}
	else
	{
		FadeFlag = false;
	}
	
	// Update value
	if FadeMode and FadeValue < 756
	{
		FadeValue = min(FadeValue + FadeSpeed, 756);
	}
	else if !FadeMode and FadeValue > 0
	{
		FadeValue = max(FadeValue - FadeSpeed, 0);
	}
}