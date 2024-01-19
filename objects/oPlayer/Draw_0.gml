/// @description Insert description here
// You can write your code in this editor
draw_self();

if face > 1 and spreadOn {
	if currentSprite == sprite {
		spriteToDraw = spriteSpread[face]
	} else if currentSprite == spriteWalk {
		spriteToDraw = spriteSpreadWalk[face]
	} else if currentSprite == spriteAttack {
		spriteToDraw = spriteSpreadAttack[face]
	}
	draw_sprite_ext( spriteToDraw, image_index, x, y, image_xscale, image_yscale, 0, c_white, 0.5  )
} 
	






