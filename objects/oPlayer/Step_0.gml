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
	
	//move the player
	x += xspd;
	y += yspd;


//walking animations
var _mostRecentWalk = sPlayerWalkLeft;
var _mostRecent = sPlayerLeft;
if (keyboard_check(ord("D")) and (!keyboard_check(ord("A")))) {
	_mostRecentWalk = sPlayerWalkRight;
	_mostRecent = sPlayerRight;
	sprite_index = _mostRecentWalk;	
} else if (keyboard_check(ord("A")) and (!keyboard_check(ord("D")))) {
	_mostRecentWalk = sPlayerWalkLeft;
	_mostRecent = sPlayerLeft;
	sprite_index = _mostRecentWalk;	
} else if (keyboard_check(ord("D")) and (keyboard_check_pressed(ord("A")))) {
	sprite_index = sPlayerRight;	
} else if (keyboard_check(ord("A")) and (keyboard_check_pressed(ord("D")))) {
	sprite_index = sPlayerLeft;	
}

if (keyboard_check(ord("W")) == (!keyboard_check(ord("S")))) {
	sprite_index = _mostRecentWalk;	
}

if (!keyboard_check(ord("A")) and !keyboard_check(ord("D")) and !keyboard_check(ord("S")) and !keyboard_check(ord("W")) ) {
	sprite_index = _mostRecent;
} else if (keyboard_check(ord("A")) and keyboard_check(ord("D")) and !keyboard_check(ord("S")) and !keyboard_check(ord("W")) ) {
	sprite_index = _mostRecent;
} else if (!keyboard_check(ord("A")) and !keyboard_check(ord("D")) and keyboard_check(ord("S")) and keyboard_check(ord("W")) ) {
	sprite_index = _mostRecent;
}
/**
if (keyboard_check_released(ord("D"))) {
	sprite_index = sPlayerRight;	
} if (keyboard_check_released(ord("A"))) {
	sprite_index = sPlayerLeft;	
}
**/