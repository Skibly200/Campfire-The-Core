if room==Room1
{
	audio_stop_sound(you_died)
	window_set_caption("DELVE")
	audio_play_sound(calm,10,true)
	audio_play_sound(rain,5,true)
}
if room == Room2
{
	audio_stop_sound(calm)
	audio_stop_sound(rain)	
	window_set_caption("FIGHT")
	audio_play_sound(aberrant, 10, true);
}
if room==Room3
{
	window_set_caption("KEEP GOING")
}
if room==Room4
{
	window_set_caption("REMEMBER YOUR TRAINING")
	global.lightning=true
}
if room == game_over
{
	audio_stop_sound(aberrant)
	audio_play_sound(you_died,10,true)
	window_set_caption("DEAD")
	if keyboard_check(vk_enter)
	{
		room_goto(Room1)
	}
}