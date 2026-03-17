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
			// Is NPC or INTERACTABLE
			if (is_string(actions[action_index][1])) actions[action_index][1] = obj_room_handler.find_npc(actions[action_index][1])
			// Is Player or Interactable (Movement)
			if (not is_undefined(actions[action_index][1].is_npc))
			{
				// Get enemy to sprint
				actions[action_index][1].begin_sprint(actions[action_index][3], actions[action_index][4], actions[action_index][2])
			}
			else
			{
				// Move player or interactable to position
				actions[action_index][1].move_towards_point(actions[action_index][3], actions[action_index][4], actions[action_index][2])
			}
		}
		if (point_distance(actions[action_index][1].x, actions[action_index][1].y, actions[action_index][3],actions[action_index][4]) < 1.5)
		{
			// If is NPC, then make NPC stay at the position they are currently at after cutscene
			if (actions[action_index][5] == true and not is_undefined(actions[action_index][1].is_npc))
			{
				actions[action_index][1].set_position_as_main_position(actions[action_index][1].x,actions[action_index][1].y)
			}
			next_action()
		}
		
		break;
	case "move_camera":
		if (not began_task)
		{
			began_task = true
			obj_camera_controller.move_to(actions[action_index][2], actions[action_index][3], actions[action_index][1])
		}
		if (obj_camera_controller.reached_position) next_action()
		break
	case "room_to":
		obj_room_manager.room_to(actions[action_index][2], actions[action_index][1])
		next_action()
		break
	case "play_sound":
		obj_audio_manager.play_sound(actions[action_index][1], 1)
		next_action()
		break;
	case "destroy":
		if (is_string(actions[action_index][1])) actions[action_index][1] = obj_room_handler.find_npc(actions[action_index][1])
		instance_destroy(actions[action_index][1])
		next_action()
		break;
	case "wait":
		if (not began_task)
		{
			began_task = true
			actions[action_index][1]*=60;
		}
		actions[action_index][1]--;
		if (actions[action_index][1] <= 0)
		{
			next_action()
		}
		break;
	case "spawn_enemy":
		if (not began_task)
		{
			began_task = true
			obj_room_handler.spawn_enemy(actions[action_index][1],actions[action_index][2])
		}
		next_action()
		break;
	case "end":
		actions = []
		action_index=0
		global.cutscene_active=false
		break;
	case "play_anim":
		if (not began_task)
		{
			began_task = true
			actions[action_index][1].play_anim(actions[action_index][2])
		}
		if (!actions[action_index][1].cutscene_animation_playing) next_action()
		break;
	case "change_flag":
		var container = actions[action_index][1]
		var key = actions[action_index][2]
		var value_to =  actions[action_index][3]
		container[$key] = value_to
		obj_game_manager.set_game_objective()
		
		next_action()
		break;
	case "fade_in":
		if (not began_task)
		{
			began_task=true
			obj_ui_manager.fade_in(actions[action_index][1], actions[action_index][2])
		}
		if (obj_ui_manager.fade_alpha >= 1)
		{
			next_action()
		}
		break;
	case "fade_out":
		if (not began_task)
		{
			began_task=true
			obj_ui_manager.fade_out(actions[action_index][1], actions[action_index][2])
		}
		if (obj_ui_manager.fade_alpha <= 0)
		{
			next_action()
		}
		break;
}


