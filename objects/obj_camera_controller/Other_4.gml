
view_enabled=true
view_visible[0] = true

camera = view_camera[0]

camera_set_view_size(camera, camera_width, camera_height)

view_wport[0] = window_width;
view_hport[0] = window_height;

window_set_size(window_width, window_height)
window_center()
surface_resize(application_surface, window_width, window_height); //
