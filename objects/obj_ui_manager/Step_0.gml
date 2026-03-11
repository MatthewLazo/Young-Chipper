switch (state)
{
	case fade_state.fade_in:
		fade_alpha += fade_speed
		if (fade_alpha >= 1)
		{
			// inform room to update player position
			state=fade_state.idle
		}
		break;
	case fade_state.fade_out:
		fade_alpha -= fade_speed
		if (fade_alpha <= 0)
		{
			state=fade_state.idle
		}
		break;
	case fade_state.idle:
		
		break;
}