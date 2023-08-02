function string_draw(xpos, ypos,text)
{
	// Create
	t = method(self, useTranslation);

	// Draw
	draw_text(xpos, ypos, t(text));
}