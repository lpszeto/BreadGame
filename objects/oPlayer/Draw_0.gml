draw_self();

spriteSpread[2] = sSpreadLeft;
spriteSpread[3] = sSpreadRight;

spriteSpreadWalk[2] = sSpreadWalkLeft;
spriteSpreadWalk[3] = sSpreadWalkRight;

spriteSpreadAttack[2] = sSpreadAttackLeft;
spriteSpreadAttack[3] = sSpreadAttackRight;

if spreadOn {
	if face > 1 {
		if currentSprite == sprite {
			spriteToDraw = spriteSpread[face]
			draw_sprite_ext( spriteToDraw, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5  );
		} else if currentSprite == spriteWalk {
			spriteToDraw = spriteSpreadWalk[face]
			draw_sprite_ext( spriteToDraw, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5  );
		} 
	} if attackFace > 1 {
		if currentSprite == spriteAttack and cooldown > 0 {
			spriteToDraw = spriteSpreadAttack[attackFace];
			draw_sprite_ext( spriteToDraw, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5  );
		}
	}
} 







