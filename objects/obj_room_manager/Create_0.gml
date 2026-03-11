
place_from = "room"
place_to = room
is_transitioning = false

function room_to(transition_id, place_to_go)
{
	is_transitioning=true
	obj_ui_manager.fade_in(c_black)
	
	place_from = transition_id
	place_to=place_to_go
}