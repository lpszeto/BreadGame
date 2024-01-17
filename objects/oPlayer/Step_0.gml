//get inputs
rightKey = keyboard_check(ord("D"));
leftKey = keyboard_check(ord("A"));
upKey = keyboard_check(ord("W"));
downKey = keyboard_check(ord("S"));

//player movement
	//get the direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0,0,_horizKey,_vertKey);
	
	//get x and y speed
	var _spd = 0;
	var _inputlevel = point_distance(0,0,_horizKey,_vertKey);
	_inputlevel = clamp(_inputlevel, 0 , 1 );
	_spd = moveSpd * _inputlevel;
	
	xspd = lengthdir_x( _spd, moveDir);
	yspd = lengthdir_y( _spd, moveDir);
	
	//collisions
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


//walking animations

if (keyboard_check(ord("W")) and (!keyboard_check(ord("S")))) {
	facingForward = false;
	movingV = true;
} else if (keyboard_check(ord("S")) and (!keyboard_check(ord("W")))) {
	facingForward = true;
	movingV = true;
} else if (keyboard_check(ord("W")) and (keyboard_check_pressed(ord("S")))) {
	facingForward = false;
	movingV = false;
} else if (keyboard_check(ord("S")) and (keyboard_check_pressed(ord("W")))) {
	facingForward = true;
	movingV = false;
}


if (keyboard_check(ord("D")) and (!keyboard_check(ord("A")))) {
	facingRight = true;
	movingH = true;
} else if (keyboard_check(ord("A")) and (!keyboard_check(ord("D")))) {
	facingRight = false;
	movingH = true;
} else if (keyboard_check(ord("D")) and (keyboard_check_pressed(ord("A")))) {
	facingRight = true;
	movingH = false;
} else if (keyboard_check(ord("A")) and (keyboard_check_pressed(ord("D")))) {
	facingRight = false;
	movingH = false;
}	


if (!keyboard_check(ord("A")) and !keyboard_check(ord("D")) and !keyboard_check(ord("S")) and !keyboard_check(ord("W"))) {
	movingH = false;
	movingV = false;
} else if (keyboard_check(ord("A")) and keyboard_check(ord("D")) and !keyboard_check(ord("S")) and !keyboard_check(ord("W"))) {
	movingH = false;
	movingV = false;
} else if (!keyboard_check(ord("A")) and !keyboard_check(ord("D")) and keyboard_check(ord("S")) and keyboard_check(ord("W"))) {
	movingH = false;
	movingV = false;
}


if facingForward  and cooldown <= 0 {
	if facingRight {
		mostRecentAttack = sPlayerAttackRight;
		if movingH or movingV {
			sprite_index = sPlayerWalkRight;
		} else {
			sprite_index = sPlayerRight;
		}
	} else {
		mostRecentAttack = sPlayerAttackLeft;
		if movingH or movingV {
			sprite_index = sPlayerWalkLeft;
		} else {
			sprite_index = sPlayerLeft;
		}
	}
} else if cooldown <= 0 {
	if facingRight {
		mostRecentAttack = sPlayerAttackBackRight;
		if movingH or movingV {
			sprite_index = sPlayerWalkRight;
		} else {
			sprite_index = sPlayerBackRight;
		}
	} else {
		mostRecentAttack = sPlayerAttackBackLeft;
		if movingH or movingV {
			sprite_index = sPlayerWalkLeft;
		} else {
			sprite_index = sPlayerBackLeft;
		}
	}
}


//attack
if cooldown > 0 {
	cooldown -= 1;
}
if mouse_check_button_pressed(mb_left) and cooldown <= 0 {
	sprite_index = mostRecentAttack;
	image_index = 0;
	cooldown = 24;
}