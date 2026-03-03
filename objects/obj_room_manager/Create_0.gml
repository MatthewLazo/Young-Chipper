enum manager_state {
	fade_in,
	idle,
	fade_out
}
state = manager_state.fade_out

fade_alpha = 1
fade_speed = 0.05

place_from = "room"
place_to = room





function room_to(transition_id, place_to_go)
{
	place_from = transition_id
	place_to=place_to_go
	state=manager_state.fade_in
	
}