
if (global.cutscene_active)
{
	hor_=0
	ver_=0
	return
}

#region Movement
var hor_ = keyboard_check(ord("D")) -  keyboard_check(ord("A"));
var ver_ = keyboard_check(ord("S")) -  keyboard_check(ord("W"));

if (menu_opened) // Prevents movement with menu opened
{
	hor_=0
	ver_=0
}

move_and_collide(hor_*move_speed,ver_*move_speed, [obj_obstacle, obj_cover]) 

if (keyboard_check_pressed(vk_shift))
{
	crouching = !crouching
	if (crouching)
	{ image_blend = c_grey 
	  sprite_index=spr_player_crouch 
	}
	else 
	{
	 image_blend = c_white 
	 sprite_index=spr_player_stand
	}	
}
#endregion

#region Shooting
if (keyboard_check_pressed(ord("P")) or mouse_check_button_pressed(mb_right) && not cocked)
{
	cocked = true
	effect_create_depth(depth, ef_spark, x,y-20,0.1,c_grey)
}	
if (keyboard_check_pressed(ord("O")) or mouse_check_button_pressed(mb_left) && cocked && not crouching)
{
	cocked = false
	shoot_bullet()
}
if (keyboard_check_pressed(ord("R")))
{
	reload()
}
#endregion

#region Menu
if (keyboard_check_pressed(ord("E")))
{
	menu_opened = !menu_opened
}

#endregion
#region Dialogue
if (keyboard_check_pressed(ord("I")))
{
	var talk_to = instance_place(x,y,obj_interactable)
	if (talk_to)
	{
		talk_to.begin_cutscene()
	}
}
#endregion

// SHAKE EFFECT
if (shake > 0) 
{
	shake = lerp(shake, 0, 0.1)
	
	hit_shake_x = random_range(-shake, shake)
	hit_shake_y = random_range(-shake, shake)
}
else
{
	hit_shake_x=0
	hit_shake_y=0
}

with(all)
{
	depth = -bbox_bottom;
}