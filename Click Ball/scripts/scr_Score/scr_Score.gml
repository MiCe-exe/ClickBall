///scr_Score(argument0)
function scr_Score(argument0) {

	if (argument0 > global.HighScore)
	{
		ini_open("scores.ini")
		ini_write_real("player", "HighScore", argument0);
		ini_close();
	
		global.HighScore = argument0;
	}


}
