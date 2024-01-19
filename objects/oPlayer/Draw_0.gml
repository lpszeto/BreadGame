
if cooldown > 0 {
	draw_sprite_ext( sSlashAttack, image_index, x + sprite_width/4, y + centerYOffset - sprite_height/4, 1, 1, (face+1)*90, c_white, 0.5  )
}

draw_self();

spriteSpread[2] = sSpreadLeft;
spriteSpread[3] = sSpreadRight;

spriteSpreadWalk[2] = sSpreadWalkLeft;
spriteSpreadWalk[3] = sSpreadWalkRight;

spriteSpreadAttack[2] = sSpreadAttackLeft;
spriteSpreadAttack[3] = sSpreadAttackRight;

spriteToDraw = sSpreadRight;

if face > 1 and spreadOn {
	if currentSprite == sprite {
		spriteToDraw = spriteSpread[face]
	} else if currentSprite == spriteWalk {
		spriteToDraw = spriteSpreadWalk[face]
	} else if currentSprite == spriteAttack {
		spriteToDraw = spriteSpreadAttack[face]
	}
	draw_sprite_ext( spriteToDraw, image_index, x, y, 1, 1, 0, c_white, 0.5  )
} 
	






