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