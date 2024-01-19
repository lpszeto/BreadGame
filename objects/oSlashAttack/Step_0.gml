if oPlayer.cooldown > 1 {
	image_alpha = 1;
	if oPlayer.face == 0 {
		sprite_index = sSlashAttackReversed;
		image_index = oPlayer.image_index;
		x = oPlayer.x + oPlayer.sprite_width/4;
		y = oPlayer.y + oPlayer.centerYOffset + oPlayer.sprite_height/8;
		image_angle = 90;
		//draw_sprite_ext( sSlashAttackReversed, image_index, x + sprite_width/4, y + centerYOffset + sprite_height/8, 1, 1, 90, c_white, 0.5  )
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
} else {image_alpha = 0;}