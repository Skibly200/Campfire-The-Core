ysp+=0.15
if x<0
{
	x=0
}
if x>600
{
	x=600	
}
if xsp>0
{
	xsp-=0.15;	
}
else if xsp<0
{
	xsp+=0.15	
}
if(xsp<=0.15 && xsp>=-0.15)
{
	xsp=0;
}
if keyboard_check(ord("D")){
	direction=0
	image_xscale=1
	if xsp<3
	{
	xsp+=0.5
	}
	sprite_index=plyr_run
}
else if keyboard_check(ord("A")){
	direction=180
	image_xscale=-1
	if xsp>-3
	{
	xsp-=0.5
	}
	sprite_index=plyr_run
}
else
{
	sprite_index=plyr_idle	
}
if place_meeting(x,y,obj_wall)
{
	yspd=-1	
}

if place_meeting(x+1,y,obj_wall)
{
	x-=1	
}
if place_meeting(x-1,y,obj_wall)
{
	x+=1	
}
if place_meeting(x,y+max(0,ysp),obj_wall)
{
	ysp=0
	if keyboard_check(ord("W"))
	{
		ysp=-4.5
	}
}

if ysp>1
{
	sprite_index=plyr_fall
}
else if ysp<-1
{
	sprite_index=plyr_rise	
}
else if !place_meeting(x,y+1,obj_wall)
{
	sprite_index=plyr_peak
}


slash-=1

if slash<1 && keyboard_check(vk_space) && !hurt>0
{
	instance_create_layer(x,y,"Instances",obj_slash);
	slash=45
}
if slash>30
{
	sprite_index=plyr_slash
}

if global.lightning && global.mana>=1 && cast<1 && keyboard_check(vk_right)
{
	cast=30
	cast_sprite=plyr_cast
	global.mana-=1
	instance_create_layer(x,y,"Instances",obj_lightning);
}
if global.fireball && global.mana>=2 && cast<1 && keyboard_check(vk_down)
{
	ysp=-4
	cast=30
	global.mana-=2
	cast_sprite=plyr_castdown
	audio_play_sound(snd_fireball,10,false)
	instance_create_layer(x,y,"Instances",obj_fireball);
	firedir=270
	instance_create_layer(x,y,"Instances",obj_fireball);
	firedir=285
	instance_create_layer(x,y,"Instances",obj_fireball);
	firedir=255
}
if cast>0
{
	cast--
	sprite_index=cast_sprite
}
if hurt>0
{
	hurt--
	sprite_index=plyr_hurt
}

if(webtime>0){
	xsp*=0.65
	webtime--
	sprite_index=plyr_web
}

move_and_collide(xsp,ysp,obj_wall);

if y>room_height
{
	room_goto_next()	
}


if global.hp<=0
{
	window_set_caption("DEAD")
	room_goto(game_over)
}