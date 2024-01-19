if oPlayer.attackStart {
	image_alpha = 1;
	cooldown = 24;
	if oPlayer.face == 0 {
		sprite_index = sSlashAttackReversed;
		image_index = oPlayer.image_index;
		x = oPlayer.x + oPlayer.sprite_width/4;
		y = oPlayer.y + oPlayer.centerYOffset + oPlayer.sprite_height/8;
		image_angle = 90;
		//draw_sprite_ext( sSlashAttackReversed, image_index, x + sprite_width/4, y + centerYOffset + sprite_height/8, 1, 1, 90, c_white, 0.5  )
		hitCounted = true;
	} else if oPlayer.face == 1 {
		sprite_index = sSlashAttackReversed;
		image_index = oPlayer.image_index;
		x = oPlayer.x - oPlayer.sprite_width/4;
		y = oPlayer.y + oPlayer.centerYOffset;
		image_angle = 250;
		//draw_sprite_ext( sSlashAttackReversed, image_index, x - sprite_width/4, y + centerYOffset, 1, 1, 250, c_white, 0.5  )
	} else if oPlayer.face == 2 {
		sprite_index = sSlashAttack;
		image_index = oPlayer.image_index;
		x = oPlayer.x - oPlayer.sprite_width/4;
		y = oPlayer.y + oPlayer.centerYOffset + oPlayer.sprite_height/8;
		image_angle = 180;
		//draw_sprite_ext( sSlashAttack, image_index, x - sprite_width/4, y + centerYOffset + sprite_height/8, 1, 1, 180, c_white, 0.5  )
	
	} else {
		sprite_index = sSlashAttack;
		image_index = oPlayer.image_index;
		x = oPlayer.x + oPlayer.sprite_width/4;
		y = oPlayer.y + oPlayer.centerYOffset;
		image_angle = 0;
		//draw_sprite_ext( sSlashAttack, image_index, x + sprite_width/4, y + centerYOffset, 1, 1, 0, c_white, 0.5  )
	
	}
} 

/*
mask_index = sprite_index;
for (var i = 0; i < instance_number(oWall); ++i;) {
	//if place_meeting(x, y, instance_find(oWall,i)) and !hitCounted {
	if collision_ellipse(x-36, y-64, x+82, y+36, instance_find(oWall,i), false, true) and !hitCounted {
		mask_index = -1;
		show_debug_message("HIT")
		show_debug_message(instance_find(oWall,i));
		show_debug_message(debugCount);
		debugCount +=1 ;
	}
}*/

cooldown -= 1;
if cooldown <= 0 {
	image_alpha = 0;
	hitCounted = false;
}

