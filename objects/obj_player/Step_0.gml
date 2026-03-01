
#region Movement
var hor_ = keyboard_check(ord("D")) -  keyboard_check(ord("A"));
var ver_ = keyboard_check(ord("S")) -  keyboard_check(ord("W"));

if (currently_talking or menu_opened) 
{
	hor_=0
	ver_=0
}
move_and_collide(hor_*move_speed,ver_*move_speed, [obj_obstacle, obj_cover]) 

if (keyboard_check_pressed(vk_shift))
{
	crouching = !crouching
	show_debug_message(crouching)
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
if (keyboard_check_pressed(ord("P")) && not cocked)
{
	cocked = true
	effect_create_depth(depth, ef_spark, x,y-20,0.1,c_grey)
}	
if (keyboard_check_pressed(ord("O")) && cocked && not crouching)
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
if (keyboard_check_pressed(ord("E")) and not currently_talking)
{
	menu_opened = !menu_opened
}

#endregion
#region Dialogue
if (keyboard_check_pressed(vk_enter))
{
	var who_is_here = instance_place(x,y, obj_interactable)
	if (who_is_here ) 
	{
		if (who_is_here.return_text() == false) return
		
		if (currently_talking)
		{
			if (current_text_line < array_length(who_is_here.text)-1)
			{
				current_text_line++;
				current_text=who_is_here.text[current_text_line]
				current_text_index=0;
			}
			else
			{
				currently_talking=noone
			}
			current_text_index=0
		}
		else{
			current_text_line=0
			currently_talking=who_is_here
			current_text=who_is_here.text[0]
			current_text_index=0
		}
	}
}
#endregion

with(all)
{
	depth = -bbox_bottom;
}