if (!currently_talking)
{
	// Ammo hud
	#region Ammo
	draw_set_halign(fa_middle);
	draw_set_valign(fa_center);
	
	if (obj_player.total_ammo == 0) draw_set_colour(c_red)
	else draw_set_colour(c_white)
	var ammo_text_x = 100;
	var ammo_text_y = window_get_height() - 50;

	draw_text_transformed(ammo_text_x, ammo_text_y, string(obj_player.total_ammo), 2, 2, 0);
	draw_text_transformed(ammo_text_x, ammo_text_y - 50, string(max(obj_player.alarm[1]/60, 0)), 1, 1, 0)
	
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	#endregion
	// Menu
	#region Menu
	if (obj_player.menu_opened)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
	
		var menu_x1 = 50;
		var menu_y1 = 10;
		var menu_x2 = 500;
		var menu_y2 = 400;
	
		draw_set_colour(c_orange)
		draw_rectangle(menu_x1,menu_y1,menu_x2,menu_y2, false)
		
		draw_set_colour(c_black)
		draw_set_halign(fa_center);
	
		draw_text_transformed((menu_x1 + menu_x2)/2, menu_y1+20, "To Do: ", 1, 1, 0);
		
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		global.to_do = keyboard_string + "|"
		draw_text_ext(menu_x1, menu_y1+55, global.to_do, 50, 450);
		
		
	}
	#endregion
}
// fADING
draw_set_alpha(fade_alpha)
draw_set_colour(fade_color)
draw_rectangle(0,0,window_get_width() + 150 ,window_get_height() + 150, false)
draw_set_alpha(1)

if (currently_talking)
{
	// Dialogue
	var x1 = 0;
	var y1 = window_get_height()- 200;
	var x2 = window_get_width() + 150;
	var y2 = window_get_height() + 150;
	
	draw_set_colour(c_orange)
	//draw_rectangle(x1,y1,x2,y2, false)
	
	var text_x = x1 + 32;
	var text_y = y1 + 50;
	
	draw_set_colour(c_white)
	draw_text_ext(text_x,text_y,  string_copy(current_text, 1, current_text_index), 50, window_get_width()-50)
	current_text_index++;
	if (current_text_index < string_length(current_text) and alarm[0] < 0) alarm[0] = 2
}