spr_idle = spr_beanboy_idle
spr_walk = spr_beanboy_walk
function return_text()
{
	if (state == npc_state.moving) return false
	
	if (global.win == true) return text2
	else return text
}

function dialogue_end(dialogue)
{
	if (dialogue == text)
	{
		global.win = true
	}
	else if (dialogue == text2)
	{
		instance_create_depth(x,y,depth, obj_enemy_parent)
		instance_destroy()
	}
}