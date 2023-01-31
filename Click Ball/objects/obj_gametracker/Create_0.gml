/// @description Keeping score
global.HighScore = 0;
global.Counter = 0;

ini_open("scores.ini");
global.HighScore = ini_read_real("player", "HighScore", 0);
ini_close();

//show_debug_overlay(true);
