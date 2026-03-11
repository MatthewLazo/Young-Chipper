function place_player(new_x,new_y)
{
	obj_player.x = new_x
	obj_player.y = new_y
}

function find_npc(_npc_id)
{
	with (obj_interactable)
	{
		if (npc_id == _npc_id)
		{
			return self
		}
	}
	
}