/// @function data_read(name)
function data_read(name) 
{
	var File = file_text_open_read(name);				
	if  File 
	{														
		for (var i = 0; i < 248; i++) 
		{
			switch name 
			{
				case "data_angval.txt": 
					Game.AngleValueOf[i] = (256 - file_text_read_real(File)) * 360 / 256;
					file_text_readln(File);
				break;
				case "data_height.txt":
					for (var j = 0; j < 16; j++) 
					{
						Game.HeightValueOf[i][j] = file_text_read_real(File);
						file_text_readln(File);
					}
				break;
				case "data_width.txt":  
					for (var j = 0; j < 16; j++) 
					{
						Game.WidthValueOf[i][j] = file_text_read_real(File);	 
						file_text_readln(File);
					}
				break;
			}
		}
		file_text_close(File);									 
	}
}