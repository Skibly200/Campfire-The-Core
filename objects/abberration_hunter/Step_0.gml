sprite_index=hunter_walk
if !place_meeting(x+100,y+1,obj_wall) && xsp>0
{
	xsp*=-1
}
else if !place_meeting(x-100,y+1,obj_wall) && xsp<0
{
	xsp*=-1
}
if xsp>0 {
	image_xscale=-1;
}
else{
	image_xscale=1;
}
ysp-=0.1
if place_meeting(x,y,obj_wall)
{
	ysp=0
}
if hurt>0
{
	bite=-1
	hurt--
	sprite_index=hunter_hurt
}
else if abs(obj_plyr1.x-x)<150 && abs(obj_plyr1.y-y)<50 && lag<1{
	if(obj_plyr1.x<x)
	{
		image_xscale=1
	}
	else{
		image_xscale=-1	
	}
	bite=15
}
if bite>0
{
	sprite_index=hunter_windup
	bite--
}
if bite==0
{
	bite--
	xsp=5*image_xscale
	sprite_index=hunter_bite
	lag=15
}
if(lag>0)
{
	lag--
	sprite_index=hunter_bite
}
move_and_collide(xsp,ysp,obj_wall)
if(xsp>1){
	xsp-=0.2
}
if(xsp<-1)
{
	xsp+=0.2
}