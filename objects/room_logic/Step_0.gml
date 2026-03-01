if room == loading
{
	if audio_sound_is_playable(aberrant) && audio_sound_is_playable(aberration_die) && audio_sound_is_playable(calm) && audio_sound_is_playable(imminent_death) && audio_sound_is_playable(rain) && audio_sound_is_playable(sfx_gelatinous_death) && audio_sound_is_playable(sizeful) && audio_sound_is_playable(slash_sound) && audio_sound_is_playable(snd_lightning) && audio_sound_is_playable(you_died) && audio_sound_is_playable(spi_scream)
	{
		room=Room1
	}
}
if room==game_over
{
	if keyboard_check(vk_enter)
	{
		room_goto(Room1)	
	}
}
if room==Room1
{
	effect_create_above(ef_rain,x,y,1,c_red);
}
with(obj_slash)
{
	depth=-1
}
with(obj_aberration_stalker)
{
	depth=-1
}
if room==victory
{
	if keyboard_check(vk_enter)
	{
		room_goto(Room1)	
	}
}