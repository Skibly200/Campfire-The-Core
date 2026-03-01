if cutscene_timer>0
{
	cutscene_timer--
	sprite_index=spi_roar
}
if cutscene_timer<=0 && !dead
{
	show_debug_message(jump_timer)
	if jump_timer>0
	{
		jump_timer--
		sprite_index=spi_idle
	}
	else if jump_timer == -1
	{
		jump_timer=60	
		y=448
		xsp=0
		ysp=0
	}
	else if jump_timer<-1
	{
		jump_timer++
		sprite_index=spi_jump
		if shoot
		{
			sprite_index=spi_attack
		}
		ysp+=(6*(2/(5/3)))/60
		if abs(ysp)<0.1 && shoot
		{
			shoot=false
			for (var i = 0; i < 8; i += 1)
			{
				webdir=i*45
				instance_create_layer(x,y,"Instances",obj_web)
			}
		}
	}
	else if jump_timer==0{
		jump_pos=obj_plyr1.x
		jump_timer=-101
		jump_dist=jump_pos-x
		if irandom_range(0,1)
		{
			xsp=jump_dist/100
		}
		else{
			xsp=jump_dist/200
			shoot=true
		}
		ysp=-6
	}
	if(hurt>0){
		hurt--
		sprite_index=spi_hurt
	}
	if hp<=0
	{
		sprite_index=spi_dead
		dead=true
		audio_stop_sound(sizeful)
		audio_play_sound(yummy,10,false)
	}
	x+=xsp
	y+=ysp
}
if dead
{
	deadtime--
	y+=1.5
	if deadtime ==0
	{
		room_goto(victory)	
	}
}