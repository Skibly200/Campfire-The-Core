if obj_plyr1.x < x && sword == 0
{
	image_xscale = 1
}
if obj_plyr1.x > x && sword == 0
{
	image_xscale = -1
}
if obj_plyr1.y > y && sword && blockLag<0
{
	windup = 30
	sword=0
}
if windup > 0
{
	sprite_index = gelatinous_windup
	windup--
}
if windup == 0
{
	windup = -15
	throwLag = 30
	instance_create_layer(x-30*image_xscale,y,"Instances",obj_gel_knife)
	timesThrown++
}
if throwLag > 0
{
	sprite_index = gelatinous_throw
	throwLag--
}
if throwLag == 0
{
	throwLag = -15
	throwLag2=30
	if timesThrown%2==0 && timesThrown!=0 
	{
		throwLag2=60
	}
}
if throwLag2>0
{
	sprite_index=gelatinous_idle1
	if timesThrown%2==0{
		sprite_index=gelatinous_tired;	
	}
	throwLag2--
}
if throwLag2==0
{
	sword=1
	throwLag2=-15
}

if hp <= 0
{
	audio_play_sound(sfx_gelatinous_death,15,false)
	effect_create_above(ef_firework,x,y,2,c_olive)
	instance_destroy()
}
if blockLag > 0
{
	blockLag--	
	sprite_index=gelatinous_block
}
if blockLag==0
{
	sword = 1
	blockLag=-15
}
//if sword == 0 && throwLag < 0 && windup < 0 && blockLag < 0
//{
//	xspd = 8
//}
x -= xspd*image_xscale