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


if (keyboard_check(ord("D")) and (!keyboard_check(ord("A")))) and cooldown <= 0 {
	mostRecentWalk = sPlayerWalkRight;
	mostRecent = sPlayerRight;
	mostRecentAttack = sPlayerAttackRight;
	sprite_index = mostRecentWalk;	
} else if (keyboard_check(ord("A")) and (!keyboard_check(ord("D")))) and cooldown <= 0 {
	mostRecentWalk = sPlayerWalkLeft;
	mostRecent = sPlayerLeft;
	mostRecentAttack = sPlayerAttackLeft;
	sprite_index = mostRecentWalk;	
} else if (keyboard_check(ord("D")) and (keyboard_check_pressed(ord("A")))) and cooldown <= 0 {
	sprite_index = sPlayerRight;	
} else if (keyboard_check(ord("A")) and (keyboard_check_pressed(ord("D")))) and cooldown <= 0 {
	sprite_index = sPlayerLeft;	
}

if (keyboard_check(ord("W")) == (!keyboard_check(ord("S")))) and cooldown <= 0 {
	sprite_index = mostRecentWalk;	
}

if (!keyboard_check(ord("A")) and !keyboard_check(ord("D")) and !keyboard_check(ord("S")) and !keyboard_check(ord("W")) and cooldown <= 0) {
	sprite_index = mostRecent;
} else if (keyboard_check(ord("A")) and keyboard_check(ord("D")) and !keyboard_check(ord("S")) and !keyboard_check(ord("W")) and cooldown <= 0) {
	sprite_index = mostRecent;
} else if (!keyboard_check(ord("A")) and !keyboard_check(ord("D")) and keyboard_check(ord("S")) and keyboard_check(ord("W")) and cooldown <= 0) {
	sprite_index = mostRecent;
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