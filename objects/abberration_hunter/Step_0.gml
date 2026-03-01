sprite_index=hunter_walk
if place_meeting(x-1,y,turn) || place_meeting(x+1,y,turn)
{
	xsp*=-1
}
if xsp>0 {
	image_xscale=-1;
}
else{
	image_xscale=1;
}
ysp+=0.1
if place_meeting(x,y+1,obj_wall)
{
	ysp=0
}
if hurt>0
{
	bite=-1
	hurt--
	sprite_index=hunter_hurt
}
else if abs(obj_plyr1.x-x)<100 && abs(obj_plyr1.y-y)<50 && lag<1 && !bite>0{
	if(obj_plyr1.x<x)
	{
		image_xscale=1
		xsp=-abs(xsp)
	}
	else{
		image_xscale=-1	
		xsp=abs(xsp)
	}
	bite=30
}
if bite>0
{
	sprite_index=hunter_windup
	bite--
}
if bite==0
{
	bite--
	xsp=5*(-image_xscale)
	sprite_index=hunter_bite
	lag=25
}
if(lag>0)
{
	lag--
	sprite_index=hunter_bite
}

move_and_collide(xsp,ysp,obj_wall)
check++
if(xsp>0.5){
	xsp-=0.1
}
if(xsp<-0.5)
{
	xsp+=0.1
}
if hp<=0
{
	effect_create_above(ef_explosion,x,y,0.5,c_red)
	audio_play_sound(aberration_die,10,false)
	instance_destroy()
}