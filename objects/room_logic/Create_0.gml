if room==Room1
{
	window_set_caption("DELVE")
	audio_play_sound(calm,10,true)
}
if room == Room2
{
	audio_stop_sound(calm)
	window_set_caption("FIGHT")
	audio_play_sound(aberrant, 10, true);
}
if room==Room3
{
	window_set_caption("KEEP GOING")
}
if room == game_over
{
	audio_stop_sound(aberrant)
	audio_play_sound(death,10,true)
	window_set_caption("DEAD")
}