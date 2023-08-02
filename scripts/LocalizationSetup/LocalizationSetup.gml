function LocalizationSetup()
{
	locales = [
		{ code: "en-US", file: "en-US.json", lang: "English" }
	];

	defaultLocale = "en-US";
	fallBackLocale = "en-US";

	gmi18nSetup(locales, defaultLocale, fallBackLocale);
}