attackStart = false;

//get inputs
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));
attackKey = mouse_check_button(mb_left);

// Define coordinate locations


//player movement 
#region
	//get the direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0,0,_horizKey,_vertKey);
	
	//get x and y speed
	// Also handles diagonal movement clamping
	var _spd = 0;	
	var _inputlevel = point_distance(0,0,_horizKey,_vertKey);
	_inputlevel = clamp(_inputlevel, 0 , 1 );
	_spd = moveSpd * _inputlevel;
	
	xspd = lengthdir_x( _spd, moveDir);
	yspd = lengthdir_y( _spd, moveDir);
	
	// wall collisions 
	if place_meeting(x+xspd,y,oWall) {
		xspd = 0;
	}
	if place_meeting(x,y+yspd,oWall) {
		yspd = 0;
	}
	//stationary during attack
	if cooldown > 0 {
		xspd /= 8;
		yspd /= 8;
	}
	//move the player
	x += xspd;
	y += yspd;
	
	x=clamp(x, sprite_width/2, room_width-sprite_width/2);
	y=clamp(y, sprite_height, room_height);
	
	//depth
	depth = 1-bbox_bottom;
	
#endregion

//sprite control
#region
	//player aiming
	centerY = y + centerYOffset;
	
	//aim
	aimDir = point_direction( x, centerY, mouse_x, mouse_y );
	
	//make sure player is facing direction
	face = round( (aimDir-45)/90 )
	if face >= 4 { face = 0; }
	
	//animate
	if xspd == 0 and yspd == 0 and cooldown <= 0 {
		currentSprite = sprite;
	} else if cooldown <= 0 {
		currentSprite = spriteWalk;
	}
	//attack animation
	if cooldown > 0 {
		cooldown -= 1;
	}
	
	//set the player sprite
	if cooldown <= 0 {
		attackFace = face;
		if attackKey {
			//attackFace = face;
			attackStart = true;
			currentSprite = spriteAttack;
			mask_index = sprite[3];
			sprite_index = currentSprite[attackFace];
			image_index = 0;
		
			// Cooldown prevents animations from occuring until value reaches 0
			cooldown = 24;
		} else {
			mask_index = sprite[3];
			sprite_index = currentSprite[face];
		}
	}
	
#endregion

if mouse_check_button_pressed(mb_right){ 
	spreadOn = !spreadOn;
}