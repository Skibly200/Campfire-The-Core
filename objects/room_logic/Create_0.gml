if room=loading{
	window_set_size(600,600)
}
if room==Room1
{
	audio_stop_sound(you_died)
	audio_stop_sound(calm)
	window_set_caption("DELVE")
	audio_play_sound(calm,10,true)
	audio_play_sound(rain,5,true)
	global.lightning=false
	global.fireball=false
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
if room==Room5
{
	window_set_caption("PUT YOUR SKILLS TO USE")
}
if room == Room6{
	window_set_caption("AICHMOPHOBIA") //AICHMOPHOBIA
}
if room == Room7{
	window_set_caption("DEFLECT")
}
if room == Room8
{
	window_set_caption("BURN UP")
	global.fireball=true
}
if room == Room9
{
	window_set_caption("SWARMED")
}
if room == Room10
{
	window_set_caption("IMMINENT")
	audio_stop_sound(aberrant)
	audio_play_sound(imminent_death,10,true)
}
if room == Boss
{
	window_set_caption("THE CORE")
	audio_stop_sound(aberrant)
	audio_stop_sound(imminent_death)
	audio_stop_sound(calm)
	audio_stop_sound(rain)
	audio_play_sound(sizeful,10,true)
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
if room == victory
{
	audio_stop_sound(yummy)
	audio_play_sound(calm,10,true)
	window_set_caption("CONGRATULATIONS, THAUMATURGE")
	if keyboard_check(vk_enter)
	{
		room_goto(Room1)
	}
}