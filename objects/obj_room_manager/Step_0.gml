switch (state)
{
	case manager_state.fade_in:
		fade_alpha += fade_speed
		if (fade_alpha >= 1)
		{
			room_goto(place_to)
			// inform room to update player position
			state=manager_state.fade_out
		}
		break;
	case manager_state.fade_out:
		fade_alpha -= fade_speed
		if (fade_alpha <= 0)
		{
			
			state=manager_state.idle
		}
		break;
	case manager_state.idle:
		
		break;
}