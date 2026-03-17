if (is_transitioning and obj_ui_manager.fade_alpha >= 1)
{
	is_transitioning=false
	room_goto(place_to)
	obj_ui_manager.fade_out(c_black, 0.01)
}