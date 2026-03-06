if (!global.cutscene_active) return // Do final action

switch (actions[action_index][0])
{
	case "talk": 
		if (not began_task)
		{
			began_task = true
			obj_ui_manager.start_dialogue(actions[action_index][1])
		}
		
		if (began_task and not obj_ui_manager.currently_talking) next_action()
		
		
		break;
	case "move": 
		if (not began_task)
		{
			began_task=true
			actions[action_index][1].begin_sprint(actions[action_index][3], actions[action_index][4], actions[action_index][2])
		}
		if (point_distance(actions[action_index][1].x, actions[action_index][1].y, actions[action_index][3],actions[action_index][4]) < 1) next_action()
		
		break;
	case "play_sound":
		break;
	case "wait":
		break;
	case "end":
		actions = []
		action_index=0
		global.cutscene_active=false
		break;
	case "create_obj":
		break;
	case "play_anim":
		break;
		
}


