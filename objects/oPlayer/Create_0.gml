//variables for movement
moveDir = 0;
moveSpd = 2;
xspd = 0;
yspd = 0;
cooldown = 0;
spreadOn = false;
attackStart = false;

jar_break_bool = false;

//sprite control
#region
	centerYOffset = -sprite_height/2;
	centerY = y + centerYOffset;

	aimDir = 0;

	face = 3;

	sprite[0] = sPlayerBackRight;
	sprite[1] = sPlayerBackLeft;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerRight;


	spriteWalk[0] = sPlayerWalkBackRight;
	spriteWalk[1] = sPlayerWalkBackLeft;
	spriteWalk[2] = sPlayerWalkLeft;
	spriteWalk[3] = sPlayerWalkRight;


	spriteAttack[0] = sPlayerAttackBackRight;
	spriteAttack[1] = sPlayerAttackBackLeft;
	spriteAttack[2] = sPlayerAttackLeft;
	spriteAttack[3] = sPlayerAttackRight;

	spriteSpread[2] = sSpreadLeft;
	spriteSpread[3] = sSpreadRight;

	spriteSpreadWalk[2] = sSpreadWalkLeft;
	spriteSpreadWalk[3] = sSpreadWalkRight;

	spriteSpreadAttack[2] = sSpreadAttackLeft;
	spriteSpreadAttack[3] = sSpreadAttackRight;

	spriteToDraw = sSpreadRight;

	currentSprite = sprite;
	sprite_index = currentSprite[face];
#endregion


