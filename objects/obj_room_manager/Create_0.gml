
place_from = "room"
place_to = room
is_transitioning = false

function room_to(transition_id, place_to_go)
{
	is_transitioning=true
	if (obj_ui_manager.fade_alpha < 1) obj_ui_manager.fade_in(c_black, 0.01)
	
	place_from = transition_id
	place_to=place_to_go
}