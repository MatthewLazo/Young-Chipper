enum cam_state {moving, idle, zooming}

state = cam_state.moving

window_width = 816
window_height = 627

camera_width = 816/2.25
camera_height = 627/2.25

target_x = 0
target_y = 0

position_x = 0
position_y = 0

cam_speed = 0.75
reached_position = false

function move_to(x_, y_, speed_)
{
	cam_speed = speed_
	
	target_x = x_ - camera_width/2
	target_y = y_ - camera_height/2
	
	target_x = clamp(target_x, 0, room_width - camera_width)
	target_y = clamp(target_y, 0, room_height - camera_height)
	
	state = cam_state.moving
}
