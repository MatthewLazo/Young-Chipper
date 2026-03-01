show_debug_message("pressed")
var bullet = instance_create_depth(x, y, depth, obj_bullet_parent)
bullet.target_x = mouse_x
bullet.target_y = mouse_y