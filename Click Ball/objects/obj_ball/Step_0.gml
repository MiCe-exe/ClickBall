/// @descr Controls

// Get player input
//key_left = keyboard_check(vk_left);
//key_right = keyboard_check(vk_right);
//key_jump = keyboard_check_pressed(vk_space);
key_jump = mouse_check_button_pressed(mb_left);

// Calculate movement
hsp = _move * walksp;

vsp = vsp + grv;

//if (place_meeting(x, y + 1, obj_wall) && (key_jump))

// Player movement
if (position_meeting(mouse_x, mouse_y, id) && (key_jump))
{
	global.Counter++;
	
	vsp = -jumpsp;
	
	if ((mouse_x - obj_ball.x) > 15)
	{
		_move = 10;
	}
	else
	{
		_move = -150;
	}
	
	if ((mouse_x - obj_ball.x) <= 15)
	{
		_move = 1;
	}
	else
	{
		_move = -1;
	}
	
}


// Horizontal collision
if ( place_meeting(x + hsp, y, obj_LeftWall))
{
	_move *= -1;
}

if (place_meeting(x + hsp, y, Obj_RightWall))
{
	_move *= -1;
}

//if (place_meeting(x + hsp, y, obj_wall))
//{
//	while(!place_meeting(x + sign(hsp), y, obj_wall))
//	{
//		x = -(x + sign(hsp));
//	}
//	
//	hsp = -(hsp);
//}

x = x + hsp;

// Vertical collision hitting the floor
//if (place_meeting(x, y + vsp, obj_wall))
//{
//	while(!place_meeting(x, y + sign(vsp), obj_wall))
//	{
//		y = y + sign(vsp);
//	}
//	
//	global.Counter = 0;
//	vsp = 0;
//}

//hitting the ceiling
if (place_meeting(x, y + vsp, obj_Ceiling))
{
	vsp = -vsp;
}

if (place_meeting(x, y + vsp, obj_Floor))
{
	while (!place_meeting(x, y + sign(vsp), obj_Floor))
	{
		y = y + sign(vsp);
		
	}
	
	scr_Score(global.Counter);
	global.Counter = 0;	//also call save score
	vsp = 0;
	
	_move = 0;
}

y = y + vsp;

